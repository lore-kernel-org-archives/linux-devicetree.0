From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v10 1/6] mailbox: qcom: Convert APCS IPC driver to use regmap
Date: Fri,  1 Dec 2017 19:02:19 +0200
Message-ID: <20171201170224.25053-2-georgi.djakov@linaro.org>
References: <20171201170224.25053-1-georgi.djakov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171201170224.25053-1-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@codeaurora.org, jassisinghbrar@gmail.com, bjorn.andersson@linaro.org, robh@kernel.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, georgi.djakov@linaro.org
List-Id: devicetree@vger.kernel.org

This hardware block provides more functionalities that just IPC. Convert
it to regmap to allow other child platform devices to use the same regmap.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index 9924c6d7f05d..ab344bc6fa63 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/mailbox_controller.h>
 
 #define QCOM_APCS_IPC_BITS	32
@@ -26,19 +27,25 @@ struct qcom_apcs_ipc {
 	struct mbox_controller mbox;
 	struct mbox_chan mbox_chans[QCOM_APCS_IPC_BITS];
 
-	void __iomem *reg;
+	struct regmap *regmap;
 	unsigned long offset;
 };
 
+static const struct regmap_config apcs_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x1000,
+	.fast_io = true,
+};
+
 static int qcom_apcs_ipc_send_data(struct mbox_chan *chan, void *data)
 {
 	struct qcom_apcs_ipc *apcs = container_of(chan->mbox,
 						  struct qcom_apcs_ipc, mbox);
 	unsigned long idx = (unsigned long)chan->con_priv;
 
-	writel(BIT(idx), apcs->reg);
-
-	return 0;
+	return regmap_write(apcs->regmap, apcs->offset, BIT(idx));
 }
 
 static const struct mbox_chan_ops qcom_apcs_ipc_ops = {
@@ -47,7 +54,9 @@ static const struct mbox_chan_ops qcom_apcs_ipc_ops = {
 
 static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct qcom_apcs_ipc *apcs;
+	struct regmap *regmap;
 	struct resource *res;
 	unsigned long offset;
 	void __iomem *base;
@@ -63,9 +72,14 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	regmap = devm_regmap_init_mmio(&pdev->dev, base, &apcs_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
 	offset = (unsigned long)of_device_get_match_data(&pdev->dev);
 
-	apcs->reg = base + offset;
+	apcs->regmap = regmap;
+	apcs->offset = offset;
 
 	/* Initialize channel identifiers */
 	for (i = 0; i < ARRAY_SIZE(apcs->mbox_chans); i++)
