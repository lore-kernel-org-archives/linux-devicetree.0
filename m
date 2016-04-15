From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] arm64: dts: uniphier: change release address of
 spin-table
Date: Fri, 15 Apr 2016 14:05:49 +0100
Message-ID: <20160415130549.GB8021@leverpostej>
References: <1460716247-28049-1-git-send-email-yamada.masahiro@socionext.com>
 <1460716247-28049-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1460716247-28049-3-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Apr 15, 2016 at 07:30:47PM +0900, Masahiro Yamada wrote:
> The 8-byte register located at 0x59801200 on this SoC is dedicated
> for waking up secondary CPUs.  We can use it and save normal memory.

Generally, it is not safe to use MMIO registers to back spin-table. The
kernel maps the spin table location with cacheable attributes, so there
may be speculative accesses to any registes in the same (64K) page, and
a writeback may be larger than the 8-byte register width (which the
device might not accept, triggering an SError).

Given that, I do not think this is a good idea.

Thanks,
Mark.

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
> 
>  arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
> index 651c9d9..f73b09e 100644
> --- a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
> +++ b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
> @@ -77,7 +77,7 @@
>  			compatible = "arm,cortex-a72", "arm,armv8";
>  			reg = <0 0x000>;
>  			enable-method = "spin-table";
> -			cpu-release-addr = <0 0x80000100>;
> +			cpu-release-addr = <0 0x59801200>;
>  		};
>  
>  		cpu1: cpu@1 {
> @@ -85,7 +85,7 @@
>  			compatible = "arm,cortex-a72", "arm,armv8";
>  			reg = <0 0x001>;
>  			enable-method = "spin-table";
> -			cpu-release-addr = <0 0x80000100>;
> +			cpu-release-addr = <0 0x59801200>;
>  		};
>  
>  		cpu2: cpu@100 {
> @@ -93,7 +93,7 @@
>  			compatible = "arm,cortex-a53", "arm,armv8";
>  			reg = <0 0x100>;
>  			enable-method = "spin-table";
> -			cpu-release-addr = <0 0x80000100>;
> +			cpu-release-addr = <0 0x59801200>;
>  		};
>  
>  		cpu3: cpu@101 {
> @@ -101,7 +101,7 @@
>  			compatible = "arm,cortex-a53", "arm,armv8";
>  			reg = <0 0x101>;
>  			enable-method = "spin-table";
> -			cpu-release-addr = <0 0x80000100>;
> +			cpu-release-addr = <0 0x59801200>;
>  		};
>  	};
>  
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
