From: James Hartley <james.hartley@imgtec.com>
Subject: Re: [PATCH V2 2/2] reset: img: Add Pistachio reset controller driver
Date: Mon, 18 Jan 2016 12:19:36 +0000
Message-ID: <569CD858.70908@imgtec.com>
References: <1452881845-2368-1-git-send-email-james.hartley@imgtec.com>  <1452881845-2368-3-git-send-email-james.hartley@imgtec.com> <1453108311.3557.10.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453108311.3557.10.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Damien Horsley <damien.horsley@imgtec.com>, Govindraj Raja <govindraj.raja@imgtec.com>
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On 01/18/16 09:11, Philipp Zabel wrote:
> Hi,
>
> a few small issues.
>
> Am Freitag, den 15.01.2016, 18:17 +0000 schrieb James Hartley:
>> From: "Damien.Horsley" <Damien.Horsley@imgtec.com>
>>
>> Add reset controller driver for Pistachio SoC
>>
>> Signed-off-by: Damien.Horsley <Damien.Horsley@imgtec.com>
>> Signed-off-by: James Hartley <james.hartley@imgtec.com>
>> ---
>>   drivers/reset/Makefile                             |    1 +
>>   drivers/reset/reset-pistachio.c                    |  162 ++++++++++++++++++++
>>   .../reset-controller/pistachio-resets.h            |   36 +++++
>>   3 files changed, 199 insertions(+)
>>   create mode 100644 drivers/reset/reset-pistachio.c
>>   create mode 100644 include/dt-bindings/reset-controller/pistachio-resets.h
>>
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 4d7178e..a1fc8ed 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -2,6 +2,7 @@ obj-y += core.o
>>   obj-$(CONFIG_ARCH_LPC18XX) += reset-lpc18xx.o
>>   obj-$(CONFIG_ARCH_SOCFPGA) += reset-socfpga.o
>>   obj-$(CONFIG_ARCH_BERLIN) += reset-berlin.o
>> +obj-$(CONFIG_MACH_PISTACHIO) += reset-pistachio.o
>>   obj-$(CONFIG_ARCH_SUNXI) += reset-sunxi.o
>>   obj-$(CONFIG_ARCH_STI) += sti/
>>   obj-$(CONFIG_ARCH_HISI) += hisilicon/
>> diff --git a/drivers/reset/reset-pistachio.c b/drivers/reset/reset-pistachio.c
>> new file mode 100644
>> index 0000000..0bbc086
>> --- /dev/null
>> +++ b/drivers/reset/reset-pistachio.c
>> @@ -0,0 +1,162 @@
>> +/*
>> + * Pistachio SoC Reset Controller driver
>> + *
>> + * Copyright (C) 2015 Imagination Technologies Ltd.
>> + *
>> + * Author: Damien Horsley <Damien.Horsley@imgtec.com>
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/slab.h>
>> +#include <linux/mfd/syscon.h>
>> +
>> +#include <dt-bindings/reset-controller/pistachio-resets.h>
> This should be:
> #include <dt-bindings/reset/pistachio-resets.h>
> (see below).

Ok, done

>> +
>> +#define	PISTACHIO_SOFT_RESET		0
>> +
>> +struct pistachio_reset_data {
>> +	struct reset_controller_dev	rcdev;
>> +	struct regmap			*periph_regs;
>> +};
>> +
>> +static inline int pistachio_reset_shift(unsigned long id)
>> +{
>> +	switch (id) {
>> +	case PISTACHIO_RESET_I2C0:
>> +	case PISTACHIO_RESET_I2C1:
>> +	case PISTACHIO_RESET_I2C2:
>> +	case PISTACHIO_RESET_I2C3:
>> +	case PISTACHIO_RESET_I2S_IN:
>> +	case PISTACHIO_RESET_PRL_OUT:
>> +	case PISTACHIO_RESET_SPDIF_OUT:
>> +	case PISTACHIO_RESET_SPI:
>> +	case PISTACHIO_RESET_PWM_PDM:
>> +	case PISTACHIO_RESET_UART0:
>> +	case PISTACHIO_RESET_UART1:
>> +	case PISTACHIO_RESET_QSPI:
>> +	case PISTACHIO_RESET_MDC:
>> +	case PISTACHIO_RESET_SDHOST:
>> +	case PISTACHIO_RESET_ETHERNET:
>> +	case PISTACHIO_RESET_IR:
>> +	case PISTACHIO_RESET_HASH:
>> +	case PISTACHIO_RESET_TIMER:
>> +		return id;
>> +	case PISTACHIO_RESET_I2S_OUT:
>> +	case PISTACHIO_RESET_SPDIF_IN:
>> +	case PISTACHIO_RESET_EVT:
>> +		return id + 6;
>> +	case PISTACHIO_RESET_USB_H:
>> +	case PISTACHIO_RESET_USB_PR:
>> +	case PISTACHIO_RESET_USB_PHY_PR:
>> +	case PISTACHIO_RESET_USB_PHY_PON:
>> +		return id + 7;
>> +	default:
>> +		return -1;
> That's -EPERM. Please
> 		return -EINVAL;
Ok, done.
> here, since ...
>
>> +	}
>> +}
>> +
>> +static int pistachio_reset_assert(struct reset_controller_dev *rcdev,
>> +			      unsigned long id)
>> +{
>> +	struct pistachio_reset_data *rd;
>> +	u32 mask;
>> +	int shift;
>> +
>> +	rd = container_of(rcdev, struct pistachio_reset_data, rcdev);
>> +	shift = pistachio_reset_shift(id);
>> +	if (shift < 0)
>> +		return shift;
> ... here we return the above error value to the caller.
>
>> +	mask = 1UL << shift;
> I'd prefer
> 	mask = BIT(shift);
> instead.

Ok, done.

>
>> +
>> +	regmap_update_bits(rd->periph_regs, PISTACHIO_SOFT_RESET, mask, mask);
>> +
>> +	return 0;
> Better propagate the return value from regmap_update_bits:
> 	return regmap_update_bits(rd->periph_regs, PISTACHIO_SOFT_RESET,
> 				  mask, mask);

Ok, done.

>> +}
>> +
>> +static int pistachio_reset_deassert(struct reset_controller_dev *rcdev,
>> +				unsigned long id)
>> +{
>> +	struct pistachio_reset_data *rd;
>> +	u32 mask;
>> +	int shift;
>> +
>> +	rd = container_of(rcdev, struct pistachio_reset_data, rcdev);
>> +	shift = pistachio_reset_shift(id);
>> +	if (shift < 0)
>> +		return shift;
>> +	mask = 1UL << shift;
> Same as above.

Ok, done.

>
>> +
>> +	regmap_update_bits(rd->periph_regs, PISTACHIO_SOFT_RESET, mask, 0);
>> +
>> +	return 0;
> Same as above.

Ok, done.

>
>> +}
>> +
>> +static struct reset_control_ops pistachio_reset_ops = {
>> +	.assert		= pistachio_reset_assert,
>> +	.deassert	= pistachio_reset_deassert,
>> +};
>> +
>> +static int pistachio_reset_probe(struct platform_device *pdev)
>> +{
>> +	struct pistachio_reset_data *rd;
>> +	int ret;
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *np = pdev->dev.of_node;
>> +
>> +	rd = devm_kzalloc(dev, sizeof(*rd), GFP_KERNEL);
>> +	if (!rd)
>> +		return -ENOMEM;
>> +
>> +	rd->periph_regs = syscon_node_to_regmap(np->parent);
>> +	if (IS_ERR(rd->periph_regs))
>> +		return PTR_ERR(rd->periph_regs);
>> +
>> +	rd->rcdev.owner = THIS_MODULE;
>> +	rd->rcdev.nr_resets = PISTACHIO_RESET_MAX + 1;
>> +	rd->rcdev.ops = &pistachio_reset_ops;
>> +	rd->rcdev.of_node = np;
>> +
>> +	ret = reset_controller_register(&rd->rcdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
> This is equivalent to:
> 	return reset_controller_register(&rd->rcdev);
> Just use that instead.

Yes that's pretty ugly - done.

>
>> +}
>> +
>> +static int pistachio_reset_remove(struct platform_device *pdev)
>> +{
>> +	struct pistachio_reset_data *data = platform_get_drvdata(pdev);
>> +
>> +	reset_controller_unregister(&data->rcdev);
>> +
>> +	return 0;
>> +}
>> +
>> +
>> +static const struct of_device_id pistachio_reset_dt_ids[] = {
>> +	 { .compatible = "img,pistachio-reset", },
>> +	 { /* sentinel */ },
>> +};
>> +MODULE_DEVICE_TABLE(of, pistachio_reset_dt_ids);
>> +
>> +static struct platform_driver pistachio_reset_driver = {
>> +	.probe	= pistachio_reset_probe,
>> +	.remove	= pistachio_reset_remove,
>> +	.driver = {
>> +		.name		= "pistachio-reset",
>> +		.of_match_table	= pistachio_reset_dt_ids,
>> +	},
>> +};
>> +module_platform_driver(pistachio_reset_driver);
>> +
>> +MODULE_AUTHOR("Damien Horsley <Damien.Horsley@imgtec.com>");
>> +MODULE_DESCRIPTION("Pistacho Reset Controller Driver");
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/include/dt-bindings/reset-controller/pistachio-resets.h b/include/dt-bindings/reset-controller/pistachio-resets.h
>> new file mode 100644
>> index 0000000..60a189b
>> --- /dev/null
>> +++ b/include/dt-bindings/reset-controller/pistachio-resets.h
> Please move the header to include/dt-bindings/reset/pistachio-resets.h.

Done.

>
> regards
> Philipp
>

Thanks for the review! I'll send a V3 patchet.

James.
