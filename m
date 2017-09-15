From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v13 19/25] v4l: fwnode: Add convenience function for parsing common external refs
Date: Fri, 15 Sep 2017 17:17:18 +0300
Message-ID: <20170915141724.23124-20-sakari.ailus@linux.intel.com>
References: <20170915141724.23124-1-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170915141724.23124-1-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add v4l2_fwnode_parse_reference_sensor_common for parsing common
sensor properties that refer to adjacent devices such as flash or lens
driver chips.

As this is an association only, there's little a regular driver needs to
know about these devices as such.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Acked-by: Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>
Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 35 +++++++++++++++++++++++++++++++++++
 include/media/v4l2-async.h            |  3 ++-
 include/media/v4l2-fwnode.h           | 21 +++++++++++++++++++++
 3 files changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 968a345a288f..7de2fd195e19 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -768,6 +768,41 @@ static int v4l2_fwnode_reference_parse_int_props(
 	return ret;
 }
 
+int v4l2_async_notifier_parse_fwnode_sensor_common(
+	struct device *dev, struct v4l2_async_notifier *notifier)
+{
+	static const char *led_props[] = { "led" };
+	static const struct {
+		const char *name;
+		const char **props;
+		unsigned int nprops;
+	} props[] = {
+		{ "flash-leds", led_props, ARRAY_SIZE(led_props) },
+		{ "lens-focus", NULL, 0 },
+	};
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(props); i++) {
+		int ret;
+
+		if (props[i].props && is_acpi_node(dev_fwnode(dev)))
+			ret = v4l2_fwnode_reference_parse_int_props(
+				dev, notifier, props[i].name,
+				props[i].props, props[i].nprops);
+		else
+			ret = v4l2_fwnode_reference_parse(
+				dev, notifier, props[i].name);
+		if (ret && ret != -ENOENT) {
+			dev_warn(dev, "parsing property \"%s\" failed (%d)\n",
+				 props[i].name, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_async_notifier_parse_fwnode_sensor_common);
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>");
 MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index a13803a6371d..378e20e3b44d 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -155,7 +155,8 @@ void v4l2_async_notifier_unregister(struct v4l2_async_notifier *notifier);
  * Release memory resources related to a notifier, including the async
  * sub-devices allocated for the purposes of the notifier. The user is
  * responsible for releasing the notifier's resources after calling
- * @v4l2_async_notifier_parse_fwnode_endpoints.
+ * @v4l2_async_notifier_parse_fwnode_endpoints or
+ * @v4l2_fwnode_reference_parse_sensor_common.
  *
  * There is no harm from calling v4l2_async_notifier_release in other
  * cases as long as its memory has been zeroed after it has been
diff --git a/include/media/v4l2-fwnode.h b/include/media/v4l2-fwnode.h
index 83afac48ea6b..7f315383c0ae 100644
--- a/include/media/v4l2-fwnode.h
+++ b/include/media/v4l2-fwnode.h
@@ -318,4 +318,25 @@ int v4l2_async_notifier_parse_fwnode_endpoints_by_port(
 			      struct v4l2_fwnode_endpoint *vep,
 			      struct v4l2_async_subdev *asd));
 
+/**
+ * v4l2_fwnode_reference_parse_sensor_common - parse common references on
+ *					       sensors for async sub-devices
+ * @dev: the device node the properties of which are parsed for references
+ * @notifier: the async notifier where the async subdevs will be added
+ *
+ * Parse common sensor properties for remote devices related to the
+ * sensor and set up async sub-devices for them.
+ *
+ * Any notifier populated using this function must be released with a call to
+ * v4l2_async_notifier_release() after it has been unregistered and the async
+ * sub-devices are no longer in use, even in the case the function returned an
+ * error.
+ *
+ * Return: 0 on success
+ *	   -ENOMEM if memory allocation failed
+ *	   -EINVAL if property parsing failed
+ */
+int v4l2_async_notifier_parse_fwnode_sensor_common(
+	struct device *dev, struct v4l2_async_notifier *notifier);
+
 #endif /* _V4L2_FWNODE_H */
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
