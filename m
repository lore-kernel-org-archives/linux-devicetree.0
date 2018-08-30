From: =?UTF-8?Q?=27Ond=C5=99ej_Jirman=27_via_linux=2Dsunxi?= <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Subject: Re: [PATCH v3 30/30] ARM: sun8i: a83t: full range OPP
 tables and CPUfreq
Date: Thu, 30 Aug 2018 18:38:33 +0200
Message-ID: <20180830163833.v7zvmaz2vsxvzhur@core>
References: <20180830154518.29507-1-embed3d@gmail.com>
 <20180830154518.29507-31-embed3d@gmail.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBC53UDOAKGQEGTEKUBY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180830154518.29507-31-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Thu, Aug 30, 2018 at 05:45:18PM +0200, Philipp Rossak wrote:
> Since we have now thermal trotteling enabeled we can now add the full
> range of the OPP table.

I'm not sure we can. I have a tablet with A83T SoC and it gets unstable
at these frequencies even with thermal throttling on mainline kernel. (Though
I have my own THS driver, but I doubt a different driver will change much.)

There might be some other issue left in the cpufreq code. I'll let others
test this on a better cooled boards though.

Did you/someone test this?

regards,
  o.

> The operating points were found in Allwinner BSP and fex files.
> 
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> index 78aa448e869f..ddcf404f9c80 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -250,6 +250,22 @@
>  			opp-microvolt = <840000>;
>  			clock-latency-ns = <244144>; /* 8 32k periods */
>  		};
> +
> +		opp-1608000000 {
> +			opp-hz = /bits/ 64 <1608000000>;
> +			opp-microvolt = <920000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +		};
> +		opp-1800000000 { /* BOOT FREQ */
> +			opp-hz = /bits/ 64 <1800000000>;
> +			opp-microvolt = <1000000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +		};
> +		opp-2016000000 {
> +			opp-hz = /bits/ 64 <2016000000>;
> +			opp-microvolt = <1080000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +		};
>  	};
>  
>  	cpu1_opp_table: opp_table1 {
> @@ -303,6 +319,22 @@
>  			opp-microvolt = <840000>;
>  			clock-latency-ns = <244144>; /* 8 32k periods */
>  		};
> +
> +		opp-1608000000 {
> +			opp-hz = /bits/ 64 <1608000000>;
> +			opp-microvolt = <920000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +		};
> +		opp-1800000000 { /* BOOT FREQ */
> +			opp-hz = /bits/ 64 <1800000000>;
> +			opp-microvolt = <1000000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +		};
> +		opp-2016000000 {
> +			opp-hz = /bits/ 64 <2016000000>;
> +			opp-microvolt = <1080000>;
> +			clock-latency-ns = <244144>; /* 8 32k periods */
> +		};
>  	};
>  
>  	soc {
> -- 
> 2.11.0
> 
> -- 
> You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> For more options, visit https://groups.google.com/d/optout.
