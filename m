From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx53: use PMIC's TSI pins in adc mode
Date: Fri, 2 Feb 2018 15:00:34 +0800
Message-ID: <20180202070033.GB25699@dragon>
References: <20180115142820.31729-1-sebastian.reichel@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180115142820.31729-1-sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 15, 2018 at 03:28:20PM +0100, Sebastian Reichel wrote:
> PPD uses the PMIC's TSI pins in general purpose ADC mode.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>

s/imx53/imx53-ppd

> ---
>  arch/arm/boot/dts/imx53-ppd.dts | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx53-ppd.dts b/arch/arm/boot/dts/imx53-ppd.dts
> index 123297da43a7..80224fa995f9 100644
> --- a/arch/arm/boot/dts/imx53-ppd.dts
> +++ b/arch/arm/boot/dts/imx53-ppd.dts
> @@ -132,6 +132,14 @@
>  		enable-active-high;
>  	};
>  
> +	reg_tsiref: tsiref {

A better node name should be regulator-tsiref.

> +		compatible = "regulator-fixed";
> +		regulator-name = "tsiref";
> +		regulator-min-microvolt = <2500000>;
> +		regulator-max-microvolt = <2500000>;
> +		regulator-always-on;
> +	};
> +
>  	pwm_bl: backlight {
>  		compatible = "pwm-backlight";
>  		pwms = <&pwm2 0 50000>;
> @@ -295,6 +303,9 @@
>  		interrupts = <12 0x8>;
>  		spi-max-frequency = <1000000>;
>  

This new line can be dropped now.

I fixed up all these, and applied the patch.

Shawn 

> +		dlg,tsi-as-adc;
> +		tsiref-supply = <&reg_tsiref>;
> +
>  		regulators {
>  			buck1_reg: buck1 {
>  				regulator-name = "BUCKCORE";
> -- 
> 2.15.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
