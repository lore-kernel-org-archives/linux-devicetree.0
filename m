From: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH 1/4] drm/fsl-dcu: Cleanup vblank interrupt mask and status setting code
Date: Tue, 26 Jan 2016 12:00:30 +0800
Message-ID: <1453780833-32289-1-git-send-email-meng.yi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org, jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Switch update interrupt mask bit with regmap_update_bits, and clear
interrupt status by writing 1 to relevant bit before setting mask in
fsl_dcu_drm_irq_init function.

Signed-off-by: JianWei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Meng Yi <meng.yi-3arQi8VN3Tc@public.gmane.org>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index fca97d3..cbef47c 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -38,21 +38,17 @@ static const struct regmap_config fsl_dcu_regmap_config = {
 static int fsl_dcu_drm_irq_init(struct drm_device *dev)
 {
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
-	unsigned int value;
 	int ret;
 
 	ret = drm_irq_install(dev, fsl_dev->irq);
 	if (ret < 0)
 		dev_err(dev->dev, "failed to install IRQ handler\n");
 
-	ret = regmap_write(fsl_dev->regmap, DCU_INT_STATUS, 0);
+	ret = regmap_write(fsl_dev->regmap, DCU_INT_STATUS, 0xffffffff);
 	if (ret)
 		dev_err(dev->dev, "set DCU_INT_STATUS failed\n");
-	ret = regmap_read(fsl_dev->regmap, DCU_INT_MASK, &value);
-	if (ret)
-		dev_err(dev->dev, "read DCU_INT_MASK failed\n");
-	value &= DCU_INT_MASK_VBLANK;
-	ret = regmap_write(fsl_dev->regmap, DCU_INT_MASK, value);
+	ret = regmap_update_bits(fsl_dev->regmap, DCU_INT_MASK,
+				 DCU_INT_MASK_VBLANK, ~DCU_INT_MASK_VBLANK);
 	if (ret)
 		dev_err(dev->dev, "set DCU_INT_MASK failed\n");
 	ret = regmap_write(fsl_dev->regmap, DCU_UPDATE_MODE,
@@ -143,14 +139,10 @@ static irqreturn_t fsl_dcu_drm_irq(int irq, void *arg)
 static int fsl_dcu_drm_enable_vblank(struct drm_device *dev, unsigned int pipe)
 {
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
-	unsigned int value;
 	int ret;
 
-	ret = regmap_read(fsl_dev->regmap, DCU_INT_MASK, &value);
-	if (ret)
-		dev_err(dev->dev, "read DCU_INT_MASK failed\n");
-	value &= ~DCU_INT_MASK_VBLANK;
-	ret = regmap_write(fsl_dev->regmap, DCU_INT_MASK, value);
+	ret = regmap_update_bits(fsl_dev->regmap, DCU_INT_MASK,
+				 DCU_INT_MASK_VBLANK, ~DCU_INT_MASK_VBLANK);
 	if (ret)
 		dev_err(dev->dev, "set DCU_INT_MASK failed\n");
 	return 0;
@@ -160,14 +152,10 @@ static void fsl_dcu_drm_disable_vblank(struct drm_device *dev,
 				       unsigned int pipe)
 {
 	struct fsl_dcu_drm_device *fsl_dev = dev->dev_private;
-	unsigned int value;
 	int ret;
 
-	ret = regmap_read(fsl_dev->regmap, DCU_INT_MASK, &value);
-	if (ret)
-		dev_err(dev->dev, "read DCU_INT_MASK failed\n");
-	value |= DCU_INT_MASK_VBLANK;
-	ret = regmap_write(fsl_dev->regmap, DCU_INT_MASK, value);
+	ret = regmap_update_bits(fsl_dev->regmap, DCU_INT_MASK,
+				 DCU_INT_MASK_VBLANK, DCU_INT_MASK_VBLANK);
 	if (ret)
 		dev_err(dev->dev, "set DCU_INT_MASK failed\n");
 }
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
