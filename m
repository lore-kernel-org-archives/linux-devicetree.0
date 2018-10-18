From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v2 2/5] phy: qcom-qmp: Utilize fully-specified DT registers
Date: Thu, 18 Oct 2018 14:09:30 -0700
Message-ID: <20181018210933.113592-3-evgreen@chromium.org>
References: <20181018210933.113592-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181018210933.113592-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, Douglas Anderson <dianders@chromium.org>, Manu Gautam <mgautam@codeaurora.org>, Can Guo <cang@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, swboyd@chromium.org
Cc: Evan Green <evgreen@chromium.org>
List-Id: devicetree@vger.kernel.org

This change utilizes the newly fixed up DT bindings to get the tx2
and rx2 register regions for the second lane of dual-lane PHYs. Before
this change, the driver was simply using lane one's register region and
adding 0x400, which reached well beyond the DT-specified register
allocation. This would have been a crash were it not for the page size on
ARM64. Fix the driver not to rely on the magic of virtual memory by using
the newly specified DT register regions for tx2 and rx2.

In order to support existing device trees, this change also contains a
fallback mode for when those new register regions don't exist, which
reverts to the original behavior of overreaching and prints a complaint.

Signed-off-by: Evan Green <evgreen@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 51 +++++++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index a83332411026..957da2ef37c1 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -72,6 +72,9 @@
 
 #define MAX_PROP_NAME				32
 
+/* Define the assumed distance between lanes for underspecified device trees. */
+#define QMP_PHY_LEGACY_LANE_STRIDE		0x400
+
 struct qmp_phy_init_tbl {
 	unsigned int offset;
 	unsigned int val;
@@ -733,9 +736,6 @@ struct qmp_phy_cfg {
 	bool has_phy_dp_com_ctrl;
 	/* true, if PHY has secondary tx/rx lanes to be configured */
 	bool is_dual_lane_phy;
-	/* Register offset of secondary tx/rx lanes for USB DP combo PHY */
-	unsigned int tx_b_lane_offset;
-	unsigned int rx_b_lane_offset;
 
 	/* true, if PCS block has no separate SW_RESET register */
 	bool no_pcs_sw_reset;
@@ -748,6 +748,8 @@ struct qmp_phy_cfg {
  * @tx: iomapped memory space for lane's tx
  * @rx: iomapped memory space for lane's rx
  * @pcs: iomapped memory space for lane's pcs
+ * @tx2: iomapped memory space for second lane's tx (in dual lane PHYs)
+ * @rx2: iomapped memory space for second lane's rx (in dual lane PHYs)
  * @pcs_misc: iomapped memory space for lane's pcs_misc
  * @pipe_clk: pipe lock
  * @index: lane index
@@ -759,6 +761,8 @@ struct qmp_phy {
 	void __iomem *tx;
 	void __iomem *rx;
 	void __iomem *pcs;
+	void __iomem *tx2;
+	void __iomem *rx2;
 	void __iomem *pcs_misc;
 	struct clk *pipe_clk;
 	unsigned int index;
@@ -975,8 +979,6 @@ static const struct qmp_phy_cfg qmp_v3_usb3phy_cfg = {
 
 	.has_phy_dp_com_ctrl	= true,
 	.is_dual_lane_phy	= true,
-	.tx_b_lane_offset	= 0x400,
-	.rx_b_lane_offset	= 0x400,
 };
 
 static const struct qmp_phy_cfg qmp_v3_usb3_uniphy_cfg = {
@@ -1031,9 +1033,6 @@ static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
 	.mask_pcs_ready		= PCS_READY,
 
 	.is_dual_lane_phy	= true,
-	.tx_b_lane_offset	= 0x400,
-	.rx_b_lane_offset	= 0x400,
-
 	.no_pcs_sw_reset	= true,
 };
 
@@ -1238,12 +1237,12 @@ static int qcom_qmp_phy_init(struct phy *phy)
 	qcom_qmp_phy_configure(tx, cfg->regs, cfg->tx_tbl, cfg->tx_tbl_num);
 	/* Configuration for other LANE for USB-DP combo PHY */
 	if (cfg->is_dual_lane_phy)
-		qcom_qmp_phy_configure(tx + cfg->tx_b_lane_offset, cfg->regs,
+		qcom_qmp_phy_configure(qphy->tx2, cfg->regs,
 				       cfg->tx_tbl, cfg->tx_tbl_num);
 
 	qcom_qmp_phy_configure(rx, cfg->regs, cfg->rx_tbl, cfg->rx_tbl_num);
 	if (cfg->is_dual_lane_phy)
-		qcom_qmp_phy_configure(rx + cfg->rx_b_lane_offset, cfg->regs,
+		qcom_qmp_phy_configure(qphy->rx2, cfg->regs,
 				       cfg->rx_tbl, cfg->rx_tbl_num);
 
 	qcom_qmp_phy_configure(pcs, cfg->regs, cfg->pcs_tbl, cfg->pcs_tbl_num);
@@ -1614,8 +1613,9 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
 
 	/*
 	 * Get memory resources for each phy lane:
-	 * Resources are indexed as: tx -> 0; rx -> 1; pcs -> 2; and
-	 * pcs_misc (optional) -> 3.
+	 * Resources are indexed as: tx -> 0; rx -> 1; pcs -> 2.
+	 * For dual lane PHYs: tx2 -> 3, rx2 -> 4, pcs_misc (optional) -> 5
+	 * For single lane PHYs: pcs_misc (optional) -> 3.
 	 */
 	qphy->tx = of_iomap(np, 0);
 	if (!qphy->tx)
@@ -1629,7 +1629,32 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
 	if (!qphy->pcs)
 		return -ENOMEM;
 
-	qphy->pcs_misc = of_iomap(np, 3);
+	/*
+	 * If this is a dual-lane PHY, then there should be registers for the
+	 * second lane. Some old device trees did not specify this, so fall
+	 * back to old legacy behavior of assuming they can be reached at an
+	 * offset from the first lane.
+	 */
+	if (qmp->cfg->is_dual_lane_phy) {
+		qphy->tx2 = of_iomap(np, 3);
+		qphy->rx2 = of_iomap(np, 4);
+		if (!qphy->tx2 || !qphy->rx2) {
+			dev_warn(dev,
+				 "Underspecified device tree, falling back to legacy register regions\n");
+
+			/* In the old version, pcs_misc is at index 3. */
+			qphy->pcs_misc = qphy->tx2;
+			qphy->tx2 = qphy->tx + QMP_PHY_LEGACY_LANE_STRIDE;
+			qphy->rx2 = qphy->rx + QMP_PHY_LEGACY_LANE_STRIDE;
+
+		} else {
+			qphy->pcs_misc = of_iomap(np, 5);
+		}
+
+	} else {
+		qphy->pcs_misc = of_iomap(np, 3);
+	}
+
 	if (!qphy->pcs_misc)
 		dev_vdbg(dev, "PHY pcs_misc-reg not used\n");
 
-- 
2.16.4
