From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: Re: [PATCH v3 3/5] mfd: tps65912: Add driver for the TPS65912 PMIC
Date: Mon, 28 Sep 2015 11:01:11 -0500
Message-ID: <56096447.8020804@ti.com>
References: <1443106374-4126-1-git-send-email-afd@ti.com>
 <1443106374-4126-4-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1443106374-4126-4-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 09/24/2015 09:52 AM, Andrew F. Davis wrote:
> This patch adds support for TPS65912 mfd device. It provides
> communication through the I2C and SPI interfaces. It contains
> the following components:
> 
>   - Regulators
>   - GPIO controller
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> ---
>   drivers/mfd/Kconfig          |  24 +++
>   drivers/mfd/Makefile         |   3 +
>   drivers/mfd/tps65912-core.c  | 114 +++++++++++++
>   drivers/mfd/tps65912-i2c.c   |  86 ++++++++++
>   drivers/mfd/tps65912-spi.c   |  85 ++++++++++
>   include/linux/mfd/tps65912.h | 393 +++++++++++++++++++++++++++++++++++++++++++
>   6 files changed, 705 insertions(+)
>   create mode 100644 drivers/mfd/tps65912-core.c
>   create mode 100644 drivers/mfd/tps65912-i2c.c
>   create mode 100644 drivers/mfd/tps65912-spi.c
>   create mode 100644 include/linux/mfd/tps65912.h
> 

[...]

> +
> +/*
> + * struct tps_info - packages regulator constraints
> + * @id: Id of the regulator
> + * @name: Voltage regulator name
> + * @min_uV: Minimum micro volts
> + * @max_uV: Minimum micro volts
> + *
> + * This data is used to check the regulator voltage limits while setting.
> + */
> +struct tps_info {
> +	int id;
> +	const char *name;
> +	int min_uV;
> +	int max_uV;
> +};

Could you move structure's definitions to the corresponding c-files
if they are used only locally in this files, pls? 

> +
> +/*
> + * struct tps65912 - state holder for the tps65912 driver
> + *
> + * Device data may be used to access the TPS65912 chip
> + */
> +struct tps65912 {
> +	struct device *dev;
> +	unsigned int id;
> +
> +	/* IRQ Data */
> +	int irq;
> +	struct regmap_irq_chip_data *irq_data;
> +
> +	struct regulator_desc desc[TPS65912_NUM_REGULATOR];
> +	struct tps_info *info[TPS65912_NUM_REGULATOR];

seems above two field are not used (and id?).

> +	struct regmap *regmap;
> +};
> +
> +static const struct regmap_range tps65912_yes_ranges[] = {
> +	regmap_reg_range(TPS65912_INT_STS, TPS65912_GPIO5),
> +};
> +
> +static const struct regmap_access_table tps65912_volatile_table = {
> +	.yes_ranges = tps65912_yes_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(tps65912_yes_ranges),
> +};
> +
> +static const struct regmap_config tps65912_regmap_co	nfig = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.cache_type = REGCACHE_RBTREE,
> +	.volatile_table = &tps65912_volatile_table,
> +};
> +
> +int tps65912_device_init(struct tps65912 *tps);
> +int tps65912_device_exit(struct tps65912 *tps);
> +
> +#endif /*  __LINUX_MFD_TPS65912_H */
> 


-- 
regards,
-grygorii
