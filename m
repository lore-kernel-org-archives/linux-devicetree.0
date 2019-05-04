Return-Path: <SRS0=YSTV=TE=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 7/8] media: imx7-media-csi: Check the return value from clk_prepare_enable()
Date: Sat,  4 May 2019 11:40:26 -0300
Message-Id: <20190504144027.31920-7-festevam@gmail.com>
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: rui.silva@linaro.org, slongerbeam@gmail.com, p.zabel@pengutronix.de, linux-media@vger.kernel.org, sebastien.szymanski@armadeus.com, otavio@ossystems.com.br, robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

clk_prepare_enable() may fail, so we should better check its return value
and propagate it in the case of error.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index d1ecdcfc792e..dcc6027fe32b 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -390,17 +390,23 @@ static void imx7_csi_error_recovery(struct imx7_csi *csi)
 	imx7_csi_hw_enable(csi);
 }
 
-static void imx7_csi_init(struct imx7_csi *csi)
+static int imx7_csi_init(struct imx7_csi *csi)
 {
+	int ret;
+
 	if (csi->is_init)
-		return;
+		return 0;
 
-	clk_prepare_enable(csi->mclk);
+	ret = clk_prepare_enable(csi->mclk);
+	if (ret < 0)
+		return ret;
 	imx7_csi_hw_reset(csi);
 	imx7_csi_init_interface(csi);
 	imx7_csi_dmareq_rff_enable(csi);
 
 	csi->is_init = true;
+
+	return 0;
 }
 
 static void imx7_csi_deinit(struct imx7_csi *csi)
@@ -513,7 +519,7 @@ static int imx7_csi_link_setup(struct media_entity *entity,
 
 init:
 	if (csi->sink || csi->src_sd)
-		imx7_csi_init(csi);
+		ret = imx7_csi_init(csi);
 	else
 		imx7_csi_deinit(csi);
 
-- 
2.17.1
