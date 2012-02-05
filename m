From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 00/25] irq_domain generalization and refinement
Date: Sat, 4 Feb 2012 17:38:53 -0800
Message-ID: <20120205013853.GQ20333@atomide.com>
References: <1327700179-17454-1-git-send-email-grant.likely@secretlab.ca>
 <20120204221748.GN14129@n2100.arm.linux.org.uk>
 <20120204223125.GO14129@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120204223125.GO14129-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Milton Miller <miltonm-ogEGBHC/i9Y@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

* Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> [120204 14:00]:
> 
> Actually, it turns out to be not that hard, because twl doesn't actually
> make use of the IRQ domain stuff:
> 
> commit aeb5032b3f8b9ab69daa545777433fa94b3494c4
> Author:     Benoit Cousson <b-cousson-l0cyMroinI0@public.gmane.org>
> AuthorDate: Mon Aug 29 16:20:23 2011 +0200
> Commit:     Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> CommitDate: Mon Jan 9 00:37:40 2012 +0100
> 
>     mfd: twl-core: Add initial DT support for twl4030/twl6030
> 
>     [grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org: Fix IRQ_DOMAIN dependency in kconfig]
> 
> Adding any dependency - especially one which wouldn't be enabled - for
> a new feature which wasn't required before is going to break existing
> users, so this shouldn't have been done in the first place.
> 
> A better fix to preserve existing users would've been as below - yes
> it means more ifdefs, but if irq domain is to remain a DT only thing
> then we're going to end up with _lots_ of this stuff.
> 
> I'd much prefer to see irq domain become more widely available so it
> doesn't require these ifdefs everywhere.

Your patch below looks like a correct fix to me to the problem
you and Grazvydas are seeing:

Acked-by: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
 
>  drivers/mfd/Kconfig    |    2 +-
>  drivers/mfd/twl-core.c |    4 ++++
>  2 files changed, 5 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 28a301b..bd60ce0 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -200,7 +200,7 @@ config MENELAUS
>  
>  config TWL4030_CORE
>  	bool "Texas Instruments TWL4030/TWL5030/TWL6030/TPS659x0 Support"
> -	depends on I2C=y && GENERIC_HARDIRQS && IRQ_DOMAIN
> +	depends on I2C=y && GENERIC_HARDIRQS
>  	help
>  	  Say yes here if you have TWL4030 / TWL6030 family chip on your board.
>  	  This core driver provides register access and IRQ handling
> diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
> index e04e04d..5913aaa 100644
> --- a/drivers/mfd/twl-core.c
> +++ b/drivers/mfd/twl-core.c
> @@ -263,7 +263,9 @@ struct twl_client {
>  
>  static struct twl_client twl_modules[TWL_NUM_SLAVES];
>  
> +#ifdef CONFIG_IRQ_DOMAIN
>  static struct irq_domain domain;
> +#endif
>  
>  /* mapping the module id to slave id and base address */
>  struct twl_mapping {
> @@ -1226,6 +1228,7 @@ twl_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	pdata->irq_base = status;
>  	pdata->irq_end = pdata->irq_base + nr_irqs;
>  
> +#ifdef CONFIG_IRQ_DOMAIN
>  	domain.irq_base = pdata->irq_base;
>  	domain.nr_irq = nr_irqs;
>  #ifdef CONFIG_OF_IRQ
> @@ -1233,6 +1236,7 @@ twl_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  	domain.ops = &irq_domain_simple_ops;
>  #endif
>  	irq_domain_add(&domain);
> +#endif
>  
>  	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C) == 0) {
>  		dev_dbg(&client->dev, "can't talk I2C?\n");
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
