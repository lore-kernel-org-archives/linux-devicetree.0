From: Dong Aisheng <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM: dts: imx7s: Adjust anatop-enable-bit for
 'reg_1p0d'
Date: Fri, 14 Apr 2017 23:32:43 +0800
Message-ID: <20170414153243.GA1792@b29396-OptiPlex-7040>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
 <20170413133242.5068-4-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170413133242.5068-4-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 06:32:37AM -0700, Andrey Smirnov wrote:
> In PMU_REG_1P0Dn ENABLE_LINREG is bit 0. Bit 31 is called OVERRIDE and
> it serves the function of granting permission to GPC IP block to alter
> various bit-fields of the register. The reason why this property, that
> trickeld here from Freescale BSP, is set to 31 is because in the code
> it came from it is used in conjunction with a notifier handler for
> REGULATOR_EVENT_PRE_DO_ENABLE and REGULATOR_EVENT_PRE_DO_DISABLE
> events (not found in upstream kernel) that triggers GPC to start
> manipulating aforementioned other bitfields.
> 
> Since:
> 	a) none of the aforementioned machinery is implemented by
> 	   upstream
> 	b) using 'anatop-enable-bit' in that capacity is a bit of a
> 	   semantic stretch

Yes, this does is a bit of semantic stretch.
FSL using is combined with regulator notify and that do bring a bit
of complexity.

I'm not sure if it's good to introduce another anatop-override-bit
to separate, but i'm a bit scare since there's already many....

> 
> simplify the situation by setting the value of 'anatop-enable-bit' to
> point to ENABLE_LINREG (same as i.MX6).
> 
> Cc: yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx7s.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
> index 22c9788..8fee299 100644
> --- a/arch/arm/boot/dts/imx7s.dtsi
> +++ b/arch/arm/boot/dts/imx7s.dtsi
> @@ -516,7 +516,7 @@
>  					anatop-min-bit-val = <8>;
>  					anatop-min-voltage = <800000>;
>  					anatop-max-voltage = <1200000>;
> -					anatop-enable-bit = <31>;
> +					anatop-enable-bit = <0>;

The change of this line seems already exist in patch 1.

Regards
Dong Aisheng
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
