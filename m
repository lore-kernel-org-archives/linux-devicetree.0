Return-Path: <SRS0=YSTV=TE=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/8] media: imx7-media-csi: Use devm_platform_ioremap_resource()
Date: Sat,  4 May 2019 11:40:21 -0300
Message-Id: <20190504144027.31920-2-festevam@gmail.com>
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: rui.silva@linaro.org, slongerbeam@gmail.com, p.zabel@pengutronix.de, linux-media@vger.kernel.org, sebastien.szymanski@armadeus.com, otavio@ossystems.com.br, robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Use devm_platform_ioremap_resource() to simplify the code a bit.

While at it, propagate the real error value in case of 
devm_platform_ioremap_resource() failure.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 3e02cfa2f07c..e0286c322fad 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1188,7 +1188,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	struct device_node *node = dev->of_node;
 	struct imx_media_dev *imxmd;
 	struct imx7_csi *csi;
-	struct resource *res;
 	int ret;
 
 	csi = devm_kzalloc(&pdev->dev, sizeof(*csi), GFP_KERNEL);
@@ -1204,17 +1203,16 @@ static int imx7_csi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	csi->irq = platform_get_irq(pdev, 0);
-	if (!res || csi->irq < 0) {
+	if (csi->irq < 0) {
 		dev_err(dev, "Missing platform resources data\n");
 		return -ENODEV;
 	}
 
-	csi->regbase = devm_ioremap_resource(dev, res);
+	csi->regbase = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(csi->regbase)) {
 		dev_err(dev, "Failed platform resources map\n");
-		return -ENODEV;
+		return PTR_ERR(csi->regbase);
 	}
 
 	spin_lock_init(&csi->irqlock);
-- 
2.17.1
