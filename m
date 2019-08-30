From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net-next v2 2/3] dt-bindings: net: dsa: mt7530: Add
 support for port 5
Date: Fri, 30 Aug 2019 17:16:03 +0000
Message-ID: <20190830171603.Horde.UeVVg_YU-C4f8bcYmFJ_1Gv@www.vdorst.com>
References: <20190821144547.15113-1-opensource@vdorst.com>
 <20190821144547.15113-3-opensource@vdorst.com>
 <20190827222251.GA30507@bogus>
 <20190828063520.Horde.4_ak7mcmFhVJlxZWWy2wo3V@www.vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190828063520.Horde.4_ak7mcmFhVJlxZWWy2wo3V@www.vdorst.com>
Content-Disposition: inline
Sender: netdev-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller" <davem@davemloft.net>, Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, linux-mips@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Rob,

<snip>

>>> See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list  
>>> of additional
>>> required, optional properties and how the integrated switch subnodes must
>>> be specified.
>>> @@ -94,3 +130,185 @@ Example:
>>> 			};
>>> 		};
>>> 	};
>>> +
>>> +Example 2: MT7621: Port 4 is WAN port: 2nd GMAC -> Port 5 -> PHY port 4.
>>> +
>>> +&eth {
>>> +	status = "okay";
>>
>> Don't show status in examples.
>
> OK.
>
>> This should show the complete node.
>>
>

I asked this question below in my previous email.
May be you missed it, I hope that you have time soon to answer this so that I
can send a new version.

> To be clear, I should take ethernet node from the mt7621.dtsi [0] or  
> mt7623.dtsi [1] and insert the example below?, right?

Greats,

René

>
> Greats,
>
> René
>
> [0]:  
> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/tree/drivers/staging/mt7621-dts/mt7621.dtsi#n397
> [1]:  
> https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/tree/arch/arm/boot/dts/mt7623.dtsi#n1023
>
>>> +
>>> +	gmac0: mac@0 {
>>> +		compatible = "mediatek,eth-mac";
>>> +		reg = <0>;
>>> +		phy-mode = "rgmii";
>>> +
>>> +		fixed-link {
>>> +			speed = <1000>;
>>> +			full-duplex;
>>> +			pause;
>>> +		};
>>> +	};
>>> +
>>> +	gmac1: mac@1 {
>>> +		compatible = "mediatek,eth-mac";
>>> +		reg = <1>;
>>> +		phy-mode = "rgmii-txid";
>>> +		phy-handle = <&phy4>;
>>> +	};
>>> +
>>> +	mdio: mdio-bus {
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +
>>> +		/* Internal phy */
>>> +		phy4: ethernet-phy@4 {
>>> +			reg = <4>;
>>> +		};
>>> +
>>> +		mt7530: switch@1f {
>>> +			compatible = "mediatek,mt7621";
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +			reg = <0x1f>;
>>> +			pinctrl-names = "default";
>>> +			mediatek,mcm;
>>> +
>>> +			resets = <&rstctrl 2>;
>>> +			reset-names = "mcm";
>>> +
>>> +			ports {
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +
>>> +				port@0 {
>>> +					reg = <0>;
>>> +					label = "lan0";
>>> +				};
>>> +
>>> +				port@1 {
>>> +					reg = <1>;
>>> +					label = "lan1";
>>> +				};
>>> +
>>> +				port@2 {
>>> +					reg = <2>;
>>> +					label = "lan2";
>>> +				};
>>> +
>>> +				port@3 {
>>> +					reg = <3>;
>>> +					label = "lan3";
>>> +				};
>>> +
>>> +/* Commented out. Port 4 is handled by 2nd GMAC.
>>> +				port@4 {
>>> +					reg = <4>;
>>> +					label = "lan4";
>>> +				};
>>> +*/
>>> +
>>> +				cpu_port0: port@6 {
>>> +					reg = <6>;
>>> +					label = "cpu";
>>> +					ethernet = <&gmac0>;
>>> +					phy-mode = "rgmii";
>>> +
>>> +					fixed-link {
>>> +						speed = <1000>;
>>> +						full-duplex;
>>> +						pause;
>>> +					};
>>> +				};
>>> +			};
>>> +		};
>>> +	};
>>> +};
>>> +
>>> +Example 3: MT7621: Port 5 is connected to external PHY: Port 5 ->  
>>> external PHY.
>>> +
>>> +&eth {
>>> +	status = "okay";
>>> +
>>> +	gmac0: mac@0 {
>>> +		compatible = "mediatek,eth-mac";
>>> +		reg = <0>;
>>> +		phy-mode = "rgmii";
>>> +
>>> +		fixed-link {
>>> +			speed = <1000>;
>>> +			full-duplex;
>>> +			pause;
>>> +		};
>>> +	};
>>> +
>>> +	mdio: mdio-bus {
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +
>>> +		/* External phy */
>>> +		ephy5: ethernet-phy@7 {
>>> +			reg = <7>;
>>> +		};
>>> +
>>> +		mt7530: switch@1f {
>>> +			compatible = "mediatek,mt7621";
>>> +			#address-cells = <1>;
>>> +			#size-cells = <0>;
>>> +			reg = <0x1f>;
>>> +			pinctrl-names = "default";
>>> +			mediatek,mcm;
>>> +
>>> +			resets = <&rstctrl 2>;
>>> +			reset-names = "mcm";
>>> +
>>> +			ports {
>>> +				#address-cells = <1>;
>>> +				#size-cells = <0>;
>>> +
>>> +				port@0 {
>>> +					reg = <0>;
>>> +					label = "lan0";
>>> +				};
>>> +
>>> +				port@1 {
>>> +					reg = <1>;
>>> +					label = "lan1";
>>> +				};
>>> +
>>> +				port@2 {
>>> +					reg = <2>;
>>> +					label = "lan2";
>>> +				};
>>> +
>>> +				port@3 {
>>> +					reg = <3>;
>>> +					label = "lan3";
>>> +				};
>>> +
>>> +				port@4 {
>>> +					reg = <4>;
>>> +					label = "lan4";
>>> +				};
>>> +
>>> +				port@5 {
>>> +					reg = <5>;
>>> +					label = "lan5";
>>> +					phy-mode = "rgmii";
>>> +					phy-handle = <&ephy5>;
>>> +				};
>>> +
>>> +				cpu_port0: port@6 {
>>> +					reg = <6>;
>>> +					label = "cpu";
>>> +					ethernet = <&gmac0>;
>>> +					phy-mode = "rgmii";
>>> +
>>> +					fixed-link {
>>> +						speed = <1000>;
>>> +						full-duplex;
>>> +						pause;
>>> +					};
>>> +				};
>>> +			};
>>> +		};
>>> +	};
>>> +};
>>> --
>>> 2.20.1
>>>
