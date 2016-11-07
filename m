From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 3/3] arm64: dts: h3ulcb: enable SDHI2
Date: Mon, 7 Nov 2016 14:23:47 +0100
Message-ID: <20161107132347.GA29721@verge.net.au>
References: <1478196242-939-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1478196302-1060-1-git-send-email-vladimir.barinov@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478196302-1060-1-git-send-email-vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Nov 03, 2016 at 09:05:02PM +0300, Vladimir Barinov wrote:
> This supports SDHI2 for H3ULCB onboard eMMC
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 43 ++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> index a244edb..e46687e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
> @@ -55,6 +55,24 @@
>  		clock-frequency = <24576000>;
>  	};
>  
> +	reg_1p8v: regulator0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-1.8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v: regulator1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-3.3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  	vcc_sdhi0: regulator-vcc-sdhi0 {
>  		compatible = "regulator-fixed";
>  
> @@ -113,6 +131,18 @@
>  		function = "sdhi0";
>  		power-source = <1800>;
>  	};
> +
> +	sdhi2_pins_3v3: sd2_3v3 {
> +		groups = "sdhi2_data8", "sdhi2_ctrl";
> +		function = "sdhi2";
> +		power-source = <3300>;
> +	};
> +
> +	sdhi2_pins_1v8: sd2_1v8 {
> +		groups = "sdhi2_data8", "sdhi2_ctrl";
> +		function = "sdhi2";
> +		power-source = <1800>;
> +	};

I'd prefer if the pin nodes where named as follows:

	sdhi2_pins_3v3 -> sdhi2_pins
	sdhi2_pins_1v8 -> sdhi2_pins_uhs

And that a patch was provided to rename the SDHI0 nodes to match that scheme.

>  
>  	sound_pins: sound {
>  		groups = "ssi01239_ctrl", "ssi0_data", "ssi1_data_a";
> @@ -128,6 +158,19 @@
>  	status = "okay";
>  };
>  
> +&sdhi2 {
> +	/* used for on-board 8bit eMMC */
> +	pinctrl-0 = <&sdhi2_pins_3v3>;
> +	pinctrl-1 = <&sdhi2_pins_1v8>;
> +	pinctrl-names = "default", "state_uhs";
> +
> +	vmmc-supply = <&reg_3p3v>;
> +	vqmmc-supply = <&reg_1p8v>;
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> +
>  &ssi1 {
>  	shared-pin;
>  };
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
