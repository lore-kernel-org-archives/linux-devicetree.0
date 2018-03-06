Return-Path: <SRS0=MR/7=F4=linaro.org=shawn.guo@kernel.org>
Date: Tue, 6 Mar 2018 17:13:36 +0800
From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH v2 2/2] mmc: dw_mmc: add support for hi3798cv200 specific
 extensions of dw-mshc
Message-ID: <20180306091333.GI28619@dragon>
References: <1520319531-24661-1-git-send-email-shawn.guo@linaro.org>
 <1520319531-24661-3-git-send-email-shawn.guo@linaro.org>
 <ef5f39cf-c420-1ca4-6b74-f9fb44138a33@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef5f39cf-c420-1ca4-6b74-f9fb44138a33@rock-chips.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, tianshuliang <tianshuliang@hisilicon.com>, Jiancheng Xue <xuejiancheng@hisilicon.com>, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 06, 2018 at 03:42:05PM +0800, Shawn Lin wrote:
> >diff --git a/drivers/mmc/host/dw_mmc-hi3798cv200.c b/drivers/mmc/host/dw_mmc-hi3798cv200.c
> >new file mode 100644
> >index 000000000000..364ad3dd7116
> >--- /dev/null
> >+++ b/drivers/mmc/host/dw_mmc-hi3798cv200.c
> >@@ -0,0 +1,197 @@
> >+// SPDX-License-Identifier: GPL-2.0
> >+/*
> >+ * Copyright (c) 2017 HiSilicon Technologies Co., Ltd.
> 
> 2018?

Okay.  I will update it to year 2018.

> 
> >+ */
> >+
> >+#include <linux/clk.h>
> >+#include <linux/mfd/syscon.h>
> >+#include <linux/mmc/host.h>
> >+#include <linux/module.h>
> >+#include <linux/of_address.h>
> >+#include <linux/platform_device.h>
> >+#include <linux/pm_runtime.h>
> >+#include <linux/regmap.h>
> >+#include <linux/regulator/consumer.h>
> >+
> >+#include "dw_mmc.h"
> >+#include "dw_mmc-pltfm.h"
> >+
> >+#define SDMMC_DDR_REG		0x10c
> >+#define SDMMC_DDR_HS400		BIT(31)
> >+#define SDMMC_ENABLE_SH		0x110
> >+#define SDMMC_ENABLE_SH_PHASE	BIT(0)
> >+
> >+#define SDMMC_UHS_DDR		BIT(16)
> 
> All these definition match the dwmmc datasbook, so I
> sugguest to move it to dw_mmc.h.

I do not have the access to dwmmc datasbook, so will rely on your
knowledge on this.  I will add a separate patch before this one to move
these defines into dw_mmc.h.

> 
> >+#define ALL_INT_CLR		0x1efff
> 
> Why you leave out HLE?

I do not know any particular reason for that, and I just verified that
it works with HLE included in there.

@Jiancheng, Shuliang, if you guys know any reason for that, please help
comment.  Otherwise, I will just include the bit HLE in ALL_INT_CLR.

> 
> >+
> >+struct hi3798cv200_priv {
> >+	struct clk *sample_clk;
> >+	struct clk *drive_clk;
> >+};
> >+

<snip>

> >+static int dw_mci_hi3798cv200_init(struct dw_mci *host)
> >+{
> >+	struct hi3798cv200_priv *priv;
> >+	int ret;
> >+
> >+	priv = devm_kzalloc(host->dev, sizeof(*priv), GFP_KERNEL);
> >+	if (!priv)
> >+		return -ENOMEM;
> >+
> >+	priv->sample_clk = devm_clk_get(host->dev, "ciu-sample");
> >+	if (IS_ERR(priv->sample_clk)) {
> >+		dev_err(host->dev, "failed to get ciu-sample clock\n");
> >+		return PTR_ERR(priv->sample_clk);
> >+	}
> >+
> >+	priv->drive_clk = devm_clk_get(host->dev, "ciu-drive");
> >+	if (IS_ERR(priv->drive_clk)) {
> >+		dev_err(host->dev, "failed to get ciu-drive clock\n");
> >+		return PTR_ERR(priv->drive_clk);
> >+	}
> >+
> >+	ret = clk_prepare_enable(priv->sample_clk);
> >+	if (ret) {
> >+		dev_err(host->dev, "failed to enable ciu-sample clock\n");
> >+		return ret;
> >+	}
> >+
> >+	ret = clk_prepare_enable(priv->drive_clk);
> >+	if (ret) {
> >+		dev_err(host->dev, "failed to enable ciu-drive clock\n");
> >+		goto disable_sample_clk;
> >+	}
> >+
> >+	host->priv = priv;
> >+	return 0;
> >+
> >+disable_sample_clk:
> >+	clk_disable_unprepare(priv->sample_clk);
> >+	return ret;
> >+}
> >+
> >+static const struct dw_mci_drv_data hi3798cv200_data = {
> >+	.init = dw_mci_hi3798cv200_init,
> >+	.set_ios = dw_mci_hi3798cv200_set_ios,
> >+	.execute_tuning = dw_mci_hi3798cv200_execute_tuning,
> >+};
> >+
> >+static int dw_mci_hi3798cv200_probe(struct platform_device *pdev)
> >+{
> >+	return dw_mci_pltfm_register(pdev, &hi3798cv200_data);
> >+}
> >+
> >+static const struct of_device_id dw_mci_hi3798cv200_match[] = {
> >+	{ .compatible = "hisilicon,hi3798cv200-dw-mshc", },
> >+	{},
> >+};
> >+
> >+MODULE_DEVICE_TABLE(of, dw_mci_hi3798cv200_match);
> >+static struct platform_driver dw_mci_hi3798cv200_driver = {
> >+	.probe = dw_mci_hi3798cv200_probe,
> >+	.remove = dw_mci_pltfm_remove,
> 
> Do you need specific remove hook? As I notice you sample_clk
> and drive_clk when probing. Same question if you gonna support
> PM for this driver.

Good point.  I will add a custom .remove hook to disable the clocks.

Thanks for the comments.

Shawn
