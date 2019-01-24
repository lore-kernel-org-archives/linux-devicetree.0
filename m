Return-Path: <SRS0=avNg=QA=nvidia.com=talho@kernel.org>
From: Timo Alho <talho@nvidia.com>
Subject: [PATCH V3 3/4] firmware: tegra: add bpmp driver for Tegra210
Date: Thu, 24 Jan 2019 19:03:54 +0200
Message-ID: <1548349435-1086-4-git-send-email-talho@nvidia.com>
In-Reply-To: <1548349435-1086-1-git-send-email-talho@nvidia.com>
References: <1548349435-1086-1-git-send-email-talho@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
To: jonathanh@nvidia.com, treding@nvidia.com, sivaramn@nvidia.com, robh@kernel.org
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Timo Alho <talho@nvidia.com>
List-ID: <devicetree@vger.kernel.org>

This patch adds driver for Tegra210 BPMP firmware.

The BPMP is a specific processor in Tegra210 chip, which runs firmware
for assisting in entering deep low power states (suspend to ram), and
offloading DRAM memory clock scaling on some platforms.

Based on work by Sivaram Nair <sivaramn@nvidia.com>

Signed-off-by: Timo Alho <talho@nvidia.com>
---
 drivers/firmware/tegra/Makefile       |   1 +
 drivers/firmware/tegra/bpmp-private.h |   1 +
 drivers/firmware/tegra/bpmp-t210.c    | 245 ++++++++++++++++++++++++++++++++++
 drivers/firmware/tegra/bpmp.c         |  46 +++++--
 include/soc/tegra/bpmp.h              |   1 +
 5 files changed, 285 insertions(+), 9 deletions(-)
 create mode 100644 drivers/firmware/tegra/bpmp-t210.c

diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Makefile
index 367d482..dc41d6f 100644
--- a/drivers/firmware/tegra/Makefile
+++ b/drivers/firmware/tegra/Makefile
@@ -1,5 +1,6 @@
 tegra-bpmp-y			= bpmp.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+= bpmp-t186.o
+tegra-bpmp-$(CONFIG_ARCH_TEGRA_210_SOC)	+= bpmp-t210.o
 tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp-debugfs.o
 obj-$(CONFIG_TEGRA_BPMP)	+= tegra-bpmp.o
 obj-$(CONFIG_TEGRA_IVC)		+= ivc.o
diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
index 2354337..5132234 100644
--- a/drivers/firmware/tegra/bpmp-private.h
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -24,5 +24,6 @@ struct tegra_bpmp_ops {
 };
 
 extern struct tegra_bpmp_ops tegra186_bpmp_ops;
+extern struct tegra_bpmp_ops tegra210_bpmp_ops;
 
 #endif
