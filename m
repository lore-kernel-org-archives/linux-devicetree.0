From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 10/15] ARM: dts: imx6dl-icore-rqs: Add sgtl5000 codec
 node
Date: Wed, 29 Mar 2017 11:29:12 +0800
Message-ID: <20170329032910.GX30608@dragon>
References: <1490372330-5611-1-git-send-email-jagan@openedev.com>
 <1490372330-5611-11-git-send-email-jagan@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490372330-5611-11-git-send-email-jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Mar 24, 2017 at 09:48:45PM +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> 
> - Moved sound card node on imx6qdl-icore-rqs.dtsi
> - Added codec node in imx6dl-icore-rqs from imx6q-icore-rqs
> 
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>
> Cc: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
> Changes for v2:
> - Newly added patch
> 
>  arch/arm/boot/dts/imx6dl-icore-rqs.dts   | 11 +++++++++++
>  arch/arm/boot/dts/imx6q-icore-rqs.dts    | 13 -------------
>  arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi | 13 +++++++++++++
>  3 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-icore-rqs.dts b/arch/arm/boot/dts/imx6dl-icore-rqs.dts
> index cf42c2f..5b4c14c 100644
> --- a/arch/arm/boot/dts/imx6dl-icore-rqs.dts
> +++ b/arch/arm/boot/dts/imx6dl-icore-rqs.dts
> @@ -49,3 +49,14 @@
>  	model = "Engicam i.CoreM6 DualLite/Solo RQS Starter Kit";
>  	compatible = "engicam,imx6-icore-rqs", "fsl,imx6dl";
>  };
> +
> +&i2c3 {
> +	codec: sgtl5000@0a {

Why adding something that the following patch will change right away?

Shawn

> +		compatible = "fsl,sgtl5000";
> +		reg = <0x0a>;
> +		clocks = <&clks IMX6QDL_CLK_CKO>;
> +		VDDA-supply = <&reg_2p5v>;
> +		VDDIO-supply = <&reg_3p3v>;
> +		VDDD-supply = <&reg_1p8v>;
> +	};
> +};
> diff --git a/arch/arm/boot/dts/imx6q-icore-rqs.dts b/arch/arm/boot/dts/imx6q-icore-rqs.dts
> index e451b4c..441a28e5 100644
> --- a/arch/arm/boot/dts/imx6q-icore-rqs.dts
> +++ b/arch/arm/boot/dts/imx6q-icore-rqs.dts
> @@ -47,19 +47,6 @@
>  / {
>  	model = "Engicam i.CoreM6 Quad/Dual RQS Starter Kit";
>  	compatible = "engicam,imx6-icore-rqs", "fsl,imx6q";
> -
> -	sound {
> -		compatible = "fsl,imx-audio-sgtl5000";
> -		model = "imx-audio-sgtl5000";
> -		ssi-controller = <&ssi1>;
> -		audio-codec = <&codec>;
> -		audio-routing =
> -			"MIC_IN", "Mic Jack",
> -			"Mic Jack", "Mic Bias",
> -			"Headphone Jack", "HP_OUT";
> -		mux-int-port = <1>;
> -		mux-ext-port = <4>;
> -	};
>  };
>  
>  &i2c3 {
> diff --git a/arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi b/arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi
> index 5fab5be..4032d38 100644
> --- a/arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-icore-rqs.dtsi
> @@ -118,6 +118,19 @@
>  		clocks = <&clks IMX6QDL_CLK_LVDS2_GATE>;
>  		clock-names = "refclk";
>  	};
> +
> +	sound {
> +		compatible = "fsl,imx-audio-sgtl5000";
> +		model = "imx-audio-sgtl5000";
> +		ssi-controller = <&ssi1>;
> +		audio-codec = <&codec>;
> +		audio-routing =
> +			"MIC_IN", "Mic Jack",
> +			"Mic Jack", "Mic Bias",
> +			"Headphone Jack", "HP_OUT";
> +		mux-int-port = <1>;
> +		mux-ext-port = <4>;
> +	};
>  };
>  
>  &clks {
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
