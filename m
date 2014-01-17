From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v2] of: add functions to count number of elements in a property
Date: Fri, 17 Jan 2014 16:44:14 +0100
Message-ID: <1434798.oSb68sYmYT@phil>
References: <27256277.YJ687suYy5@phil> <3781679.27UF2dWtKL@phil> <20140117144456.GG19578@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140117144456.GG19578-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The need to know the number of array elements in a property is
a common pattern. To prevent duplication of open-coded implementations
add a helper static function that also centralises strict sanity
checking and DTB format details, as well as a set of wrapper functions
for u8, u16, u32 and u64.

Suggested-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
---
changes since v1:
address comments from Rob Herring and Mark Rutland:
- provide a helper and a set of wrappers for u8-u64
- get rid of extra len variable, prop->length is enough
- include node name in error message

 drivers/of/base.c  |   98 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h |   32 +++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index f807d0e..b6e6d4a 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -862,6 +862,104 @@ struct device_node *of_find_node_by_phandle(phandle handle)
 EXPORT_SYMBOL(of_find_node_by_phandle);
 
 /**
+ * of_count_property_elems_of_size - Count the number of elements in a property
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @elem_size:	size of the individual element
+ */
+static int of_count_property_elems_of_size(const struct device_node *np,
+				const char *propname, int elem_size)
+{
+	struct property *prop = of_find_property(np, propname, NULL);
+
+	if (!prop)
+		return -EINVAL;
+	if (!prop->value)
+		return -ENODATA;
+
+	if (prop->length % elem_size != 0) {
+		pr_err("size of %s in node %s is not a multiple of %d\n",
+		       propname, np->name, elem_size);
+		return -EINVAL;
+	}
+
+	return prop->length / elem_size;
+}
+
+/**
+ * of_property_count_u8_elems - Count the number of u8 elements in a property
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ *
+ * Search for a property in a device node and count the number of u8 elements
+ * in it. Returns number of elements on sucess, -EINVAL if the property does
+ * not exist or its length does not match a multiple of u8 and -ENODATA if the
+ * property does not have a value.
+ */
+int of_property_count_u8_elems(const struct device_node *np,
+				const char *propname)
+{
+	return of_count_property_elems_of_size(np, propname, sizeof(u8));
+}
+EXPORT_SYMBOL_GPL(of_property_count_u8_elems);
+
+/**
+ * of_property_count_u16_elems - Count the number of u16 elements in a property
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ *
+ * Search for a property in a device node and count the number of u16 elements
+ * in it. Returns number of elements on sucess, -EINVAL if the property does
+ * not exist or its length does not match a multiple of u16 and -ENODATA if the
+ * property does not have a value.
+ */
+int of_property_count_u16_elems(const struct device_node *np,
+				const char *propname)
+{
+	return of_count_property_elems_of_size(np, propname, sizeof(u16));
+}
+EXPORT_SYMBOL_GPL(of_property_count_u16_elems);
+
+/**
+ * of_property_count_u32_elems - Count the number of u32 elements in a property
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ *
+ * Search for a property in a device node and count the number of u32 elements
+ * in it. Returns number of elements on sucess, -EINVAL if the property does
+ * not exist or its length does not match a multiple of u32 and -ENODATA if the
+ * property does not have a value.
+ */
+int of_property_count_u32_elems(const struct device_node *np,
+				const char *propname)
+{
+	return of_count_property_elems_of_size(np, propname, sizeof(u32));
+}
+EXPORT_SYMBOL_GPL(of_property_count_u32_elems);
+
+/**
+ * of_property_count_u64_elems - Count the number of u64 elements in a property
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ *
+ * Search for a property in a device node and count the number of u64 elements
+ * in it. Returns number of elements on sucess, -EINVAL if the property does
+ * not exist or its length does not match a multiple of u64 and -ENODATA if the
+ * property does not have a value.
+ */
+int of_property_count_u64_elems(const struct device_node *np,
+				const char *propname)
+{
+	return of_count_property_elems_of_size(np, propname, sizeof(u64));
+}
+EXPORT_SYMBOL_GPL(of_property_count_u64_elems);
+
+/**
  * of_find_property_value_of_size
  *
  * @np:		device node from which the property value is to be read.
diff --git a/include/linux/of.h b/include/linux/of.h
index 276c546..06fe898 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -250,6 +250,14 @@ extern struct device_node *of_find_node_with_property(
 extern struct property *of_find_property(const struct device_node *np,
 					 const char *name,
 					 int *lenp);
+extern int of_property_count_u8_elems(const struct device_node *np,
+				       const char *propname);
+extern int of_property_count_u16_elems(const struct device_node *np,
+				       const char *propname);
+extern int of_property_count_u32_elems(const struct device_node *np,
+				       const char *propname);
+extern int of_property_count_u64_elems(const struct device_node *np,
+				       const char *propname);
 extern int of_property_read_u32_index(const struct device_node *np,
 				       const char *propname,
 				       u32 index, u32 *out_value);
@@ -426,6 +434,30 @@ static inline struct device_node *of_find_compatible_node(
 	return NULL;
 }
 
+static inline int of_property_count_u8_elems(const struct device_node *np,
+			const char *propname)
+{
+	return -ENOSYS;
+}
+
+static inline int of_property_count_u16_elems(const struct device_node *np,
+			const char *propname)
+{
+	return -ENOSYS;
+}
+
+static inline int of_property_count_u32_elems(const struct device_node *np,
+			const char *propname)
+{
+	return -ENOSYS;
+}
+
+static inline int of_property_count_u64_elems(const struct device_node *np,
+			const char *propname)
+{
+	return -ENOSYS;
+}
+
 static inline int of_property_read_u32_index(const struct device_node *np,
 			const char *propname, u32 index, u32 *out_value)
 {
-- 
1.7.10.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
