From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/8] regulator: Support ROHM BD71847 power management IC
Date: Tue, 11 Sep 2018 14:48:08 +0100
Message-ID: <20180911134808.GP4185@dell>
References: <cover.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
 <9fa1da19c69d3dab33234d8f06ffae91fb56672f.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9fa1da19c69d3dab33234d8f06ffae91fb56672f.1535545377.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org, mazziesaccount@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
List-Id: devicetree@vger.kernel.org

On Wed, 29 Aug 2018, Matti Vaittinen wrote:

> BD71847 is reduced version of BD71837. DVS bucks 3 and 4 are
> removed as is LDO7. Voltage ranges of some regulators are
> expanded.
> 
> Add initial support for BD71847 with BD71847 driver.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/mfd/rohm-bd718x7.c            |   84 ++-
>  drivers/regulator/bd71837-regulator.c | 1056 ++++++++++++++++++++++-----------
>  include/linux/mfd/rohm-bd718x7.h      |  272 ++++-----
>  3 files changed, 910 insertions(+), 502 deletions(-)
> 
> diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
> index 75c8ec659547..c95f34269bb6 100644
> --- a/drivers/mfd/rohm-bd718x7.c
> +++ b/drivers/mfd/rohm-bd718x7.c
> @@ -7,21 +7,34 @@
>  // Datasheet available from
>  // https://www.rohm.com/datasheet/BD71837MWV/bd71837mwv-e
>  
> +#include <linux/gpio_keys.h>
>  #include <linux/i2c.h>
>  #include <linux/input.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/rohm-bd718x7.h>
>  #include <linux/mfd/core.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/regmap.h>
>  
> -/*
> - * gpio_keys.h requires definiton of bool. It is brought in
> - * by above includes. Keep this as last until gpio_keys.h gets fixed.
> - */
> -#include <linux/gpio_keys.h>
> +static const u8 bd71837_supported_revisions[] = { 0xA2 };
> +static const u8 bd71847_supported_revisions[] = { 0xA0 };

I haven't seen anything like this before.

Is this really required?

Especially since you only have 1 of each currently.

