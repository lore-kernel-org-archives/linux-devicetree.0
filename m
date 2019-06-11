From: Michael Drake <michael.drake@codethink.co.uk>
Subject: [PATCH v1 05/11] ti948: Add alive check function using schedule_delayed_work()
Date: Tue, 11 Jun 2019 15:04:06 +0100
Message-ID: <20190611140412.32151-6-michael.drake@codethink.co.uk>
References: <20190611140412.32151-1-michael.drake@codethink.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611140412.32151-1-michael.drake@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Drake <michael.drake@codethink.co.uk>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@lists.codethink.co.uk, Patrick Glaser <pglaser@tesla.com>, Nate Case <ncase@tesla.com>
List-Id: devicetree@vger.kernel.org

This simply runs the function once every 5 seconds, while the
device is supposed to be active.  The alive check function is
currently simply a stub, that logs it has been called, and
re-inserts itself into the work queue.

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Cc: Patrick Glaser <pglaser@tesla.com>
Cc: Nate Case <ncase@tesla.com>
---
 drivers/gpu/drm/bridge/ti948.c | 37 +++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti948.c b/drivers/gpu/drm/bridge/ti948.c
index 9cb37215f049..86daa3701b91 100644
--- a/drivers/gpu/drm/bridge/ti948.c
+++ b/drivers/gpu/drm/bridge/ti948.c
@@ -16,6 +16,7 @@
 
 #include <linux/regulator/consumer.h>
 #include <linux/of_device.h>
+#include <linux/workqueue.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
@@ -25,6 +26,9 @@
 /* Number of times to try checking for device on bringup. */
 #define TI948_DEVICE_ID_TRIES 10
 
+/* Alive check every 5 seconds. */
+#define TI948_ALIVE_CHECK_DELAY (5 * HZ)
+
 /**
  * enum ti948_reg - TI948 registers.
  *
@@ -374,9 +378,27 @@ static inline struct ti948_ctx *ti948_ctx_from_dev(struct device *dev)
 	return i2c_get_clientdata(client);
 }
 
+static inline struct ti948_ctx *delayed_work_to_ti948_ctx(
+		struct delayed_work *dwork)
+{
+	return container_of(dwork, struct ti948_ctx, alive_check);
+}
+
+static void ti948_alive_check(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct ti948_ctx *ti948 = delayed_work_to_ti948_ctx(dwork);
+
+	dev_info(&ti948->i2c->dev, "%s Alive check!\n", __func__);
+
+	/* Reschedule ourself for the next check. */
+	schedule_delayed_work(&ti948->alive_check, TI948_ALIVE_CHECK_DELAY);
+}
+
 static int ti948_pm_resume(struct device *dev)
 {
 	struct ti948_ctx *ti948 = ti948_ctx_from_dev(dev);
+	bool scheduled;
 	int ret;
 
 	if (ti948 == NULL)
@@ -386,7 +408,18 @@ static int ti948_pm_resume(struct device *dev)
 	if (ret != 0)
 		return ret;
 
-	return ti948_write_config_seq(ti948);
+	ret = ti948_write_config_seq(ti948);
+	if (ret != 0)
+		return ret;
+
+	INIT_DELAYED_WORK(&ti948->alive_check, ti948_alive_check);
+
+	scheduled = schedule_delayed_work(
+			&ti948->alive_check, TI948_ALIVE_CHECK_DELAY);
+	if (!scheduled)
+		dev_warn(&ti948->i2c->dev, "Alive check already scheduled\n");
+
+	return 0;
 }
 
 static int ti948_pm_suspend(struct device *dev)
@@ -396,6 +429,8 @@ static int ti948_pm_suspend(struct device *dev)
 	if (ti948 == NULL)
 		return 0;
 
+	cancel_delayed_work_sync(&ti948->alive_check);
+
 	return ti948_power_off(ti948);
 }
 
-- 
2.20.1
