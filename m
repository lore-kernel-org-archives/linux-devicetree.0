From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v2 2/3] MAINTAINERS: add zx2967 reset controller driver
 to ARM ZTE architecture
Date: Mon, 16 Jan 2017 15:38:48 +0100
Message-ID: <1484577528.8415.147.camel@pengutronix.de>
References: <1484564194-18530-1-git-send-email-baoyou.xie@linaro.org>
         <1484564194-18530-2-git-send-email-baoyou.xie@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1484564194-18530-2-git-send-email-baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, xie.baoyou-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, chen.chaokai-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org, wang.qiang01-Th6q7B73Y6EnDS1+zs4M5A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2017-01-16 at 18:56 +0800, Baoyou Xie wrote:
> Add the zx2967 reset controller driver as maintained by ARM ZTE
> architecture maintainers, as they're parts of the core IP.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2793808..08f8155 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1980,10 +1980,12 @@ L:	linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	arch/arm/mach-zx/
>  F:	drivers/clk/zte/
> +F:	drivers/reset/reset-zx2967.c
>  F:	drivers/soc/zte/
>  F:	drivers/thermal/zx*
>  F:	Documentation/devicetree/bindings/arm/zte.txt
>  F:	Documentation/devicetree/bindings/clock/zx296702-clk.txt
> +F:	Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt
>  F:	Documentation/devicetree/bindings/soc/zte/
>  F:	Documentation/devicetree/bindings/thermal/zx*
>  F:	include/dt-bindings/soc/zx*.h

This patch doesn't apply on top of reset/next. I can rebase it, but it
will cause a trivial merge conflict with the soc/thermal additions.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
