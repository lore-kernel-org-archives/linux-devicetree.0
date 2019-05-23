From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next v2 3/3] net: phy: aquantia: add USXGMII support
 and warn if XGMII mode is set
Date: Thu, 23 May 2019 11:19:06 -0700
Message-ID: <7ae30629-f1c0-db95-87ab-7bc45400c12e@gmail.com>
References: <9d284f4d-93ee-fb27-e386-80825f92adc8@gmail.com>
 <96437cfa-b1f9-eeae-f9ca-c658c81f61c0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <96437cfa-b1f9-eeae-f9ca-c658c81f61c0@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, Madalin-cristian Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 5/23/19 11:09 AM, Heiner Kallweit wrote:
> So far we didn't support mode USXGMII, and in order to not break few
> boards mode XGMII was accepted for the AQR107 family even though it
> doesn't support XGMII. Add USXGMII support to the Aquantia PHY driver
> and warn if XGMII mode is set.
> 
> v2:
> - add warning if XGMII mode is set
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
