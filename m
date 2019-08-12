From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 06/10] mfd: Add support for the MediaTek MT6358 PMIC
Date: Mon, 12 Aug 2019 11:59:33 +0100
Message-ID: <20190812105933.GO26727@dell>
References: <1564982518-32163-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1564982518-32163-7-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1564982518-32163-7-git-send-email-hsin-hsiung.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, Kate Stewart <kstewart@linuxfoundation.org>, Allison Randal <allison@lohutok.net>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org

On Mon, 05 Aug 2019, Hsin-Hsiung Wang wrote:

> This adds support for the MediaTek MT6358 PMIC. This is a
> multifunction device with the following sub modules:
> 
> - Regulator
> - RTC
> - Codec
> - Interrupt
> 
> It is interfaced to the host controller using SPI interface
> by a proprietary hardware called PMIC wrapper or pwrap.
> MT6358 MFD is a child device of the pwrap.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/Makefile                 |   3 +-
>  drivers/mfd/mt6358-irq.c             | 229 ++++++++++++++++++++++++++++
>  drivers/mfd/mt6397-core.c            |  52 ++++++-
>  include/linux/mfd/mt6358/core.h      | 158 ++++++++++++++++++++
>  include/linux/mfd/mt6358/registers.h | 282 +++++++++++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   3 +
>  6 files changed, 725 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/mfd/mt6358-irq.c
>  create mode 100644 include/linux/mfd/mt6358/core.h
>  create mode 100644 include/linux/mfd/mt6358/registers.h
> 
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 9a96325..36d088b 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -241,7 +241,8 @@ obj-$(CONFIG_INTEL_SOC_PMIC)	+= intel-soc-pmic.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_BXTWC)	+= intel_soc_pmic_bxtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTWC)	+= intel_soc_pmic_chtwc.o
>  obj-$(CONFIG_INTEL_SOC_PMIC_CHTDC_TI)	+= intel_soc_pmic_chtdc_ti.o
> -mt6397-objs	:= mt6397-core.o mt6397-irq.o
> +
> +mt6397-objs			:= mt6397-core.o mt6397-irq.o mt6358-irq.o
>  obj-$(CONFIG_MFD_MT6397)	+= mt6397.o
>  
>  obj-$(CONFIG_MFD_ALTERA_A10SR)	+= altera-a10sr.o
> diff --git a/drivers/mfd/mt6358-irq.c b/drivers/mfd/mt6358-irq.c
> new file mode 100644
> index 0000000..2f55079
> --- /dev/null
> +++ b/drivers/mfd/mt6358-irq.c
> @@ -0,0 +1,229 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// Copyright (c) 2019 MediaTek Inc.
> +
> +#include <linux/interrupt.h>
> +#include <linux/mfd/mt6358/core.h>
> +#include <linux/mfd/mt6358/registers.h>
> +#include <linux/mfd/mt6397/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

[...]

> +static void pmic_irq_sync_unlock(struct irq_data *data)
> +{
> +	unsigned int i, top_gp, en_reg, int_regs, shift;
> +	struct mt6397_chip *chip = irq_data_get_irq_chip_data(data);
> +	struct pmic_irq_data *irqd = chip->irq_data;
> +
> +	for (i = 0; i < irqd->num_pmic_irqs; i++) {
> +		if (irqd->enable_hwirq[i] == irqd->cache_hwirq[i])
> +			continue;
> +
> +		top_gp = 0;
> +		while ((top_gp + 1) < ARRAY_SIZE(mt6358_ints) &&
> +		       i >= mt6358_ints[top_gp + 1].hwirq_base)
> +			top_gp++;

A comment here would make this easier to follow.

> +		if (top_gp >= ARRAY_SIZE(mt6358_ints)) {
> +			mutex_unlock(&chip->irqlock);
> +			dev_err(chip->dev,
> +				"Failed to get top_group: %d\n", top_gp);
> +			return;
> +		}
> +
> +		int_regs = (i - mt6358_ints[top_gp].hwirq_base) /
> +			    MT6358_REG_WIDTH;
> +		en_reg = mt6358_ints[top_gp].en_reg +
> +			mt6358_ints[top_gp].en_reg_shift * int_regs;
> +		shift = (i - mt6358_ints[top_gp].hwirq_base) % MT6358_REG_WIDTH;
> +		regmap_update_bits(chip->regmap, en_reg, BIT(shift),
> +				   irqd->enable_hwirq[i] << shift);
> +		irqd->cache_hwirq[i] = irqd->enable_hwirq[i];
> +	}
> +	mutex_unlock(&chip->irqlock);
> +}

[...]