> -static const u8 supported_revisions[] = { 0xA2 /* BD71837 */ };
> +struct known_revisions {
> +	const u8 (*revisions)[];
> +	unsigned int known_revisions;

I didn't initially know what this was at first glance.

Please re-name it to show that it is the number of stored revisions.

> +};
> +
> +static const struct known_revisions supported_revisions[BD718XX_TYPE_AMNT] = {
> +	[BD718XX_TYPE_BD71837] = {
> +		.revisions = &bd71837_supported_revisions,
> +		.known_revisions = ARRAY_SIZE(bd71837_supported_revisions),
> +	},
> +	[BD718XX_TYPE_BD71847] = {
> +		.revisions = &bd71847_supported_revisions,
> +		.known_revisions = ARRAY_SIZE(bd71847_supported_revisions),
> +	},
> +};
>  
>  static struct gpio_keys_button button = {
>  	.code = KEY_POWER,
> @@ -41,8 +54,8 @@ static struct mfd_cell bd71837_mfd_cells[] = {
>  		.platform_data = &bd718xx_powerkey_data,
>  		.pdata_size = sizeof(bd718xx_powerkey_data),
>  	},
> -	{ .name = "bd71837-clk", },
> -	{ .name = "bd71837-pmic", },
> +	{ .name = "bd718xx-clk", },
> +	{ .name = "bd718xx-pmic", },
>  };
>  
>  static const struct regmap_irq bd71837_irqs[] = {
> @@ -61,16 +74,16 @@ static struct regmap_irq_chip bd71837_irq_chip = {
>  	.num_irqs = ARRAY_SIZE(bd71837_irqs),
>  	.num_regs = 1,
>  	.irq_reg_stride = 1,
> -	.status_base = BD71837_REG_IRQ,
> -	.mask_base = BD71837_REG_MIRQ,
> -	.ack_base = BD71837_REG_IRQ,
> +	.status_base = BD718XX_REG_IRQ,
> +	.mask_base = BD718XX_REG_MIRQ,
> +	.ack_base = BD718XX_REG_IRQ,
>  	.init_ack_masked = true,
>  	.mask_invert = false,
>  };
>  
>  static const struct regmap_range pmic_status_range = {
> -	.range_min = BD71837_REG_IRQ,
> -	.range_max = BD71837_REG_POW_STATE,
> +	.range_min = BD718XX_REG_IRQ,
> +	.range_max = BD718XX_REG_POW_STATE,
>  };
>  
>  static const struct regmap_access_table volatile_regs = {
> @@ -82,7 +95,7 @@ static const struct regmap_config bd71837_regmap_config = {
>  	.reg_bits = 8,
>  	.val_bits = 8,
>  	.volatile_table = &volatile_regs,
> -	.max_register = BD71837_MAX_REGISTER - 1,
> +	.max_register = BD718XX_MAX_REGISTER - 1,
>  	.cache_type = REGCACHE_RBTREE,
>  };
>  
> @@ -91,13 +104,19 @@ static int bd71837_i2c_probe(struct i2c_client *i2c,
>  {
>  	struct bd71837 *bd71837;
>  	int ret, i;
> -	unsigned int val;
> +	const unsigned int *type;
>  
>  	bd71837 = devm_kzalloc(&i2c->dev, sizeof(struct bd71837), GFP_KERNEL);
>  
>  	if (!bd71837)
>  		return -ENOMEM;
>  
> +	type = of_device_get_match_data(&i2c->dev);
> +	if (!type || *type >= BD718XX_TYPE_AMNT) {
> +		dev_err(&i2c->dev, "Bad chip type\n");
> +		return -ENODEV;
> +	}
> +
>  	bd71837->chip_irq = i2c->irq;
>  
>  	if (!bd71837->chip_irq) {
> @@ -105,6 +124,7 @@ static int bd71837_i2c_probe(struct i2c_client *i2c,
>  		return -EINVAL;
>  	}
>  
> +	bd71837->chip_type = *type;
>  	bd71837->dev = &i2c->dev;
>  	dev_set_drvdata(&i2c->dev, bd71837);
>  
> @@ -114,18 +134,21 @@ static int bd71837_i2c_probe(struct i2c_client *i2c,
>  		return PTR_ERR(bd71837->regmap);
>  	}
>  
> -	ret = regmap_read(bd71837->regmap, BD71837_REG_REV, &val);
> +	ret = regmap_read(bd71837->regmap, BD718XX_REG_REV, &bd71837->chip_rev);
>  	if (ret) {
> -		dev_err(&i2c->dev, "Read BD71837_REG_DEVICE failed\n");
> +		dev_err(&i2c->dev, "Failed to read revision register\n");
>  		return ret;
>  	}
> -	for (i = 0; i < ARRAY_SIZE(supported_revisions); i++)
> -		if (supported_revisions[i] == val)
> +	for (i = 0;
> +	     i < supported_revisions[bd71837->chip_type].known_revisions; i++)
> +		if ((*supported_revisions[bd71837->chip_type].revisions)[i] ==
> +		    bd71837->chip_rev)
>  			break;
>  
> -	if (i == ARRAY_SIZE(supported_revisions)) {
> -		dev_err(&i2c->dev, "Unsupported chip revision\n");
> -		return -ENODEV;
> +	if (i == supported_revisions[bd71837->chip_type].known_revisions) {
> +		dev_err(&i2c->dev, "Unrecognized revision 0x%02x\n",
> +			bd71837->chip_rev);
> +		return -EINVAL;
>  	}

This has become a very (too) elaborate way to see if the current
running version is supported.  Please find a way to solve this (much)
more succinctly.  There are lots of examples of this.

In fact, since you are using OF, it is not possible for this driver to
probe with an unsupported device.  You can remove the whole lot.

>  	ret = devm_regmap_add_irq_chip(&i2c->dev, bd71837->regmap,
> @@ -138,7 +161,7 @@ static int bd71837_i2c_probe(struct i2c_client *i2c,
>  
>  	/* Configure short press to 10 milliseconds */
>  	ret = regmap_update_bits(bd71837->regmap,
> -				 BD71837_REG_PWRONCONFIG0,
> +				 BD718XX_REG_PWRONCONFIG0,
>  				 BD718XX_PWRBTN_PRESS_DURATION_MASK,
>  				 BD718XX_PWRBTN_SHORT_PRESS_10MS);
>  	if (ret) {
> @@ -149,7 +172,7 @@ static int bd71837_i2c_probe(struct i2c_client *i2c,
>  
>  	/* Configure long press to 10 seconds */
>  	ret = regmap_update_bits(bd71837->regmap,
> -				 BD71837_REG_PWRONCONFIG1,
> +				 BD718XX_REG_PWRONCONFIG1,
>  				 BD718XX_PWRBTN_PRESS_DURATION_MASK,
>  				 BD718XX_PWRBTN_LONG_PRESS_10S);
>  
> @@ -177,9 +200,20 @@ static int bd71837_i2c_probe(struct i2c_client *i2c,
>  
>  	return ret;
>  }
> +static const unsigned int chip_types[] = {
> +	[BD718XX_TYPE_BD71837] = BD718XX_TYPE_BD71837,
> +	[BD718XX_TYPE_BD71847] = BD718XX_TYPE_BD71847,
> +};
>  
>  static const struct of_device_id bd71837_of_match[] = {
> -	{ .compatible = "rohm,bd71837", },
> +	{
> +		.compatible = "rohm,bd71837",
> +		.data = &chip_types[BD718XX_TYPE_BD71837]
> +	},
> +	{
> +		.compatible = "rohm,bd71847",
> +		.data = &chip_types[BD718XX_TYPE_BD71847]

Again, way too complex.  Why not simply:

       .data = (void *)BD718XX_TYPE_BD71847?

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, bd71837_of_match);

[...]

> diff --git a/include/linux/mfd/rohm-bd718x7.h b/include/linux/mfd/rohm-bd718x7.h
> index e8338e5dc10b..d1ed232e669e 100644
> --- a/include/linux/mfd/rohm-bd718x7.h
> +++ b/include/linux/mfd/rohm-bd718x7.h
> @@ -7,106 +7,125 @@
>  #include <linux/regmap.h>
>  
>  enum {
> -	BD71837_BUCK1	=	0,
> -	BD71837_BUCK2,
> -	BD71837_BUCK3,
> -	BD71837_BUCK4,
> -	BD71837_BUCK5,
> -	BD71837_BUCK6,
> -	BD71837_BUCK7,
> -	BD71837_BUCK8,
> -	BD71837_LDO1,
> -	BD71837_LDO2,
> -	BD71837_LDO3,
> -	BD71837_LDO4,
> -	BD71837_LDO5,
> -	BD71837_LDO6,
> -	BD71837_LDO7,
> -	BD71837_REGULATOR_CNT,
> +	BD718XX_TYPE_BD71837,
> +	BD718XX_TYPE_BD71847,
> +	BD718XX_TYPE_AMNT // Keep this as last item

No C++ comments please.

What does AMNT mean?  I'm guessing it means amount, which isn't a
valid type. I suggest MAX_BOARD_TYPES or similar instead.

>  };
>  
> -#define BD71837_BUCK1_VOLTAGE_NUM	0x40
> -#define BD71837_BUCK2_VOLTAGE_NUM	0x40
> -#define BD71837_BUCK3_VOLTAGE_NUM	0x40
> -#define BD71837_BUCK4_VOLTAGE_NUM	0x40
> +enum {
> +	BD718XX_BUCK1	=	0,
> +	BD718XX_BUCK2,
> +	BD718XX_BUCK3,
> +	BD718XX_BUCK4,
> +	BD718XX_BUCK5,
> +	BD718XX_BUCK6,
> +	BD718XX_BUCK7,
> +	BD718XX_BUCK8,
> +	BD718XX_LDO1,
> +	BD718XX_LDO2,
> +	BD718XX_LDO3,
> +	BD718XX_LDO4,
> +	BD718XX_LDO5,
> +	BD718XX_LDO6,
> +	BD718XX_LDO7,
> +	BD718XX_REGULATOR_MAX,

Closer.

Whatever you choose to use, please ensure the last entries of the
enums use a similar format.

[...]

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
