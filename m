From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH v3] Add GPIO DT support to s3c24xx
Date: Fri, 15 Apr 2011 02:08:08 +0200
Message-ID: <201104150208.08420.marek.vasut@gmail.com>
References: <20110410152735.338798127@gmail.com>
	<20110411064719.GD4439@angua.secretlab.ca>
	<20110411093304.GA21589@dandreoli.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110411093304.GA21589@dandreoli.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, Domenico Andreoli <cavokz@gmail.com>
List-Id: devicetree@vger.kernel.org

On Monday, April 11, 2011 11:33:04 AM Domenico Andreoli wrote:
> From: Domenico Andreoli <cavokz@gmail.com>
> 
> Assign proper OF node (= with matching physical base address) to each
> s3c24xx GPIO chip.
> 
> Signed-off-by: Domenico Andreoli <cavokz@gmail.com>
> 
> ---
> 
> With this new patch there is no need to add the dt_compat field to
> s3c_gpio_chip, such string is now chosen in base of the s3c gpio chip
> base address.
> 
> Respect to v2, s3c24xx_attach_of_node() now uses of_address_to_resource()
> instead of of_get_address()+of_translate_address(). I don't see where
> is the gain.
> 
> ---
>  arch/arm/plat-s3c24xx/gpiolib.c |   36
> ++++++++++++++++++++++++++++++++++++ 1 file changed, 36 insertions(+)
> 
> Index: b/arch/arm/plat-s3c24xx/gpiolib.c
> ===================================================================
> --- a/arch/arm/plat-s3c24xx/gpiolib.c	2011-04-10 23:28:31.000000000 +0200
> +++ b/arch/arm/plat-s3c24xx/gpiolib.c	2011-04-11 11:23:36.000000000 +0200
> @@ -19,6 +19,8 @@
>  #include <linux/ioport.h>
>  #include <linux/io.h>
>  #include <linux/gpio.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> 
>  #include <plat/gpio-core.h>
>  #include <plat/gpio-cfg.h>
> @@ -210,6 +212,39 @@
>  	},
>  };
> 
> +#ifdef CONFIG_OF_GPIO
> +
> +static void s3c24xx_attach_of_node(struct s3c_gpio_chip *chip)
> +{
> +	struct device_node *dn;
> +	struct resource res;
> +	const char *dt_compat;
> +
> +	if (chip->base == S3C2410_GPACON)
> +		dt_compat = "samsung,s3c2410-gpio-a";
> +	else
> +		dt_compat = "samsung,s3c2410-gpio";
> +
> +	for_each_compatible_node(dn, NULL, dt_compat) {
> +		if (of_address_to_resource(dn, 0, &res) < 0) {
> +			printk(KERN_ERR "%s: unable to translate DT address\n", dn-
>full_name);
> +			continue;
> +		}
> +
> +		if (chip->base == (res.start - S3C24XX_PA_GPIO + S3C24XX_VA_GPIO)) {
> +			chip->chip.of_node = dn;
> +			break;
> +		}
> +	}
> +}
> +
> +#else
> +
> +static void s3c24xx_attach_of_node(struct s3c_gpio_chip *chip)

static inline void maybe ;)

> +{
> +}
> +
> +#endif
> 
>  static __init int s3c24xx_gpiolib_init(void)
>  {
> @@ -220,6 +255,7 @@
>  		if (!chip->config)
>  			chip->config = &s3c24xx_gpiocfg_default;
> 
> +		s3c24xx_attach_of_node(chip);
>  		s3c_gpiolib_add(chip);
>  	}
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
