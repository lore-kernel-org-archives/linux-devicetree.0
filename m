From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] of: match by compatible property first
Date: Fri, 20 Apr 2012 12:21:52 +0200
Message-ID: <1334917312-21192-1-git-send-email-thierry.reding@avionic-design.de>
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
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When matching devices against an OF device ID table, the first string of
the compatible property that is listed in the table should match,
regardless of its position in the table.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 drivers/of/base.c  |   31 +++++++++++++++++++++++++++----
 include/linux/of.h |    3 +++
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d9bfd49..db355b7 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -511,6 +511,23 @@ out:
 }
 EXPORT_SYMBOL(of_find_node_with_property);
 
+const struct of_device_id *of_match_compat(const struct of_device_id *matches,
+					   const char *compat)
+{
+	while (matches->name[0] || matches->type[0] || matches->compatible[0]) {
+		const char *cp = matches->compatible;
+		int len = strlen(cp);
+
+		if (len > 0 && of_compat_cmp(compat, cp, len) == 0)
+			return matches;
+
+		matches++;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(of_match_compat);
+
 /**
  * of_match_node - Tell if an device_node has a matching of_match structure
  *	@matches:	array of of device match structures to search in
@@ -521,9 +538,18 @@ EXPORT_SYMBOL(of_find_node_with_property);
 const struct of_device_id *of_match_node(const struct of_device_id *matches,
 					 const struct device_node *node)
 {
+	struct property *prop;
+	const char *cp;
+
 	if (!matches)
 		return NULL;
 
+	of_property_for_each_string(node, "compatible", prop, cp) {
+		const struct of_device_id *match = of_match_compat(matches, cp);
+		if (match)
+			return match;
+	}
+
 	while (matches->name[0] || matches->type[0] || matches->compatible[0]) {
 		int match = 1;
 		if (matches->name[0])
@@ -532,10 +558,7 @@ const struct of_device_id *of_match_node(const struct of_device_id *matches,
 		if (matches->type[0])
 			match &= node->type
 				&& !strcmp(matches->type, node->type);
-		if (matches->compatible[0])
-			match &= of_device_is_compatible(node,
-						matches->compatible);
-		if (match)
+		if (match && !matches->compatible[0])
 			return matches;
 		matches++;
 	}
diff --git a/include/linux/of.h b/include/linux/of.h
index bd52d83..23b5061 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -231,6 +231,8 @@ extern const void *of_get_property(const struct device_node *node,
 
 extern int of_n_addr_cells(struct device_node *np);
 extern int of_n_size_cells(struct device_node *np);
+extern const struct of_device_id *of_match_compat(
+	const struct of_device_id *matches, const char *compat);
 extern const struct of_device_id *of_match_node(
 	const struct of_device_id *matches, const struct device_node *node);
 extern int of_modalias_node(struct device_node *node, char *modalias, int len);
@@ -395,6 +397,7 @@ static inline int of_machine_is_compatible(const char *compat)
 }
 
 #define of_match_ptr(_ptr)	NULL
+#define of_match_compat(_matches, _compat)	NULL
 #define of_match_node(_matches, _node)	NULL
 #define of_property_for_each_u32(np, propname, prop, p, u) \
 	while (0)
-- 
1.7.10
