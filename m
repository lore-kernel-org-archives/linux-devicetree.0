From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: rockchip: correct regular setting for act8846
Date: Wed, 24 May 2017 10:17:03 +0200
Message-ID: <5352430.FzU3E8oYou@phil>
References: <1495611221-6749-1-git-send-email-eddie.cai.linux@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1495611221-6749-1-git-send-email-eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Eddie,

Am Mittwoch, 24. Mai 2017, 15:33:41 CEST schrieb Eddie Cai:
> the previous setting of act8846 is just copy from firefly board. but
> the reload board is a little different from firefly board. let's correct
> it.
> 
> Signed-off-by: Eddie Cai <eddie.cai.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
> index 8134966..4cfa109 100644
> --- a/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
> +++ b/arch/arm/boot/dts/rk3288-firefly-reload-core.dtsi
> @@ -179,6 +179,7 @@
>  				regulator-name = "vccio_sd";
>  				regulator-min-microvolt = <3300000>;
>  				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;

the rest below looks pretty straight forward, but why does vccio_sd
need to be always on?

I've checked the reload's schematics but did not find any further users
of vccio_sd that may warant this attribute.


Heiko


>  			};
>  
>  			vdd10_lcd: REG6 {
> @@ -187,24 +188,23 @@
>  				regulator-max-microvolt = <1000000>;
>  			};
>  
> -			vcca_18: REG7  {
> -				regulator-name = "vcca_18";
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <1800000>;
> -				regulator-always-on;
> +			vcca_33: REG7  {
> +				regulator-name = "vcca_33";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
>  			};
>  
> -			vcca_33: REG8 {
> -				regulator-name = "vcca_33";
> +			vcc_lan: REG8 {
> +				regulator-name = "vcc_lan";
>  				regulator-min-microvolt = <3300000>;
>  				regulator-max-microvolt = <3300000>;
> -				regulator-always-on;
>  			};
>  
> -			vcc_lan: REG9 {
> -				regulator-name = "vcca_lan";
> +			vccio_pmu: REG9 {
> +				regulator-name = "vccio_pmu";
>  				regulator-min-microvolt = <3300000>;
>  				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
>  			};
>  
>  			vdd_10: REG10 {
> @@ -218,6 +218,7 @@
>  				regulator-name = "vcc_18";
>  				regulator-min-microvolt = <1800000>;
>  				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
>  			};
>  
>  			vcc18_lcd: REG12 {
> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
