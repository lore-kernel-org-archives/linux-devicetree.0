Return-Path: <SRS0=YSTV=TE=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/8] media: imx7-media-csi: Acquire a single clock
Date: Sat,  4 May 2019 11:40:20 -0300
Message-Id: <20190504144027.31920-1-festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: rui.silva@linaro.org, slongerbeam@gmail.com, p.zabel@pengutronix.de, linux-media@vger.kernel.org, sebastien.szymanski@armadeus.com, otavio@ossystems.com.br, robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

As per the i.MX7D Reference Manual only the MCLK is used for
the CSI block, so only handle this single clock.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 51 ++++------------------
 1 file changed, 8 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 18eb5d3ecf10..3e02cfa2f07c 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -152,8 +152,6 @@
 #define CSI_CSICR18		0x48
 #define CSI_CSICR19		0x4c
 
-static const char * const imx7_csi_clk_id[] = {"axi", "dcic", "mclk"};
-
 struct imx7_csi {
 	struct device *dev;
 	struct v4l2_subdev sd;
@@ -180,9 +178,7 @@ struct imx7_csi {
 
 	void __iomem *regbase;
 	int irq;
-
-	int num_clks;
-	struct clk_bulk_data *clks;
+	struct clk *mclk;
 
 	/* active vb2 buffers to send to video dev sink */
 	struct imx_media_buffer *active_vb2_buf[2];
@@ -204,20 +200,6 @@ struct imx7_csi {
 #define imx7_csi_reg_write(_csi, _val, _offset) \
 	__raw_writel(_val, (_csi)->regbase + (_offset))
 
-static void imx7_csi_clk_enable(struct imx7_csi *csi)
-{
-	int ret;
-
-	ret = clk_bulk_prepare_enable(csi->num_clks, csi->clks);
-	if (ret < 0)
-		dev_err(csi->dev, "failed to enable clocks\n");
-}
-
-static void imx7_csi_clk_disable(struct imx7_csi *csi)
-{
-	clk_bulk_disable_unprepare(csi->num_clks, csi->clks);
-}
-
 static void imx7_csi_hw_reset(struct imx7_csi *csi)
 {
 	imx7_csi_reg_write(csi,
@@ -413,7 +395,7 @@ static void imx7_csi_init(struct imx7_csi *csi)
 	if (csi->is_init)
 		return;
 
-	imx7_csi_clk_enable(csi);
+	clk_prepare_enable(csi->mclk);
 	imx7_csi_hw_reset(csi);
 	imx7_csi_init_interface(csi);
 	imx7_csi_dmareq_rff_enable(csi);
@@ -429,7 +411,7 @@ static void imx7_csi_deinit(struct imx7_csi *csi)
 	imx7_csi_hw_reset(csi);
 	imx7_csi_init_interface(csi);
 	imx7_csi_dmareq_rff_disable(csi);
-	imx7_csi_clk_disable(csi);
+	clk_disable_unprepare(csi->mclk);
 
 	csi->is_init = false;
 }
@@ -1200,24 +1182,6 @@ static int imx7_csi_parse_endpoint(struct device *dev,
 	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
 }
 
-static int imx7_csi_clocks_get(struct imx7_csi *csi)
-{
-	struct device *dev = csi->dev;
-	int i;
-
-	csi->num_clks = ARRAY_SIZE(imx7_csi_clk_id);
-	csi->clks = devm_kcalloc(dev, csi->num_clks, sizeof(*csi->clks),
-				 GFP_KERNEL);
-
-	if (!csi->clks)
-		return -ENOMEM;
-
-	for (i = 0; i < csi->num_clks; i++)
-		csi->clks[i].id = imx7_csi_clk_id[i];
-
-	return devm_clk_bulk_get(dev, csi->num_clks, csi->clks);
-}
-
 static int imx7_csi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1233,10 +1197,11 @@ static int imx7_csi_probe(struct platform_device *pdev)
 
 	csi->dev = dev;
 
-	ret = imx7_csi_clocks_get(csi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to get clocks");
-		return -ENODEV;
+	csi->mclk = devm_clk_get(&pdev->dev, "mclk");
+	if (IS_ERR(csi->mclk)) {
+		ret = PTR_ERR(csi->mclk);
+		dev_err(dev, "Failed to get mclk: %d", ret);
+		return ret;
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-- 
2.17.1
