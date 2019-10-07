From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3] ARM: dts: imx6qdl-rex: add gpio expander pca9535
Date: Mon, 7 Oct 2019 19:24:32 +0800
Message-ID: <20191007112430.GD7150@dragon>
References: <20190916104353.7278-1-gilles.doffe@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190916104353.7278-1-gilles.doffe@savoirfairelinux.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>
Cc: devicetree@vger.kernel.org, rennes@savoirfairelinux.com, jerome.oufella@savoirfairelinux.com, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 16, 2019 at 12:43:53PM +0200, Gilles DOFFE wrote:
> The pca9535 gpio expander is present on the Rex baseboard, but missing
> from the dtsi.
> The pca9535 is on i2c2 bus which is common to the three SOM
> variants (Basic/Pro/Ultra), thus it is activated by default.
> 
> Add also the new gpio controller and the associated interrupt line
> MX6QDL_PAD_NANDF_CS3__GPIO6_IO16.
> 
> Signed-off-by: Gilles DOFFE <gilles.doffe@savoirfairelinux.com>
> ---
>  arch/arm/boot/dts/imx6qdl-rex.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-rex.dtsi b/arch/arm/boot/dts/imx6qdl-rex.dtsi
> index 97f1659144ea..8a748ca1b108 100644
> --- a/arch/arm/boot/dts/imx6qdl-rex.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-rex.dtsi
> @@ -132,6 +132,19 @@
>  	pinctrl-0 = <&pinctrl_i2c2>;
>  	status = "okay";
>  
> +	pca9535: gpio8@27 {

gpio-expander might be a better node name?

Shawn

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
> +
>  	eeprom@57 {
>  		compatible = "atmel,24c02";
>  		reg = <0x57>;
> @@ -237,6 +250,12 @@
>  			>;
>  		};
>  
> +		pinctrl_pca9535: pca9535 {
> +			fsl,pins = <
> +				MX6QDL_PAD_NANDF_CS3__GPIO6_IO16	0x17059
> +		   >;
> +		};
> +
>  		pinctrl_uart1: uart1grp {
>  			fsl,pins = <
>  				MX6QDL_PAD_CSI0_DAT10__UART1_TX_DATA	0x1b0b1
> -- 
> 2.20.1
> 
