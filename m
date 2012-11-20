From: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] dt: add helper function to read u8 & u16 variables & arrays
Date: Tue, 20 Nov 2012 10:15:19 +0530
Message-ID: <0ee5b74534a09d75c14b22c2d9330c4971ab30fb.1353386646.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, spear-devel-nkJGhpqTU55BDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds following helper routines:
- of_property_read_u8_array()
- of_property_read_u16_array()
- of_property_read_u8()
- of_property_read_u16()

This expects arrays from DT to be passed as:
- u8 array:
	property = /bits/ 8 <0x50 0x60 0x70>;
- u16 array:
	property = /bits/ 16 <0x5000 0x6000 0x7000>;

Signed-off-by: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
V2->V3:
- Expect u8 & u16 arrays to be passed using: /bits/ 8 or 16
- remove common macro, as not much common now :(
- Tested on ARM platform.

 drivers/of/base.c  | 77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h | 30 +++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index af3b22a..f564e31 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -671,12 +671,89 @@ struct device_node *of_find_node_by_phandle(phandle handle)
 EXPORT_SYMBOL(of_find_node_by_phandle);
 
 /**
+ * of_property_read_u8_array - Find and read an array of u8 from a property.
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @out_value:	pointer to return value, modified only if return value is 0.
+ * @sz:		number of array elements to read
+ *
+ * Search for a property in a device node and read 8-bit value(s) from
+ * it. Returns 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data isn't large enough.
+ *
+ * dts entry of array should be like:
+ *	property = /bits/ 8 <0x50 0x60 0x70>;
+ *
+ * The out_value is modified only if a valid u8 value can be decoded.
+ */
+int of_property_read_u8_array(const struct device_node *np,
+			const char *propname, u8 *out_values, size_t sz)
+{
+	struct property *prop = of_find_property(np, propname, NULL);
+	const u8 *val;
+
+	if (!prop)
+		return -EINVAL;
+	if (!prop->value)
+		return -ENODATA;
+	if ((sz * sizeof(*out_values)) > prop->length)
+		return -EOVERFLOW;
+
+	val = prop->value;
+	while (sz--)
+		*out_values++ = *val++;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_property_read_u8_array);
+
+/**
+ * of_property_read_u16_array - Find and read an array of u16 from a property.
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @out_value:	pointer to return value, modified only if return value is 0.
+ * @sz:		number of array elements to read
+ *
+ * Search for a property in a device node and read 16-bit value(s) from
+ * it. Returns 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data isn't large enough.
+ *
+ * dts entry of array should be like:
+ *	property = /bits/ 16 <0x5000 0x6000 0x7000>;
+ *
+ * The out_value is modified only if a valid u16 value can be decoded.
+ */
+int of_property_read_u16_array(const struct device_node *np,
+			const char *propname, u16 *out_values, size_t sz)
+{
+	struct property *prop = of_find_property(np, propname, NULL);
+	const __be16 *val;
+
+	if (!prop)
+		return -EINVAL;
+	if (!prop->value)
+		return -ENODATA;
+	if ((sz * sizeof(*out_values)) > prop->length)
+		return -EOVERFLOW;
+
+	val = prop->value;
+	while (sz--)
+		*out_values++ = be16_to_cpup(val++);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_property_read_u16_array);
+
+/**
  * of_property_read_u32_array - Find and read an array of 32 bit integers
  * from a property.
  *
  * @np:		device node from which the property value is to be read.
  * @propname:	name of the property to be searched.
  * @out_value:	pointer to return value, modified only if return value is 0.
+ * @sz:		number of array elements to read
  *
  * Search for a property in a device node and read 32-bit value(s) from
  * it. Returns 0 on success, -EINVAL if the property does not exist,
diff --git a/include/linux/of.h b/include/linux/of.h
index b4e50d5..bfdc130 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -223,6 +223,10 @@ extern struct device_node *of_find_node_with_property(
 extern struct property *of_find_property(const struct device_node *np,
 					 const char *name,
 					 int *lenp);
+extern int of_property_read_u8_array(const struct device_node *np,
+			const char *propname, u8 *out_values, size_t sz);
+extern int of_property_read_u16_array(const struct device_node *np,
+			const char *propname, u16 *out_values, size_t sz);
 extern int of_property_read_u32_array(const struct device_node *np,
 				      const char *propname,
 				      u32 *out_values,
@@ -364,6 +368,18 @@ static inline struct device_node *of_find_compatible_node(
 	return NULL;
 }
 
+static inline int of_property_read_u8_array(const struct device_node *np,
+			const char *propname, u8 *out_values, size_t sz)
+{
+	return -ENOSYS;
+}
+
+static inline int of_property_read_u16_array(const struct device_node *np,
+			const char *propname, u16 *out_values, size_t sz)
+{
+	return -ENOSYS;
+}
+
 static inline int of_property_read_u32_array(const struct device_node *np,
 					     const char *propname,
 					     u32 *out_values, size_t sz)
@@ -470,6 +486,20 @@ static inline bool of_property_read_bool(const struct device_node *np,
 	return prop ? true : false;
 }
 
+static inline int of_property_read_u8(const struct device_node *np,
+				       const char *propname,
+				       u8 *out_value)
+{
+	return of_property_read_u8_array(np, propname, out_value, 1);
+}
+
+static inline int of_property_read_u16(const struct device_node *np,
+				       const char *propname,
+				       u16 *out_value)
+{
+	return of_property_read_u16_array(np, propname, out_value, 1);
+}
+
 static inline int of_property_read_u32(const struct device_node *np,
 				       const char *propname,
 				       u32 *out_value)
-- 
1.7.12.rc2.18.g61b472e
