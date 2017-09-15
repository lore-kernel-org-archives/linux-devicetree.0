From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v13 24/25] ov13858: Add support for flash and lens devices
Date: Fri, 15 Sep 2017 17:17:23 +0300
Message-ID: <20170915141724.23124-25-sakari.ailus@linux.intel.com>
References: <20170915141724.23124-1-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915141724.23124-1-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Parse async sub-devices by using
v4l2_subdev_fwnode_reference_parse_sensor_common().

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Acked-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
---
 drivers/media/i2c/ov13858.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index af7af0d14c69..a8a9fb0a1756 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -18,6 +18,7 @@
 #include <linux/pm_runtime.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
+#include <media/v4l2-fwnode.h>
 
 #define OV13858_REG_VALUE_08BIT		1
 #define OV13858_REG_VALUE_16BIT		2
@@ -1028,6 +1029,7 @@ static const struct ov13858_mode supported_modes[] = {
 struct ov13858 {
 	struct v4l2_subdev sd;
 	struct media_pad pad;
+	struct v4l2_async_notifier notifier;
 
 	struct v4l2_ctrl_handler ctrl_handler;
 	/* V4L2 Controls */
@@ -1715,6 +1717,11 @@ static int ov13858_probe(struct i2c_client *client,
 	if (!ov13858)
 		return -ENOMEM;
 
+	ret = v4l2_async_notifier_parse_fwnode_sensor_common(
+		&client->dev, &ov13858->notifier);
+	if (ret < 0)
+		return ret;
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&ov13858->sd, client, &ov13858_subdev_ops);
 
@@ -1722,7 +1729,7 @@ static int ov13858_probe(struct i2c_client *client,
 	ret = ov13858_identify_module(ov13858);
 	if (ret) {
 		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
-		return ret;
+		goto error_notifier_release;
 	}
 
 	/* Set default mode to max resolution */
@@ -1730,7 +1737,7 @@ static int ov13858_probe(struct i2c_client *client,
 
 	ret = ov13858_init_controls(ov13858);
 	if (ret)
-		return ret;
+		goto error_notifier_release;
 
 	/* Initialize subdev */
 	ov13858->sd.internal_ops = &ov13858_internal_ops;
@@ -1746,9 +1753,14 @@ static int ov13858_probe(struct i2c_client *client,
 		goto error_handler_free;
 	}
 
+	ret = v4l2_async_subdev_notifier_register(&ov13858->sd,
+						  &ov13858->notifier);
+	if (ret)
+		goto error_media_entity;
+
 	ret = v4l2_async_register_subdev(&ov13858->sd);
 	if (ret < 0)
-		goto error_media_entity;
+		goto error_notifier_unregister;
 
 	/*
 	 * Device is already turned on by i2c-core with ACPI domain PM.
@@ -1761,11 +1773,17 @@ static int ov13858_probe(struct i2c_client *client,
 
 	return 0;
 
+error_notifier_unregister:
+	v4l2_async_notifier_unregister(&ov13858->notifier);
+
 error_media_entity:
 	media_entity_cleanup(&ov13858->sd.entity);
 
 error_handler_free:
 	ov13858_free_controls(ov13858);
+
+error_notifier_release:
+	v4l2_async_notifier_release(&ov13858->notifier);
 	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
 
 	return ret;
@@ -1777,6 +1795,8 @@ static int ov13858_remove(struct i2c_client *client)
 	struct ov13858 *ov13858 = to_ov13858(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_async_notifier_unregister(&ov13858->notifier);
+	v4l2_async_notifier_release(&ov13858->notifier);
 	media_entity_cleanup(&sd->entity);
 	ov13858_free_controls(ov13858);
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
