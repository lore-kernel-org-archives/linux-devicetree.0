From: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: [PATCH 2/2] of: Add array read functions with min/max size limits
Date: Tue, 6 Sep 2016 16:02:01 +0100
Message-ID: <1473174121-19742-2-git-send-email-rf@opensource.wolfsonmicro.com>
References: <1473174121-19742-1-git-send-email-rf@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1473174121-19742-1-git-send-email-rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a new set of array reading functions that take a minimum and
maximum size limit and will fail if the property size is not within
the size limits. This makes it more convenient for drivers that
use variable-size DT arrays which must be bounded at both ends -
data must be at least N entries but must not overflow the array
it is being copied into. It is also more efficient than making this
functionality out of existing public functions and avoids duplication.

The existing array functions have been left in the API, since there
are a very large number of clients of those functions and their
existing functionality is still useful. This avoids turning a small
API improvement into a major kernel rework.

Signed-off-by: Richard Fitzgerald <rf-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
---
 drivers/of/base.c  | 206 ++++++++++++++++++++++++++++++++++++++++++-----------
 include/linux/of.h |  16 +++++
 2 files changed, 180 insertions(+), 42 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b853737..cbad5cf 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1209,6 +1209,47 @@ int of_property_read_u32_index(const struct device_node *np,
 EXPORT_SYMBOL_GPL(of_property_read_u32_index);
 
 /**
+ * of_property_read_variable_u8_array - Find and read an array of u8 from a
+ * property, with bounds on the minimum and maximum array size.
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @out_values:	pointer to return value, modified only if return value is 0.
+ * @sz_min:	minimum number of array elements to read
+ * @sz_max:	maximum number of array elements to read
+ *
+ * Search for a property in a device node and read 8-bit value(s) from
+ * it. Returns 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data is smaller than sz_min or longer than sz_max.
+ *
+ * dts entry of array should be like:
+ *	property = /bits/ 8 <0x50 0x60 0x70>;
+ *
+ * The out_values is modified only if a valid u8 value can be decoded.
+ */
+int of_property_read_variable_u8_array(const struct device_node *np,
+					const char *propname, u8 *out_values,
+					size_t sz_min, size_t sz_max)
+{
+	size_t sz;
+	const u8 *val = of_find_property_value_of_size(np, propname,
+						(sz_min * sizeof(*out_values)),
+						(sz_max * sizeof(*out_values)),
+						&sz);
+
+	if (IS_ERR(val))
+		return PTR_ERR(val);
+
+	sz /= sizeof(*out_values);
+
+	while (sz--)
+		*out_values++ = *val++;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_property_read_variable_u8_array);
+
+/**
  * of_property_read_u8_array - Find and read an array of u8 from a property.
  *
  * @np:		device node from which the property value is to be read.
@@ -1229,21 +1270,53 @@ EXPORT_SYMBOL_GPL(of_property_read_u32_index);
 int of_property_read_u8_array(const struct device_node *np,
 			const char *propname, u8 *out_values, size_t sz)
 {
-	const u8 *val = of_find_property_value_of_size(np, propname,
-						(sz * sizeof(*out_values)),
-						0,
-						NULL);
-
-	if (IS_ERR(val))
-		return PTR_ERR(val);
-
-	while (sz--)
-		*out_values++ = *val++;
-	return 0;
+	return of_property_read_variable_u8_array(np, propname, out_values,
+						  sz, 0);
 }
 EXPORT_SYMBOL_GPL(of_property_read_u8_array);
 
 /**
+ * of_property_read_variable_u16_array - Find and read an array of u16 from a
+ * property, with bounds on the minimum and maximum array size.
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @out_values:	pointer to return value, modified only if return value is 0.
+ * @sz_min:	minimum number of array elements to read
+ * @sz_max:	maximum number of array elements to read
+ *
+ * Search for a property in a device node and read 16-bit value(s) from
+ * it. Returns 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data is smaller than sz_min or longer than sz_max.
+ *
+ * dts entry of array should be like:
+ *	property = /bits/ 16 <0x5000 0x6000 0x7000>;
+ *
+ * The out_values is modified only if a valid u16 value can be decoded.
+ */
+int of_property_read_variable_u16_array(const struct device_node *np,
+					const char *propname, u16 *out_values,
+					size_t sz_min, size_t sz_max)
+{
+	size_t sz;
+	const __be16 *val = of_find_property_value_of_size(np, propname,
+						(sz_min * sizeof(*out_values)),
+						(sz_max * sizeof(*out_values)),
+						&sz);
+
+	if (IS_ERR(val))
+		return PTR_ERR(val);
+
+	sz /= sizeof(*out_values);
+
+	while (sz--)
+		*out_values++ = be16_to_cpup(val++);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_property_read_variable_u16_array);
+
+/**
  * of_property_read_u16_array - Find and read an array of u16 from a property.
  *
  * @np:		device node from which the property value is to be read.
@@ -1264,21 +1337,50 @@ EXPORT_SYMBOL_GPL(of_property_read_u8_array);
 int of_property_read_u16_array(const struct device_node *np,
 			const char *propname, u16 *out_values, size_t sz)
 {
-	const __be16 *val = of_find_property_value_of_size(np, propname,
-						(sz * sizeof(*out_values)),
-						0,
-						NULL);
-
-	if (IS_ERR(val))
-		return PTR_ERR(val);
-
-	while (sz--)
-		*out_values++ = be16_to_cpup(val++);
-	return 0;
+	return of_property_read_variable_u16_array(np, propname, out_values,
+						   sz, 0);
 }
 EXPORT_SYMBOL_GPL(of_property_read_u16_array);
 
 /**
+ * of_property_read_variable_u32_array - Find and read an array of 32 bit
+ * integers from a property, with bounds on the minimum and maximum array size.
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @out_values:	pointer to return value, modified only if return value is 0.
+ * @sz_min:	minimum number of array elements to read
+ * @sz_max:	maximum number of array elements to read
+ *
+ * Search for a property in a device node and read 32-bit value(s) from
+ * it. Returns 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data is smaller than sz_min or longer than sz_max.
+ *
+ * The out_values is modified only if a valid u32 value can be decoded.
+ */
+int of_property_read_variable_u32_array(const struct device_node *np,
+			       const char *propname, u32 *out_values,
+			       size_t sz_min, size_t sz_max)
+{
+	size_t sz;
+	const __be32 *val = of_find_property_value_of_size(np, propname,
+						(sz_min * sizeof(*out_values)),
+						(sz_max * sizeof(*out_values)),
+						&sz);
+
+	if (IS_ERR(val))
+		return PTR_ERR(val);
+
+	sz /= sizeof(*out_values);
+
+	while (sz--)
+		*out_values++ = be32_to_cpup(val++);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_property_read_variable_u32_array);
+
+/**
  * of_property_read_u32_array - Find and read an array of 32 bit integers
  * from a property.
  *
@@ -1298,17 +1400,8 @@ int of_property_read_u32_array(const struct device_node *np,
 			       const char *propname, u32 *out_values,
 			       size_t sz)
 {
-	const __be32 *val = of_find_property_value_of_size(np, propname,
-						(sz * sizeof(*out_values)),
-						0,
-						NULL);
-
-	if (IS_ERR(val))
-		return PTR_ERR(val);
-
-	while (sz--)
-		*out_values++ = be32_to_cpup(val++);
-	return 0;
+	return of_property_read_variable_u32_array(np, propname, out_values,
+						   sz, 0);
 }
 EXPORT_SYMBOL_GPL(of_property_read_u32_array);
 
@@ -1342,39 +1435,68 @@ int of_property_read_u64(const struct device_node *np, const char *propname,
 EXPORT_SYMBOL_GPL(of_property_read_u64);
 
 /**
- * of_property_read_u64_array - Find and read an array of 64 bit integers
- * from a property.
+ * of_property_read_variable_u64_array - Find and read an array of 64 bit
+ * integers from a property, with bounds on the minimum and maximum array size.
  *
  * @np:		device node from which the property value is to be read.
  * @propname:	name of the property to be searched.
  * @out_values:	pointer to return value, modified only if return value is 0.
- * @sz:		number of array elements to read
+ * @sz_min:	minimum number of array elements to read
+ * @sz_max:	maximum number of array elements to read
  *
  * Search for a property in a device node and read 64-bit value(s) from
  * it. Returns 0 on success, -EINVAL if the property does not exist,
  * -ENODATA if property does not have a value, and -EOVERFLOW if the
- * property data isn't large enough.
+ * property data is smaller than sz_min or longer than sz_max.
  *
  * The out_values is modified only if a valid u64 value can be decoded.
  */
-int of_property_read_u64_array(const struct device_node *np,
+int of_property_read_variable_u64_array(const struct device_node *np,
 			       const char *propname, u64 *out_values,
-			       size_t sz)
+			       size_t sz_min, size_t sz_max)
 {
+	size_t sz;
 	const __be32 *val = of_find_property_value_of_size(np, propname,
-						(sz * sizeof(*out_values)),
-						0,
-						NULL);
+						(sz_min * sizeof(*out_values)),
+						(sz_max * sizeof(*out_values)),
+						&sz);
 
 	if (IS_ERR(val))
 		return PTR_ERR(val);
 
+	sz /= sizeof(*out_values);
+
 	while (sz--) {
 		*out_values++ = of_read_number(val, 2);
 		val += 2;
 	}
 	return 0;
 }
