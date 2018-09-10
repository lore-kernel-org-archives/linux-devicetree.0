From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Subject: [PATCH v5 1/4] drivers: soc: Add broadcast base for Last Level Cache Controller (LLCC)
Date: Mon, 10 Sep 2018 16:46:52 -0700
Message-ID: <1536623215-20018-2-git-send-email-vnkgutta@codeaurora.org>
References: <1536623215-20018-1-git-send-email-vnkgutta@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1536623215-20018-1-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <bp@alien8.de>, evgreen@chromium.org, robh@kernel.org, mchehab@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, tsoni@codeaurora.org, ckadabi@codeaurora.org, rishabhb@codeaurora.org, swboyd@chromium.org, bjorn.andersson@linaro.org, Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Currently, broadcast base is set to end of the LLCC banks, which may
not be correct always. As the number of banks may vary for each chipset
and the broadcast base could be at a different address as well. This info
depends on the chipset, so get the broadcast base info from the device
tree (DT). Add broadcast base in LLCC driver and use this for broadcast
writes.

Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Reviewed-by: Evan Green <evgreen@chromium.org>
---
 drivers/soc/qcom/llcc-slice.c      | 55 +++++++++++++++++++++++---------------
 include/linux/soc/qcom/llcc-qcom.h |  4 +--
 2 files changed, 35 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/qcom/llcc-slice.c b/drivers/soc/qcom/llcc-slice.c
