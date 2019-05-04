Return-Path: <SRS0=YSTV=TE=gmail.com=festevam@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 6/8] media: imx7-media-csi: Remove unneeded break
Date: Sat,  4 May 2019 11:40:24 -0300
Message-Id: <20190504144027.31920-5-festevam@gmail.com>
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
To: hverkuil-cisco@xs4all.nl
Cc: rui.silva@linaro.org, slongerbeam@gmail.com, p.zabel@pengutronix.de, linux-media@vger.kernel.org, sebastien.szymanski@armadeus.com, otavio@ossystems.com.br, robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Remove unneeded 'break' right after the 'return' statement as
pointed out by checkpatch.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 88265cd133ab..d1ecdcfc792e 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1003,7 +1003,6 @@ static int imx7_csi_try_fmt(struct imx7_csi *csi,
 		break;
 	default:
 		return -EINVAL;
-		break;
 	}
 	return 0;
 }
-- 
2.17.1
