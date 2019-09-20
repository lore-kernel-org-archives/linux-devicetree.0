From: Benoit Parrot <bparrot@ti.com>
Subject: [Patch v3 01/13] media: am437x-vpfe: Fix suspend path to always handle pinctrl config
Date: Fri, 20 Sep 2019 12:05:42 -0500
Message-ID: <20190920170554.29666-2-bparrot@ti.com>
References: <20190920170554.29666-1-bparrot@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190920170554.29666-1-bparrot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
List-Id: devicetree@vger.kernel.org

From: Dave Gerlach <d-gerlach@ti.com>

Currently if vpfe is not active then it returns immediately in the
suspend and resume handlers. Change this so that it always performs the
pinctrl config so that we can still get proper sleep state configuration
on the pins even if we do not need to worry about fully saving and
restoring context.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/am437x/am437x-vpfe.c | 46 ++++++++++-----------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/am437x/am437x-vpfe.c b/drivers/media/platform/am437x/am437x-vpfe.c
index 2b42ba1f5949..a3d22f90e64c 100644
--- a/drivers/media/platform/am437x/am437x-vpfe.c
+++ b/drivers/media/platform/am437x/am437x-vpfe.c
@@ -2653,22 +2653,21 @@ static int vpfe_suspend(struct device *dev)
 	struct vpfe_device *vpfe = dev_get_drvdata(dev);
 	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
 
-	/* if streaming has not started we don't care */
-	if (!vb2_start_streaming_called(&vpfe->buffer_queue))
-		return 0;
-
-	pm_runtime_get_sync(dev);
-	vpfe_config_enable(ccdc, 1);
+	/* only do full suspend if streaming has started */
+	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
+		pm_runtime_get_sync(dev);
+		vpfe_config_enable(ccdc, 1);
 
-	/* Save VPFE context */
-	vpfe_save_context(ccdc);
+		/* Save VPFE context */
+		vpfe_save_context(ccdc);
 
-	/* Disable CCDC */
-	vpfe_pcr_enable(ccdc, 0);
-	vpfe_config_enable(ccdc, 0);
+		/* Disable CCDC */
+		vpfe_pcr_enable(ccdc, 0);
+		vpfe_config_enable(ccdc, 0);
 
-	/* Disable both master and slave clock */
-	pm_runtime_put_sync(dev);
+		/* Disable both master and slave clock */
+		pm_runtime_put_sync(dev);
+	}
 
 	/* Select sleep pin state */
 	pinctrl_pm_select_sleep_state(dev);
@@ -2710,19 +2709,18 @@ static int vpfe_resume(struct device *dev)
 	struct vpfe_device *vpfe = dev_get_drvdata(dev);
 	struct vpfe_ccdc *ccdc = &vpfe->ccdc;
 
-	/* if streaming has not started we don't care */
-	if (!vb2_start_streaming_called(&vpfe->buffer_queue))
-		return 0;
-
-	/* Enable both master and slave clock */
-	pm_runtime_get_sync(dev);
-	vpfe_config_enable(ccdc, 1);
+	/* only do full resume if streaming has started */
+	if (vb2_start_streaming_called(&vpfe->buffer_queue)) {
+		/* Enable both master and slave clock */
+		pm_runtime_get_sync(dev);
+		vpfe_config_enable(ccdc, 1);
 
-	/* Restore VPFE context */
-	vpfe_restore_context(ccdc);
+		/* Restore VPFE context */
+		vpfe_restore_context(ccdc);
 
-	vpfe_config_enable(ccdc, 0);
-	pm_runtime_put_sync(dev);
+		vpfe_config_enable(ccdc, 0);
+		pm_runtime_put_sync(dev);
+	}
 
 	/* Select default pin state */
 	pinctrl_pm_select_default_state(dev);
-- 
2.17.1
