From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH 1/2] of: base: add support to get machine model name
Date: Thu, 17 Nov 2016 15:32:54 +0000
Message-ID: <1479396775-32033-1-git-send-email-sudeep.holla@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently platforms/drivers needing to get the machine model name are
replicating the same snippet of code. In some case, the OF reference
counting is either missing or incorrect.

This patch adds support to read the machine model name either using
the "model" or the "compatible" property in the device tree root node
to the core OF/DT code.

This can be used to remove all the duplicate code snippets doing exactly
same thing later.

Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Signed-off-by: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
---
 drivers/of/base.c  | 32 ++++++++++++++++++++++++++++++++
 include/linux/of.h |  6 ++++++
 2 files changed, 38 insertions(+)

Hi Rob,

It would be good if we can target this for v4.10, so that we have no
dependencies to push PATCH 2/2 in v4.11

Regards,
Sudeep

diff --git a/drivers/of/base.c b/drivers/of/base.c
index a0bccb54a9bd..0810c5ecf1aa 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -546,6 +546,38 @@ int of_machine_is_compatible(const char *compat)
 EXPORT_SYMBOL(of_machine_is_compatible);

 /**
+ * of_machine_get_model_name - Find and read the model name or the compatible
+ *		value for the machine.
+ * @model:	pointer to null terminated return string, modified only if
+ *		return value is 0.
+ *
+ * Returns a string containing either the model name or the compatible value
+ * of the machine if found, else return error.
+ *
+ * Search for a machine model name or the compatible if model name is missing
+ * in a device tree node and retrieve a null terminated string value (pointer
+ * to data, not a copy). Returns 0 on success, -EINVAL if root of the device
+ * tree is not found and other error returned by of_property_read_string on
+ * failure.
+ */
+int of_machine_get_model_name(const char **model)
+{
+	int error;
+
+	if (!of_node_get(of_root))
+		return -EINVAL;
+
+	error = of_property_read_string(of_root, "model", model);
+	if (error)
+		error = of_property_read_string_index(of_root, "compatible",
+						      0, model);
+	of_node_put(of_root);
+
+	return error;
+}
+EXPORT_SYMBOL(of_machine_get_model_name);
+
+/**
  *  __of_device_is_available - check if a device is available for use
  *
  *  @device: Node to check for availability, with locks already held
diff --git a/include/linux/of.h b/include/linux/of.h
index d72f01009297..13fc66531f1b 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -367,6 +367,7 @@ extern int of_alias_get_id(struct device_node *np, const char *stem);
 extern int of_alias_get_highest_id(const char *stem);

 extern int of_machine_is_compatible(const char *compat);
+extern int of_machine_get_model_name(const char **model);

 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
@@ -788,6 +789,11 @@ static inline int of_machine_is_compatible(const char *compat)
 	return 0;
 }

+static inline int of_machine_get_model_name(const char **model)
+{
+	return -EINVAL;
+}
+
 static inline bool of_console_check(const struct device_node *dn, const char *name, int index)
 {
 	return false;
--
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
