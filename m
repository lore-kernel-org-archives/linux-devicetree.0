From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next 1/2] net: phy: add interface mode
 PHY_INTERFACE_MODE_USXGMII
Date: Wed, 22 May 2019 22:20:05 +0200
Message-ID: <101b6cff-797b-1d06-17d3-045d56aa0de3@gmail.com>
References: <110a1e45-56a7-a646-7b63-f39fe3083c28@gmail.com>
 <aca070f6-f56b-1b1f-180a-ddf52af91ecb@gmail.com>
 <d736f2d8-5c2a-e624-e372-cc2dd7b29f3c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <d736f2d8-5c2a-e624-e372-cc2dd7b29f3c@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Madalin-cristian Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 22.05.2019 22:06, Florian Fainelli wrote:
> On 5/22/19 12:57 PM, Heiner Kallweit wrote:
>> Add support for interface mode PHY_INTERFACE_MODE_USXGMII.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> If you update Documentation/devicetree/bindings/net/ethernet.txt, then
> this is:
> 
Indeed, that's missing. Thanks for the hint.

> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> 