diff --git a/drivers/firmware/tegra/bpmp-t210.c b/drivers/firmware/tegra/bpmp-t210.c
new file mode 100644
index 0000000..cc56682
--- /dev/null
+++ b/drivers/firmware/tegra/bpmp-t210.c
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, NVIDIA CORPORATION.
+ */
+
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#include <soc/tegra/bpmp.h>
+
+#include "bpmp-private.h"
+
+#define TRIGGER_OFFSET		0x000
+#define RESULT_OFFSET(id)	(0xc00 + id * 4)
+#define TRIGGER_ID_SHIFT	16
+#define TRIGGER_CMD_GET		4
+
+#define STA_OFFSET		0
+#define SET_OFFSET		4
+#define CLR_OFFSET		8
+
+#define CH_MASK(ch)	(0x3 << ((ch) * 2))
+#define SL_SIGL(ch)	(0x0 << ((ch) * 2))
+#define SL_QUED(ch)	(0x1 << ((ch) * 2))
+#define MA_FREE(ch)	(0x2 << ((ch) * 2))
+#define MA_ACKD(ch)	(0x3 << ((ch) * 2))
+
+struct tegra210_bpmp {
+	void __iomem *atomics;
+	void __iomem *arb_sema;
+	struct irq_data *tx_irq_data;
+};
+
+static uint32_t bpmp_ch_sta(struct tegra_bpmp *bpmp, int ch)
+{
+	struct tegra210_bpmp *priv = bpmp->priv;
+
+	return __raw_readl(priv->arb_sema + STA_OFFSET) & CH_MASK(ch);
+}
+
+static bool tegra210_bpmp_is_resp_ready(struct tegra_bpmp_channel *channel)
+{
+	int nr = channel->nr;
+
+	return bpmp_ch_sta(channel->bpmp, nr) == MA_ACKD(nr);
+}
+
+static bool tegra210_bpmp_is_req_ready(struct tegra_bpmp_channel *channel)
+{
+	int nr = channel->nr;
+
+	return bpmp_ch_sta(channel->bpmp, nr) == SL_SIGL(nr);
+}
+
+static bool tegra210_bpmp_is_req_channel_free(
+	struct tegra_bpmp_channel *channel)
+{
+	int nr = channel->nr;
+
+	return bpmp_ch_sta(channel->bpmp, nr) == MA_FREE(nr);
+}
+
+static bool tegra210_bpmp_is_resp_channel_free(
+	struct tegra_bpmp_channel *channel)
+{
+	int nr = channel->nr;
+
+	return bpmp_ch_sta(channel->bpmp, nr) == SL_QUED(nr);
+}
+
+static int tegra210_bpmp_post_req(struct tegra_bpmp_channel *channel)
+{
+	struct tegra210_bpmp *priv = channel->bpmp->priv;
+	int nr = channel->nr;
+
+	__raw_writel(CH_MASK(nr), priv->arb_sema + CLR_OFFSET);
+
+	return 0;
+}
+
+static int tegra210_bpmp_post_resp(struct tegra_bpmp_channel *channel)
+{
+	struct tegra210_bpmp *priv = channel->bpmp->priv;
+	int nr = channel->nr;
+
+	__raw_writel(MA_ACKD(nr), priv->arb_sema + SET_OFFSET);
+
+	return 0;
+}
+
+static int tegra210_bpmp_ack_resp(struct tegra_bpmp_channel *channel)
+{
+	struct tegra210_bpmp *priv = channel->bpmp->priv;
+	int nr = channel->nr;
+
+	__raw_writel(MA_ACKD(nr) ^ MA_FREE(nr),
+		     priv->arb_sema + CLR_OFFSET);
+
+	return 0;
+}
+
+static int tegra210_bpmp_ack_req(struct tegra_bpmp_channel *channel)
+{
+	struct tegra210_bpmp *priv = channel->bpmp->priv;
+	int nr = channel->nr;
+
+	__raw_writel(SL_QUED(nr), priv->arb_sema + SET_OFFSET);
+
+	return 0;
+}
+
+static int tegra210_bpmp_ring_doorbell(struct tegra_bpmp *bpmp)
+{
+	struct tegra210_bpmp *priv = bpmp->priv;
+	struct irq_data *irq_data = priv->tx_irq_data;
+
+	/* Tegra Legacy Interrupt Controller (LIC) is used to notify
+	 * BPMP of available messages
+	 */
+	if (!irq_data->chip->irq_retrigger)
+		return -EINVAL;
+	else
+		return irq_data->chip->irq_retrigger(irq_data);
+}
+
+static irqreturn_t rx_irq(int irq, void *data)
+{
+	struct tegra_bpmp *bpmp = data;
+
+	tegra_bpmp_handle_rx(bpmp);
+
+	return IRQ_HANDLED;
+}
+
+static int tegra210_bpmp_channel_init(struct tegra_bpmp_channel *channel,
+				      struct tegra_bpmp *bpmp,
+				      unsigned int index)
+{
+	struct tegra210_bpmp *priv = bpmp->priv;
+	uint32_t a;
+	void *p;
+
+	/* Retrieve channel base address from bpmp */
+	writel(index << TRIGGER_ID_SHIFT | TRIGGER_CMD_GET,
+	       priv->atomics + TRIGGER_OFFSET);
+	a = readl(priv->atomics + RESULT_OFFSET(index));
+
+	p = devm_ioremap(bpmp->dev, a, 0x80);
+	if (!p)
+		return -ENOMEM;
+
+	channel->ib = p;
+	channel->ob = p;
+	channel->nr = index;
+	init_completion(&channel->completion);
+	channel->bpmp = bpmp;
+
+	return 0;
+}
+
+static int tegra210_bpmp_init(struct tegra_bpmp *bpmp)
+{
+	struct platform_device *pdev = to_platform_device(bpmp->dev);
+	struct tegra210_bpmp *priv;
+	struct resource *res;
+	unsigned int i;
+	int err;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	bpmp->priv = priv;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	priv->atomics = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(priv->atomics))
+		return PTR_ERR(priv->atomics);
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	priv->arb_sema = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(priv->arb_sema))
+		return PTR_ERR(priv->arb_sema);
+
+	err = tegra210_bpmp_channel_init(bpmp->tx_channel, bpmp,
+					 bpmp->soc->channels.cpu_tx.offset);
+	if (err < 0)
+		return err;
+
+	err = tegra210_bpmp_channel_init(bpmp->rx_channel, bpmp,
+					 bpmp->soc->channels.cpu_rx.offset);
+	if (err < 0)
+		return err;
+
+	for (i = 0; i < bpmp->threaded.count; i++) {
+		err = tegra210_bpmp_channel_init(
+			&bpmp->threaded_channels[i], bpmp,
+			bpmp->soc->channels.thread.offset + i);
+		if (err < 0)
+			return err;
+	}
+
+	err = platform_get_irq_byname(pdev, "tx");
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to get tx IRQ: %d\n", err);
+		return err;
+	}
+
+	priv->tx_irq_data = irq_get_irq_data(err);
+	if (!priv->tx_irq_data) {
+		dev_err(&pdev->dev, "failed to get irq_data for tx IRQ\n");
+		return err;
+	}
+
+	err = platform_get_irq_byname(pdev, "rx");
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to get rx IRQ: %d\n", err);
+		return err;
+	}
+	err = devm_request_irq(&pdev->dev, err, rx_irq,
+			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), bpmp);
+	if (err < 0) {
+		dev_err(&pdev->dev, "failed to request IRQ: %d\n",
+			err);
+		return err;
+	}
+
+	return 0;
+}
+
+struct tegra_bpmp_ops tegra210_bpmp_ops = {
+	.init = tegra210_bpmp_init,
+	.is_resp_ready = tegra210_bpmp_is_resp_ready,
+	.is_req_ready = tegra210_bpmp_is_req_ready,
+	.ack_resp = tegra210_bpmp_ack_resp,
+	.ack_req = tegra210_bpmp_ack_req,
+	.is_resp_channel_free = tegra210_bpmp_is_resp_channel_free,
+	.is_req_channel_free = tegra210_bpmp_is_req_channel_free,
+	.post_resp = tegra210_bpmp_post_resp,
+	.post_req = tegra210_bpmp_post_req,
+	.ring_doorbell = tegra210_bpmp_ring_doorbell,
+};
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 483a37b..9a7d387 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -765,17 +765,23 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto free_mrq;
 
