From: andrew-ct chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/3] nvmem: mediatek: Add Mediatek EFUSE driver
Date: Tue, 27 Oct 2015 13:32:13 +0800
Message-ID: <1445923933.15900.14.camel@mtksdaap41>
References: <1444984751-4572-1-git-send-email-andrew-ct.chen@mediatek.com>
	 <1444984751-4572-3-git-send-email-andrew-ct.chen@mediatek.com>
	 <562DF8C8.8060600@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562DF8C8.8060600-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, 2015-10-26 at 09:56 +0000, Srinivas Kandagatla wrote:
> On 16/10/15 09:39, andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> > From: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> >
> > Add Mediatek EFUSE driver to access hardware data like
> > thermal sensor calibration or HDMI impedance.
> >
> > Signed-off-by: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> Dirver looks pretty simple, below are few minor nits.
> 
> Please rebase this patch on top of v4.4-rc1 once its released in few 
> weeks, so that I can queue this driver for v4.5.

We will rebase it.

> 
> > ---
> >   drivers/nvmem/Kconfig     | 11 ++++++
> >   drivers/nvmem/Makefile    |  1 +
> >   drivers/nvmem/mtk-efuse.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 101 insertions(+)
> >   create mode 100644 drivers/nvmem/mtk-efuse.c
> >
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index 8db2978..1bd5badc 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -14,6 +14,17 @@ menuconfig NVMEM
> >
> >   if NVMEM
> >
> > +config MTK_EFUSE
> > +	tristate "Mediatek SoCs EFUSE support"
> > +	depends on ARCH_MEDIATEK || COMPILE_TEST
> > +	select REGMAP_MMIO
> > +	help
> > +	  This is a driver to access hardware related data like sensor
> > +	  calibration, HDMI impedance etc.
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called efuse-mtk.
> > +
> >   config QCOM_QFPROM
> >   	tristate "QCOM QFPROM Support"
> >   	depends on ARCH_QCOM || COMPILE_TEST
> > diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> > index 4328b93..916b727 100644
> > --- a/drivers/nvmem/Makefile
> > +++ b/drivers/nvmem/Makefile
> > @@ -6,6 +6,7 @@ obj-$(CONFIG_NVMEM)		+= nvmem_core.o
> >   nvmem_core-y			:= core.o
> >
> >   # Devices
> > +obj-$(CONFIG_MTK_EFUSE)		+= mtk-efuse.o
> 
> For consistency reasons, could you do this similar to other drivers.
> 
> >   obj-$(CONFIG_QCOM_QFPROM)	+= nvmem_qfprom.o
> >   nvmem_qfprom-y			:= qfprom.o
> >   obj-$(CONFIG_NVMEM_SUNXI_SID)	+= nvmem_sunxi_sid.o
> > diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> > new file mode 100644
> > index 0000000..9021c0b
> > --- /dev/null
> > +++ b/drivers/nvmem/mtk-efuse.c
> > @@ -0,0 +1,89 @@
> > +/*
> > + * Copyright (c) 2015 MediaTek Inc.
> > + * Author: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/module.h>
> > +#include <linux/nvmem-provider.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +static struct regmap_config mtk_regmap_config = {
> > +	.reg_bits = 32,
> > +	.val_bits = 32,
> > +	.reg_stride = 4,
> > +};
> > +
> > +static int mtk_efuse_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +	struct nvmem_device *nvmem;
> > +	struct nvmem_config *econfig;
> > +	struct regmap *regmap;
> > +	void __iomem *base;
> > +
> > +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	base = devm_ioremap_resource(dev, res);
> > +	if (IS_ERR(base))
> > +		return PTR_ERR(base);
> > +
> > +	econfig = devm_kzalloc(dev, sizeof(*econfig), GFP_KERNEL);
> > +	if (!econfig)
> > +		return -ENOMEM;
> Why not use static econfig variable?
> 
> > +
> > +	mtk_regmap_config.max_register = resource_size(res) - 1;
> > +
> > +	regmap = devm_regmap_init_mmio(dev, base, &mtk_regmap_config);
> > +	if (IS_ERR(regmap)) {
> > +		dev_err(dev, "regmap init failed\n");
> > +		return PTR_ERR(regmap);
> > +	}
> > +
> > +	econfig->dev = dev;
> > +	econfig->owner = THIS_MODULE;
> > +	nvmem = nvmem_register(econfig);
> > +	if (IS_ERR(nvmem))
> > +		return PTR_ERR(nvmem);
> > +
> > +	platform_set_drvdata(pdev, nvmem);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mtk_efuse_remove(struct platform_device *pdev)
> > +{
> > +	struct nvmem_device *nvmem = platform_get_drvdata(pdev);
> > +
> > +	return nvmem_unregister(nvmem);
> > +}
> > +
> > +static const struct of_device_id mtk_efuse_of_match[] = {
> > +	{ .compatible = "mediatek,mt8135-efuse",},
> > +	{ .compatible = "mediatek,mt8173-efuse",},
> > +	{/* sentinel */},
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_efuse_of_match);
> > +
> > +static struct platform_driver mtk_efuse_driver = {
> > +	.probe = mtk_efuse_probe,
> > +	.remove = mtk_efuse_remove,
> > +	.driver = {
> > +		.name = "mediatek,efuse",
> > +		.of_match_table = mtk_efuse_of_match,
> > +	},
> > +};
> > +module_platform_driver(mtk_efuse_driver);
> > +MODULE_AUTHOR("Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>");
> > +MODULE_DESCRIPTION("Mediatek EFUSE driver");
> > +MODULE_LICENSE("GPL v2");
> >


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
