From: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Subject: [PATCH 1/8] drm/tilcdc: Fix the error path in tilcdc_load()
Date: Fri, 11 Jul 2014 11:18:47 -0300
Message-ID: <1405088334-11215-2-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1405088334-11215-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405088334-11215-1-git-send-email-ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Darren Etheridge <detheridge-l0cyMroinI0@public.gmane.org>, daniel.vetter-/w4YWyX8dFk@public.gmane.org, =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The current error path calls tilcdc_unload() in case of an error to release
the resources. However, this is wrong because not all resources have been
allocated by the time an error occurs in tilcdc_load().

To fix it, this commit adds proper labels to bail out at the different
stages in the load function, and release only the resources actually allocated.

Signed-off-by: Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 60 ++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 6be623b..000428e 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -84,6 +84,7 @@ static int modeset_init(struct drm_device *dev)
 	if ((priv->num_encoders == 0) || (priv->num_connectors == 0)) {
 		/* oh nos! */
 		dev_err(dev->dev, "no encoders/connectors found\n");
+		drm_mode_config_cleanup(dev);
 		return -ENXIO;
 	}
 
@@ -172,33 +173,37 @@ static int tilcdc_load(struct drm_device *dev, unsigned long flags)
 	dev->dev_private = priv;
 
 	priv->wq = alloc_ordered_workqueue("tilcdc", 0);
+	if (!priv->wq) {
+		ret = -ENOMEM;
+		goto fail_free_priv;
+	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		dev_err(dev->dev, "failed to get memory resource\n");
 		ret = -EINVAL;
-		goto fail;
+		goto fail_free_wq;
 	}
 
 	priv->mmio = ioremap_nocache(res->start, resource_size(res));
 	if (!priv->mmio) {
 		dev_err(dev->dev, "failed to ioremap\n");
 		ret = -ENOMEM;
-		goto fail;
+		goto fail_free_wq;
 	}
 
 	priv->clk = clk_get(dev->dev, "fck");
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev->dev, "failed to get functional clock\n");
 		ret = -ENODEV;
-		goto fail;
+		goto fail_iounmap;
 	}
 
 	priv->disp_clk = clk_get(dev->dev, "dpll_disp_ck");
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev->dev, "failed to get display clock\n");
 		ret = -ENODEV;
-		goto fail;
+		goto fail_put_clk;
 	}
 
 #ifdef CONFIG_CPU_FREQ
@@ -208,7 +213,7 @@ static int tilcdc_load(struct drm_device *dev, unsigned long flags)
 			CPUFREQ_TRANSITION_NOTIFIER);
 	if (ret) {
 		dev_err(dev->dev, "failed to register cpufreq notifier\n");
-		goto fail;
+		goto fail_put_disp_clk;
 	}
 #endif
 
@@ -253,13 +258,13 @@ static int tilcdc_load(struct drm_device *dev, unsigned long flags)
 	ret = modeset_init(dev);
 	if (ret < 0) {
 		dev_err(dev->dev, "failed to initialize mode setting\n");
-		goto fail;
+		goto fail_cpufreq_unregister;
 	}
 
 	ret = drm_vblank_init(dev, 1);
 	if (ret < 0) {
 		dev_err(dev->dev, "failed to initialize vblank\n");
-		goto fail;
+		goto fail_mode_config_cleanup;
 	}
 
 	pm_runtime_get_sync(dev->dev);
@@ -267,7 +272,7 @@ static int tilcdc_load(struct drm_device *dev, unsigned long flags)
 	pm_runtime_put_sync(dev->dev);
 	if (ret < 0) {
 		dev_err(dev->dev, "failed to install IRQ handler\n");
-		goto fail;
+		goto fail_vblank_cleanup;
 	}
 
 	platform_set_drvdata(pdev, dev);
@@ -283,13 +288,48 @@ static int tilcdc_load(struct drm_device *dev, unsigned long flags)
 	priv->fbdev = drm_fbdev_cma_init(dev, bpp,
 			dev->mode_config.num_crtc,
 			dev->mode_config.num_connector);
+	if (IS_ERR(priv->fbdev)) {
+		ret = PTR_ERR(priv->fbdev);
+		goto fail_irq_uninstall;
+	}
 
 	drm_kms_helper_poll_init(dev);
 
 	return 0;
 
-fail:
-	tilcdc_unload(dev);
+fail_irq_uninstall:
+	pm_runtime_get_sync(dev->dev);
+	drm_irq_uninstall(dev);
+	pm_runtime_put_sync(dev->dev);
+
+fail_vblank_cleanup:
+	drm_vblank_cleanup(dev);
+
+fail_mode_config_cleanup:
+	drm_mode_config_cleanup(dev);
+
+fail_cpufreq_unregister:
+	pm_runtime_disable(dev->dev);
+#ifdef CONFIG_CPU_FREQ
+	cpufreq_unregister_notifier(&priv->freq_transition,
+			CPUFREQ_TRANSITION_NOTIFIER);
+fail_put_disp_clk:
+	clk_put(priv->disp_clk);
+#endif
+
+fail_put_clk:
+	clk_put(priv->clk);
+
+fail_iounmap:
+	iounmap(priv->mmio);
+
+fail_free_wq:
+	flush_workqueue(priv->wq);
+	destroy_workqueue(priv->wq);
+
+fail_free_priv:
+	dev->dev_private = NULL;
+	kfree(priv);
 	return ret;
 }
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
