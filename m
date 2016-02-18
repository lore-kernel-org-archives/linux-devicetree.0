From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 1/3] irqchip: gic/realview: support more RealView DCC
 variants
Date: Thu, 18 Feb 2016 14:19:48 +0000
Message-ID: <56C5D304.5010708@arm.com>
References: <1455803172-22747-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455803172-22747-1-git-send-email-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Linus,

On 18/02/16 13:46, Linus Walleij wrote:
> In the add-on file for the GIC dealing with the RealView family
> we currently only handle the PB11MPCore, let's extend this to
> manage the RealView EB ARM11MPCore as well. The Revision B of the
> ARM11MPCore core tile is a bit special and needs special handling
> as it moves a system control register around at random.

Ah, 11MPCore RevB. That thing. Tried to locate one in the magic
cupboard, and failed. Oh well...

> 
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> This can be applied in isolation from the other patches so Marc
> one you're happy with it, please take it into the IRQchip tree.
> 
> There are two compatible strings getting added to the device tree
> bindings so CC to the DT list. No biggie though, just figures out
> exactly what ARM custom GIC flavor it is.
> ---
>  .../bindings/interrupt-controller/arm,gic.txt      |  2 ++
>  drivers/irqchip/irq-gic-realview.c                 | 35 ++++++++++++++++++----
>  2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
> index 5a1cb4bc3dfe..0c80e6870645 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.txt
> @@ -16,6 +16,8 @@ Main node required properties:
>  	"arm,cortex-a15-gic"
>  	"arm,cortex-a7-gic"
>  	"arm,cortex-a9-gic"
> +	"arm,eb11mp-gic"
> +	"arm,eb11mp-revb-gic"
>  	"arm,gic-400"
>  	"arm,pl390"
>  	"arm,tc11mp-gic"
> diff --git a/drivers/irqchip/irq-gic-realview.c b/drivers/irqchip/irq-gic-realview.c
> index aa46eb280a7f..224e83d5c056 100644
> --- a/drivers/irqchip/irq-gic-realview.c
> +++ b/drivers/irqchip/irq-gic-realview.c
> @@ -10,7 +10,8 @@
>  #include <linux/irqchip/arm-gic.h>
>  
>  #define REALVIEW_SYS_LOCK_OFFSET	0x20
> -#define REALVIEW_PB11MP_SYS_PLD_CTRL1	0x74
> +#define REALVIEW_SYS_PLD_CTRL1		0x74
> +#define REALVIEW_EB_REVB_SYS_PLD_CTRL1	0xD8
>  #define VERSATILE_LOCK_VAL		0xA05F
>  #define PLD_INTMODE_MASK		BIT(22)|BIT(23)|BIT(24)
>  #define PLD_INTMODE_LEGACY		0x0
> @@ -18,26 +19,50 @@
>  #define PLD_INTMODE_NEW_NO_DCC		BIT(23)
>  #define PLD_INTMODE_FIQ_ENABLE		BIT(24)
>  
> +static const struct of_device_id syscon_pldset_of_match[] = {
> +	{
> +		.compatible = "arm,realview-eb-syscon",
> +	},
> +	{
> +		.compatible = "arm,realview-pb11mp-syscon",
> +	},
> +	{},
> +};
> +
>  static int __init
>  realview_gic_of_init(struct device_node *node, struct device_node *parent)
>  {
>  	static struct regmap *map;
> +	struct device_node *np;
> +	struct pld_setting *pldset;
> +	u32 pld1_ctrl = REALVIEW_SYS_PLD_CTRL1;
> +
> +	np = of_find_matching_node_and_match(NULL, syscon_pldset_of_match,
> +					     (void *)&pldset);
> +	if (!np)
> +		return -ENODEV;
> +
> +	/* For some reason RealView EB Rev B moved this register */
> +	if (of_device_is_compatible(np, "arm,eb11mp-revb-gic"))
> +		pld1_ctrl = REALVIEW_EB_REVB_SYS_PLD_CTRL1;

Associating the PLD control register with the GIC compatible string is a
bit odd, as they are conceptually two different devices. Why not storing
the register address as the data field in the syscon_pldset_of_match
array? One less check, and you get it for free (sort of).

>  
>  	/* The PB11MPCore GIC needs to be configured in the syscon */
> -	map = syscon_regmap_lookup_by_compatible("arm,realview-pb11mp-syscon");
> +	map = syscon_node_to_regmap(np);
>  	if (!IS_ERR(map)) {
>  		/* new irq mode with no DCC */
>  		regmap_write(map, REALVIEW_SYS_LOCK_OFFSET,
>  			     VERSATILE_LOCK_VAL);
> -		regmap_update_bits(map, REALVIEW_PB11MP_SYS_PLD_CTRL1,
> +		regmap_update_bits(map, pld1_ctrl,
>  				   PLD_INTMODE_NEW_NO_DCC,
>  				   PLD_INTMODE_MASK);
>  		regmap_write(map, REALVIEW_SYS_LOCK_OFFSET, 0x0000);
> -		pr_info("TC11MP GIC: set up interrupt controller to NEW mode, no DCC\n");
> +		pr_info("RealView GIC: set up interrupt controller to NEW mode, no DCC\n");
>  	} else {
> -		pr_err("TC11MP GIC setup: could not find syscon\n");
> +		pr_err("RealView GIC setup: could not find syscon\n");
>  		return -ENXIO;

Is that even reachable now that you check for the syscon early in the
function? Also, you are now returning -ENODEV while you were returning
-ENXIO before. Which one is the most correct (I have no idea)?

>  	}
>  	return gic_of_init(node, parent);
>  }
>  IRQCHIP_DECLARE(armtc11mp_gic, "arm,tc11mp-gic", realview_gic_of_init);
> +IRQCHIP_DECLARE(armeb11mp_gic, "arm,eb11mp-gic", realview_gic_of_init);
> +IRQCHIP_DECLARE(armeb11mp_revb_gic, "arm,eb11mp-revb-gic", realview_gic_of_init);
> 

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
