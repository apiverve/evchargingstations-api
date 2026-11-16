using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.EVChargingStations
{
    /// <summary>
    /// Query options for the EV Charging Stations API
    /// </summary>
    public class EVChargingStationsQueryOptions
    {
        /// <summary>
        /// Latitude of the search centre. Use lat and lon, a zip, or a city and state
        /// </summary>
        [JsonProperty("lat")]
        public double? Lat { get; set; }

        /// <summary>
        /// Longitude of the search centre
        /// </summary>
        [JsonProperty("lon")]
        public double? Lon { get; set; }

        /// <summary>
        /// US ZIP code or Canadian postal code to search around
        /// </summary>
        [JsonProperty("zip")]
        public string Zip { get; set; }

        /// <summary>
        /// City to search around, with state
        /// </summary>
        [JsonProperty("city")]
        public string City { get; set; }

        /// <summary>
        /// Two-letter US state or Canadian province code, with city
        /// </summary>
        [JsonProperty("state")]
        public string State { get; set; }

        /// <summary>
        /// Search radius in kilometres, up to 80
        /// </summary>
        [JsonProperty("radius")]
        public double? Radius { get; set; }

        /// <summary>
        /// Only stations with one of these connectors, comma-separated: j1772, ccs, chademo, nacs, nema515, nema520, nema1450, mcs
        /// </summary>
        [JsonProperty("connector")]
        public string Connector { get; set; }

        /// <summary>
        /// Only stations on a network whose name contains this, for example Tesla, ChargePoint or Electrify America
        /// </summary>
        [JsonProperty("network")]
        public string Network { get; set; }

        /// <summary>
        /// Only stations with ports at this charging level
        /// </summary>
        [JsonProperty("level")]
        public string Level { get; set; }

        /// <summary>
        /// Only stations with DC fast charging
        /// </summary>
        [JsonProperty("fastOnly")]
        public bool? FastOnly { get; set; }

        /// <summary>
        /// Public stations (default), private ones, or all
        /// </summary>
        [JsonProperty("access")]
        public string Access { get; set; }

        /// <summary>
        /// Open stations (default), planned, temporarily unavailable, or all
        /// </summary>
        [JsonProperty("status")]
        public string Status { get; set; }

        /// <summary>
        /// Maximum number of stations to return, 1-100
        /// </summary>
        [JsonProperty("limit")]
        public int? Limit { get; set; }
    }
}
