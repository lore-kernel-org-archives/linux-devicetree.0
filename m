From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: [PATCH v4 2/4] drivers: soc: Add support to register LLCC EDAC driver
Date: Tue,  4 Sep 2018 16:22:23 -0700
Message-ID: <1536103345-1919-3-git-send-email-vnkgutta@codeaurora.org>
References: <1536103345-1919-1-git-send-email-vnkgutta@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536103345-1919-1-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>, evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, swboyd@chromium.org, bjorn.andersson@linaro.org
Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Cache error reporting controller detects and reports single and
double bit errors on Last Level Cache Controller (LLCC) cache.
Add required support to register LLCC EDAC driver as platform driver,
from LLCC driver.

Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Reviewed-by: Evan Green <evgreen@chromium.org>
---
 drivers/soc/qcom/llcc-slice.c      | 18 ++++++++++++++++--
 include/linux/soc/qcom/llcc-qcom.h |  2 ++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/llcc-slice.c b/drivers/soc/qcom/llcc-slice.c
index a63640d..09c8bb0 100644
--- a/drivers/soc/qcom/llcc-slice.c
+++ b/drivers/soc/qcom/llcc-slice.c
@@ -224,7 +224,7 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev)
 	u32 attr0_val;
 	u32 max_cap_cacheline;
 	u32 sz;
-	int ret;
+	int ret = 0;
 	const struct llcc_slice_config *llcc_table;
 	struct llcc_slice_desc desc;
 
@@ -282,6 +282,7 @@ int qcom_llcc_probe(struct platform_device *pdev,
 	struct resource *llcc_banks_res, *llcc_bcast_res;
 	void __iomem *llcc_banks_base, *llcc_bcast_base;
 	int ret, i;
+	struct platform_device *llcc_edac;
 
 	drv_data = devm_kzalloc(dev, sizeof(*drv_data), GFP_KERNEL);
 	if (!drv_data)
@@ -341,6 +342,19 @@ int qcom_llcc_probe(struct platform_device *pdev,
 	mutex_init(&drv_data->lock);
 	platform_set_drvdata(pdev, drv_data);
 
-	return qcom_llcc_cfg_program(pdev);
+	ret = qcom_llcc_cfg_program(pdev);
+	if (ret)
+		return ret;
+
+	drv_data->ecc_irq = platform_get_irq(pdev, 0);
+	if (drv_data->ecc_irq >= 0) {
+		llcc_edac = platform_device_register_data(&pdev->dev,
+						"qcom_llcc_edac", -1, drv_data,
+						sizeof(*drv_data));
+		if (IS_ERR(llcc_edac))
+			dev_err(dev, "Failed to register llcc edac driver\n");
+	}
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_llcc_probe);
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index c681e79..2e4b34d 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -78,6 +78,7 @@ struct llcc_slice_config {
  * @num_banks: Number of llcc banks
  * @bitmap: Bit map to track the active slice ids
  * @offsets: Pointer to the bank offsets array
+ * @ecc_irq: interrupt for llcc cache error detection and reporting
  */
 struct llcc_drv_data {
 	struct regmap *regmap;
@@ -89,6 +90,7 @@ struct llcc_drv_data {
 	u32 num_banks;
 	unsigned long *bitmap;
 	u32 *offsets;
+	int ecc_irq;
 };
 
 #if IS_ENABLED(CONFIG_QCOM_LLCC)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
