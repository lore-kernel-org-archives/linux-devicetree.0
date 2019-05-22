From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH net-next 2/2] net: phy: aquantia: add USXGMII support
Date: Wed, 22 May 2019 13:29:45 -0700
Message-ID: <abdf67f6-3b7b-fab4-ed7c-779f5685ab58@gmail.com>
References: <110a1e45-56a7-a646-7b63-f39fe3083c28@gmail.com>
 <2c68bdb1-9b53-ce0b-74d3-c7ea2d9e7ac0@gmail.com>
 <46a141c7-f838-ae4b-4a47-5b1fb44ef063@gmail.com>
 <e7a7c38c-ebe7-1cea-4099-3cf3a4483ac7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <e7a7c38c-ebe7-1cea-4099-3cf3a4483ac7@gmail.com>
Content-Language: en-US
Sender: netdev-owner@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, Madalin-cristian Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 5/22/19 1:18 PM, Heiner Kallweit wrote:
> On 22.05.2019 22:07, Florian Fainelli wrote:
>> On 5/22/19 12:58 PM, Heiner Kallweit wrote:
>>> So far we didn't support mode USXGMII, and in order to not break the
>>> two Freescale boards mode XGMII was accepted for the AQR107 family
>>> even though it doesn't support XGMII. Add USXGMII support to the
>>> Aquantia PHY driver and change the phy connection type for the two
>>> boards.
>>>
>>> As an additional note: Even though the handle is named aqr106
>>> there seem to be LS1046A boards with an AQR107.
>>>
>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>
>> You can probably split the DTS changes and the PHY driver changes into a
>> separate commits and just have the DTS changes come last? With that:
>>
> To split the patches I would have to do:
> 1. Add USXGMII support to Aquantia PHY driver
> 2. DTS changes
> 3. Don't accept XGMII any longer in Aquantia PHY driver
> This seemed to me to be too much overhead considering the very small
> change.
> 
> Just making the DTS changes a separate patch would break bisecting.

I fail to see how, you can't make use of "usxgmii" in DTS unless you
define that as as a valid phy-mode property value (patch #1), and you
can't have that possibly working until patch #2. Until then using
"xgmii" is still supported and going to work.

Once patch #3 which brings DTS lands in, you could possibly deprecate
"xgmii" in the Aquantia PHY driver (or rather issue a big warning).
-- 
Florian
