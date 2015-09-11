From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 6/9] dmaengine: st_fdma: Add fdma suspend and resume callbacks.
Date: Fri, 11 Sep 2015 15:14:28 +0100
Message-ID: <1441980871-24475-7-git-send-email-peter.griffin@linaro.org>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441980871-24475-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the functions to gate the xp70 clock on
suspend and resume.

Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/dma/st_fdma.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index 4288e79..de3afefb 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -1127,10 +1127,56 @@ static int st_fdma_remove(struct platform_device *pdev)
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
+static int st_fdma_pm_suspend(struct device *dev)
+{
+	struct st_fdma_dev *fdev = dev_get_drvdata(dev);
+	int ret;
+
+	if (atomic_read(&fdev->fw_loaded)) {
+		ret = st_fdma_disable(fdev);
+		if (ret & FDMA_EN_RUN) {
+			dev_warn(fdev->dev, "Failed to disable channels");
+			return -EBUSY;
+		}
+	}
+
+	st_fdma_clk_disable(fdev);
+
+	return 0;
+}
+
+static int st_fdma_pm_resume(struct device *dev)
+{
+	struct st_fdma_dev *fdev = dev_get_drvdata(dev);
+	int ret;
+
+	ret = st_fdma_clk_enable(fdev);
+	if (ret) {
+		dev_err(fdev->dev, "Failed to enable clocks\n");
+		goto out;
+	}
+
+	ret = st_fdma_get_fw(fdev);
+out:
+	return ret;
+}
+
+static const struct dev_pm_ops st_fdma_pm = {
+	.suspend_late = st_fdma_pm_suspend,
+	.resume_early = st_fdma_pm_resume,
+};
+
+#define ST_FDMA_PM	(&st_fdma_pm)
+#else
+#define ST_FDMA_PM	NULL
+#endif
+
 static struct platform_driver st_fdma_platform_driver = {
 	.driver = {
 		.name = "st-fdma",
 		.of_match_table = st_fdma_match,
+		.pm = ST_FDMA_PM,
 	},
 	.probe = st_fdma_probe,
 	.remove = st_fdma_remove,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
