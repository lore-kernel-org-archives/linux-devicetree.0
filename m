Return-Path: <SRS0=YSTV=TE=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 4/8] media: imx7-media-csi: Propagate the correct error for platform_get_irq()
Date: Sat,  4 May 2019 11:40:22 -0300
Message-Id: <20190504144027.31920-3-festevam@gmail.com>
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: rui.silva@linaro.org, slongerbeam@gmail.com, p.zabel@pengutronix.de, linux-media@vger.kernel.org, sebastien.szymanski@armadeus.com, otavio@ossystems.com.br, robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

In the case of platform_get_irq() failure, let's propagate the real error
code instead of a fake one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index e0286c322fad..a4cc9a342674 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1206,7 +1206,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	csi->irq = platform_get_irq(pdev, 0);
 	if (csi->irq < 0) {
 		dev_err(dev, "Missing platform resources data\n");
-		return -ENODEV;
+		return csi->irq;
 	}
 
 	csi->regbase = devm_platform_ioremap_resource(pdev, 0);
-- 
2.17.1
