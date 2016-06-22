From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 2/2] reset: add TI SYSCON based reset driver
Date: Wed, 22 Jun 2016 12:19:32 +0200
Message-ID: <1466590772.4123.38.camel@pengutronix.de>
References: <20160620184607.4380-1-afd@ti.com>
	 <20160620184607.4380-3-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160620184607.4380-3-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Suman Anna <s-anna@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Montag, den 20.06.2016, 13:46 -0500 schrieb Andrew F. Davis:
> Add a reset-controller driver for performing reset management of
> various devices present on the SoC, with the reset registers shared
> between devices in a common register memory space. This driver uses
> the syscon/regmap frameworks to actually implement the various reset
> functionalities needed by the reset consumer devices.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> [s-anna@ti.com: add documentation, syscon name change]
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/reset/Kconfig           |  11 ++
>  drivers/reset/Makefile          |   1 +
>  drivers/reset/reset-ti-syscon.c | 260 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 272 insertions(+)
>  create mode 100644 drivers/reset/reset-ti-syscon.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 0b2733d..60a1aed 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -15,5 +15,16 @@ menuconfig RESET_CONTROLLER
>  config RESET_OXNAS
>  	bool
>  
> +config TI_SYSCON_RESET
> +	tristate "TI SYSCON Reset Driver"
> +	depends on RESET_CONTROLLER

Should be inside an "if RESET_CONTROLLER" on reset/next, so the depends
is not needed anymore.

> +	depends on HAS_IOMEM
> +	select MFD_SYSCON
> +	help
> +	  This enables the reset driver support for TI devices with
> +	  memory-mapped reset registers as part of a syscon device node. If
> +	  you wish to use the reset framework for such memory-mapped devices,
> +	  say Y here. Otherwise, say N.

Actually, do you need the user configurable option at all?