+EXPORT_SYMBOL_GPL(of_property_read_variable_u64_array);
+
+/**
+ * of_property_read_u64_array - Find and read an array of 64 bit integers
+ * from a property.
+ *
+ * @np:		device node from which the property value is to be read.
+ * @propname:	name of the property to be searched.
+ * @out_values:	pointer to return value, modified only if return value is 0.
+ * @sz:		number of array elements to read
+ *
+ * Search for a property in a device node and read 64-bit value(s) from
+ * it. Returns 0 on success, -EINVAL if the property does not exist,
+ * -ENODATA if property does not have a value, and -EOVERFLOW if the
+ * property data isn't large enough.
+ *
+ * The out_values is modified only if a valid u64 value can be decoded.
+ */
+int of_property_read_u64_array(const struct device_node *np,
+			       const char *propname, u64 *out_values,
+			       size_t sz)
+{
+	return of_property_read_variable_u64_array(np, propname, out_values,
+						   sz, 0);
+}
 EXPORT_SYMBOL_GPL(of_property_read_u64_array);
 
 /**
diff --git a/include/linux/of.h b/include/linux/of.h
index 3d9ff8e..8e3c508 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -291,16 +291,32 @@ extern int of_property_count_elems_of_size(const struct device_node *np,
 extern int of_property_read_u32_index(const struct device_node *np,
 				       const char *propname,
 				       u32 index, u32 *out_value);
+extern int of_property_read_variable_u8_array(const struct device_node *np,
+					const char *propname, u8 *out_values,
+					size_t sz_min, size_t sz_max);
 extern int of_property_read_u8_array(const struct device_node *np,
 			const char *propname, u8 *out_values, size_t sz);
+extern int of_property_read_variable_u16_array(const struct device_node *np,
+					const char *propname, u16 *out_values,
+					size_t sz_min, size_t sz_max);
 extern int of_property_read_u16_array(const struct device_node *np,
 			const char *propname, u16 *out_values, size_t sz);
+extern int of_property_read_variable_u32_array(const struct device_node *np,
+					const char *propname,
+					u32 *out_values,
+					size_t sz_min,
+					size_t sz_max);
 extern int of_property_read_u32_array(const struct device_node *np,
 				      const char *propname,
 				      u32 *out_values,
 				      size_t sz);
 extern int of_property_read_u64(const struct device_node *np,
 				const char *propname, u64 *out_value);
+extern int of_property_read_variable_u64_array(const struct device_node *np,
+					const char *propname,
+					u64 *out_values,
+					size_t sz_min,
+					size_t sz_max);
 extern int of_property_read_u64_array(const struct device_node *np,
 				      const char *propname,
 				      u64 *out_values,
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
