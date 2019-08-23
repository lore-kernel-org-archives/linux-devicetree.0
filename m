From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v5 03/10] mfd: mt6397: modify suspend/resume behavior
Date: Fri, 23 Aug 2019 17:12:18 +0200
Message-ID: <53bed53c-13a5-b745-25a0-0c8720f64441@gmail.com>
References: <1566531931-9772-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1566531931-9772-4-git-send-email-hsin-hsiung.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566531931-9772-4-git-send-email-hsin-hsiung.wang@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Liam Girdwood <lgirdwood@gmail.com>, Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Alessandro Zummo <a.zummo@towertech.it>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Richard Fontana <rfontana@redhat.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org



On 23/08/2019 05:45, Hsin-Hsiung Wang wrote:
> Some pmics don't need backup interrupt settings, so we change to use
> pm notifier for the pmics which are necessary to store settings.
> 
> Acked-for-mfd-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/mfd/mt6397-core.c       | 89 +++++++++++++++++------------------------
>  drivers/mfd/mt6397-irq.c        | 33 +++++++++++++++
>  include/linux/mfd/mt6397/core.h |  3 ++
>  3 files changed, 73 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 93c8881..8f94187 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -4,7 +4,6 @@
>   * Author: Flora Fu, MediaTek
>   */
>  
> -#include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
> @@ -82,40 +81,27 @@
>  	}
>  };
>  
> -#ifdef CONFIG_PM_SLEEP
> -static int mt6397_irq_suspend(struct device *dev)
> -{
> -	struct mt6397_chip *chip = dev_get_drvdata(dev);
> -
> -	regmap_write(chip->regmap, chip->int_con[0], chip->wake_mask[0]);
> -	regmap_write(chip->regmap, chip->int_con[1], chip->wake_mask[1]);
> -
> -	enable_irq_wake(chip->irq);
> -
> -	return 0;
> -}
> -
> -static int mt6397_irq_resume(struct device *dev)
> -{
> -	struct mt6397_chip *chip = dev_get_drvdata(dev);
> -
> -	regmap_write(chip->regmap, chip->int_con[0], chip->irq_masks_cur[0]);
> -	regmap_write(chip->regmap, chip->int_con[1], chip->irq_masks_cur[1]);
> -
> -	disable_irq_wake(chip->irq);
> +struct chip_data {
> +	u32 cid_addr;
> +	u32 cid_shift;
> +};
>  
> -	return 0;
> -}
> -#endif
> +static const struct chip_data mt6323_core = {
> +	.cid_addr = MT6323_CID,
> +	.cid_shift = 0,
> +};
>  
> -static SIMPLE_DEV_PM_OPS(mt6397_pm_ops, mt6397_irq_suspend,
> -			mt6397_irq_resume);
> +static const struct chip_data mt6397_core = {
> +	.cid_addr = MT6397_CID,
> +	.cid_shift = 0,
> +};
>  
>  static int mt6397_probe(struct platform_device *pdev)
>  {
>  	int ret;
>  	unsigned int id;
>  	struct mt6397_chip *pmic;
> +	const struct chip_data *pmic_core;
>  
>  	pmic = devm_kzalloc(&pdev->dev, sizeof(*pmic), GFP_KERNEL);
>  	if (!pmic)
> @@ -131,28 +117,30 @@ static int mt6397_probe(struct platform_device *pdev)
>  	if (!pmic->regmap)
>  		return -ENODEV;
>  
> -	platform_set_drvdata(pdev, pmic);
> +	pmic_core = of_device_get_match_data(&pdev->dev);
> +	if (!pmic_core)
> +		return -ENODEV;
>  
> -	ret = regmap_read(pmic->regmap, MT6397_CID, &id);
> +	ret = regmap_read(pmic->regmap, pmic_core->cid_addr, &id);
>  	if (ret) {
> -		dev_err(pmic->dev, "Failed to read chip id: %d\n", ret);
> +		dev_err(&pdev->dev, "Failed to read chip id: %d\n", ret);
>  		return ret;
>  	}
>  
> +	pmic->chip_id = (id >> pmic_core->cid_shift) & 0xff;
> +
> +	platform_set_drvdata(pdev, pmic);
> +

What do this changes have to do with the commit message/subject?

>  	pmic->irq = platform_get_irq(pdev, 0);
>  	if (pmic->irq <= 0)
>  		return pmic->irq;
>  
> -	switch (id & 0xff) {
> -	case MT6323_CHIP_ID:
> -		pmic->int_con[0] = MT6323_INT_CON0;
> -		pmic->int_con[1] = MT6323_INT_CON1;
> -		pmic->int_status[0] = MT6323_INT_STATUS0;
> -		pmic->int_status[1] = MT6323_INT_STATUS1;
> -		ret = mt6397_irq_init(pmic);
> -		if (ret)
> -			return ret;

This looks to me as if it should be part of 02/10.

> +	ret = mt6397_irq_init(pmic);
> +	if (ret)
> +		return ret;
>  
> +	switch (pmic->chip_id) {
> +	case MT6323_CHIP_ID:
>  		ret = devm_mfd_add_devices(&pdev->dev, -1, mt6323_devs,
>  					   ARRAY_SIZE(mt6323_devs), NULL,
>  					   0, pmic->irq_domain);
> @@ -160,21 +148,13 @@ static int mt6397_probe(struct platform_device *pdev)
>  
>  	case MT6391_CHIP_ID:
>  	case MT6397_CHIP_ID:
> -		pmic->int_con[0] = MT6397_INT_CON0;
> -		pmic->int_con[1] = MT6397_INT_CON1;
> -		pmic->int_status[0] = MT6397_INT_STATUS0;
> -		pmic->int_status[1] = MT6397_INT_STATUS1;
> -		ret = mt6397_irq_init(pmic);
> -		if (ret)
> -			return ret;
> -

Same here.

Regards,
Matthias

>  		ret = devm_mfd_add_devices(&pdev->dev, -1, mt6397_devs,
>  					   ARRAY_SIZE(mt6397_devs), NULL,
>  					   0, pmic->irq_domain);
>  		break;
>  
>  	default:
> -		dev_err(&pdev->dev, "unsupported chip: %d\n", id);
> +		dev_err(&pdev->dev, "unsupported chip: %d\n", pmic->chip_id);
>  		return -ENODEV;
>  	}
>  
> @@ -187,9 +167,15 @@ static int mt6397_probe(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id mt6397_of_match[] = {
> -	{ .compatible = "mediatek,mt6397" },
> -	{ .compatible = "mediatek,mt6323" },
> -	{ }
> +	{
> +		.compatible = "mediatek,mt6323",
> +		.data = &mt6323_core,
> +	}, {
> +		.compatible = "mediatek,mt6397",
> +		.data = &mt6397_core,
> +	}, {
> +		/* sentinel */
> +	}
>  };
>  MODULE_DEVICE_TABLE(of, mt6397_of_match);
>  
> @@ -204,7 +190,6 @@ static int mt6397_probe(struct platform_device *pdev)
>  	.driver = {
>  		.name = "mt6397",
>  		.of_match_table = of_match_ptr(mt6397_of_match),
> -		.pm = &mt6397_pm_ops,
>  	},
>  	.id_table = mt6397_id,
>  };
> diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
> index b2d3ce1..669e93d 100644
> --- a/drivers/mfd/mt6397-irq.c
> +++ b/drivers/mfd/mt6397-irq.c
> @@ -9,6 +9,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/suspend.h>
>  #include <linux/mfd/mt6323/core.h>
>  #include <linux/mfd/mt6323/registers.h>
>  #include <linux/mfd/mt6397/core.h>
> @@ -128,6 +129,36 @@ static int mt6397_irq_domain_map(struct irq_domain *d, unsigned int irq,
>  	.map = mt6397_irq_domain_map,
>  };
>  
> +static int mt6397_irq_pm_notifier(struct notifier_block *notifier,
> +				  unsigned long pm_event, void *unused)
> +{
> +	struct mt6397_chip *chip =
> +		container_of(notifier, struct mt6397_chip, pm_nb);
> +
> +	switch (pm_event) {
> +	case PM_SUSPEND_PREPARE:
> +		regmap_write(chip->regmap,
> +			     chip->int_con[0], chip->wake_mask[0]);
> +		regmap_write(chip->regmap,
> +			     chip->int_con[1], chip->wake_mask[1]);
> +		enable_irq_wake(chip->irq);
> +		break;
> +
> +	case PM_POST_SUSPEND:
> +		regmap_write(chip->regmap,
> +			     chip->int_con[0], chip->irq_masks_cur[0]);
> +		regmap_write(chip->regmap,
> +			     chip->int_con[1], chip->irq_masks_cur[1]);
> +		disable_irq_wake(chip->irq);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_DONE;
> +}
> +
>  int mt6397_irq_init(struct mt6397_chip *chip)
>  {
>  	int ret;
> @@ -159,6 +190,7 @@ int mt6397_irq_init(struct mt6397_chip *chip)
>  	regmap_write(chip->regmap, chip->int_con[0], 0x0);
>  	regmap_write(chip->regmap, chip->int_con[1], 0x0);
>  
> +	chip->pm_nb.notifier_call = mt6397_irq_pm_notifier;
>  	chip->irq_domain = irq_domain_add_linear(chip->dev->of_node,
>  						 MT6397_IRQ_NR,
>  						 &mt6397_irq_domain_ops,
> @@ -177,5 +209,6 @@ int mt6397_irq_init(struct mt6397_chip *chip)
>  		return ret;
>  	}
>  
> +	register_pm_notifier(&chip->pm_nb);
>  	return 0;
>  }
> diff --git a/include/linux/mfd/mt6397/core.h b/include/linux/mfd/mt6397/core.h
> index 9320c2a..23e21da 100644
> --- a/include/linux/mfd/mt6397/core.h
> +++ b/include/linux/mfd/mt6397/core.h
> @@ -7,6 +7,8 @@
>  #ifndef __MFD_MT6397_CORE_H__
>  #define __MFD_MT6397_CORE_H__
>  
> +#include <linux/notifier.h>
> +
>  enum chip_id {
>  	MT6323_CHIP_ID = 0x23,
>  	MT6391_CHIP_ID = 0x91,
> @@ -52,6 +54,7 @@ enum mt6397_irq_numbers {
>  struct mt6397_chip {
>  	struct device *dev;
>  	struct regmap *regmap;
> +	struct notifier_block pm_nb;
>  	int irq;
>  	struct irq_domain *irq_domain;
>  	struct mutex irqlock;
> 
