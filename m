From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH_V2 2/2] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
Date: Mon, 30 Mar 2015 19:42:05 -0700
Message-ID: <20150331024205.GT32500@ld-irv-0074>
References: <1425902299-53967-1-git-send-email-Zubair.Kakakhel@imgtec.com>
 <1425902299-53967-3-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425902299-53967-3-git-send-email-Zubair.Kakakhel@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: dwmw2@infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
List-Id: devicetree@vger.kernel.org

I can't compile test most of this, since I don't have the dependencies.
But the code looks mostly OK.

On Mon, Mar 09, 2015 at 11:58:19AM +0000, Zubair Lutfullah Kakakhel wrote:
> From: Alex Smith <alex.smith@imgtec.com>
> 
> Add a driver for NAND devices connected to the NEMC on JZ4780 SoCs, as
> well as the hardware BCH controller. DMA is not currently implemented.
> 
> While older 47xx SoCs also have a BCH controller, they are incompatible
> with the one in the 4780 due to differing register/bit positions, which
> would make implementing a common driver for them quite messy.
> 
> Signed-off-by: Alex Smith <alex@alex-smith.me.uk>
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> 
> ---
> V1 - > V2
> Fixed module license macro
> Rebase to 4.0-rc3
> ---
>  drivers/mtd/nand/Kconfig       |   7 +
>  drivers/mtd/nand/Makefile      |   1 +
>  drivers/mtd/nand/jz4780_bch.c  | 358 +++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/nand/jz4780_bch.h  |  42 +++++
>  drivers/mtd/nand/jz4780_nand.c | 372 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 780 insertions(+)
>  create mode 100644 drivers/mtd/nand/jz4780_bch.c
>  create mode 100644 drivers/mtd/nand/jz4780_bch.h
>  create mode 100644 drivers/mtd/nand/jz4780_nand.c
> 
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 5b76a17..7627002 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -503,6 +503,13 @@ config MTD_NAND_JZ4740
>  	help
>  		Enables support for NAND Flash on JZ4740 SoC based boards.
>  
> +config MTD_NAND_JZ4780
> +	tristate "Support for NAND on JZ4780 SoC"
> +	depends on MACH_JZ4780 && JZ4780_NEMC
> +	help
> +	  Enables support for NAND Flash connected to the NEMC on JZ4780 SoC
> +	  based boards, using the BCH controller for hardware error correction.
> +
>  config MTD_NAND_FSMC
>  	tristate "Support for NAND on ST Micros FSMC"
>  	depends on PLAT_SPEAR || ARCH_NOMADIK || ARCH_U8500 || MACH_U300
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 582bbd05..7c1ebca 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -47,6 +47,7 @@ obj-$(CONFIG_MTD_NAND_NUC900)		+= nuc900_nand.o
>  obj-$(CONFIG_MTD_NAND_MPC5121_NFC)	+= mpc5121_nfc.o
>  obj-$(CONFIG_MTD_NAND_RICOH)		+= r852.o
>  obj-$(CONFIG_MTD_NAND_JZ4740)		+= jz4740_nand.o
> +obj-$(CONFIG_MTD_NAND_JZ4780)		+= jz4780_nand.o jz4780_bch.o
>  obj-$(CONFIG_MTD_NAND_GPMI_NAND)	+= gpmi-nand/
>  obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
>  obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
> diff --git a/drivers/mtd/nand/jz4780_bch.c b/drivers/mtd/nand/jz4780_bch.c
> new file mode 100644
> index 0000000..eb264be
> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_bch.c
> @@ -0,0 +1,358 @@
...
> +/**
> + * jz4780_bch_get() - get the BCH controller device
> + * @np: BCH device tree node.
> + * @dev: where to store pointer to BCH controller device.
> + *
> + * Gets the BCH controller device from the specified device tree node. The
> + * device must be released with jz4780_bch_release() when it is no longer being
> + * used.
> + *
> + * Return: 0 on success, -EPROBE_DEFER if the controller has not yet been
> + * initialised.
> + */
> +int jz4780_bch_get(struct device_node *np, struct device **dev)
> +{
> +	struct platform_device *pdev;
> +	struct jz4780_bch *bch;
> +
> +	pdev = of_find_device_by_node(np);
> +	if (!pdev || !platform_get_drvdata(pdev))
> +		return -EPROBE_DEFER;
> +
> +	bch = platform_get_drvdata(pdev);
> +	clk_prepare_enable(bch->clk);
> +
> +	*dev = &pdev->dev;

Might want a get_device() / put_device() pair in this driver, so you
can't unbind the BCH controller device while the NAND driver is using
it?

> +	return 0;
> +}
> +EXPORT_SYMBOL(jz4780_bch_get);
> +
> +/**
> + * jz4780_bch_release() - release the BCH controller device
> + * @dev: BCH device.
> + */
> +void jz4780_bch_release(struct device *dev)
> +{
> +	struct jz4780_bch *bch = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(bch->clk);
> +}
> +EXPORT_SYMBOL(jz4780_bch_release);
> +
> +static int jz4780_bch_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct jz4780_bch *bch;
> +	struct resource *res;
> +
> +	bch = devm_kzalloc(dev, sizeof(*bch), GFP_KERNEL);
> +	if (!bch)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	bch->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(bch->base)) {
> +		dev_err(dev, "failed to get I/O memory\n");
> +		return PTR_ERR(bch->base);
> +	}
> +
> +	jz4780_bch_disable(bch);
> +
> +	bch->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(bch->clk)) {
> +		dev_err(dev, "failed to get clock: %ld\n", PTR_ERR(bch->clk));
> +		return PTR_ERR(bch->clk);
> +	}
> +
> +	clk_set_rate(bch->clk, BCH_CLK_RATE);
> +
> +	platform_set_drvdata(pdev, bch);
> +	dev_info(dev, "JZ4780 BCH initialised\n");
> +	return 0;
> +}
> +
> +static int jz4780_bch_remove(struct platform_device *pdev)
> +{
> +	return 0;
> +}

