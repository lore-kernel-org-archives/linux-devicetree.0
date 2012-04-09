From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/1 v3] dt: add property iteration helpers
Date: Mon,  9 Apr 2012 12:46:14 +0200
Message-ID: <1333968374-28451-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

This patch adds macros of_property_for_each_u32() and
of_property_for_each_string(), which iterate over an array of values
within a device-tree property. Usage is for example:

struct property *prop;
const __be32 *p;
u32 u;
of_property_for_each_u32(np, "propname", prop, p, u)
	printk("U32 value: %x\n", u);

struct property *prop;
const char *s;
of_property_for_each_string(np, "propname", prop, s)
	printk("String value: %s\n", s);

Based on work by Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
---
I need it for at91 for the interrupt controller
and pinctrl

Best Regards,
J.
 drivers/of/base.c  |   41 +++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 90 insertions(+), 0 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 5806449..d9bfd49 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1260,3 +1260,44 @@ int of_alias_get_id(struct device_node *np, const char *stem)
 	return id;
 }
 EXPORT_SYMBOL_GPL(of_alias_get_id);
+
+const __be32 *of_prop_next_u32(struct property *prop, const __be32 *cur,
+			       u32 *pu)
+{
+	const void *curv = cur;
+
+	if (!prop)
+		return NULL;
+
+	if (!cur) {
+		curv = prop->value;
+		goto out_val;
+	}
+
+	curv += sizeof(*cur);
+	if (curv >= prop->value + prop->length)
+		return NULL;
+
+out_val:
+	*pu = be32_to_cpup(curv);
+	return curv;
+}
+EXPORT_SYMBOL_GPL(of_prop_next_u32);
+
+const char *of_prop_next_string(struct property *prop, const char *cur)
+{
+	const void *curv = cur;
+
+	if (!prop)
+		return NULL;
+
+	if (!cur)
+		return prop->value;
+
+	curv += strlen(cur) + 1;
+	if (curv >= prop->value + prop->length)
+		return NULL;
+
+	return curv;
+}
+EXPORT_SYMBOL_GPL(of_prop_next_string);
diff --git a/include/linux/of.h b/include/linux/of.h
index fa7fb1d..5d23f6d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -259,6 +259,37 @@ extern void of_detach_node(struct device_node *);
 #endif
 
 #define of_match_ptr(_ptr)	(_ptr)
+extern const __be32 *of_prop_next_u32(struct property *prop,
+				      const __be32 *cur, u32 *pu);
+extern const char *of_prop_next_string(struct property *prop, const char *cur);
+
+/*
+ * struct property *prop;
+ * const __be32 *p;
+ * u32 u;
+ *
+ * of_property_for_each_u32(np, "propname", prop, p, u)
+ *         printk("U32 value: %x\n", u);
+ */
+#define of_property_for_each_u32(np, propname, prop, p, u)	\
+	for (prop = of_find_property(np, propname, NULL),	\
+		p = of_prop_next_u32(prop, NULL, &u);		\
+		p;						\
+		p = of_prop_next_u32(prop, p, &u))
+
+/*
+ * struct property *prop;
+ * const char *s;
+ *
+ * of_property_for_each_string(np, "propname", prop, s)
+ *         printk("String value: %s\n", s);
+ */
+#define of_property_for_each_string(np, propname, prop, s)	\
+	for (prop = of_find_property(np, propname, NULL),	\
+		s = of_prop_next_string(prop, NULL);		\
+		s;						\
+		s = of_prop_next_string(prop, s))
+
 #else /* CONFIG_OF */
 
 static inline bool of_have_populated_dt(void)
@@ -349,6 +380,24 @@ static inline int of_machine_is_compatible(const char *compat)
 
 #define of_match_ptr(_ptr)	NULL
 #define of_match_node(_matches, _node)	NULL
+
+static inline const __be32 *of_prop_next_u32(struct property *prop,
+					     const __be32 *cur, u32 *pu)
+{
+	return NULL;
+}
+
+static inline const char *of_prop_next_string(struct property *prop,
+					      const char *cur)
+{
+	return NULL;
+}
+
+#define of_property_for_each_u32(np, propname, prop, p, u)	\
+	while (0)
+
+#define of_property_for_each_string(np, propname, prop, s)	\
+	while (0)
 #endif /* CONFIG_OF */
 
 /**
-- 
1.7.9.1
