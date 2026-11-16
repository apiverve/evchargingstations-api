/*
 * EV Charging Stations API - Basic Usage Example
 *
 * This example demonstrates the basic usage of the EV Charging Stations API.
 * API Documentation: https://docs.apiverve.com/ref/evchargingstations
 */

using System;
using System.Net.Http;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Linq;

namespace APIVerve.Examples
{
    class EVChargingStationsExample
    {
        private static readonly string API_KEY = Environment.GetEnvironmentVariable("APIVERVE_API_KEY") ?? "YOUR_API_KEY_HERE";
        private static readonly string API_URL = "https://api.apiverve.com/v1/evchargingstations";

        /// <summary>
        /// Make a GET request to the EV Charging Stations API
        /// </summary>
        static async Task<JsonDocument> CallEVChargingStationsAPI()
        {
            try
            {
                using var client = new HttpClient();
                client.DefaultRequestHeaders.Add("x-api-key", API_KEY);

                // Query parameters
                var queryParams &#x3D; new Dictionary&lt;string, string&gt; { [&quot;lat&quot;] &#x3D; 37.7749, [&quot;lon&quot;] &#x3D; -122.4194, [&quot;zip&quot;] &#x3D; &quot;10001&quot;, [&quot;city&quot;] &#x3D; &quot;Toronto&quot;, [&quot;state&quot;] &#x3D; &quot;ON&quot;, [&quot;radius&quot;] &#x3D; 10, [&quot;connector&quot;] &#x3D; &quot;ccs&quot;, [&quot;network&quot;] &#x3D; &quot;Tesla&quot;, [&quot;level&quot;] &#x3D; &quot;2&quot;, [&quot;fastOnly&quot;] &#x3D; true, [&quot;access&quot;] &#x3D; &quot;public&quot;, [&quot;status&quot;] &#x3D; &quot;open&quot;, [&quot;limit&quot;] &#x3D; 20 };

                var queryString = string.Join("&",
                    queryParams.Select(kvp => $"{kvp.Key}={Uri.EscapeDataString(kvp.Value)}"));
                var url = $"{API_URL}?{queryString}";

                var response = await client.GetAsync(url);

                // Check if response is successful
                response.EnsureSuccessStatusCode();

                var responseBody = await response.Content.ReadAsStringAsync();
                var data = JsonDocument.Parse(responseBody);

                // Check API response status
                if (data.RootElement.GetProperty("status").GetString() == "ok")
                {
                    Console.WriteLine("✓ Success!");
                    Console.WriteLine("Response data: " + data.RootElement.GetProperty("data"));
                    return data;
                }
                else
                {
                    var error = data.RootElement.TryGetProperty("error", out var errorProp)
                        ? errorProp.GetString()
                        : "Unknown error";
                    Console.WriteLine($"✗ API Error: {error}");
                    return null;
                }
            }
            catch (HttpRequestException e)
            {
                Console.WriteLine($"✗ Request failed: {e.Message}");
                return null;
            }
        }

        static async Task Main(string[] args)
        {
            Console.WriteLine("📤 Calling EV Charging Stations API...\n");

            var result = await CallEVChargingStationsAPI();

            if (result != null)
            {
                Console.WriteLine("\n📊 Final Result:");
                Console.WriteLine(result.RootElement.GetProperty("data"));
            }
            else
            {
                Console.WriteLine("\n✗ API call failed");
            }
        }
    }
}
