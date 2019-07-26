From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next 3/3] dt-bindings: net: ethernet: Update mt7622
 docs and dts to reflect the new phylink API
Date: Fri, 26 Jul 2019 07:19:56 +0000
Message-ID: <20190726071956.Horde.s4rfuzovwXB-d3LnV0PLRc8@www.vdorst.com>
References: <20190724192411.20639-1-opensource@vdorst.com>
 <20190725193123.GA32542@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190725193123.GA32542@lunn.ch>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, vivien.didelot@gmail.com, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Andrew Lunn <andrew@lunn.ch>:

>> +	gmac0: mac@0 {
>> +		compatible = "mediatek,eth-mac";
>> +		reg = <0>;
>> +		phy-mode = "sgmii";
>> +
>> +		fixed-link {
>> +			speed = <2500>;
>> +			full-duplex;
>> +			pause;
>> +		};
>> +	};
>
> Hi René
>

Hi Andrew,

> SGMII and fixed-link is rather odd. Why do you need this combination?

BananaPi R64 has a RTL8367S 5+2-port switch, switch interfaces with  
the SOC by a
(H)SGMII and/or RGMII interface. SGMII is mainly used for the LAN ports and
RGMII for the WAN port.

I mimic the SDK software which puts SGMII interface in 2.5GBit  
fixed-link mode.
The RTL8367S switch code also put switch mac in forge 2.5GBit mode.

So this is the reason why I put a fixed-link mode here.

Greats,

René

>       Andrew