-	err = tegra_bpmp_init_clocks(bpmp);
-	if (err < 0)
-		goto free_mrq;
+	if (of_find_property(pdev->dev.of_node, "#clock-cells", NULL)) {
+		err = tegra_bpmp_init_clocks(bpmp);
+		if (err < 0)
+			goto free_mrq;
+	}
 
-	err = tegra_bpmp_init_resets(bpmp);
-	if (err < 0)
-		goto free_mrq;
+	if (of_find_property(pdev->dev.of_node, "#reset-cells", NULL)) {
+		err = tegra_bpmp_init_resets(bpmp);
+		if (err < 0)
+			goto free_mrq;
+	}
 
-	err = tegra_bpmp_init_powergates(bpmp);
-	if (err < 0)
-		goto free_mrq;
+	if (of_find_property(pdev->dev.of_node, "#power-domain-cells", NULL)) {
+		err = tegra_bpmp_init_powergates(bpmp);
+		if (err < 0)
+			goto free_mrq;
+	}
 
 	err = tegra_bpmp_init_debugfs(bpmp);
 	if (err < 0)
@@ -824,8 +830,30 @@ static const struct tegra_bpmp_soc tegra186_soc = {
 	.num_resets = 193,
 };
 
+static const struct tegra_bpmp_soc tegra210_soc = {
+	.channels = {
+		.cpu_tx = {
+			.offset = 0,
+			.count = 1,
+			.timeout = 60 * USEC_PER_SEC,
+		},
+		.thread = {
+			.offset = 4,
+			.count = 1,
+			.timeout = 600 * USEC_PER_SEC,
+		},
+		.cpu_rx = {
+			.offset = 8,
+			.count = 1,
+			.timeout = 0,
+		},
+	},
+	.ops = &tegra210_bpmp_ops,
+};
+
 static const struct of_device_id tegra_bpmp_match[] = {
 	{ .compatible = "nvidia,tegra186-bpmp", .data = &tegra186_soc },
+	{ .compatible = "nvidia,tegra210-bpmp", .data = &tegra210_soc },
 	{ }
 };
 
diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
index a4818c0..efcbeed 100644
--- a/include/soc/tegra/bpmp.h
+++ b/include/soc/tegra/bpmp.h
@@ -50,6 +50,7 @@ struct tegra_bpmp_channel {
 	struct tegra_bpmp_mb_data *ob;
 	struct completion completion;
 	struct tegra_ivc *ivc;
+	int nr;
 };
 
 typedef void (*tegra_bpmp_mrq_handler_t)(unsigned int mrq,
-- 
2.7.4
