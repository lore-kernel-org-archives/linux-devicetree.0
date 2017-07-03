From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 4/8] mfd: hi6421-pmic: add support for HiSilicon
 Hi6421v530
Date: Mon, 3 Jul 2017 13:01:55 +0100
Message-ID: <20170703120155.gqou6tpm2mlygpzu@dell>
References: <20170608220841.26531-1-guodong.xu@linaro.org>
 <20170608220841.26531-5-guodong.xu@linaro.org>
 <20170703120002.vlegc4d5fgbsf4vn@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170703120002.vlegc4d5fgbsf4vn@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, riku.voipio-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org, damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org, ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 03 Jul 2017, Lee Jones wrote:

> On Fri, 09 Jun 2017, Guodong Xu wrote:
> 
> > Add support for HiSilicon Hi6421v530 PMIC. Hi6421v530 communicates with
> > main SoC via memory-mapped I/O.
> > 
> > Hi6421v530 and Hi6421 are PMIC chips from the same vendor, HiSilicon,
> > but at different revisions. They share the same memory-mapped I/O
> > design. They differ in integrated devices, such as regulator details,
> > LDO voltage points.
> > 
> > Signed-off-by: Wang Xiaoyin <hw.wangxiaoyin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> > Signed-off-by: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> > ---
> >  drivers/mfd/hi6421-pmic-core.c  | 70 ++++++++++++++++++++++++++++++-----------
> >  include/linux/mfd/hi6421-pmic.h |  5 +++
> >  2 files changed, 57 insertions(+), 18 deletions(-)
> 
> For my own reference:
>   Acked-for-MFD-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> 
> Plan is to apply this set after the merge-window closes.

In order to make this process as easy as possible, can you rebase this
set on v4.13-rc1 and apply my Ack to this patch please?