>  source "drivers/reset/sti/Kconfig"
>  source "drivers/reset/hisilicon/Kconfig"
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index f173fc3..5a9dc40 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_ARCH_HISI) += hisilicon/
>  obj-$(CONFIG_ARCH_ZYNQ) += reset-zynq.o
>  obj-$(CONFIG_ATH79) += reset-ath79.o
>  obj-$(CONFIG_RESET_OXNAS) += reset-oxnas.o
> +obj-$(CONFIG_TI_SYSCON_RESET) += reset-ti-syscon.o
> diff --git a/drivers/reset/reset-ti-syscon.c b/drivers/reset/reset-ti-syscon.c
> new file mode 100644
> index 0000000..229f876
> --- /dev/null
> +++ b/drivers/reset/reset-ti-syscon.c
> @@ -0,0 +1,260 @@
> +/*
> + * TI SYSCON regmap reset driver
> + *
> + * Copyright (C) 2015-2016 Texas Instruments Incorporated - http://www.ti.com/
> + *	Andrew F. Davis <afd@ti.com>
> + *	Suman Anna <afd@ti.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed "as is" WITHOUT ANY WARRANTY of any
> + * kind, whether express or implied; without even the implied warranty
> + * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/reset/ti-syscon.h>
> +
> +/**
> + * struct ti_syscon_reset_control - reset control structure
> + * @offset: reset control register offset from syscon base
> + * @reset_bit: reset bit in the reset control register
> + * @assert_high: flag to indicate if setting the bit high asserts the reset
> + * @status_offset: reset status register offset from syscon base
> + * @status_reset_bit: reset status bit in the reset status register
> + * @status_assert_high: flag to indicate if a set bit represents asserted state
> + * @toggle: flag to indicate this reset has no readable status register
> + */
> +struct ti_syscon_reset_control {
> +	unsigned int offset;
> +	unsigned int reset_bit;
> +	bool assert_high;
> +	unsigned int status_offset;
> +	unsigned int status_reset_bit;
> +	bool status_assert_high;
> +	bool toggle;
> +};
> +
> +/**
> + * struct ti_syscon_reset_data - reset controller information structure
> + * @rcdev: reset controller entity
> + * @dev: reset controller device pointer
> + * @regmap: regmap handle containing the memory-mapped reset registers
> + * @controls: array of reset controls
> + * @nr_controls: number of controls in control array
> + */
> +struct ti_syscon_reset_data {
> +	struct reset_controller_dev rcdev;
> +	struct device *dev;

I don't see data->dev used anywhere. I think you can drop this.

> +	struct regmap *regmap;
> +	struct ti_syscon_reset_control *controls;
> +	unsigned int nr_controls;
> +};
> +
> +#define to_ti_syscon_reset_data(rcdev)	\
> +	container_of(rcdev, struct ti_syscon_reset_data, rcdev)
> +
> +/**
> + * ti_syscon_reset_set() - program a device's reset
> + * @rcdev: reset controller entity
> + * @id: ID of the reset to toggle
> + * @assert: boolean flag to indicate assert or deassert
> + *
> + * This is a common internal function used to assert or deassert a device's
> + * reset using the regmap API. The device's reset is asserted if the @assert
> + * argument is true, or deasserted if the @assert argument is false.
> + *
> + * Return: 0 for successful request, else a corresponding error value
> + */
> +static int ti_syscon_reset_set(struct reset_controller_dev *rcdev,
> +			       unsigned long id, bool assert)
> +{
> +	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
> +	struct ti_syscon_reset_control *control;
> +	unsigned int mask, value;
> +
> +	if (id < 0 || id >= data->nr_controls)

id is unsigned long, no need to check for negative values.

> +		return -EINVAL;
> +
> +	control = &data->controls[id];
> +
> +	mask = BIT(control->reset_bit);
> +	value = (assert == control->assert_high) ? mask : 0x0;
> +
> +	return regmap_update_bits(data->regmap, control->offset, mask, value);
> +}
> +
> +/**
> + * ti_syscon_reset_assert() - assert device reset
> + * @rcdev: reset controller entity
> + * @id: ID of the reset to be asserted
> + *
> + * This function implements the reset driver op to assert a device's reset.
> + * This invokes the function ti_syscon_reset_set() with the corresponding
> + * parameters as passed in, but with the @assert argument set to true for
> + * asserting the reset.
> + *
> + * Return: 0 for successful request, else a corresponding error value
> + */
> +static int ti_syscon_reset_assert(struct reset_controller_dev *rcdev,
> +				  unsigned long id)
> +{
> +	return ti_syscon_reset_set(rcdev, id, true);
> +}
> +
> +/**
> + * ti_syscon_reset_deassert() - deassert device reset
> + * @rcdev: reset controller entity
> + * @id: ID of reset to be deasserted
> + *
> + * This function implements the reset driver op to deassert a device's reset.
> + * This invokes the function ti_syscon_reset_set() with the corresponding
> + * parameters as passed in, but with the @assert argument set to false for
> + * deasserting the reset.
> + *
> + * Return: 0 for successful request, else a corresponding error value
> + */
> +static int ti_syscon_reset_deassert(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	return ti_syscon_reset_set(rcdev, id, false);
> +}
> +
> +/**
> + * ti_syscon_reset_status() - check device reset status
> + * @rcdev: reset controller entity
> + * @id: ID of the reset for which the status is being requested
> + *
> + * This function implements the reset driver op to return the status of a
> + * device's reset.
> + *
> + * Return: 0 if reset is deasserted, true if reset is asserted, else a
> + * corresponding error value
> + */
> +static int ti_syscon_reset_status(struct reset_controller_dev *rcdev,
> +				  unsigned long id)
> +{
> +	struct ti_syscon_reset_data *data = to_ti_syscon_reset_data(rcdev);
> +	struct ti_syscon_reset_control *control;
> +	unsigned int reset_state;
> +	int ret;
> +
> +	if (id < 0 || id >= data->nr_controls)

	if (id >= data->nr_controls)

> +		return -EINVAL;
> +
> +	control = &data->controls[id];
> +
> +	if (control->toggle)
> +		return -ENOSYS; /* status not supported for this reset */

That should be -ENOTSUPP.

Are you sure that reading status is not supported for your trigger
resets?
On i.MX6 the triggered reset bits are self-clearing, for example, but
only after the reset sequence is finished. So it is possible to read the
reset status there.

> +
> +	ret = regmap_read(data->regmap, control->status_offset, &reset_state);
> +	if (ret)
> +		return ret;
> +
> +	return (reset_state & BIT(control->status_reset_bit)) ==
> +			control->status_assert_high;

If status_assert_high == 1 and status_reset_bit > 0 this will always
return false.

> +}
> +
> +static struct reset_control_ops ti_syscon_reset_ops = {
> +	.assert		= ti_syscon_reset_assert,
> +	.deassert	= ti_syscon_reset_deassert,
> +	.status		= ti_syscon_reset_status,
> +};
> +
> +static int ti_syscon_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct ti_syscon_reset_data *data;
> +	struct regmap *regmap;
> +	const __be32 *list;
> +	struct ti_syscon_reset_control *controls;
> +	int size, nr_controls, i;
> +	u32 flags;
> +
> +	if (!np)
> +		return -ENODEV;

