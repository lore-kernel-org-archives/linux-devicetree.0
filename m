From: Jan Kotas <jank@cadence.com>
Subject: [PATCH 3/3] media: Add support for Cadence CSI2TX 2.1
Date: Thu, 18 Jul 2019 12:15:09 +0100
Message-ID: <20190718111509.29924-4-jank@cadence.com>
References: <20190718111509.29924-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718111509.29924-1-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch adds support for CSI2TX v2.1 version of the controller.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 drivers/media/platform/cadence/cdns-csi2tx.c | 142 +++++++++++++++++++++------
 1 file changed, 112 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2tx.c b/drivers/media/platform/cadence/cdns-csi2tx.c
index 232259c71..e4d08acfb 100644
--- a/drivers/media/platform/cadence/cdns-csi2tx.c
+++ b/drivers/media/platform/cadence/cdns-csi2tx.c
@@ -52,6 +52,17 @@
 #define CSI2TX_STREAM_IF_CFG_REG(n)	(0x100 + (n) * 4)
 #define CSI2TX_STREAM_IF_CFG_FILL_LEVEL(n)	((n) & 0x1f)
 
+/* CSI2TX V2 Registers */
+#define CSI2TX_V2_DPHY_CFG_REG			0x28
+#define CSI2TX_V2_DPHY_CFG_RESET		BIT(16)
+#define CSI2TX_V2_DPHY_CFG_CLOCK_MODE		BIT(10)
+#define CSI2TX_V2_DPHY_CFG_MODE_MASK		GENMASK(9, 8)
+#define CSI2TX_V2_DPHY_CFG_MODE_LPDT		(2 << 8)
+#define CSI2TX_V2_DPHY_CFG_MODE_HS		(1 << 8)
+#define CSI2TX_V2_DPHY_CFG_MODE_ULPS		(0 << 8)
+#define CSI2TX_V2_DPHY_CFG_CLK_ENABLE		BIT(4)
+#define CSI2TX_V2_DPHY_CFG_LANE_ENABLE(n)	BIT(n)
+
 #define CSI2TX_LANES_MAX	4
 #define CSI2TX_STREAMS_MAX	4
 
@@ -70,6 +81,13 @@ struct csi2tx_fmt {
 	u32	bpp;
 };
 
