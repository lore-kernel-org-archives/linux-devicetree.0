From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/5] checks: add string list check for *-names properties
Date: Fri, 17 Nov 2017 08:45:13 -0600
Message-ID: <20171117144515.10870-4-robh@kernel.org>
References: <20171117144515.10870-1-robh@kernel.org>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117144515.10870-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a string list check for common properties ending in "-names" such as
reg-names or interrupt-names.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index 4e23f29486bb..346b0256f9cb 100644
--- a/checks.c
+++ b/checks.c
@@ -622,6 +622,21 @@ WARNING_IF_NOT_STRING(stdout_path_is_string, "stdout-path");
 
 WARNING_IF_NOT_STRING_LIST(compatible_is_string_list, "compatible");
 
+static void check_names_is_string_list(struct check *c, struct dt_info *dti,
+				       struct node *node)
+{
+	struct property *prop;
+
+	for_each_property(node, prop) {
+		if (!strstr(prop->name, "-names"))
+			continue;
+
+		c->data = prop->name;
+		check_is_string_list(c, dti, node);
+	}
+}
+WARNING(names_is_string_list, check_names_is_string_list, NULL);
+
 static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
 				  struct node *node)
 {
@@ -1273,7 +1288,7 @@ static struct check *check_table[] = {
 	&device_type_is_string, &model_is_string, &status_is_string,
 	&label_is_string, &bootargs_is_string, &stdout_path_is_string,
 
-	&compatible_is_string_list,
+	&compatible_is_string_list, &names_is_string_list,
 
 	&property_name_chars_strict,
 	&node_name_chars_strict,
-- 
2.14.1
