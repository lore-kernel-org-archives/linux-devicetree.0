From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 6/6] ARM: at91/board-dt: remove AIC irq domain from board
 file
Date: Wed, 4 Jan 2012 12:48:18 -0700
Message-ID: <20120104194818.GD15503@ponder.secretlab.ca>
References: <85d531b5686e5eff623bed9618f802198409905f.1323975517.git.nicolas.ferre@atmel.com>
 <9fea5224b3a6544bd07c6e877d12870de9403b98.1323975517.git.nicolas.ferre@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9fea5224b3a6544bd07c6e877d12870de9403b98.1323975517.git.nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Dec 15, 2011 at 08:16:08PM +0100, Nicolas Ferre wrote:
> Adding of irqdomain in AIC code make the specification
> of the irq domain in board file useless.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

> ---
>  arch/arm/mach-at91/board-dt.c |   15 +--------------
>  1 files changed, 1 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/mach-at91/board-dt.c b/arch/arm/mach-at91/board-dt.c
> index bb6b434..119eda6 100644
> --- a/arch/arm/mach-at91/board-dt.c
> +++ b/arch/arm/mach-at91/board-dt.c
> @@ -15,8 +15,6 @@
>  #include <linux/init.h>
>  #include <linux/module.h>
>  #include <linux/gpio.h>
> -#include <linux/irqdomain.h>
> -#include <linux/of_irq.h>
>  #include <linux/of_platform.h>
>  
>  #include <mach/hardware.h>
> @@ -88,17 +86,6 @@ static void __init ek_add_device_nand(void)
>  	at91_add_device_nand(&ek_nand_data);
>  }
>  
> -static const struct of_device_id aic_of_match[] __initconst = {
> -	{ .compatible = "atmel,at91rm9200-aic", },
> -	{},
> -};
> -
> -static void __init at91_dt_init_irq(void)
> -{
> -	irq_domain_generate_simple(aic_of_match, 0xfffff000, 0);
> -	at91_init_irq_default();
> -}
> -
>  static void __init at91_dt_device_init(void)
>  {
>  	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
> @@ -118,7 +105,7 @@ DT_MACHINE_START(at91sam_dt, "Atmel AT91SAM (Device Tree)")
>  	.timer		= &at91sam926x_timer,
>  	.map_io		= at91_map_io,
>  	.init_early	= ek_init_early,
> -	.init_irq	= at91_dt_init_irq,
> +	.init_irq	= at91_init_irq_default,
>  	.init_machine	= at91_dt_device_init,
>  	.dt_compat	= at91_dt_board_compat,
>  MACHINE_END
> -- 
> 1.7.5.4
> 
