From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [PATCH v2] dt: Add of_device_compatible_match()
Date: Fri, 08 Jul 2016 08:35:59 +1000
Message-ID: <1467930959.27157.72.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This provides an equivalent of of_fdt_match() for non-flat trees.

This is more practical than matching an array of of_device_id structs
when converting a bunch of existing users of of_fdt_match().

Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---

v2. Fix the score logic

 drivers/of/base.c  | 22 ++++++++++++++++++++++
 include/linux/of.h |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index ebf84e3..c382e1fc 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -493,6 +493,28 @@ int of_device_is_compatible(const struct device_node *device,
 }
 EXPORT_SYMBOL(of_device_is_compatible);
 
+/** Checks if the device is compatible with any of the entries in
+ *  a NULL terminated array of strings. Returns the best match
+ *  score or 0.
+ */
+int of_device_compatible_match(struct device_node *device,
+			       const char *const *compat)
+{
+	unsigned int tmp, score = 0;
+
+	if (!compat)
+		return 0;
+
+	while (*compat) {
+		tmp = of_device_is_compatible(device, *compat);
+		if (tmp > score)
+			score = tmp;
+		compat++;
+	}
+
+	return score;
+}
+
 /**
  * of_machine_is_compatible - Test root of device tree for a given compatible value
  * @compat: compatible string to look for in root node's compatible property.
diff --git a/include/linux/of.h b/include/linux/of.h
index 74eb28c..33c184d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -324,6 +324,8 @@ extern int of_property_read_string_helper(const struct device_node *np,
 					      const char **out_strs, size_t sz, int index);
 extern int of_device_is_compatible(const struct device_node *device,
 				   const char *);
+extern int of_device_compatible_match(struct device_node *device,
+				      const char *const *compat);
 extern bool of_device_is_available(const struct device_node *device);
 extern bool of_device_is_big_endian(const struct device_node *device);
 extern const void *of_get_property(const struct device_node *node,


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
