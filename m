From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 07/12] ARM: dts: imx6ul-isiot: Add Sound card with codec
 node
Date: Fri, 24 Mar 2017 13:23:28 +0800
Message-ID: <20170324052324.GF30608@dragon>
References: <1490204897-14525-1-git-send-email-jagan@openedev.com>
 <1490204897-14525-8-git-send-email-jagan@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490204897-14525-8-git-send-email-jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 22, 2017 at 11:18:12PM +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> 
> Add support for Sound card and related codec(via i2c1) nodes
> on Engicam Is.IoT MX6UL variant module boards.
> 
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>
> Cc: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6ul-isiot-common.dtsi | 11 +++++++++++
>  arch/arm/boot/dts/imx6ul-isiot.dtsi        | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6ul-isiot-common.dtsi b/arch/arm/boot/dts/imx6ul-isiot-common.dtsi
> index b149b5e..c79fa42 100644
> --- a/arch/arm/boot/dts/imx6ul-isiot-common.dtsi
> +++ b/arch/arm/boot/dts/imx6ul-isiot-common.dtsi
> @@ -41,6 +41,17 @@
>   */
>  
>  &i2c1 {
> +	codec: sgtl5000@0a {

	sgtl5000: codec@a {

> +		compatible = "fsl,sgtl5000";
> +		reg = <0x0a>;
> +		clocks = <&clks IMX6UL_CLK_OSC>;
> +		clock-names = "mclk";
> +		wlf,shared-lrclk;

This is a property for wm8960 not sgtl5000.

> +		VDDA-supply = <&reg_3p3v>;
> +		VDDIO-supply = <&reg_3p3v>;
> +		VDDD-supply = <&reg_1p8v>;
> +	};
> +
>  	touch: stmpe811@44 {
>  		compatible = "st,stmpe811";
>  		reg = <0x44>;
> diff --git a/arch/arm/boot/dts/imx6ul-isiot.dtsi b/arch/arm/boot/dts/imx6ul-isiot.dtsi
> index ea30380..7cbcaea 100644
> --- a/arch/arm/boot/dts/imx6ul-isiot.dtsi
> +++ b/arch/arm/boot/dts/imx6ul-isiot.dtsi
> @@ -69,6 +69,36 @@
>  				    100>;
>  		default-brightness-level = <100>;
>  	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	sound {
> +		compatible = "fsl,imx-audio-sgtl5000";
> +		model = "imx6ul-isiot-sgtl5000";
> +		cpu-dai = <&sai2>;
> +		audio-codec = <&codec>;
> +		gpr = <&gpr>;

I do not see this 'gpr' thing in bindings/sound/imx-audio-sgtl5000.txt.

Shawn

> +		audio-routing =
> +			"MIC_IN", "Mic Jack",
> +			"Mic Jack", "Mic Bias",
> +			"Headphone Jack", "HP_OUT";
> +	};
>  };
>  
>  &i2c1 {
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
