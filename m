From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: voipac: Improve fixed voltage regulator
 definition
Date: Wed, 6 Nov 2013 11:35:15 +0800
Message-ID: <20131106033514.GQ19770@S2101-09.ap.freescale.net>
References: <1383655760-28206-1-git-send-email-lisovy@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383655760-28206-1-git-send-email-lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, pisa-/N2ztlQkxE7Ub/6JBqosbQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Nov 05, 2013 at 01:49:20PM +0100, Rostislav Lisovy wrote:
> Signed-off-by: Rostislav Lisovy <lisovy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi b/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
> index a7d03ad..4f1d8fa 100644
> --- a/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
> +++ b/arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
> @@ -27,9 +27,12 @@
>  
>  	regulators {
>  		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
>  
> -		reg_3p3v: 3p3v {
> +		reg_3p3v: regulator@0 {

Yeah, instead of using arbitrary node name, the generic regulator@num is
more preferable. I will make this change to the rest of IMX dts files.

Applied, thanks.

Shawn

>  			compatible = "regulator-fixed";
> +			reg = <0>;
>  			regulator-name = "3P3V";
>  			regulator-min-microvolt = <3300000>;
>  			regulator-max-microvolt = <3300000>;
> -- 
> 1.7.10.4
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
