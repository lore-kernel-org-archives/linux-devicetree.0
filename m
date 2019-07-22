From: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2] arm: dts: imx6qdl: add gpio expander pca9535
Date: Mon, 22 Jul 2019 09:53:41 +0200
Message-ID: <20190722075341.e4ve45rneusiogtk@pengutronix.de>
References: <20190719104615.5329-1-gilles.doffe@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190719104615.5329-1-gilles.doffe@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, festevam@gmail.com, s.hauer@pengutronix.de, rennes@savoirfairelinux.com, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, jerome.oufella@savoirfairelinux.com, shawnguo@kernel.org
List-Id: devicetree@vger.kernel.org

Hi Gilles,

can you adapt the patch title, I assumed that the base dtsi is adding a
gpio-expander which makes no sense.

On 19-07-19 12:46, Gilles DOFFE wrote:
> The pca9535 gpio expander is present on the Rex baseboard, but missing
> from the dtsi.
> 
> Add the new gpio controller and the associated interrupt line
> MX6QDL_PAD_NANDF_CS3__GPIO6_IO16.
> 
> Signed-off-by: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>
> ---

Having a changelog would be nice too.

>  arch/arm/boot/dts/imx6qdl-rex.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-rex.dtsi b/arch/arm/boot/dts/imx6qdl-rex.dtsi
> index 97f1659144ea..b517efb22fcb 100644
> --- a/arch/arm/boot/dts/imx6qdl-rex.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-rex.dtsi
> @@ -136,6 +136,19 @@
>  		compatible = "atmel,24c02";
>  		reg = <0x57>;
>  	};
> +
> +	pca9535: gpio8@27 {
> +		compatible = "nxp,pca9535";
> +		reg = <0x27>;

The i2c devices are orderd by their i2c-addresses starting from the
lowest.

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

The pinmux below don't use the leading zero's if you are the first I
would drop that.

Regards,
  Marco

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
