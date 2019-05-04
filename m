Return-Path: <SRS0=XfsU=TE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39995 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfEDOkj (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 4 May 2019 10:40:39 -0400
From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 5/8] media: imx7-media-csi: Propagate the correct error for devm_request_irq()
Date: Sat,  4 May 2019 11:40:23 -0300
Message-Id: <20190504144027.31920-4-festevam@gmail.com>
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: hverkuil-cisco@xs4all.nl
Cc: rui.silva@linaro.org, slongerbeam@gmail.com, p.zabel@pengutronix.de, linux-media@vger.kernel.org, sebastien.szymanski@armadeus.com, otavio@ossystems.com.br, robh+dt@kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
List-ID: <devicetree@vger.kernel.org>

In the case of devm_request_irq() failure, let's propagate the real error
code instead of a fake one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index a4cc9a342674..88265cd133ab 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1223,7 +1223,6 @@ static int imx7_csi_probe(struct platform_device *pdev)
 			       (void *)csi);
 	if (ret < 0) {
 		dev_err(dev, "Request CSI IRQ failed.\n");
-		ret = -ENODEV;
 		goto destroy_mutex;
 	}
 
-- 
2.17.1