> > diff --git a/drivers/mfd/hi6421-pmic-core.c b/drivers/mfd/hi6421-pmic-core.c
> > index b1139d4..6fb7ba2 100644
> > --- a/drivers/mfd/hi6421-pmic-core.c
> > +++ b/drivers/mfd/hi6421-pmic-core.c
> > @@ -1,9 +1,9 @@
> >  /*
> > - * Device driver for Hi6421 IC
> > + * Device driver for Hi6421 PMIC
> >   *
> >   * Copyright (c) <2011-2014> HiSilicon Technologies Co., Ltd.
> >   *              http://www.hisilicon.com
> > - * Copyright (c) <2013-2014> Linaro Ltd.
> > + * Copyright (c) <2013-2017> Linaro Ltd.
> >   *              http://www.linaro.org
> >   *
> >   * Author: Guodong Xu <guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > @@ -16,16 +16,20 @@
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/mfd/core.h>
> > +#include <linux/mfd/hi6421-pmic.h>
> >  #include <linux/module.h>
> > -#include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > -#include <linux/mfd/hi6421-pmic.h>
> >  
> >  static const struct mfd_cell hi6421_devs[] = {
> >  	{ .name = "hi6421-regulator", },
> >  };
> >  
> > +static const struct mfd_cell hi6421v530_devs[] = {
> > +	{ .name = "hi6421v530-regulator", },
> > +};
> > +
> >  static const struct regmap_config hi6421_regmap_config = {
> >  	.reg_bits = 32,
> >  	.reg_stride = 4,
> > @@ -33,12 +37,33 @@ static const struct regmap_config hi6421_regmap_config = {
> >  	.max_register = HI6421_REG_TO_BUS_ADDR(HI6421_REG_MAX),
> >  };
> >  
> > +static const struct of_device_id of_hi6421_pmic_match[] = {
> > +	{
> > +		.compatible = "hisilicon,hi6421-pmic",
> > +		.data = (void *)HI6421
> > +	},
> > +	{
> > +		.compatible = "hisilicon,hi6421v530-pmic",
> > +		.data = (void *)HI6421_V530
> > +	},
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, of_hi6421_pmic_match);
> > +
> >  static int hi6421_pmic_probe(struct platform_device *pdev)
> >  {
> >  	struct hi6421_pmic *pmic;
> >  	struct resource *res;
> > +	const struct of_device_id *id;
> > +	const struct mfd_cell *subdevs;
> > +	enum hi6421_type type;
> >  	void __iomem *base;
> > -	int ret;
> > +	int n_subdevs, ret;
> > +
> > +	id = of_match_device(of_hi6421_pmic_match, &pdev->dev);
> > +	if (!id)
> > +		return -EINVAL;
> > +	type = (enum hi6421_type)id->data;
> >  
> >  	pmic = devm_kzalloc(&pdev->dev, sizeof(*pmic), GFP_KERNEL);
> >  	if (!pmic)
> > @@ -57,18 +82,33 @@ static int hi6421_pmic_probe(struct platform_device *pdev)
> >  		return PTR_ERR(pmic->regmap);
> >  	}
> >  
> > -	/* set over-current protection debounce 8ms */
> > -	regmap_update_bits(pmic->regmap, HI6421_OCP_DEB_CTRL_REG,
> > +	platform_set_drvdata(pdev, pmic);
> > +
> > +	switch (type) {
> > +	case HI6421:
> > +		/* set over-current protection debounce 8ms */
> > +		regmap_update_bits(pmic->regmap, HI6421_OCP_DEB_CTRL_REG,
> >  				(HI6421_OCP_DEB_SEL_MASK
> >  				 | HI6421_OCP_EN_DEBOUNCE_MASK
> >  				 | HI6421_OCP_AUTO_STOP_MASK),
> >  				(HI6421_OCP_DEB_SEL_8MS
> >  				 | HI6421_OCP_EN_DEBOUNCE_ENABLE));
> >  
> > -	platform_set_drvdata(pdev, pmic);
> > +		subdevs = hi6421_devs;
> > +		n_subdevs = ARRAY_SIZE(hi6421_devs);
> > +		break;
> > +	case HI6421_V530:
> > +		subdevs = hi6421v530_devs;
> > +		n_subdevs = ARRAY_SIZE(hi6421v530_devs);
> > +		break;
> > +	default:
> > +		dev_err(&pdev->dev, "Unknown device type %d\n",
> > +						(unsigned int)type);
> > +		return -EINVAL;
> > +	}
> >  
> > -	ret = devm_mfd_add_devices(&pdev->dev, 0, hi6421_devs,
> > -				   ARRAY_SIZE(hi6421_devs), NULL, 0, NULL);
> > +	ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
> > +				   subdevs, n_subdevs, NULL, 0, NULL);
> >  	if (ret) {
> >  		dev_err(&pdev->dev, "Failed to add child devices: %d\n", ret);
> >  		return ret;
> > @@ -77,16 +117,10 @@ static int hi6421_pmic_probe(struct platform_device *pdev)
> >  	return 0;
> >  }
> >  
> > -static const struct of_device_id of_hi6421_pmic_match_tbl[] = {
> > -	{ .compatible = "hisilicon,hi6421-pmic", },
> > -	{ },
> > -};
> > -MODULE_DEVICE_TABLE(of, of_hi6421_pmic_match_tbl);
> > -
> >  static struct platform_driver hi6421_pmic_driver = {
> >  	.driver = {
> > -		.name	= "hi6421_pmic",
> > -		.of_match_table = of_hi6421_pmic_match_tbl,
> > +		.name = "hi6421_pmic",
> > +		.of_match_table = of_hi6421_pmic_match,
> >  	},
> >  	.probe	= hi6421_pmic_probe,
> >  };
> > diff --git a/include/linux/mfd/hi6421-pmic.h b/include/linux/mfd/hi6421-pmic.h
> > index 587273e..2580c08 100644
> > --- a/include/linux/mfd/hi6421-pmic.h
> > +++ b/include/linux/mfd/hi6421-pmic.h
> > @@ -38,4 +38,9 @@ struct hi6421_pmic {
> >  	struct regmap		*regmap;
> >  };
> >  
> > +enum hi6421_type {
> > +	HI6421 = 0,
> > +	HI6421_V530,
> > +};
> > +
> >  #endif		/* __HI6421_PMIC_H */
> 

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
