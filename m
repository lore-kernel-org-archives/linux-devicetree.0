From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/2] gpio: Add Avionic Design N-bit GPIO expander support
Date: Fri, 11 May 2012 17:47:27 -0600
Message-ID: <20120511234728.0A4623E0791@localhost>
References: <1334229858-1665-1-git-send-email-thierry.reding@avionic-design.de>
 <1334229858-1665-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1334229858-1665-2-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 12 Apr 2012 13:24:18 +0200, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org> wrote:
> This commit adds a driver for the Avionic Design N-bit GPIO expander.
> The expander provides a variable number of GPIO pins with interrupt
> support.

Hi Thierry,  comments below...

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 7875c3f..d86c3b7 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -373,6 +373,25 @@ config GPIO_ADP5588_IRQ
>  	  Say yes here to enable the adp5588 to be used as an interrupt
>  	  controller. It requires the driver to be built in the kernel.
>  
> +config GPIO_ADNP
> +	tristate "Avionic Design N-bit GPIO expander"
> +	depends on I2C
> +	help
> +	  This option enables support for N GPIOs found on Avionic Design
> +	  I2C GPIO expanders. The register space will be extended by powers
> +	  of two, so the controller will need to accomodate for that. For
> +	  example: if a controller provides 48 pins, 6 registers will be
> +	  enough to represent all pins, but the driver will assume a
> +	  register layout for 64 pins (8 registers).
> +
> +config GPIO_ADNP_IRQ
> +	bool "Interrupt controller support"
> +	depends on GPIO_ADNP
> +	help
> +	  Say yes here to enable the Avionic Design N-bit GPIO expander to
> +	  be used as an interrupt controller. It requires the driver to be
> +	  built in the kernel.
> +

Why does it require the driver to be built in?

> +struct adnp {
> +	struct i2c_client *client;
> +	struct gpio_chip gpio;
> +	unsigned int reg_shift;
> +
> +	struct mutex i2c_lock;
> +
> +#ifdef CONFIG_GPIO_ADNP_IRQ
> +	struct irq_domain *domain;
> +	struct mutex irq_lock;
> +
> +	unsigned int irq_base;
> +	unsigned int nrirq;

This driver should use the irq_domain linear mapping which makes
irq_base unnecessary.

> +static int adnp_gpio_setup(struct adnp *gpio, struct adnp_platform_data *pdata)
> +{
> +	struct gpio_chip *chip = &gpio->gpio;
> +
> +	gpio->reg_shift = get_count_order(pdata->nr_gpios) - 3;
> +
> +	chip->direction_input = adnp_gpio_direction_input;
> +	chip->direction_output = adnp_gpio_direction_output;
> +	chip->get = adnp_gpio_get;
> +	chip->set = adnp_gpio_set;
> +	chip->dbg_show = adnp_gpio_dbg_show;
> +	chip->can_sleep = 1;
> +
> +	chip->base = pdata->gpio_base;
> +	chip->ngpio = pdata->nr_gpios;
> +	chip->label = gpio->client->name;
> +	chip->dev = &gpio->client->dev;
> +	chip->owner = THIS_MODULE;
> +	chip->names = pdata->names;
> +
> +#ifdef CONFIG_OF_GPIO
> +	chip->of_node = chip->dev->of_node;
> +#endif

Drop the #ifdef protection.  dev->of_node always exists so this
assignment is safe.

> +static int adnp_irq_setup(struct adnp *gpio, struct adnp_platform_data *pdata)
> +{
> +	unsigned int regs = 1 << gpio->reg_shift;
> +	struct gpio_chip *chip = &gpio->gpio;
> +	int pin;
> +	int err;
> +
> +	mutex_init(&gpio->irq_lock);
> +
> +	gpio->irq_mask = devm_kzalloc(gpio->gpio.dev, regs * 4, GFP_KERNEL);
> +	if (!gpio->irq_mask)
> +		return -ENOMEM;
> +
> +	gpio->irq_mask_cur = gpio->irq_mask + (regs * 1);
> +	gpio->irq_rising = gpio->irq_mask + (regs * 2);
> +	gpio->irq_falling = gpio->irq_mask + (regs * 3);
> +
> +	err = irq_alloc_descs(-1, pdata->irq_base, gpio->gpio.ngpio, -1);
> +	if (err < 0) {
> +		dev_err(gpio->gpio.dev, "%s failed: %d\n",
> +				"irq_alloc_descs()", err);
> +		return err;
> +	}
> +
> +	gpio->nrirq = gpio->gpio.ngpio;
> +	gpio->irq_base = err;
> +
> +	gpio->domain = irq_domain_add_legacy(chip->dev->of_node, gpio->nrirq,
> +			gpio->irq_base, 0, &irq_domain_simple_ops, NULL);

Use the linear mapping instead with takes care of allocating irq_descs
for you and simplifies a lot of the driver.

> +
> +	for (pin = 0; pin < gpio->nrirq; pin++) {
> +		int irq = irq_find_mapping(gpio->domain, pin);
> +
> +		irq_clear_status_flags(irq, IRQ_NOREQUEST);
> +		irq_set_chip_data(irq, gpio);
> +		irq_set_chip(irq, &adnp_irq_chip);
> +		irq_set_nested_thread(irq, true);
> +#ifdef CONFIG_ARM
> +		set_irq_flags(irq, IRQF_VALID);
> +#else
> +		irq_set_noprobe(irq);
> +#endif
> +	}

The body of this for loop needs to be performed in the irq_domain map
hook.

> +static const struct i2c_device_id adnp_i2c_id[] = {
> +	{ "gpio-adnp" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, adnp_i2c_id);

Should use an of_device_id table since this is a DT-enabled
driver.

> +
> +static struct i2c_driver adnp_i2c_driver = {
> +	.driver = {
> +		.name = "gpio-adnp",
> +		.owner = THIS_MODULE,
> +	},
> +	.probe = adnp_i2c_probe,
> +	.remove = __devexit_p(adnp_i2c_remove),
> +	.id_table = adnp_i2c_id,
> +};
> +module_i2c_driver(adnp_i2c_driver);
> +
> +MODULE_DESCRIPTION("Avionic Design N-bit GPIO expander");
> +MODULE_AUTHOR("Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/i2c/gpio-adnp.h b/include/linux/i2c/gpio-adnp.h
> new file mode 100644
> index 0000000..6e077a3
> --- /dev/null
> +++ b/include/linux/i2c/gpio-adnp.h
> @@ -0,0 +1,19 @@
> +/*
> + * Copyright (C) 2011-2012 Avionic Design GmbH
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#ifndef _LINUX_I2C_ADNP_H
> +#define _LINUX_I2C_ADNP_H 1
> +
> +struct adnp_platform_data {
> +	unsigned gpio_base;
> +	unsigned nr_gpios;
> +	int irq_base;
> +	const char *const *names;
> +};

>From the start this is a DT enabled driver.  There should be no reason
to also include platform_data support.
