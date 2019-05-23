From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v2 3/3] net: phy: aquantia: add USXGMII support
 and warn if XGMII mode is set
Date: Thu, 23 May 2019 20:14:51 +0200
Message-ID: <20190523181451.GE15531@lunn.ch>
References: <9d284f4d-93ee-fb27-e386-80825f92adc8@gmail.com>
 <96437cfa-b1f9-eeae-f9ca-c658c81f61c0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <96437cfa-b1f9-eeae-f9ca-c658c81f61c0@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Madalin-cristian Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, David Miller <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 23, 2019 at 08:09:08PM +0200, Heiner Kallweit wrote:
> So far we didn't support mode USXGMII, and in order to not break few
> boards mode XGMII was accepted for the AQR107 family even though it
> doesn't support XGMII. Add USXGMII support to the Aquantia PHY driver
> and warn if XGMII mode is set.
> 
> v2:
> - add warning if XGMII mode is set
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