> +int mt6358_irq_init(struct mt6397_chip *chip)
> +{
> +	int i, j, ret;
> +	struct pmic_irq_data *irqd;
> +
> +	irqd = devm_kzalloc(chip->dev, sizeof(struct pmic_irq_data *),
> +			    GFP_KERNEL);
> +	if (!irqd)
> +		return -ENOMEM;
> +
> +	chip->irq_data = irqd;
> +
> +	mutex_init(&chip->irqlock);
> +	irqd->top_int_status_reg = MT6358_TOP_INT_STATUS0;
> +	irqd->num_pmic_irqs = MT6358_IRQ_NR;
> +	irqd->num_top = ARRAY_SIZE(mt6358_ints);
> +
> +	irqd->enable_hwirq = devm_kcalloc(chip->dev,
> +					  irqd->num_pmic_irqs,
> +					  sizeof(bool),
> +					  GFP_KERNEL);
> +	if (!irqd->enable_hwirq)
> +		return -ENOMEM;
> +
> +	irqd->cache_hwirq = devm_kcalloc(chip->dev,
> +					 irqd->num_pmic_irqs,
> +					 sizeof(bool),
> +					 GFP_KERNEL);
> +	if (!irqd->cache_hwirq)
> +		return -ENOMEM;
> +
> +	/* Disable all interrupt for initializing */

s/interrupt/interrupts/

> +	for (i = 0; i < irqd->num_top; i++) {
> +		for (j = 0; j < mt6358_ints[i].num_int_regs; j++)
> +			regmap_write(chip->regmap,
> +				     mt6358_ints[i].en_reg +
> +				     mt6358_ints[i].en_reg_shift * j, 0);
> +	}
> +
> +	chip->irq_domain = irq_domain_add_linear(chip->dev->of_node,
> +						 irqd->num_pmic_irqs,
> +						 &mt6358_irq_domain_ops, chip);
> +	if (!chip->irq_domain) {
> +		dev_err(chip->dev, "could not create irq domain\n");

s/irq/IRQ/

> +		return -ENODEV;
> +	}
> +
> +	ret = devm_request_threaded_irq(chip->dev, chip->irq, NULL,
> +					mt6358_irq_handler, IRQF_ONESHOT,
> +					mt6358_irq_chip.name, chip);
> +	if (ret) {
> +		dev_err(chip->dev, "failed to register irq=%d; err: %d\n",
> +			chip->irq, ret);
> +		return ret;
> +	}
> +
> +	enable_irq_wake(chip->irq);
> +	return ret;
> +}

[...]

>  static const struct chip_data mt6397_core = {
>  	.cid_addr = MT6397_CID,
>  	.cid_shift = 0,
> @@ -135,7 +172,11 @@ static int mt6397_probe(struct platform_device *pdev)
>  	if (pmic->irq <= 0)
>  		return pmic->irq;
>  
> -	ret = mt6397_irq_init(pmic);
> +	if (pmic->chip_id == MT6358_CHIP_ID)
> +		ret = mt6358_irq_init(pmic);
> +	else
> +		ret = mt6397_irq_init(pmic);
> +

You may with so to check for both and error out on an unsupported chip
ID.

>  	if (ret)
>  		return ret;
>  
> @@ -146,6 +187,12 @@ static int mt6397_probe(struct platform_device *pdev)
>  					   0, pmic->irq_domain);
>  		break;
>  
> +	case MT6358_CHIP_ID:
> +		ret = devm_mfd_add_devices(&pdev->dev, -1, mt6358_devs,

Not -1.  Please use the defines.

> +					   ARRAY_SIZE(mt6358_devs), NULL,
> +					   0, pmic->irq_domain);
> +		break;
> +
>  	case MT6391_CHIP_ID:
>  	case MT6397_CHIP_ID:
>  		ret = devm_mfd_add_devices(&pdev->dev, -1, mt6397_devs,
> @@ -171,6 +218,9 @@ static const struct of_device_id mt6397_of_match[] = {
>  		.compatible = "mediatek,mt6323",
>  		.data = &mt6323_core,
>  	}, {
> +		.compatible = "mediatek,mt6358",
> +		.data = &mt6358_core,
> +	}, {
>  		.compatible = "mediatek,mt6397",
>  		.data = &mt6397_core,
>  	}, {
> diff --git a/include/linux/mfd/mt6358/core.h b/include/linux/mfd/mt6358/core.h
> new file mode 100644
> index 0000000..05108617
> --- /dev/null
> +++ b/include/linux/mfd/mt6358/core.h
> @@ -0,0 +1,158 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2019 MediaTek Inc.
> + */
> +
> +#ifndef __MFD_MT6358_CORE_H__
> +#define __MFD_MT6358_CORE_H__
> +
> +#define MT6358_REG_WIDTH 16

[...]

> +#define MT6358_TOP_GEN(sp)	\
> +{	\
> +	.hwirq_base = MT6358_IRQ_##sp##_BASE,	\
> +	.num_int_regs =	\
> +		((MT6358_IRQ_##sp##_BITS - 1) / MT6358_REG_WIDTH) + 1,	\
> +	.num_int_bits = MT6358_IRQ_##sp##_BITS, \
> +	.en_reg = MT6358_##sp##_TOP_INT_CON0,		\
> +	.en_reg_shift = 0x6,	\
> +	.sta_reg = MT6358_##sp##_TOP_INT_STATUS0,		\
> +	.sta_reg_shift = 0x2,	\
> +	.top_offset = MT6358_##sp##_TOP,	\
> +}

Please tab out the '\'s.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
