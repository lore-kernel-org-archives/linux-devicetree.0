From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v2 3/8] drm/fsl-dcu: disable clock on initialization failure and remove
Date: Mon, 28 Mar 2016 18:59:57 -0700
Message-ID: <1459216802-32094-4-git-send-email-stefan@agner.ch>
References: <1459216802-32094-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459216802-32094-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alison.wang-KZfg59tc24xl57MIdRCFDg@public.gmane.org, meng.yi-3arQi8VN3Tc@public.gmane.org, alexander.stein-93q1YBGzJSMe9JSWTWOYM3xStJ4P+DSV@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Fix error handling during probe by reordering initialization and
adding a error path which disables clock again. Also disable the
clock on remove.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 44 +++++++++++++++----------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index e8d9337..f2a9c1b 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -290,6 +290,11 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 	if (!fsl_dev)
 		return -ENOMEM;
 
+	id = of_match_node(fsl_dcu_of_match, pdev->dev.of_node);
+	if (!id)
+		return -ENODEV;
+	fsl_dev->soc = id->data;
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		dev_err(dev, "could not get memory IO resource\n");
@@ -308,39 +313,29 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
+	fsl_dev->regmap = devm_regmap_init_mmio(dev, base,
+			&fsl_dcu_regmap_config);
+	if (IS_ERR(fsl_dev->regmap)) {
+		dev_err(dev, "regmap init failed\n");
+		return PTR_ERR(fsl_dev->regmap);
+	}
+
 	fsl_dev->clk = devm_clk_get(dev, "dcu");
 	if (IS_ERR(fsl_dev->clk)) {
-		ret = PTR_ERR(fsl_dev->clk);
 		dev_err(dev, "failed to get dcu clock\n");
-		return ret;
-	}
-	ret = clk_prepare(fsl_dev->clk);
-	if (ret < 0) {
-		dev_err(dev, "failed to prepare dcu clk\n");
-		return ret;
+		return PTR_ERR(fsl_dev->clk);
 	}
-	ret = clk_enable(fsl_dev->clk);
+	ret = clk_prepare_enable(fsl_dev->clk);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable dcu clk\n");
-		clk_unprepare(fsl_dev->clk);
 		return ret;
 	}
 
-	fsl_dev->regmap = devm_regmap_init_mmio(dev, base,
-			&fsl_dcu_regmap_config);
-	if (IS_ERR(fsl_dev->regmap)) {
-		dev_err(dev, "regmap init failed\n");
-		return PTR_ERR(fsl_dev->regmap);
-	}
-
-	id = of_match_node(fsl_dcu_of_match, pdev->dev.of_node);
-	if (!id)
-		return -ENODEV;
-	fsl_dev->soc = id->data;
-
 	drm = drm_dev_alloc(driver, dev);
-	if (!drm)
-		return -ENOMEM;
+	if (!drm) {
+		ret = -ENOMEM;
+		goto disable_clk;
+	}
 
 	fsl_dev->dev = dev;
 	fsl_dev->drm = drm;
@@ -360,6 +355,8 @@ static int fsl_dcu_drm_probe(struct platform_device *pdev)
 
 unref:
 	drm_dev_unref(drm);
+disable_clk:
+	clk_disable_unprepare(fsl_dev->clk);
 	return ret;
 }
 
@@ -367,6 +364,7 @@ static int fsl_dcu_drm_remove(struct platform_device *pdev)
 {
 	struct fsl_dcu_drm_device *fsl_dev = platform_get_drvdata(pdev);
 
+	clk_disable_unprepare(fsl_dev->clk);
 	drm_put_dev(fsl_dev->drm);
 
 	return 0;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
