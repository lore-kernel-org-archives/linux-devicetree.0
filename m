From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH 2/2] arm: mvebu: reorder nodes under internal-regs by
 address in RN2120 .dts file
Date: Mon, 12 Oct 2015 16:23:24 +0200
Message-ID: <20151012142324.GB30801@lunn.ch>
References: <cover.1444428035.git.arno@natisbad.org>
 <277de75473af2431849a7494ae65b57dbc9a8309.1444428035.git.arno@natisbad.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <277de75473af2431849a7494ae65b57dbc9a8309.1444428035.git.arno@natisbad.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, TuxOholic <tuxoholic@hotmail.de>
List-Id: devicetree@vger.kernel.org

On Sat, Oct 10, 2015 at 12:10:39AM +0200, Arnaud Ebalard wrote:
> 
> This cosmetic patch reorder nodes under internal-regs by increasing
> address order, as epxected.

expected.

Gregory, can you fix that as you commit?

Acked-by: Andrew Lunn <andrew@lunn.ch>

	  Andrew

> 
> Signed-off-by: Arnaud Ebalard <arno@natisbad.org>
> ---
>  arch/arm/boot/dts/armada-xp-netgear-rn2120.dts | 86 +++++++++++++-------------
>  1 file changed, 43 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
> index 85b2f87c0b8a..d72a69d97ba2 100644
> --- a/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
> +++ b/arch/arm/boot/dts/armada-xp-netgear-rn2120.dts
> @@ -94,54 +94,11 @@
>  				status = "disabled";
>  			};
>  
> -			/* Two rear eSATA ports */
> -			sata@a0000 {
> -				nr-ports = <2>;
> -				status = "okay";
> -			};
> -
> -			serial@12000 {
> -				status = "okay";
> -			};
> -
> -			mdio {
> -				phy0: ethernet-phy@0 { /* Marvell 88E1318 */
> -					reg = <0>;
> -				};
> -
> -				phy1: ethernet-phy@1 { /* Marvell 88E1318 */
> -					reg = <1>;
> -				};
> -			};
> -
> -			ethernet@70000 {
> -				status = "okay";
> -				phy = <&phy0>;
> -				phy-mode = "rgmii-id";
> -			};
> -
> -			ethernet@74000 {
> -				status = "okay";
> -				phy = <&phy1>;
> -				phy-mode = "rgmii-id";
> -			};
> -
> -			/* Front USB 2.0 port */
> -			usb@50000 {
> -				status = "okay";
> -			};
> -
>  			i2c@11000 {
>  				compatible = "marvell,mv64xxx-i2c";
>  				clock-frequency = <400000>;
>  				status = "okay";
>  
> -				isl12057: isl12057@68 {
> -					compatible = "isil,isl12057";
> -					reg = <0x68>;
> -					isil,irq2-can-wakeup-machine;
> -				};
> -
>  				/* Controller for rear fan #1 of 3 (Protechnic
>  				 * MGT4012XB-O20, 8000RPM) near eSATA port */
>  				g762_fan1: g762@3e {
> @@ -178,6 +135,49 @@
>  					compatible = "gmt,g751";
>  					reg = <0x4c>;
>  				};
> +
> +				isl12057: isl12057@68 {
> +					compatible = "isil,isl12057";
> +					reg = <0x68>;
> +					isil,irq2-can-wakeup-machine;
> +				};
> +			};
> +
> +			serial@12000 {
> +				status = "okay";
> +			};
> +
> +			/* Front USB 2.0 port */
> +			usb@50000 {
> +				status = "okay";
> +			};
> +
> +			mdio {
> +				phy0: ethernet-phy@0 { /* Marvell 88E1318 */
> +					reg = <0>;
> +				};
> +
> +				phy1: ethernet-phy@1 { /* Marvell 88E1318 */
> +					reg = <1>;
> +				};
> +			};
> +
> +			ethernet@70000 {
> +				status = "okay";
> +				phy = <&phy0>;
> +				phy-mode = "rgmii-id";
> +			};
> +
> +			ethernet@74000 {
> +				status = "okay";
> +				phy = <&phy1>;
> +				phy-mode = "rgmii-id";
> +			};
> +
> +			/* Two rear eSATA ports */
> +			sata@a0000 {
> +				nr-ports = <2>;
> +				status = "okay";
>  			};
>  
>  			nand@d0000 {
> -- 
> 2.5.3
> 
