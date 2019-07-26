From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next 3/3] dt-bindings: net: ethernet: Update mt7622
 docs and dts to reflect the new phylink API
Date: Fri, 26 Jul 2019 15:16:22 +0000
Message-ID: <20190726151622.Horde.1AA717IbQrC7_YJcSBe4M-0@www.vdorst.com>
References: <20190724192411.20639-1-opensource@vdorst.com>
 <20190725193123.GA32542@lunn.ch>
 <20190726071956.Horde.s4rfuzovwXB-d3LnV0PLRc8@www.vdorst.com>
 <20190726131604.GA18223@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190726131604.GA18223@lunn.ch>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, frank-w@public-files.de, sean.wang@mediatek.com, f.fainelli@gmail.com, linux@armlinux.org.uk, davem@davemloft.net, matthias.bgg@gmail.com, vivien.didelot@gmail.com, john@phrozen.org, linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Andrew Lunn <andrew@lunn.ch>:

> On Fri, Jul 26, 2019 at 07:19:56AM +0000, René van Dorst wrote:
>> Quoting Andrew Lunn <andrew@lunn.ch>:
>>
>> >>+	gmac0: mac@0 {
>> >>+		compatible = "mediatek,eth-mac";
>> >>+		reg = <0>;
>> >>+		phy-mode = "sgmii";
>> >>+
>> >>+		fixed-link {
>> >>+			speed = <2500>;
>> >>+			full-duplex;
>> >>+			pause;
>> >>+		};
>> >>+	};
>> >
>> >Hi René
>> >
>>
>> Hi Andrew,
>>
>> >SGMII and fixed-link is rather odd. Why do you need this combination?
>>
>> BananaPi R64 has a RTL8367S 5+2-port switch, switch interfaces with the SOC
>> by a
>> (H)SGMII and/or RGMII interface. SGMII is mainly used for the LAN ports and
>> RGMII for the WAN port.
>>
>> I mimic the SDK software which puts SGMII interface in 2.5GBit fixed-link
>> mode.
>> The RTL8367S switch code also put switch mac in forge 2.5GBit mode.
>>
>> So this is the reason why I put a fixed-link mode here.
>
> Are you sure it is using SGMII and not 2500BaseX? Can you get access
> to the signalling word? SGMII is supposed to indicate to the MAC what
> speed it is using, via inband signalling. So there should not be any
> need for a fixed-link. 2500BaseX however does not have such
> signalling, so there would need to be a fixed link.

I am not sure.

I just converted the current mainline code to support phylink and  
mimic the DTS
of the SDK. But the SDK seems to be incorrect.

Realtek[0] calls these modes:
* SGMII (1.25GHz) Interface
* High SGMII (3.125GHz) Interface
Also the datasheet that I have doesn't talk about base-x modes.

But MT7622 Reference manual[1] page 1960 says:
  The core leverages the 1000Base-X PCS and Auto-Negotiation from IEEE 802.3
  specification (clause 36/37). This IP can support up to 3.125G baud  
for 2.5Gbps
  (proprietary 2500Base-X) data rate of MAC by overclocking.

So I think it phy-mode should be 2500Base-X in this case.

SGMII part is a bit hard for me to support, I don't have the hardware,
MediaTek datasheets are mostly incomplete and also I am a not familiar  
with it.

But I think I know what I have to change.
Based on your explanation above.

I think this more correct implementation:

* 1000base-x and 2500base-x always force the link.
* SGMII is always inband but I need in phylink_mac_link_status() to readout
   "PCS_SPEED_ABILITY Clause 45 3.5" register to see the inband status?
   Or is it just the GMAC PSMR register? For me it is a bit confusing.
   SGMII block has a register to set the link speed and etc. But tests on the
   bananapi R64 board shows that I also need to set the GMAC register else it
   didn't work. Also it is not easy to debug if you don't have the board.

> Maybe we should really consider what phy-mode = "sgmii"; means. Should
> this include the overclocked 2.5G speed, or should we add a 2500sgmii
> link mode?

No.

>
>      Andrew

Greats,

René

[0]:  
https://www.realtek.com/en/products/communications-network-ics/item/rtl8367s-cg
[1]:  
https://drive.google.com/file/d/1cW8KQmmVpwDGmBd48KNQes9CRn7FEgBb/view?usp=sharing
