From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net 2/2] arm: dts: mediatek: Fix mt7629 dts to reflect
 the latest dt-binding
Date: Tue, 01 Oct 2019 13:56:08 +0000
Message-ID: <20191001135608.Horde.OSYef8s44rR0XHw22Bf55r8@www.vdorst.com>
References: <20191001123150.23135-1-Mark-MC.Lee@mediatek.com>
 <20191001123150.23135-3-Mark-MC.Lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001123150.23135-3-Mark-MC.Lee@mediatek.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: MarkLee <Mark-MC.Lee@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>, Sean Wang <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@openwrt.org>, Nelson Chang <nelson.chang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi MarkLee,

Quoting MarkLee <Mark-MC.Lee@mediatek.com>:

> * Removes mediatek,physpeed property from dtsi that is useless in PHYLINK
> * Set gmac0 to fixed-link sgmii 2.5Gbit mode
> * Set gmac1 to gmii mode that connect to a internal gphy
>
> Signed-off-by: MarkLee <Mark-MC.Lee@mediatek.com>
> ---
>  arch/arm/boot/dts/mt7629-rfb.dts | 13 ++++++++++++-
>  arch/arm/boot/dts/mt7629.dtsi    |  2 --
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/mt7629-rfb.dts  
> b/arch/arm/boot/dts/mt7629-rfb.dts
> index 3621b7d2b22a..6bf1f7d8ddb5 100644
> --- a/arch/arm/boot/dts/mt7629-rfb.dts
> +++ b/arch/arm/boot/dts/mt7629-rfb.dts
> @@ -66,9 +66,21 @@
>  	pinctrl-1 = <&ephy_leds_pins>;
>  	status = "okay";
>
> +	gmac0: mac@0 {
> +		compatible = "mediatek,eth-mac";
> +		reg = <0>;
> +		phy-mode = "sgmii";
> +		fixed-link {
> +			speed = <2500>;
> +			full-duplex;
> +			pause;
> +		};
> +	};
> +
>  	gmac1: mac@1 {
>  		compatible = "mediatek,eth-mac";
>  		reg = <1>;
> +		phy-mode = "gmii";
>  		phy-handle = <&phy0>;
>  	};
>
> @@ -78,7 +90,6 @@
>
>  		phy0: ethernet-phy@0 {
>  			reg = <0>;
> -			phy-mode = "gmii";
>  		};
>  	};
>  };
> diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
> index 9608bc2ccb3f..867b88103b9d 100644
> --- a/arch/arm/boot/dts/mt7629.dtsi
> +++ b/arch/arm/boot/dts/mt7629.dtsi
> @@ -468,14 +468,12 @@
>  			compatible = "mediatek,mt7629-sgmiisys", "syscon";
>  			reg = <0x1b128000 0x3000>;
>  			#clock-cells = <1>;
> -			mediatek,physpeed = "2500";
>  		};
>
>  		sgmiisys1: syscon@1b130000 {
>  			compatible = "mediatek,mt7629-sgmiisys", "syscon";
>  			reg = <0x1b130000 0x3000>;
>  			#clock-cells = <1>;
> -			mediatek,physpeed = "2500";
>  		};
>  	};
>  };
> --
> 2.17.1

Does MT7629 soc has the same SGMII IP block as on the MT7622?
If that is the case then phy-mode should set to "2500base-x".
See discussion about the MT7622 [1] and dts of  
mt7622-bananapi-bpi-r64.dts[2][3]

Note the code only set the phy in overclock mode if phymode =  
2500base-x and the
link is a fixed-link, see [4].
Alsp the current code doesn't support sgmii so well. Sgmii at 2.5Gbit is not
supported at all.

Greats,

René

[1]:  
https://lore.kernel.org/netdev/20190822144433.GT13294@shell.armlinux.org.uk/
[2]:  
https://lore.kernel.org/netdev/20190825174341.20750-4-opensource@vdorst.com/
[3]:  
https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/tree/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts#n122
[4]:  
https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git/tree/drivers/net/ethernet/mediatek/mtk_sgmii.c#n72
