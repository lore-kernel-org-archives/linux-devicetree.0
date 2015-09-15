From: Dave Young <dyoung-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v7 2/8] ARM64: add SBSA Generic Watchdog device node in
 foundation-v8.dts
Date: Tue, 15 Sep 2015 16:43:32 +0800
Message-ID: <20150915084332.GC5767@localhost.localdomain>
References: <=fu.wei@linaro.org>
 <1440435683-7343-1-git-send-email-fu.wei@linaro.org>
 <1440435683-7343-3-git-send-email-fu.wei@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1440435683-7343-3-git-send-email-fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org, hanjun.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-acpi-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tekkamanninja-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, graeme.gregory-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, al.stone-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, vgandhi-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, jcm-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, leo.duran-5C7GfCeVMHo@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, panand-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/25/15 at 01:01am, fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
> From: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> This can be a example of adding SBSA Generic Watchdog device node
> into some dts files for the Soc which contains SBSA Generic Watchdog.
> 
> Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Signed-off-by: Fu Wei <fu.wei-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm64/boot/dts/arm/foundation-v8.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/arm/foundation-v8.dts b/arch/arm64/boot/dts/arm/foundation-v8.dts
> index 4eac8dc..824431f 100644
> --- a/arch/arm64/boot/dts/arm/foundation-v8.dts
> +++ b/arch/arm64/boot/dts/arm/foundation-v8.dts
> @@ -237,4 +237,11 @@
>  			};
>  		};
>  	};
> +	watchdog@2a440000 {
> +		compatible = "arm,sbsa-gwdt";
> +		reg = <0x0 0x2a440000 0 0x1000>,
> +			<0x0 0x2a450000 0 0x1000>;
> +		interrupts = <0 27 4>;
> +		timeout-sec = <10 5>;

I assume 10 is timeout, 5 is pre timeout, but in the driver code the default
value is 30/10, I think the example dts[i] should use same default values as in code.

BTW, for kdump kernel Pratyush is working on kdump on wdt enabled system. 
Basiclly we expect one configure longer timeout, and kick it in shorter
period so we can get a chance to save vmcore. 10s sounds too short for the case..

> +	};
>  };
> -- 
> 2.4.3
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
