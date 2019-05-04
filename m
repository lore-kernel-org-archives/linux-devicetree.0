Return-Path: <SRS0=YSTV=TE=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 8/8] media: imx7-media-csi: Change imx7_csi_enable() to void
Date: Sat,  4 May 2019 11:40:27 -0300
Message-Id: <20190504144027.31920-8-festevam@gmail.com>
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: rui.silva@linaro.org, slongerbeam@gmail.com, p.zabel@pengutronix.de, linux-media@vger.kernel.org, sebastien.szymanski@armadeus.com, otavio@ossystems.com.br, robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

imx7_csi_enable() always return 0 and its return value is never checked,
so convert it to void.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index dcc6027fe32b..0f51791f788a 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -799,7 +799,7 @@ static int imx7_csi_configure(struct imx7_csi *csi)
 	return 0;
 }
 
-static int imx7_csi_enable(struct imx7_csi *csi)
+static void imx7_csi_enable(struct imx7_csi *csi)
 {
 	imx7_csi_sw_reset(csi);
 
@@ -807,10 +807,7 @@ static int imx7_csi_enable(struct imx7_csi *csi)
 		imx7_csi_dmareq_rff_enable(csi);
 		imx7_csi_hw_enable_irq(csi);
 		imx7_csi_hw_enable(csi);
-		return 0;
 	}
-
-	return 0;
 }
 
 static void imx7_csi_disable(struct imx7_csi *csi)
-- 
2.17.1
