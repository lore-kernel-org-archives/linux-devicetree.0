From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 4/7] remoteproc: Supply controller driver for ST's
 Remote Processors
Date: Tue, 12 Jan 2016 14:47:13 +0000
Message-ID: <20160112144713.GK27358@x1>
References: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
 <1452602781-22424-5-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1452602781-22424-5-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, maxime.coquelin@st.com, ohad@wizery.com, devicetree@vger.kernel.org, Nathan_Lynch@mentor.com, f.fainelli@gmail.com, ludovic.barre@st.com, s-anna@ti.com
List-Id: devicetree@vger.kernel.org

On Tue, 12 Jan 2016, Lee Jones wrote:

> Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

This should also have Bjorn's Ack.  Apologies for dropping it.

> ---
>  drivers/remoteproc/Kconfig         |   9 ++
>  drivers/remoteproc/Makefile        |   1 +
>  drivers/remoteproc/st_remoteproc.c | 297 +++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 307 insertions(+)
>  create mode 100644 drivers/remoteproc/st_remoteproc.c
>=20
> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 28c711f..72e97d7 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -77,4 +77,13 @@ config DA8XX_REMOTEPROC
>  	  It's safe to say n here if you're not interested in multimedia
>  	  offloading.
> =20
> +config ST_REMOTEPROC
> +	tristate "ST remoteproc support"
> +	depends on ARCH_STI
> +	select REMOTEPROC
> +	help
> +	  Say y here to support ST's adjunct processors via the remote
> +	  processor framework.
> +	  This can be either built-in or a loadable module.
> +
>  endmenu
> diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefil=
e
> index 81b04d1..279cb2e 100644
> --- a/drivers/remoteproc/Makefile
> +++ b/drivers/remoteproc/Makefile
> @@ -11,3 +11,4 @@ obj-$(CONFIG_OMAP_REMOTEPROC)		+=3D omap_remoteproc=
=2Eo
>  obj-$(CONFIG_STE_MODEM_RPROC)	 	+=3D ste_modem_rproc.o
>  obj-$(CONFIG_WKUP_M3_RPROC)		+=3D wkup_m3_rproc.o
>  obj-$(CONFIG_DA8XX_REMOTEPROC)		+=3D da8xx_remoteproc.o
> +obj-$(CONFIG_ST_REMOTEPROC)		+=3D st_remoteproc.o
> diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/=
st_remoteproc.c
> new file mode 100644
> index 0000000..6bb04d4
> --- /dev/null
> +++ b/drivers/remoteproc/st_remoteproc.c
> @@ -0,0 +1,297 @@
> +/*
> + * ST's Remote Processor Control Driver
> + *
> + * Copyright (C) 2015 STMicroelectronics - All Rights Reserved
> + *
> + * Author: Ludovic Barre <ludovic.barre@st.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/remoteproc.h>
> +#include <linux/reset.h>
> +
> +struct st_rproc_config {
> +	bool			sw_reset;
> +	bool			pwr_reset;
> +	unsigned long		bootaddr_mask;
> +};
> +
> +struct st_rproc {
> +	struct st_rproc_config	*config;
> +	struct reset_control	*sw_reset;
> +	struct reset_control	*pwr_reset;
> +	struct clk		*clk;
> +	u32			clk_rate;
> +	struct regmap		*boot_base;
> +	u32			boot_offset;
> +};
> +
> +static int st_rproc_start(struct rproc *rproc)
> +{
> +	struct st_rproc *ddata =3D rproc->priv;
> +	int err;
> +
> +	regmap_update_bits(ddata->boot_base, ddata->boot_offset,
> +			   ddata->config->bootaddr_mask, rproc->bootaddr);
> +
> +	err =3D clk_enable(ddata->clk);
> +	if (err) {
> +		dev_err(&rproc->dev, "Failed to enable clock\n");
> +		return err;
> +	}
> +
> +	if (ddata->config->sw_reset) {
> +		err =3D reset_control_deassert(ddata->sw_reset);
> +		if (err) {
> +			dev_err(&rproc->dev, "Failed to deassert S/W Reset\n");
> +			goto sw_reset_fail;
> +		}
> +	}
> +
> +	if (ddata->config->pwr_reset) {
> +		err =3D reset_control_deassert(ddata->pwr_reset);
> +		if (err) {
> +			dev_err(&rproc->dev, "Failed to deassert Power Reset\n");
> +			goto pwr_reset_fail;
> +		}
> +	}
> +
> +	dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
> +
> +	return 0;
> +
> +
> +pwr_reset_fail:
> +	if (ddata->config->pwr_reset)
> +		reset_control_assert(ddata->sw_reset);
> +sw_reset_fail:
> +	clk_disable(ddata->clk);
> +
> +	return err;
> +}
> +
> +static int st_rproc_stop(struct rproc *rproc)
> +{
> +	struct st_rproc *ddata =3D rproc->priv;
> +	int sw_err =3D 0, pwr_err =3D 0;
> +
> +	if (ddata->config->sw_reset) {
> +		sw_err =3D reset_control_assert(ddata->sw_reset);
> +		if (sw_err)
> +			dev_err(&rproc->dev, "Failed to assert S/W Reset\n");
> +	}
> +
> +	if (ddata->config->pwr_reset) {
> +		pwr_err =3D reset_control_assert(ddata->pwr_reset);
> +		if (pwr_err)
> +			dev_err(&rproc->dev, "Failed to assert Power Reset\n");
> +	}
> +
> +	clk_disable(ddata->clk);
> +
> +	return sw_err ?: pwr_err;
> +}
> +
> +static struct rproc_ops st_rproc_ops =3D {
> +	.start		=3D st_rproc_start,
> +	.stop		=3D st_rproc_stop,
> +};
> +
> +/*
> + * Fetch state of the processor: 0 is off, 1 is on.
> + */
> +static int st_rproc_state(struct platform_device *pdev)
> +{
> +	struct rproc *rproc =3D platform_get_drvdata(pdev);
> +	struct st_rproc *ddata =3D rproc->priv;
> +	int reset_sw =3D 0, reset_pwr =3D 0;
> +
> +	if (ddata->config->sw_reset)
> +		reset_sw =3D reset_control_status(ddata->sw_reset);
> +
> +	if (ddata->config->pwr_reset)
> +		reset_pwr =3D reset_control_status(ddata->pwr_reset);
> +
> +	if (reset_sw < 0 || reset_pwr < 0)
> +		return -EINVAL;
> +
> +	return !reset_sw && !reset_pwr;
> +}
> +
> +static const struct st_rproc_config st40_rproc_cfg =3D {
> +	.sw_reset =3D true,
> +	.pwr_reset =3D true,
> +	.bootaddr_mask =3D GENMASK(28, 1),
> +};
> +
> +static const struct st_rproc_config st231_rproc_cfg =3D {
> +	.sw_reset =3D true,
> +	.pwr_reset =3D false,
> +	.bootaddr_mask =3D GENMASK(31, 6),
> +};
> +
> +static const struct of_device_id st_rproc_match[] =3D {
> +	{ .compatible =3D "st,st40-rproc", .data =3D &st40_rproc_cfg },
> +	{ .compatible =3D "st,st231-rproc", .data =3D &st231_rproc_cfg },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, st_rproc_match);
> +
> +static int st_rproc_parse_dt(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct rproc *rproc =3D platform_get_drvdata(pdev);
> +	struct st_rproc *ddata =3D rproc->priv;
> +	struct device_node *np =3D dev->of_node;
> +	int err;
> +
> +	if (ddata->config->sw_reset) {
> +		ddata->sw_reset =3D devm_reset_control_get(dev, "sw_reset");
> +		if (IS_ERR(ddata->sw_reset)) {
> +			dev_err(dev, "Failed to get S/W Reset\n");
> +			return PTR_ERR(ddata->sw_reset);
> +		}
> +	}
> +
> +	if (ddata->config->pwr_reset) {
> +		ddata->pwr_reset =3D devm_reset_control_get(dev, "pwr_reset");
> +		if (IS_ERR(ddata->pwr_reset)) {
> +			dev_err(dev, "Failed to get Power Reset\n");
> +			return PTR_ERR(ddata->pwr_reset);
> +		}
> +	}
> +
> +	ddata->clk =3D devm_clk_get(dev, NULL);
> +	if (IS_ERR(ddata->clk)) {
> +		dev_err(dev, "Failed to get clock\n");
> +		return PTR_ERR(ddata->clk);
> +	}
> +
> +	err =3D of_property_read_u32(np, "clock-frequency", &ddata->clk_rat=
e);
> +	if (err) {
> +		dev_err(dev, "failed to get clock frequency\n");
> +		return err;
> +	}
> +
> +	ddata->boot_base =3D syscon_regmap_lookup_by_phandle(np, "st,syscfg=
");
> +	if (!ddata->boot_base) {
> +		dev_err(dev, "Boot base not found\n");
> +		return -EINVAL;
> +	}
> +
> +	err =3D of_property_read_u32_index(np, "st,syscfg", 1,
> +					 &ddata->boot_offset);
> +	if (err) {
> +		dev_err(dev, "Boot offset not found\n");
> +		return -EINVAL;
> +	}
> +
> +	err =3D of_reserved_mem_device_init(dev);
> +	if (err) {
> +		dev_err(dev, "Failed to obtain shared memory\n");
> +		return err;
> +	}
> +
> +	err =3D clk_prepare(ddata->clk);
> +	if (err)
> +		dev_err(dev, "failed to get clock\n");
> +
> +	return err;
> +}
> +
> +static int st_rproc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	const struct of_device_id *match;
> +	struct st_rproc *ddata;
> +	struct device_node *np =3D dev->of_node;
> +	struct rproc *rproc;
> +	int enabled;
> +	int ret;
> +
> +	match =3D of_match_device(st_rproc_match, dev);
> +	if (!match || !match->data) {
> +		dev_err(dev, "No device match found\n");
> +		return -ENODEV;
> +	}
> +
> +	rproc =3D rproc_alloc(dev, np->name, &st_rproc_ops, NULL, sizeof(*d=
data));
> +	if (!rproc)
> +		return -ENOMEM;
> +
> +	rproc->has_iommu =3D false;
> +	ddata =3D rproc->priv;
> +	ddata->config =3D (struct st_rproc_config *)match->data;
> +
> +	platform_set_drvdata(pdev, rproc);
> +
> +	ret =3D st_rproc_parse_dt(pdev);
> +	if (ret)
> +		goto free_rproc;
> +
> +	enabled =3D st_rproc_state(pdev);
> +	if (enabled < 0)
> +		goto free_rproc;
> +
> +	if (enabled) {
> +		atomic_inc(&rproc->power);
> +		rproc->state =3D RPROC_RUNNING;
> +	} else {
> +		clk_set_rate(ddata->clk, ddata->clk_rate);
> +	}
> +
> +	ret =3D rproc_add(rproc);
> +	if (ret)
> +		goto free_rproc;
> +
> +	return 0;
> +
> +free_rproc:
> +	rproc_put(rproc);
> +	return ret;
> +}
> +
> +static int st_rproc_remove(struct platform_device *pdev)
> +{
> +	struct rproc *rproc =3D platform_get_drvdata(pdev);
> +	struct st_rproc *ddata =3D rproc->priv;
> +
> +	rproc_del(rproc);
> +
> +	clk_disable_unprepare(ddata->clk);
> +
> +	of_reserved_mem_device_release(&pdev->dev);
> +
> +	rproc_put(rproc);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver st_rproc_driver =3D {
> +	.probe =3D st_rproc_probe,
> +	.remove =3D st_rproc_remove,
> +	.driver =3D {
> +		.name =3D "st-rproc",
> +		.of_match_table =3D of_match_ptr(st_rproc_match),
> +	},
> +};
> +module_platform_driver(st_rproc_driver);
> +
> +MODULE_DESCRIPTION("ST Remote Processor Control Driver");
> +MODULE_AUTHOR("Ludovic Barre <ludovic.barre@st.com>");
> +MODULE_LICENSE("GPL v2");

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
