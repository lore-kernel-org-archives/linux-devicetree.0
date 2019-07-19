From: Gilles Doffe <gilles.doffe@savoirfairelinux.com>
Subject: Re: [PATCH] arm: dts: imx6qdl: add gpio expander pca9535
Date: Fri, 19 Jul 2019 06:51:08 -0400 (EDT)
Message-ID: <405527661.6507550.1563533468485.JavaMail.zimbra@savoirfairelinux.com>
References: <20190712124522.571-1-gilles.doffe@savoirfairelinux.com> <20190712135541.55fgchvyp33cl3uv@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190712135541.55fgchvyp33cl3uv@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, mark rutland <mark.rutland@arm.com>, festevam@gmail.com, s hauer <s.hauer@pengutronix.de>, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

Hello Marco,

Thanks for your review.

Corrected in v2.

Regards,
Gilles

----- Le 12 Juil 19, à 15:55, Marco Felsch m.felsch@pengutronix.de a écrit :

Hi,

On 19-07-12 14:45, Gilles DOFFE wrote:
> The pca9535 gpio expander is present on the Rex baseboard, but missing
> from the dtsi.
> 
> Add the new gpio controller and the associated interrupt line
> MX6QDL_PAD_NANDF_CS3__GPIO6_IO16.
> 
> Signed-off-by: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>
> ---
>  arch/arm/boot/dts/imx6qdl-rex.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-rex.dtsi b/arch/arm/boot/dts/imx6qdl-rex.dtsi
> index 97f1659144ea..d5324c6761c1 100644
> --- a/arch/arm/boot/dts/imx6qdl-rex.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-rex.dtsi
> @@ -136,6 +136,19 @@
>  		compatible = "atmel,24c02";
>  		reg = <0x57>;
>  	};
> +
> +	gpio8: pca9535@27 {

Just a nitpick, I would change that to

	pca9535: gpio8@27 {

Regards,
  Marco

> +		compatible = "nxp,pca9535";
> +		reg = <0x27>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pca9535>;
> +		interrupt-parent = <&gpio6>;
> +		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
>  };
>  
>  &i2c3 {
> @@ -237,6 +250,12 @@
>  			>;
>  		};
>  
> +		pinctrl_pca9535: pca9535 {
> +			fsl,pins = <
> +				MX6QDL_PAD_NANDF_CS3__GPIO6_IO16	0x00017059
> +		   >;
> +		};
> +
>  		pinctrl_uart1: uart1grp {
>  			fsl,pins = <
>  				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
> -- 
> 2.19.1
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
