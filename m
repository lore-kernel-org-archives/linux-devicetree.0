From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] of: Empty node & property flag accessors when !OF
Date: Wed, 21 Jan 2015 19:05:57 +0200
Message-ID: <1421859957-24457-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduce empty node and property flag accessors when CONFIG_OF is not
defined.
This allows us to use them without ifdef'ing them in places where it
makes sense to do so.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 include/linux/of.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index dfde07e..7ede449 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -616,6 +616,38 @@ static inline const char *of_prop_next_string(struct property *prop,
 	return NULL;
 }
 
+static inline int of_node_check_flag(struct device_node *n, unsigned long flag)
+{
+	return 0;
+}
+
+static inline int of_node_test_and_set_flag(struct device_node *n,
+					    unsigned long flag)
+{
+	return 0;
+}
+
+static inline void of_node_set_flag(struct device_node *n, unsigned long flag)
+{
+}
+
+static inline void of_node_clear_flag(struct device_node *n, unsigned long flag)
+{
+}
+
+static inline int of_property_check_flag(struct property *p, unsigned long flag)
+{
+	return 0;
+}
+
+static inline void of_property_set_flag(struct property *p, unsigned long flag)
+{
+}
+
+static inline void of_property_clear_flag(struct property *p, unsigned long flag)
+{
+}
+
 #define of_match_ptr(_ptr)	NULL
 #define of_match_node(_matches, _node)	NULL
 #endif /* CONFIG_OF */
-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
