From: "David Rivshin (Allworx)" <drivshin.allworx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] of: add 'const' for of_property_*_string*() parameter '*np'
Date: Wed,  2 Mar 2016 16:35:51 -0500
Message-ID: <1456954551-31742-1-git-send-email-drivshin.allworx@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: David Rivshin <drivshin-5fOYsn7Fw8lBDgjK7y7TUQ@public.gmane.org>

The of_property_{read,count,match}_string* family of functions never
modify the struct device_node pointer that is passed in, so there is no
reason for it to be non-const. Equivalent functions for all other types
already take a 'const struct device_node *np'.

Signed-off-by: David Rivshin <drivshin-5fOYsn7Fw8lBDgjK7y7TUQ@public.gmane.org>
---

MAINTAINTERS says that the appropriate tree is
    git://git.kernel.org/pub/scm/linux/kernel/git/glikely/linux.git
but it looks like that hasn't been updated in a while. So this patch
is based off the "for-next" branch of
    git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
instead. Let me know if you need me to respin from another tree/branch.

 drivers/of/base.c  | 15 ++++++++-------
 include/linux/of.h | 18 +++++++++---------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 017dd94..b299de2 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1341,10 +1341,10 @@ EXPORT_SYMBOL_GPL(of_property_read_u64_array);
  *
  * The out_string pointer is modified only if a valid string can be decoded.
  */
-int of_property_read_string(struct device_node *np, const char *propname,
+int of_property_read_string(const struct device_node *np, const char *propname,
 				const char **out_string)
 {
-	struct property *prop = of_find_property(np, propname, NULL);
+	const struct property *prop = of_find_property(np, propname, NULL);
 	if (!prop)
 		return -EINVAL;
 	if (!prop->value)
@@ -1365,10 +1365,10 @@ EXPORT_SYMBOL_GPL(of_property_read_string);
  * This function searches a string list property and returns the index
  * of a specific string value.
  */
-int of_property_match_string(struct device_node *np, const char *propname,
+int of_property_match_string(const struct device_node *np, const char *propname,
 			     const char *string)
 {
-	struct property *prop = of_find_property(np, propname, NULL);
+	const struct property *prop = of_find_property(np, propname, NULL);
 	size_t l;
 	int i;
 	const char *p, *end;
@@ -1404,10 +1404,11 @@ EXPORT_SYMBOL_GPL(of_property_match_string);
  * Don't call this function directly. It is a utility helper for the
  * of_property_read_string*() family of functions.
  */
-int of_property_read_string_helper(struct device_node *np, const char *propname,
-				   const char **out_strs, size_t sz, int skip)
+int of_property_read_string_helper(const struct device_node *np,
+				   const char *propname, const char **out_strs,
+				   size_t sz, int skip)
 {
-	struct property *prop = of_find_property(np, propname, NULL);
+	const struct property *prop = of_find_property(np, propname, NULL);
 	int l = 0, i = 0;
 	const char *p, *end;
 
diff --git a/include/linux/of.h b/include/linux/of.h
index dc6e396..7fcb681 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -296,13 +296,13 @@ extern int of_property_read_u64_array(const struct device_node *np,
 				      u64 *out_values,
 				      size_t sz);
 
-extern int of_property_read_string(struct device_node *np,
+extern int of_property_read_string(const struct device_node *np,
 				   const char *propname,
 				   const char **out_string);
-extern int of_property_match_string(struct device_node *np,
+extern int of_property_match_string(const struct device_node *np,
 				    const char *propname,
 				    const char *string);
-extern int of_property_read_string_helper(struct device_node *np,
+extern int of_property_read_string_helper(const struct device_node *np,
 					      const char *propname,
 					      const char **out_strs, size_t sz, int index);
 extern int of_device_is_compatible(const struct device_node *device,
@@ -538,14 +538,14 @@ static inline int of_property_read_u64_array(const struct device_node *np,
 	return -ENOSYS;
 }
 
-static inline int of_property_read_string(struct device_node *np,
+static inline int of_property_read_string(const struct device_node *np,
 					  const char *propname,
 					  const char **out_string)
 {
 	return -ENOSYS;
 }
 
-static inline int of_property_read_string_helper(struct device_node *np,
+static inline int of_property_read_string_helper(const struct device_node *np,
 						 const char *propname,
 						 const char **out_strs, size_t sz, int index)
 {
@@ -571,7 +571,7 @@ static inline int of_property_read_u64(const struct device_node *np,
 	return -ENOSYS;
 }
 
-static inline int of_property_match_string(struct device_node *np,
+static inline int of_property_match_string(const struct device_node *np,
 					   const char *propname,
 					   const char *string)
 {
@@ -773,7 +773,7 @@ static inline int of_property_count_u64_elems(const struct device_node *np,
  *
  * If @out_strs is NULL, the number of strings in the property is returned.
  */
-static inline int of_property_read_string_array(struct device_node *np,
+static inline int of_property_read_string_array(const struct device_node *np,
 						const char *propname, const char **out_strs,
 						size_t sz)
 {
@@ -792,7 +792,7 @@ static inline int of_property_read_string_array(struct device_node *np,
  * does not have a value, and -EILSEQ if the string is not null-terminated
  * within the length of the property data.
  */
-static inline int of_property_count_strings(struct device_node *np,
+static inline int of_property_count_strings(const struct device_node *np,
 					    const char *propname)
 {
 	return of_property_read_string_helper(np, propname, NULL, 0, 0);
@@ -816,7 +816,7 @@ static inline int of_property_count_strings(struct device_node *np,
  *
  * The out_string pointer is modified only if a valid string can be decoded.
  */
-static inline int of_property_read_string_index(struct device_node *np,
+static inline int of_property_read_string_index(const struct device_node *np,
 						const char *propname,
 						int index, const char **output)
 {
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
