From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [RFC v2 2/2] mux: mmio-based syscon mux controller
Date: Mon, 24 Apr 2017 23:05:14 +0200
Message-ID: <76f57a14-b4ba-77b8-7466-c7dd8e6f7495@axentia.se>
References: <1493050349-25533-1-git-send-email-p.zabel@pengutronix.de>
 <1493050349-25533-2-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493050349-25533-2-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-04-24 18:12, Philipp Zabel wrote:
> This adds a driver for mmio-based syscon multiplexers controlled by a
> single bitfield in a syscon register range.

Single bitfield?

> 
> Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
> Changes since v1:
>  - Renamed MUX_SYSCON to MUX_MMIO. Instead of obtaining the regmap via syscon,
>    this could just as well map its own MMIO register range if a reg property
>    was added.
>  - Replaced reg, bit-mask, and bit-shift properties with mux-reg-masks array
>    to allow defining multiple mux bit-fields per mmio-mux instance.
>  - Changed mux-control-cells value to <1>, the cell value is an index into
>    the mux-reg-masks array.
>  - Replaced idle-state with idle-states array.
>  - Stopped clobbering mux->cached_state, that is internal to the mux core.
> ---
>  drivers/mux/Kconfig    |  13 ++++
>  drivers/mux/Makefile   |   1 +
>  drivers/mux/mux-mmio.c | 162 +++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 176 insertions(+)
>  create mode 100644 drivers/mux/mux-mmio.c
> 
> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> index 34b8284d6d29e..e2bee25a1586e 100644
> --- a/drivers/mux/Kconfig
> +++ b/drivers/mux/Kconfig
> @@ -43,4 +43,17 @@ config MUX_GPIO
>  	  To compile the driver as a module, choose M here: the module will
>  	  be called mux-gpio.
>  
> +config MUX_MMIO
> +	tristate "MMIO register bitfield-controlled Multiplexer"
> +	depends on OF && MFD_SYSCON
> +	help
> +	  MMIO register bitfield-controlled Multiplexer controller.
> +
> +	  The driver builds a single multiplexer controller using a bitfield
> +	  in a syscon register. For N bit wide bitfields, there will be 2^N
> +	  possible multiplexer states.

Multiple multiplexer controllers....

> +
> +	  To compile the driver as a module, choose M here: the module will
> +	  be called mux-mmio.
> +
>  endif
> diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
> index b00a7d37d2fbe..6bac5b0fea137 100644
> --- a/drivers/mux/Makefile
> +++ b/drivers/mux/Makefile
> @@ -5,3 +5,4 @@
>  obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
>  obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
>  obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
> +obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
> diff --git a/drivers/mux/mux-mmio.c b/drivers/mux/mux-mmio.c
> new file mode 100644
> index 0000000000000..0b011fb59f99b
> --- /dev/null
> +++ b/drivers/mux/mux-mmio.c
> @@ -0,0 +1,162 @@
> +/*
> + * MMIO register bitfield-controlled multiplexer driver
> + *
> + * Copyright (C) 2017 Pengutronix, Philipp Zabel <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/mux/driver.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +static int mux_mmio_set(struct mux_control *mux, int state)
> +{
> +	struct regmap_field **fields = mux_chip_priv(mux->chip);
> +	int index = mux - mux->chip->mux;

mux_control_get_index(mux) does exactly this.

> +
> +	return regmap_field_write(fields[index], state);
> +}
> +
> +static const struct mux_control_ops mux_mmio_ops = {
> +	.set = mux_mmio_set,
> +};
> +
> +static const struct of_device_id mux_mmio_dt_ids[] = {
> +	{ .compatible = "mmio-mux", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, mux_mmio_dt_ids);
> +
> +static int mux_mmio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct regmap_field **fields;
> +	struct mux_chip *mux_chip;
> +	struct regmap *regmap;
> +	s32 *idle_states;
> +	u32 *reg_masks;
> +	int num_fields;
> +	int ret;
> +	int i;
> +
> +	regmap = syscon_node_to_regmap(np->parent);
> +	if (IS_ERR(regmap)) {
> +		ret = PTR_ERR(regmap);
> +		dev_err(dev, "failed to get syscon regmap: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = of_property_count_u32_elems(np, "mux-reg-masks");
> +	if (ret == 0 || ret % 2)
> +		ret = -EINVAL;
> +	if (ret > 0) {
> +		num_fields = ret / 2;
> +
> +		reg_masks = devm_kmalloc(dev, ret * sizeof(u32), GFP_KERNEL);
> +		if (!reg_masks)
> +			return -ENOMEM;
> +
> +		ret = of_property_read_u32_array(np, "mux-reg-masks",
> +						 reg_masks, ret);
> +	}
> +	if (ret < 0) {
> +		dev_err(dev, "mux-reg-masks property missing or invalid: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	mux_chip = devm_mux_chip_alloc(dev, num_fields, num_fields *
> +				       sizeof(*fields));
> +	if (IS_ERR(mux_chip))
> +		return PTR_ERR(mux_chip);
> +
> +	fields = mux_chip_priv(mux_chip);
> +
> +	for (i = 0; i < num_fields; i++) {
> +		struct mux_control *mux = &mux_chip->mux[i];
> +		struct reg_field field;
> +		u32 *reg_mask = reg_masks + 2 * i;
> +		int bits;
		u32 mask;
> +
> +		field.reg = reg_mask[0];
> +		field.msb = fls(reg_mask[1]) - 1;
> +		field.lsb = ffs(reg_mask[1]) - 1;

Perhaps add a sanity check? (untested, but you get the idea...)

		mask = (BIT(field.msb + 1) - 1) ^ (BIT(field.lsb) - 1);
		if (WARN_ON(reg_mask[1] != mask)) {
			/* Catches empty reg_mask[1] as well. */
			dev_err(...)
			return -EINVAL;
		}

