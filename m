From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v12 18/26] v4l: fwnode: Add a helper function for parsing generic references
Date: Tue, 12 Sep 2017 16:41:52 +0300
Message-ID: <20170912134200.19556-19-sakari.ailus@linux.intel.com>
References: <20170912134200.19556-1-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170912134200.19556-1-sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add function v4l2_fwnode_reference_count() for counting external
references and v4l2_fwnode_reference_parse() for parsing them as async
sub-devices.

This can be done on e.g. flash or lens async sub-devices that are not part
of but are associated with a sensor.

struct v4l2_async_notifier.max_subdevs field is added to contain the
maximum number of sub-devices in a notifier to reflect the memory
allocated for the subdevs array.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 69 +++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 44ee35f6aad5..a32473f95be1 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -498,6 +498,75 @@ int v4l2_async_notifier_parse_fwnode_endpoints_by_port(
 }
 EXPORT_SYMBOL_GPL(v4l2_async_notifier_parse_fwnode_endpoints_by_port);
 
+/*
+ * v4l2_fwnode_reference_parse - parse references for async sub-devices
+ * @dev: the device node the properties of which are parsed for references
+ * @notifier: the async notifier where the async subdevs will be added
+ * @prop: the name of the property
+ *
+ * Return: 0 on success
+ *	   -ENOENT if no entries were found
+ *	   -ENOMEM if memory allocation failed
+ *	   -EINVAL if property parsing failed
+ */
+static int v4l2_fwnode_reference_parse(
+	struct device *dev, struct v4l2_async_notifier *notifier,
+	const char *prop)
+{
+	struct fwnode_reference_args args;
+	unsigned int index;
+	int ret;
+
+	for (index = 0;
+	     !(ret = fwnode_property_get_reference_args(
+		       dev_fwnode(dev), prop, NULL, 0, index, &args));
+	     index++)
+		fwnode_handle_put(args.fwnode);
+
+	if (!index)
+		return -ENOENT;
+
+	/*
+	 * To-do: handle -ENODATA when "device property: Align return
+	 * codes of acpi_fwnode_get_reference_with_args" is merged.
+	 */
+	if (ret != -ENOENT && ret != -ENODATA)
+		return ret;
+
+	ret = v4l2_async_notifier_realloc(notifier,
+					  notifier->num_subdevs + index);
+	if (ret)
+		return ret;
+
+	for (index = 0; !fwnode_property_get_reference_args(
+		     dev_fwnode(dev), prop, NULL, 0, index, &args);
+	     index++) {
+		struct v4l2_async_subdev *asd;
+
+		if (WARN_ON(notifier->num_subdevs >= notifier->max_subdevs)) {
+			ret = -EINVAL;
+			goto error;
+		}
+
+		asd = kzalloc(sizeof(*asd), GFP_KERNEL);
+		if (!asd) {
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		notifier->subdevs[notifier->num_subdevs] = asd;
+		asd->match.fwnode.fwnode = args.fwnode;
+		asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
+		notifier->num_subdevs++;
+	}
+
+	return 0;
+
+error:
+	fwnode_handle_put(args.fwnode);
+	return ret;
+}
+
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>");
 MODULE_AUTHOR("Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>");
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
