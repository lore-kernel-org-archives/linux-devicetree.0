From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH 1/1] devicetree: Document of_property_read_string_array() better
Date: Thu, 23 Feb 2017 23:40:19 +0200
Message-ID: <1487886019-25869-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

of_property_read_string_array() is documented to return the number of
strings present in a string array property if its target string buffer is
NULL. What is not documented, however, is that is returned if the buffer
is non-NULL. It returns the number of strings read. Document this.

Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 include/linux/of.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index d72f010..0579156 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -953,6 +953,7 @@ static inline int of_property_count_u64_elems(const struct device_node *np,
  * terminated string values (pointer to data, not a copy) in that property.
  *
  * If @out_strs is NULL, the number of strings in the property is returned.
+ * Otherwise, returns the number of strings read.
  */
 static inline int of_property_read_string_array(const struct device_node *np,
 						const char *propname, const char **out_strs,
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