> +		bits = 1 + field.msb - field.lsb;
> +
> +		fields[i] = devm_regmap_field_alloc(&pdev->dev, regmap, field);
> +		if (IS_ERR(fields[i])) {
> +			ret = PTR_ERR(fields[i]);
> +			dev_err(&pdev->dev, "failed to get bit-field %d: %d\n",
> +				i, ret);
> +			return ret;
> +		}
> +
> +		mux->states = 1 << bits;
> +	}
> +
> +	devm_kfree(dev, reg_masks);
> +
> +	if (of_find_property(np, "idle-states", NULL)) {
> +		ret = of_property_count_u32_elems(np, "idle-states");
> +		if (ret == num_fields) {
> +			idle_states = devm_kmalloc(dev, ret * sizeof(s32),
> +						   GFP_KERNEL);
> +			if (!idle_states)
> +				return -ENOMEM;
> +
> +			ret = of_property_read_u32_array(np, "idle-states",
> +							 idle_states, ret);
> +		} else {
> +			idle_states = NULL;
> +			if (ret >= 0)
> +				ret = -EINVAL;
> +		}
> +		if (ret < 0) {
> +			dev_err(dev, "idle-states property invalid: %d\n", ret);
> +			return ret;
> +		}
> +
> +		for (i = 0; i < num_fields; i++) {

Hmm, this is the second loop over num_fields with accesses to a complete
copy of a DT array. Is it not possible to use one loop and set up all
aspects of each mux-control using of_property_read_u32_index calls in that
loop? I have the feeling that will look neater...

> +			struct mux_control *mux = &mux_chip->mux[i];
> +
> +			if (idle_states[i] != MUX_IDLE_AS_IS) {
> +				if (idle_states[i] < 0 ||
> +				    idle_states[i] >= mux->states) {
> +					dev_err(dev, "invalid idle-state %u\n",
> +						idle_states[i]);
> +					return -EINVAL;
> +				}
> +
> +				mux->idle_state = idle_states[i];
> +			}
> +		}
> +
> +		devm_kfree(dev, idle_states);
> +	}
> +
> +	mux_chip->ops = &mux_mmio_ops;
> +
> +	return devm_mux_chip_register(dev, mux_chip);
> +}
> +
> +static struct platform_driver mux_mmio_driver = {
> +	.driver = {
> +		.name = "mmio-mux",
> +		.of_match_table	= of_match_ptr(mux_mmio_dt_ids),
> +	},
> +	.probe = mux_mmio_probe,
> +};
> +module_platform_driver(mux_mmio_driver);
> +
> +MODULE_DESCRIPTION("MMIO register bitfield-controlled multiplexer driver");
> +MODULE_AUTHOR("Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>");
> +MODULE_LICENSE("GPL v2");
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
