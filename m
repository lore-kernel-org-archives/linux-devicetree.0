From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] dt: add of_get_property_value32 helper function
Date: Thu, 23 Jun 2011 11:38:33 -0500
Message-ID: <1308847113-5953-1-git-send-email-robherring2@gmail.com>
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
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

A common use of of_get_property in driver is to just get a 32-bit integer
value, but the interface is a bit complicated in that case. Add a helper
function that just fills in the value.

So something like this:

	int len;
	u32 blah;
	void *prop = of_get_property(node, "blah", &len);
	if (prop && len == sizeof(blah))
		blah = be32_to_cpup(prop);

can become:

	u32 blah;
	of_get_property_value32(node, "blah", &blah);

The caller can check the return value if the property is required to be
present.

Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
Grant,

I noticed most callers of of_get_property don't do be32_to_cpup on the
returned pointer. Most instances appear to be powerpc only drivers, but
should of_get_property return ptr be __be32?

Rob

 drivers/of/base.c  |   20 +++++++++++++++++++-
 include/linux/of.h |    9 +++++++++
 2 files changed, 28 insertions(+), 1 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 632ebae..58fe34e 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -186,7 +186,7 @@ EXPORT_SYMBOL(of_find_all_nodes);
 
 /*
  * Find a property with a given name for a given node
- * and return the value.
+ * and return a pointer to the value.
  */
 const void *of_get_property(const struct device_node *np, const char *name,
 			 int *lenp)
@@ -197,6 +197,24 @@ const void *of_get_property(const struct device_node *np, const char *name,
 }
 EXPORT_SYMBOL(of_get_property);
 
+/*
+ * Find a property with a given name for a given node
+ * and return the 32-bit integer value. Returns non-zero if property with
+ * valid length was found.
+ */
+int of_get_property_value32(const struct device_node *np, const char *name,
+			 u32 *valuep)
+{
+	int len;
+	u32 *p = of_get_property(np, name, &len);
+	if (!p || len != sizeof(*p))
+		return 0;
+
+	*value = be32_to_cpup(p);
+	return 1;
+}
+EXPORT_SYMBOL(of_get_property_value32);
+
 /** Checks if the given "compat" string matches one of the strings in
  * the device's "compatible" property
  */
diff --git a/include/linux/of.h b/include/linux/of.h
index bfc0ed1..fd10d37 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -201,6 +201,9 @@ extern int of_device_is_available(const struct device_node *device);
 extern const void *of_get_property(const struct device_node *node,
 				const char *name,
 				int *lenp);
+extern int of_get_property_value32(const struct device_node *node,
+				   const char *name,
+				   u32 *valuep);
 extern int of_n_addr_cells(struct device_node *np);
 extern int of_n_size_cells(struct device_node *np);
 extern const struct of_device_id *of_match_node(
@@ -234,5 +237,11 @@ static inline bool of_have_populated_dt(void)
 	return false;
 }
 
+static inline int of_get_property_value32(const struct device_node *node,
+					  const char *name, u32 *valuep)
+{
+	return 0;
+}
+
 #endif /* CONFIG_OF */
 #endif /* _LINUX_OF_H */
-- 
1.7.4.1
