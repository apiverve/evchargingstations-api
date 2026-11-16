declare module '@apiverve/evchargingstations' {
  export interface evchargingstationsOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface evchargingstationsResponse {
    status: string;
    error: string | null;
    data: EVChargingStationsData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface EVChargingStationsData {
      count:        number | null;
      returned:     number | null;
      searchCenter: SearchCenter;
      radiusKM:     number | null;
      stations:     Station[];
  }
  
  interface SearchCenter {
      latitude:  number | null;
      longitude: number | null;
      source:    null | string;
  }
  
  interface Station {
      name:             null | string;
      status:           null | string;
      access:           null | string;
      address:          Address;
      latitude:         number | null;
      longitude:        number | null;
      distanceKM:       number | null;
      distanceMiles:    number | null;
      network:          null | string;
      ports:            Ports;
      fastCharging:     boolean | null;
      connectors:       Connector[];
      maxPowerKw:       number | null;
      accessHours:      null | string;
      pricing:          null;
      facilityType:     null;
      phone:            null | string;
      networkWebsite:   null | string;
      openDate:         Date | null;
      expectedOpenDate: null;
      lastConfirmed:    Date | null;
  }
  
  interface Address {
      street:  null | string;
      city:    null | string;
      state:   null | string;
      zip:     null | string;
      country: null | string;
  }
  
  interface Connector {
      type:       null | string;
      name:       null | string;
      level:      null | string;
      ports:      number | null;
      maxPowerKw: number | null;
  }
  
  interface Ports {
      level1: number | null;
      level2: number | null;
      dcFast: number | null;
      total:  number | null;
  }

  export default class evchargingstationsWrapper {
    constructor(options: evchargingstationsOptions);

    execute(callback: (error: any, data: evchargingstationsResponse | null) => void): Promise<evchargingstationsResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: evchargingstationsResponse | null) => void): Promise<evchargingstationsResponse>;
    execute(query?: Record<string, any>): Promise<evchargingstationsResponse>;
  }
}