+struct csi2tx_priv;
+
+/* CSI2TX Variant Operations */
+struct csi2tx_vops {
+	void (*dphy_setup)(struct csi2tx_priv *csi2tx);
+};
+
 struct csi2tx_priv {
 	struct device			*dev;
 	unsigned int			count;
@@ -82,6 +100,8 @@ struct csi2tx_priv {
 
 	void __iomem			*base;
 
+	struct csi2tx_vops		*vops;
+
 	struct clk			*esc_clk;
 	struct clk			*p_clk;
 	struct clk			*pixel_clk[CSI2TX_STREAMS_MAX];
@@ -209,53 +229,92 @@ static const struct v4l2_subdev_pad_ops csi2tx_pad_ops = {
 	.set_fmt	= csi2tx_set_pad_format,
 };
 
-static void csi2tx_reset(struct csi2tx_priv *csi2tx)
+/* Set Wake Up value in the D-PHY */
+static void csi2tx_dphy_set_wakeup(struct csi2tx_priv *csi2tx)
 {
-	writel(CSI2TX_CONFIG_SRST_REQ, csi2tx->base + CSI2TX_CONFIG_REG);
-
-	udelay(10);
+	writel(CSI2TX_DPHY_CLK_WAKEUP_ULPS_CYCLES(32),
+	       csi2tx->base + CSI2TX_DPHY_CLK_WAKEUP_REG);
 }
 
-static int csi2tx_start(struct csi2tx_priv *csi2tx)
+/*
+ * Finishes the D-PHY initialization
+ * reg dphy cfg value to be used
+ */
+static void csi2tx_dphy_init_finish(struct csi2tx_priv *csi2tx, u32 reg)
 {
-	struct media_entity *entity = &csi2tx->subdev.entity;
-	struct media_link *link;
 	unsigned int i;
-	u32 reg;
 
-	csi2tx_reset(csi2tx);
+	udelay(10);
 
-	writel(CSI2TX_CONFIG_CFG_REQ, csi2tx->base + CSI2TX_CONFIG_REG);
+	/* Enable our (clock and data) lanes */
+	reg |= CSI2TX_DPHY_CFG_CLK_ENABLE;
+	for (i = 0; i < csi2tx->num_lanes; i++)
+		reg |= CSI2TX_DPHY_CFG_LANE_ENABLE(csi2tx->lanes[i] - 1);
+	writel(reg, csi2tx->base + CSI2TX_DPHY_CFG_REG);
 
 	udelay(10);
 
-	/* Configure our PPI interface with the D-PHY */
-	writel(CSI2TX_DPHY_CLK_WAKEUP_ULPS_CYCLES(32),
-	       csi2tx->base + CSI2TX_DPHY_CLK_WAKEUP_REG);
+	/* Switch to HS mode */
+	reg &= ~CSI2TX_DPHY_CFG_MODE_MASK;
+	writel(reg | CSI2TX_DPHY_CFG_MODE_HS,
+	       csi2tx->base + CSI2TX_DPHY_CFG_REG);
+}
+
+/* Configures D-PHY in CSIv1.3 */
+static void csi2tx_dphy_setup(struct csi2tx_priv *csi2tx)
+{
+	u32 reg;
+	unsigned int i;
+
+	csi2tx_dphy_set_wakeup(csi2tx);
 
 	/* Put our lanes (clock and data) out of reset */
 	reg = CSI2TX_DPHY_CFG_CLK_RESET | CSI2TX_DPHY_CFG_MODE_LPDT;
 	for (i = 0; i < csi2tx->num_lanes; i++)
-		reg |= CSI2TX_DPHY_CFG_LANE_RESET(csi2tx->lanes[i]);
+		reg |= CSI2TX_DPHY_CFG_LANE_RESET(csi2tx->lanes[i] - 1);
 	writel(reg, csi2tx->base + CSI2TX_DPHY_CFG_REG);
 
-	udelay(10);
+	csi2tx_dphy_init_finish(csi2tx, reg);
+}
 
-	/* Enable our (clock and data) lanes */
-	reg |= CSI2TX_DPHY_CFG_CLK_ENABLE;
-	for (i = 0; i < csi2tx->num_lanes; i++)
-		reg |= CSI2TX_DPHY_CFG_LANE_ENABLE(csi2tx->lanes[i]);
-	writel(reg, csi2tx->base + CSI2TX_DPHY_CFG_REG);
+/* Configures D-PHY in CSIv2 */
+static void csi2tx_v2_dphy_setup(struct csi2tx_priv *csi2tx)
+{
+	u32 reg;
+
+	csi2tx_dphy_set_wakeup(csi2tx);
+
+	/* Put our lanes (clock and data) out of reset */
+	reg = CSI2TX_V2_DPHY_CFG_RESET | CSI2TX_V2_DPHY_CFG_MODE_LPDT;
+	writel(reg, csi2tx->base + CSI2TX_V2_DPHY_CFG_REG);
+
+	csi2tx_dphy_init_finish(csi2tx, reg);
+}
+
+static void csi2tx_reset(struct csi2tx_priv *csi2tx)
+{
+	writel(CSI2TX_CONFIG_SRST_REQ, csi2tx->base + CSI2TX_CONFIG_REG);
 
 	udelay(10);
+}
 
-	/* Switch to HS mode */
-	reg &= ~CSI2TX_DPHY_CFG_MODE_MASK;
-	writel(reg | CSI2TX_DPHY_CFG_MODE_HS,
-	       csi2tx->base + CSI2TX_DPHY_CFG_REG);
+static int csi2tx_start(struct csi2tx_priv *csi2tx)
+{
+	struct media_entity *entity = &csi2tx->subdev.entity;
+	struct media_link *link;
+	unsigned int i;
+
+	csi2tx_reset(csi2tx);
+
+	writel(CSI2TX_CONFIG_CFG_REQ, csi2tx->base + CSI2TX_CONFIG_REG);
 
 	udelay(10);
 
+	if (csi2tx->vops && csi2tx->vops->dphy_setup) {
+		csi2tx->vops->dphy_setup(csi2tx);
+		udelay(10);
+	}
+
 	/*
 	 * Create a static mapping between the CSI virtual channels
 	 * and the input streams.
@@ -478,9 +537,35 @@ static int csi2tx_check_lanes(struct csi2tx_priv *csi2tx)
 	return ret;
 }
 
+static const struct csi2tx_vops csi2tx_vops = {
+	.dphy_setup = csi2tx_dphy_setup,
+};
+
+static const struct csi2tx_vops csi2tx_v2_vops = {
+	.dphy_setup = csi2tx_v2_dphy_setup,
+};
+
+static const struct of_device_id csi2tx_of_table[] = {
+	{
+		.compatible = "cdns,csi2tx",
+		.data = &csi2tx_vops
+	},
+	{
+		.compatible = "cdns,csi2tx-1.3",
+		.data = &csi2tx_vops
+	},
+	{
+		.compatible = "cdns,csi2tx-2.1",
+		.data = &csi2tx_v2_vops
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, csi2tx_of_table);
+
 static int csi2tx_probe(struct platform_device *pdev)
 {
 	struct csi2tx_priv *csi2tx;
+	const struct of_device_id *of_id;
 	unsigned int i;
 	int ret;
 
@@ -495,6 +580,9 @@ static int csi2tx_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_free_priv;
 
+	of_id = of_match_node(csi2tx_of_table, pdev->dev.of_node);
+	csi2tx->vops = (struct csi2tx_vops *)of_id->data;
+
 	v4l2_subdev_init(&csi2tx->subdev, &csi2tx_subdev_ops);
 	csi2tx->subdev.owner = THIS_MODULE;
 	csi2tx->subdev.dev = &pdev->dev;
@@ -552,12 +640,6 @@ static int csi2tx_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id csi2tx_of_table[] = {
-	{ .compatible = "cdns,csi2tx" },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, csi2tx_of_table);
-
 static struct platform_driver csi2tx_driver = {
 	.probe	= csi2tx_probe,
 	.remove	= csi2tx_remove,
-- 
2.15.0
