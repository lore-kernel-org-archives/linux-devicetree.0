From: =?utf-8?b?UmVuw6k=?= van Dorst <opensource@vdorst.com>
Subject: Re: [PATCH net,v2 2/2] arm: dts: mediatek: Fix mt7629 dts to
 reflect the latest dt-binding
Date: Mon, 07 Oct 2019 18:30:28 +0000
Message-ID: <20191007183028.Horde.dCYJA3Xp9mBh_Bs9Ixa7Sh0@www.vdorst.com>
References: <20191007070844.14212-1-Mark-MC.Lee@mediatek.com>
 <20191007070844.14212-3-Mark-MC.Lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007070844.14212-3-Mark-MC.Lee@mediatek.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: MarkLee <Mark-MC.Lee@mediatek.com>
Cc: "David S. Miller" <davem@davemloft.net>, Sean Wang <sean.wang@mediatek.com>, John Crispin <john@phrozen.org>, Nelson Chang <nelson.chang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting MarkLee <Mark-MC.Lee@mediatek.com>:

> * Removes mediatek,physpeed property from dtsi that is useless in PHYLINK
> * Use the fixed-link property speed = <2500> to set the phy in 2.5Gbit.
> * Set gmac1 to gmii mode that connect to a internal gphy
>
> Signed-off-by: MarkLee <Mark-MC.Lee@mediatek.com>
> --
> v1->v2:
> * SGMII port only support BASE-X at 2.5Gbit.
> ---
>  arch/arm/boot/dts/mt7629-rfb.dts | 13 ++++++++++++-
>  arch/arm/boot/dts/mt7629.dtsi    |  2 --
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/mt7629-rfb.dts  
> b/arch/arm/boot/dts/mt7629-rfb.dts
> index 3621b7d2b22a..9980c10c6e29 100644
> --- a/arch/arm/boot/dts/mt7629-rfb.dts
> +++ b/arch/arm/boot/dts/mt7629-rfb.dts
> @@ -66,9 +66,21 @@
>  	pinctrl-1 = <&ephy_leds_pins>;
>  	status = "okay";
>
> +	gmac0: mac@0 {
> +		compatible = "mediatek,eth-mac";
> +		reg = <0>;
> +		phy-mode = "2500base-x";
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

Reviewed-by: René van Dorst <opensource@vdorst.com>
