import com.apiverve.evchargingstations.EVChargingStationsAPIClient;
import com.apiverve.evchargingstations.APIResponse;
import com.apiverve.evchargingstations.APIException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class BasicExample {
    public static void main(String[] args) {
        // Initialize the API client with your API key
        EVChargingStationsAPIClient client = new EVChargingStationsAPIClient("YOUR_API_KEY_HERE");

        try {
            // Query parameters
            Map&lt;String, Object&gt; parameters &#x3D; new HashMap&lt;&gt;();
        parameters.put(&quot;lat&quot;, 37.7749);
        parameters.put(&quot;lon&quot;, -122.4194);
        parameters.put(&quot;zip&quot;, &quot;10001&quot;);
        parameters.put(&quot;city&quot;, &quot;Toronto&quot;);
        parameters.put(&quot;state&quot;, &quot;ON&quot;);
        parameters.put(&quot;radius&quot;, 10);
        parameters.put(&quot;connector&quot;, &quot;ccs&quot;);
        parameters.put(&quot;network&quot;, &quot;Tesla&quot;);
        parameters.put(&quot;level&quot;, &quot;2&quot;);
        parameters.put(&quot;fastOnly&quot;, true);
        parameters.put(&quot;access&quot;, &quot;public&quot;);
        parameters.put(&quot;status&quot;, &quot;open&quot;);
        parameters.put(&quot;limit&quot;, 20);

            // Execute the API request
            APIResponse response = client.execute(parameters);

            // Check if the request was successful
            if (response.isSuccess()) {
                System.out.println("✅ Success!");

                // Get the response data
                JSONObject data = response.getData();
                if (data != null) {
                    System.out.println("Response data:");
                    System.out.println(data.toString(2)); // Pretty print with 2-space indent
                }

                // Or get specific fields from the data
                // String value = data.optString("fieldName");

            } else {
                // Handle API errors
                System.err.println("❌ API Error: " + response.getError());
                System.err.println("Status: " + response.getStatus());
                System.err.println("Code: " + response.getCode());
            }

        } catch (APIException e) {
            // Handle exceptions
            System.err.println("❌ Error: " + e.getMessage());

            // Handle specific error types
            if (e.isAuthenticationError()) {
                System.err.println("Invalid API key. Get your key at: https://apiverve.com");
            } else if (e.isRateLimitError()) {
                System.err.println("Rate limit exceeded. Please try again later.");
            } else if (e.isServerError()) {
                System.err.println("Server error (5xx). Please try again later.");
            } else if (e.isClientError()) {
                System.err.println("Client error (4xx). Check your request parameters.");
            }

            // Get HTTP status code if available
            if (e.getStatusCode() > 0) {
                System.err.println("HTTP Status Code: " + e.getStatusCode());
            }
        }
    }
}
