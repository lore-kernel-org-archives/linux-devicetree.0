From: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] of: introduces helper to manage optional property
Date: Thu, 26 Dec 2013 13:18:35 +0800
Message-ID: <1388035115-893-1-git-send-email-Li.Xiubo@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Gets to know whether one optional property is present or not in one
device node. Returns true if the property is present, false otherwise.

There is one similar helper of_property_read_bool(), but it means that
the property is one boolen type. For many drivers, they need to know
whether one optional property is present or not firstly. Though many
other of_XX helper can do this before deal with it's real work, there
maybe other errors the driver need to deal with, and the errors maybe
the same with the property absent error. And this helper can make the
code briefer,more readable and easier to deal with.

Signed-off-by: Xiubo Li <Li.Xiubo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 include/linux/of.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 276c546..0bd8cb9 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -601,6 +601,23 @@ static inline int of_property_read_u32(const struct device_node *np,
 	return of_property_read_u32_array(np, propname, out_value, 1);
 }
 
+/**
+ * of_property_optional - Find one optional property
+ * @np:		device node from which the property to be searched.
+ * @propname:	name of the optional property to be searched for.
+ *
+ * Get to know whether one optional property is present or not in a
+ * device node.
+ * Returns true if the property is present, false otherwise.
+ */
+static inline bool of_property_optional(const struct device_node *np,
+					 const char *propname)
+{
+	struct property *prop = of_find_property(np, propname, NULL);
+
+	return prop ? true : false;
+}
+
 #define of_property_for_each_u32(np, propname, prop, p, u)	\
 	for (prop = of_find_property(np, propname, NULL),	\
 		p = of_prop_next_u32(prop, NULL, &u);		\
-- 
1.8.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