index fcaad1a..a63640d 100644
--- a/drivers/soc/qcom/llcc-slice.c
+++ b/drivers/soc/qcom/llcc-slice.c
@@ -105,22 +105,24 @@ static int llcc_update_act_ctrl(u32 sid,
 	u32 slice_status;
 	int ret;
 
-	act_ctrl_reg = drv_data->bcast_off + LLCC_TRP_ACT_CTRLn(sid);
-	status_reg = drv_data->bcast_off + LLCC_TRP_STATUSn(sid);
+	act_ctrl_reg = LLCC_TRP_ACT_CTRLn(sid);
+	status_reg = LLCC_TRP_STATUSn(sid);
 
 	/* Set the ACTIVE trigger */
 	act_ctrl_reg_val |= ACT_CTRL_ACT_TRIG;
-	ret = regmap_write(drv_data->regmap, act_ctrl_reg, act_ctrl_reg_val);
+	ret = regmap_write(drv_data->bcast_regmap, act_ctrl_reg,
+				act_ctrl_reg_val);
 	if (ret)
 		return ret;
 
 	/* Clear the ACTIVE trigger */
 	act_ctrl_reg_val &= ~ACT_CTRL_ACT_TRIG;
-	ret = regmap_write(drv_data->regmap, act_ctrl_reg, act_ctrl_reg_val);
+	ret = regmap_write(drv_data->bcast_regmap, act_ctrl_reg,
+				act_ctrl_reg_val);
 	if (ret)
 		return ret;
 
-	ret = regmap_read_poll_timeout(drv_data->regmap, status_reg,
+	ret = regmap_read_poll_timeout(drv_data->bcast_regmap, status_reg,
 				      slice_status, !(slice_status & status),
 				      0, LLCC_STATUS_READ_DELAY);
 	return ret;
@@ -225,16 +227,13 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev)
 	int ret;
 	const struct llcc_slice_config *llcc_table;
 	struct llcc_slice_desc desc;
-	u32 bcast_off = drv_data->bcast_off;
 
 	sz = drv_data->cfg_size;
 	llcc_table = drv_data->cfg;
 
 	for (i = 0; i < sz; i++) {
-		attr1_cfg = bcast_off +
-				LLCC_TRP_ATTR1_CFGn(llcc_table[i].slice_id);
-		attr0_cfg = bcast_off +
-				LLCC_TRP_ATTR0_CFGn(llcc_table[i].slice_id);
+		attr1_cfg = LLCC_TRP_ATTR1_CFGn(llcc_table[i].slice_id);
+		attr0_cfg = LLCC_TRP_ATTR0_CFGn(llcc_table[i].slice_id);
 
 		attr1_val = llcc_table[i].cache_mode;
 		attr1_val |= llcc_table[i].probe_target_ways <<
@@ -259,10 +258,12 @@ static int qcom_llcc_cfg_program(struct platform_device *pdev)
 		attr0_val = llcc_table[i].res_ways & ATTR0_RES_WAYS_MASK;
 		attr0_val |= llcc_table[i].bonus_ways << ATTR0_BONUS_WAYS_SHIFT;
 
-		ret = regmap_write(drv_data->regmap, attr1_cfg, attr1_val);
+		ret = regmap_write(drv_data->bcast_regmap, attr1_cfg,
+					attr1_val);
 		if (ret)
 			return ret;
-		ret = regmap_write(drv_data->regmap, attr0_cfg, attr0_val);
+		ret = regmap_write(drv_data->bcast_regmap, attr0_cfg,
+					attr0_val);
 		if (ret)
 			return ret;
 		if (llcc_table[i].activate_on_init) {
@@ -278,24 +279,36 @@ int qcom_llcc_probe(struct platform_device *pdev,
 {
 	u32 num_banks;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
-	void __iomem *base;
+	struct resource *llcc_banks_res, *llcc_bcast_res;
+	void __iomem *llcc_banks_base, *llcc_bcast_base;
 	int ret, i;
 
 	drv_data = devm_kzalloc(dev, sizeof(*drv_data), GFP_KERNEL);
 	if (!drv_data)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	llcc_banks_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+							"llcc_base");
+	llcc_banks_base = devm_ioremap_resource(&pdev->dev, llcc_banks_res);
+	if (IS_ERR(llcc_banks_base))
+		return PTR_ERR(llcc_banks_base);
 
-	drv_data->regmap = devm_regmap_init_mmio(dev, base,
-					&llcc_regmap_config);
+	drv_data->regmap = devm_regmap_init_mmio(dev, llcc_banks_base,
+						&llcc_regmap_config);
 	if (IS_ERR(drv_data->regmap))
 		return PTR_ERR(drv_data->regmap);
 
+	llcc_bcast_res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+							"llcc_broadcast_base");
+	llcc_bcast_base = devm_ioremap_resource(&pdev->dev, llcc_bcast_res);
+	if (IS_ERR(llcc_bcast_base))
+		return PTR_ERR(llcc_bcast_base);
+
+	drv_data->bcast_regmap = devm_regmap_init_mmio(dev, llcc_bcast_base,
+							&llcc_regmap_config);
+	if (IS_ERR(drv_data->bcast_regmap))
+		return PTR_ERR(drv_data->bcast_regmap);
+
 	ret = regmap_read(drv_data->regmap, LLCC_COMMON_STATUS0,
 						&num_banks);
 	if (ret)
@@ -317,8 +330,6 @@ int qcom_llcc_probe(struct platform_device *pdev,
 	for (i = 0; i < num_banks; i++)
 		drv_data->offsets[i] = i * BANK_OFFSET_STRIDE;
 
-	drv_data->bcast_off = num_banks * BANK_OFFSET_STRIDE;
-
 	drv_data->bitmap = devm_kcalloc(dev,
 	BITS_TO_LONGS(drv_data->max_slices), sizeof(unsigned long),
 						GFP_KERNEL);
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 7e3b9c6..c681e79 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -70,22 +70,22 @@ struct llcc_slice_config {
 /**
  * llcc_drv_data - Data associated with the llcc driver
  * @regmap: regmap associated with the llcc device
+ * @bcast_regmap: regmap associated with llcc broadcast offset
  * @cfg: pointer to the data structure for slice configuration
  * @lock: mutex associated with each slice
  * @cfg_size: size of the config data table
  * @max_slices: max slices as read from device tree
- * @bcast_off: Offset of the broadcast bank
  * @num_banks: Number of llcc banks
  * @bitmap: Bit map to track the active slice ids
  * @offsets: Pointer to the bank offsets array
  */
 struct llcc_drv_data {
 	struct regmap *regmap;
+	struct regmap *bcast_regmap;
 	const struct llcc_slice_config *cfg;
 	struct mutex lock;
 	u32 cfg_size;
 	u32 max_slices;
-	u32 bcast_off;
 	u32 num_banks;
 	unsigned long *bitmap;
 	u32 *offsets;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
