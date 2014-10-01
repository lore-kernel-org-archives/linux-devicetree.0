From: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/6] ARM: at91: remove at91sam9g45/9m10 legacy board
 support
Date: Wed, 1 Oct 2014 17:59:17 +0200
Message-ID: <20141001155917.GE3907@piout.net>
References: <1412093987-30241-1-git-send-email-boris.brezillon@free-electrons.com>
 <1412093987-30241-2-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1412093987-30241-2-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Peter Korsgaard <jacmet-OfajU3CKLf1/SzgSGea1oA@public.gmane.org>, Matt Mackall <mpm-VDJrAJ4Gl5ZBDgjK7y7TUQ@public.gmane.org>, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 30/09/2014 at 18:19:42 +0200, Boris Brezillon wrote :
> Remove legacy support for at91sam9g45/9m10 boards.
> This include board files removal plus all legacy code for non DT boards
> support (i.e. at91sam9g45.c and at91sam9g45_devices.c).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

A tiny nitpick, else
Acked-by: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>


> ---
>  arch/arm/mach-at91/Kconfig.non_dt        |   21 -
>  arch/arm/mach-at91/Makefile              |    4 -
>  arch/arm/mach-at91/at91sam9g45.c         |  403 -------
>  arch/arm/mach-at91/at91sam9g45_devices.c | 1915 ------------------------------
>  arch/arm/mach-at91/board-sam9m10g45ek.c  |  526 --------
>  5 files changed, 2869 deletions(-)
>  delete mode 100644 arch/arm/mach-at91/at91sam9g45_devices.c
>  delete mode 100644 arch/arm/mach-at91/board-sam9m10g45ek.c
> 
> diff --git a/arch/arm/mach-at91/at91sam9g45.c b/arch/arm/mach-at91/at91sam9g45.c
> index 9d45496..f658b69 100644
> --- a/arch/arm/mach-at91/at91sam9g45.c
> +++ b/arch/arm/mach-at91/at91sam9g45.c
> @@ -10,355 +10,13 @@
>   *
>   */
>  
> -#include <linux/module.h>
> -#include <linux/dma-mapping.h>
> -#include <linux/clk/at91_pmc.h>
> -
> -#include <asm/irq.h>
> -#include <asm/mach/arch.h>
>  #include <asm/mach/map.h>

That include is not needed.

>  #include <asm/system_misc.h>
> -#include <mach/at91sam9g45.h>
>  #include <mach/cpu.h>
>  #include <mach/hardware.h>
>  

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