An empty .remove() callback can just be removed.

> +
> +static const struct of_device_id jz4780_bch_dt_match[] = {
> +	{ .compatible = "ingenic,jz4780-bch" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, jz4780_bch_dt_match);
> +
> +static struct platform_driver jz4780_bch_driver = {
> +	.probe		= jz4780_bch_probe,
> +	.remove		= jz4780_bch_remove,
> +	.driver	= {
> +		.name	= "jz4780-bch",
> +		.owner	= THIS_MODULE,

You don't need the .owner assignment. module_platform_driver() handles
this for you.

> +		.of_match_table = of_match_ptr(jz4780_bch_dt_match),
> +	},
> +};
> +module_platform_driver(jz4780_bch_driver);
> +
> +MODULE_AUTHOR("Alex Smith <alex@alex-smith.me.uk>");
> +MODULE_DESCRIPTION("Ingenic JZ4780 BCH error correction driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mtd/nand/jz4780_bch.h b/drivers/mtd/nand/jz4780_bch.h
> new file mode 100644
> index 0000000..cf315f3
> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_bch.h
> @@ -0,0 +1,42 @@
> +/*
> + * JZ4780 BCH controller
> + *
> + * Copyright (c) 2015 Imagination Technologies
> + * Author: Alex Smith <alex@alex-smith.me.uk>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published
> + * by the Free Software Foundation.
> + */
> +
> +#ifndef __DRIVERS_MTD_NAND_JZ4780_BCH_H__
> +#define __DRIVERS_MTD_NAND_JZ4780_BCH_H__
> +
> +#include <linux/types.h>
> +
> +struct device;
> +struct device_node;
> +
> +/**
> + * struct jz4780_bch_params - BCH parameters
> + * @size: data bytes per ECC step.
> + * @bytes: ECC bytes per step.
> + * @strength: number of correctable bits per ECC step.
> + */
> +struct jz4780_bch_params {
> +	int size;
> +	int bytes;
> +	int strength;
> +};
> +
> +extern int jz4780_bch_calculate(struct device *dev,
> +				struct jz4780_bch_params *params,
> +				const uint8_t *buf, uint8_t *ecc_code);
> +extern int jz4780_bch_correct(struct device *dev,
> +			      struct jz4780_bch_params *params, uint8_t *buf,
> +			      uint8_t *ecc_code);
> +
> +extern int jz4780_bch_get(struct device_node *np, struct device **dev);
> +extern void jz4780_bch_release(struct device *dev);
> +
> +#endif /* __DRIVERS_MTD_NAND_JZ4780_BCH_H__ */
> diff --git a/drivers/mtd/nand/jz4780_nand.c b/drivers/mtd/nand/jz4780_nand.c
> new file mode 100644
> index 0000000..542a6fc
> --- /dev/null
> +++ b/drivers/mtd/nand/jz4780_nand.c
> @@ -0,0 +1,372 @@
...
> +static int jz4780_nand_init_chips(struct jz4780_nand *nand, struct device *dev)
> +{
> +	struct jz4780_nand_chip *chip;
> +	const __be32 *prop;
> +	u64 addr, size;
> +	int i = 0;
> +
> +	/*
> +	 * Iterate over each bank assigned to this device and request resources.
> +	 * The bank numbers may not be consecutive, but nand_scan_ident()
> +	 * expects chip numbers to be, so fill out a consecutive array of chips
> +	 * which map chip number to actual bank number.
> +	 */
> +	while ((prop = of_get_address(dev->of_node, i, &size, NULL))) {
> +		chip = &nand->chips[i];
> +		chip->bank = of_read_number(prop, 1);
> +
> +		jz47xx_nemc_set_type(nand->dev, chip->bank,
> +				     JZ47XX_NEMC_BANK_NAND);
> +
> +		addr = of_translate_address(dev->of_node, prop);
> +		if (addr == OF_BAD_ADDR)
> +			return -EINVAL;

Is it not possible to use platform_get_resource() here? I'm not real
sure about the platform and resource APIs vs. of_* APIs here, so I'm not
sure.

> +
> +		chip->base = devm_ioremap(dev, addr, size);
> +		if (IS_ERR(chip->base)) {
> +			dev_err(dev, "failed to map bank %u: %ld\n", chip->bank,
> +				PTR_ERR(chip->base));
> +			return PTR_ERR(chip->base);
> +		}
> +
> +		i++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int jz4780_nand_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	unsigned int num_banks;
> +	struct jz4780_nand *nand;
> +	struct device_node *bch_np;
> +	struct mtd_info *mtd;
> +	struct nand_chip *chip;
> +	enum of_gpio_flags flags;
> +	struct mtd_part_parser_data ppdata;
> +	int ret;
> +
> +	num_banks = jz47xx_nemc_num_banks(dev);
> +
> +	nand = devm_kzalloc(dev,
> +			sizeof(*nand) + (sizeof(nand->chips[0]) * num_banks),
> +			GFP_KERNEL);
> +	if (!nand)
> +		return -ENOMEM;
> +
> +	nand->dev = dev;
> +	nand->num_banks = num_banks;
> +	nand->selected = -1;
> +
> +	/* Look for the BCH controller. */
> +	bch_np = of_parse_phandle(dev->of_node, "ingenic,bch-device", 0);
> +	if (bch_np) {
> +		ret = jz4780_bch_get(bch_np, &nand->bch);
> +		of_node_put(bch_np);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	mtd = &nand->mtd;
> +	chip = &nand->chip;
> +	mtd->priv = chip;
> +	mtd->owner = THIS_MODULE;

Please also set mtd->dev.parent.

> +	mtd->name = "jz4780-nand";
> +
> +	chip->chip_delay = RB_DELAY;
> +	chip->options = NAND_NO_SUBPAGE_WRITE;
> +	chip->bbt_options = NAND_BBT_USE_FLASH;
> +	chip->select_chip = jz4780_nand_select_chip;
> +	chip->cmd_ctrl = jz4780_nand_cmd_ctrl;
> +
> +	nand->busy_gpio = of_get_named_gpio_flags(dev->of_node,
> +						  "ingenic,busy-gpio",
> +						  0, &flags);
> +	if (gpio_is_valid(nand->busy_gpio)) {
> +		ret = devm_gpio_request(dev, nand->busy_gpio, "NAND busy");
> +		if (ret) {
> +			dev_err(dev, "failed to request busy GPIO %d: %d\n",
> +				nand->busy_gpio, ret);
> +			goto err_release_bch;
> +		}
> +
> +		nand->busy_gpio_active_low = flags & OF_GPIO_ACTIVE_LOW;
> +		gpio_direction_input(nand->busy_gpio);
> +
> +		chip->dev_ready = jz4780_nand_dev_ready;
> +	}
> +
> +	nand->wp_gpio = of_get_named_gpio_flags(dev->of_node, "ingenic,wp-gpio",
> +						0, &flags);
> +	if (gpio_is_valid(nand->wp_gpio)) {
> +		ret = devm_gpio_request(dev, nand->wp_gpio, "NAND WP");
> +		if (ret) {
> +			dev_err(dev, "failed to request WP GPIO %d: %d\n",
> +				nand->wp_gpio, ret);
> +			goto err_release_bch;
> +		}
> +
> +		nand->wp_gpio_active_low = flags & OF_GPIO_ACTIVE_LOW;
> +		gpio_direction_output(nand->wp_gpio, nand->wp_gpio_active_low);
> +	}
> +
> +	ret = jz4780_nand_init_chips(nand, dev);
> +	if (ret)
> +		goto err_release_bch;
> +
> +	ret = nand_scan_ident(mtd, num_banks, NULL);
> +	if (ret)
> +		goto err_release_bch;
> +
> +	jz4780_nand_init_ecc(nand, dev);
> +
> +	ret = nand_scan_tail(mtd);
> +	if (ret)
> +		goto err_release_bch;
> +
> +	ppdata.of_node = dev->of_node;
> +	ret = mtd_device_parse_register(mtd, NULL, &ppdata, NULL, 0);
> +	if (ret)
> +		goto err_release_nand;
> +
> +	platform_set_drvdata(pdev, nand);
> +	dev_info(dev, "JZ4780 NAND initialised\n");
> +	return 0;
> +
> +err_release_nand:
> +	nand_release(mtd);
> +
> +err_release_bch:
> +	if (nand->bch)
> +		jz4780_bch_release(nand->bch);
> +
> +	return ret;
> +}
> +
> +static int jz4780_nand_remove(struct platform_device *pdev)
> +{
> +	struct jz4780_nand *nand = platform_get_drvdata(pdev);
> +
> +	if (nand->bch)
> +		jz4780_bch_release(nand->bch);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id jz4780_nand_dt_match[] = {
> +	{ .compatible = "ingenic,jz4780-nand" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, jz4780_nand_dt_match);
> +
> +static struct platform_driver jz4780_nand_driver = {
> +	.probe		= jz4780_nand_probe,
> +	.remove		= jz4780_nand_remove,
> +	.driver	= {
> +		.name	= "jz4780-nand",
> +		.owner	= THIS_MODULE,

You don't need the .owner assignment here. module_platform_driver()
handles this for you.

> +		.of_match_table = of_match_ptr(jz4780_nand_dt_match),
> +	},
> +};
> +module_platform_driver(jz4780_nand_driver);
> +
> +MODULE_AUTHOR("Alex Smith <alex.smith@imgtec.com>");
> +MODULE_DESCRIPTION("Ingenic JZ4780 NAND driver");
> +MODULE_LICENSE("GPL v2");

Brian