This driver is probed via DT. Can this ever happen?

> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	regmap = syscon_node_to_regmap(np->parent);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	list = of_get_property(np, "ti,reset-bits", &size);
> +	if (!list || (size / sizeof(*list)) % 5 != 0) {
> +		dev_err(dev, "invalid DT reset description\n");
> +		return -EINVAL;
> +	}
> +
> +	nr_controls = (size / sizeof(*list)) / 5;
> +	controls = devm_kzalloc(dev, nr_controls * sizeof(*controls), GFP_KERNEL);
> +	if (!controls)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < nr_controls; i++) {
> +		controls[i].offset = be32_to_cpup(list++);
> +		controls[i].reset_bit = be32_to_cpup(list++);
> +		controls[i].status_offset = be32_to_cpup(list++);
> +		controls[i].status_reset_bit = be32_to_cpup(list++);
> +
> +		flags = be32_to_cpup(list++);
> +		controls[i].assert_high = !!(flags & RESET_SET);
> +		controls[i].status_assert_high = !!(flags & RESET_SET);

Why two variables if these are always the same.

> +		controls[i].toggle = !!(flags & RESET_TRIGGER);
> +	}
> +
> +	data->rcdev.ops = &ti_syscon_reset_ops;
> +	data->rcdev.owner = THIS_MODULE;
> +	data->rcdev.of_node = np;
> +	data->rcdev.nr_resets = nr_controls;
> +	data->dev = dev;

data->dev is not used.

> +	data->regmap = regmap;
> +	data->controls = controls;
> +	data->nr_controls = nr_controls;
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	return reset_controller_register(&data->rcdev);

Use devm_reset_controller_register here ...

> +}
> +
> +static int ti_syscon_reset_remove(struct platform_device *pdev)
> +{
> +	struct ti_syscon_reset_data *data = platform_get_drvdata(pdev);
> +
> +	reset_controller_unregister(&data->rcdev);
> +
> +	return 0;
> +}

... which allows you to remove the remove function entirely.

> +
> +static const struct of_device_id ti_syscon_reset_of_match[] = {
> +	{ .compatible = "syscon-reset", },

"ti,syscon-reset"

> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, ti_syscon_reset_of_match);
> +
> +static struct platform_driver ti_syscon_reset_driver = {
> +	.probe = ti_syscon_reset_probe,
> +	.remove = ti_syscon_reset_remove,
> +	.driver = {
> +		.name = "ti-syscon-reset",
> +		.of_match_table = ti_syscon_reset_of_match,
> +	},
> +};
> +module_platform_driver(ti_syscon_reset_driver);
> +
> +MODULE_AUTHOR("Andrew F. Davis <afd@ti.com>");
> +MODULE_AUTHOR("Suman Anna <s-anna@ti.com>");
> +MODULE_DESCRIPTION("TI SYSCON Regmap Reset Driver");
> +MODULE_LICENSE("GPL v2");

regards
Philipp
