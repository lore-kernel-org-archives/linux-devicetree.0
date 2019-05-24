Return-Path: <SRS0=qDds=TY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:38507 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404089AbfEXOFb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 May 2019 10:05:31 -0400
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 05/10] media: hantro: make irq names configurable
Date: Fri, 24 May 2019 16:04:54 +0200
Message-Id: <20190524140459.4002-6-p.zabel@pengutronix.de>
In-Reply-To: <20190524140459.4002-1-p.zabel@pengutronix.de>
References: <20190524140459.4002-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, Boris Brezillon <boris.brezillon@collabora.com>, Ezequiel Garcia <ezequiel@collabora.com>, Nicolas Dufresne <nicolas@ndufresne.ca>, Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, kernel@pengutronix.de
List-ID: <devicetree@vger.kernel.org>

The i.MX8MQ bindings will use different IRQ names ("g1" instead of
"vdpu", and "g2"), so make them configurable. This also allows to
register more than two IRQs, which will be required for i.MX8MM support
later (it will add "h1" instead of "vepu").

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/hantro/hantro.h        | 11 ++++---
 drivers/staging/media/hantro/hantro_drv.c    | 31 +++++++-------------
 drivers/staging/media/hantro/rk3288_vpu_hw.c |  5 ++--
 drivers/staging/media/hantro/rk3399_vpu_hw.c |  5 ++--
 4 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index 308826ba33ef..ca4d3a9fdd05 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -26,6 +26,7 @@
 #include "hantro_hw.h"
 
 #define HANTRO_MAX_CLOCKS		4
+#define HANTRO_MAX_IRQS			3
 
 #define MPEG2_MB_DIM			16
 #define MPEG2_MB_WIDTH(w)		DIV_ROUND_UP(w, MPEG2_MB_DIM)
@@ -57,8 +58,9 @@ struct hantro_codec_ops;
  * @codec_ops:			Codec ops.
  * @init:			Initialize hardware.
  * @runtime_resume:		reenable hardware after power gating
- * @vepu_irq:			encoder interrupt handler
- * @vdpu_irq:			decoder interrupt handler
+ * @irq_handlers:		interrupt handlers, same order as irq names
+ * @irq_names:			array of irq names
+ * @num_irqs:			number of irqs in the arrays
  * @clk_names:			array of clock names
  * @num_clocks:			number of clocks in the array
  */
@@ -73,8 +75,9 @@ struct hantro_variant {
 	const struct hantro_codec_ops *codec_ops;
 	int (*init)(struct hantro_dev *vpu);
 	int (*runtime_resume)(struct hantro_dev *vpu);
-	irqreturn_t (*vepu_irq)(int irq, void *priv);
-	irqreturn_t (*vdpu_irq)(int irq, void *priv);
+	irqreturn_t (*irq_handlers[HANTRO_MAX_IRQS])(int irq, void *priv);
+	const char *irq_names[HANTRO_MAX_IRQS];
+	int num_irqs;
 	const char *clk_names[HANTRO_MAX_CLOCKS];
 	int num_clocks;
 };
diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index ce50f9b47f31..b6e5c8e99dd8 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -707,36 +707,25 @@ static int hantro_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (vpu->variant->vdpu_irq) {
+	for (i = 0; i < vpu->variant->num_irqs; i++) {
+		const char *irq_name = vpu->variant->irq_names[i];
 		int irq;
 
-		irq = platform_get_irq_byname(vpu->pdev, "vdpu");
-		if (irq <= 0) {
-			dev_err(vpu->dev, "Could not get vdpu IRQ.\n");
-			return -ENXIO;
-		}
-
-		ret = devm_request_irq(vpu->dev, irq, vpu->variant->vdpu_irq,
-				       0, dev_name(vpu->dev), vpu);
-		if (ret) {
-			dev_err(vpu->dev, "Could not request vdpu IRQ.\n");
-			return ret;
-		}
-	}
-
-	if (vpu->variant->vepu_irq) {
-		int irq;
+		if (!vpu->variant->irq_handlers[i])
+			continue;
 
-		irq = platform_get_irq_byname(vpu->pdev, "vepu");
+		irq = platform_get_irq_byname(vpu->pdev, irq_name);
 		if (irq <= 0) {
-			dev_err(vpu->dev, "Could not get vepu IRQ.\n");
+			dev_err(vpu->dev, "Could not get %s IRQ.\n", irq_name);
 			return -ENXIO;
 		}
 
-		ret = devm_request_irq(vpu->dev, irq, vpu->variant->vepu_irq,
+		ret = devm_request_irq(vpu->dev, irq,
+				       vpu->variant->irq_handlers[i],
 				       0, dev_name(vpu->dev), vpu);
 		if (ret) {
-			dev_err(vpu->dev, "Could not request vepu IRQ.\n");
+			dev_err(vpu->dev, "Could not request %s IRQ.\n",
+				irq_name);
 			return ret;
 		}
 	}
diff --git a/drivers/staging/media/hantro/rk3288_vpu_hw.c b/drivers/staging/media/hantro/rk3288_vpu_hw.c
index 38adf74037fc..6263037a9d0c 100644
--- a/drivers/staging/media/hantro/rk3288_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3288_vpu_hw.c
@@ -169,8 +169,9 @@ const struct hantro_variant rk3288_vpu_variant = {
 	.num_dec_fmts = ARRAY_SIZE(rk3288_vpu_dec_fmts),
 	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER,
 	.codec_ops = rk3288_vpu_codec_ops,
-	.vepu_irq = rk3288_vepu_irq,
-	.vdpu_irq = rk3288_vdpu_irq,
+	.irq_handlers = { rk3288_vepu_irq, rk3288_vdpu_irq },
+	.irq_names = {"vepu", "vdpu"},
+	.num_irqs = 2,
 	.init = rk3288_vpu_hw_init,
 	.clk_names = {"aclk", "hclk"},
 	.num_clocks = 2
diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw.c b/drivers/staging/media/hantro/rk3399_vpu_hw.c
index 0a43e0777189..6ceb2895f48e 100644
--- a/drivers/staging/media/hantro/rk3399_vpu_hw.c
+++ b/drivers/staging/media/hantro/rk3399_vpu_hw.c
@@ -169,8 +169,9 @@ const struct hantro_variant rk3399_vpu_variant = {
 	.num_dec_fmts = ARRAY_SIZE(rk3399_vpu_dec_fmts),
 	.codec = HANTRO_JPEG_ENCODER | HANTRO_MPEG2_DECODER,
 	.codec_ops = rk3399_vpu_codec_ops,
-	.vepu_irq = rk3399_vepu_irq,
-	.vdpu_irq = rk3399_vdpu_irq,
+	.irq_handlers = { rk3399_vepu_irq, rk3399_vdpu_irq },
+	.irq_names = {"vepu", "vdpu"},
+	.num_irqs = 2,
 	.init = rk3399_vpu_hw_init,
 	.clk_names = {"aclk", "hclk"},
 	.num_clocks = 2
-- 
2.20.1
