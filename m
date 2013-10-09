From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: at91: prepare common clk transition for sama5d3
 SoC
Date: Wed, 9 Oct 2013 15:05:32 +0200
Message-ID: <5255549C.4050009@atmel.com>
References: <1375951572-10829-1-git-send-email-b.brezillon@overkiz.com> <1375953690-11207-1-git-send-email-b.brezillon@overkiz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375953690-11207-1-git-send-email-b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 08/08/2013 11:21, Boris BREZILLON :
> This patch enclose sama5d3 old clk registration in
> "#if defined(CONFIG_OLD_CLK_AT91) #endif" sections.
>
> Signed-off-by: Boris BREZILLON <b.brezillon-ZNYIgs0QAGpBDgjK7y7TUQ@public.gmane.org>

Acked-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

And... do not forget to remove completely the code when transition is 
done (ie: in "[PATCH 6/6] ARM: at91/dt: remove old main clk definition 
from sama5d3xcm.dtsi").


> ---
>   arch/arm/mach-at91/sama5d3.c |    6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-at91/sama5d3.c b/arch/arm/mach-at91/sama5d3.c
> index 0003949..3426098 100644
> --- a/arch/arm/mach-at91/sama5d3.c
> +++ b/arch/arm/mach-at91/sama5d3.c
> @@ -19,9 +19,10 @@
>
>   #include "soc.h"
>   #include "generic.h"
> -#include "clock.h"
>   #include "sam9_smc.h"
>
> +#if defined(CONFIG_OLD_CLK_AT91)
> +#include "clock.h"
>   /* --------------------------------------------------------------------
>    *  Clocks
>    * -------------------------------------------------------------------- */
> @@ -361,6 +362,7 @@ static void __init sama5d3_register_clocks(void)
>   	clk_register(&pck1);
>   	clk_register(&pck2);
>   }
> +#endif
>
>   /* --------------------------------------------------------------------
>    *  AT91SAM9x5 processor initialization
> @@ -373,5 +375,7 @@ static void __init sama5d3_map_io(void)
>
>   AT91_SOC_START(sama5d3)
>   	.map_io = sama5d3_map_io,
> +#if defined(CONFIG_OLD_CLK_AT91)
>   	.register_clocks = sama5d3_register_clocks,
> +#endif
>   AT91_SOC_END
>


-- 
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
