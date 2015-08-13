From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: shmobile: silk: add SDHI1 DT support
Date: Fri, 14 Aug 2015 01:47:12 +0300
Message-ID: <55CD1E70.6050103@cogentembedded.com>
References: <10037494.4LD4T2QGPX@wasted.cogentembedded.com>
 <2757472.iuyUyRzJ3z@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2757472.iuyUyRzJ3z-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello.

On 08/11/2015 01:44 AM, Sergei Shtylyov wrote:

> Define the SILK board dependent part of the SDHI1 (connected to micro-SD slot)
> device nodes along with the necessary voltage regulators.
>
> Based on the original patch by Vladimir Barinov
> <vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>
> ---
> This patch is against 'renesas-devel-20150810-v4.2-rc6' tag of Simon Horman's
> 'renesas.git' repo plus the R8A7794/SILK QSPI patches just re-posted. It needs
> the R8A7794 GPIO patches in order to compile.
>
> Changes in version 2:
> - removed not working SDHI0 stuff, renamed the patch;
> - replaced SDHI1's "wp-gpios" property with "disable-wp".
>
>   arch/arm/boot/dts/r8a7794-silk.dts |   40 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
>
> Index: renesas/arch/arm/boot/dts/r8a7794-silk.dts
> ===================================================================
> --- renesas.orig/arch/arm/boot/dts/r8a7794-silk.dts
> +++ renesas/arch/arm/boot/dts/r8a7794-silk.dts
[...]
> @@ -39,6 +40,29 @@
>   		regulator-boot-on;
>   		regulator-always-on;
>   	};

    Oops, need a newline here. I'll repost.

> +	vcc_sdhi1: regulator@3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "SDHI1 Vcc";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&gpio4 26 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	vccq_sdhi1: regulator@4 {
> +		compatible = "regulator-gpio";
> +
> +		regulator-name = "SDHI1 VccQ";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +		gpios-states = <1>;
> +		states = <3300000 1
> +			  1800000 0>;
> +	};
>   };
>
>   &extal_clk {
[...]

MBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
