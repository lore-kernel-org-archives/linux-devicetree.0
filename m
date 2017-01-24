From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/5] checks: Add Warning for stricter node name character checking
Date: Tue, 24 Jan 2017 11:45:31 -0600
Message-ID: <20170124174534.3865-3-robh@kernel.org>
References: <20170124174534.3865-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170124174534.3865-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

While '#', '?', '.', '+', '*', and '_' are considered valid characters,
their use is discouraged in recommended practices.

Testing this found a few cases of '.'. The majority of the warnings were
all from underscores.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/checks.c b/checks.c
index a0d4a9d968d7..0c78d69316bc 100644
--- a/checks.c
+++ b/checks.c
@@ -252,6 +252,17 @@ static void check_node_name_chars(struct check *c, struct dt_info *dti,
 }
 ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
 
+static void check_node_name_chars_strict(struct check *c, struct dt_info *dti,
+					 struct node *node)
+{
+	int n = strspn(node->name, c->data);
+
+	if (n < node->basenamelen)
+		FAIL(c, "Character '%c' not recommended in node %s",
+		     node->name[n], node->fullpath);
+}
+WARNING(node_name_chars_strict, check_node_name_chars_strict, PROPNODECHARSSTRICT);
+
 static void check_node_name_format(struct check *c, struct dt_info *dti,
 				   struct node *node)
 {
@@ -737,6 +748,7 @@ static struct check *check_table[] = {
 	&device_type_is_string, &model_is_string, &status_is_string,
 
 	&property_name_chars_strict,
+	&node_name_chars_strict,
 
 	&addr_size_cells, &reg_format, &ranges_format,
 
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
