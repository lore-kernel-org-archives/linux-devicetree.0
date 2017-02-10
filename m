From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 1/4] checks: Add Warning for stricter property name character checking
Date: Fri, 10 Feb 2017 10:47:14 -0600
Message-ID: <20170210164717.1234-2-robh@kernel.org>
References: <20170210164717.1234-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170210164717.1234-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

While '?', '.', '+', '*', and '_' are considered valid characters their
use is discouraged in recommended practices. '#' is also only
recommended to be used at the beginning of property names.

Testing this found one typo error with '.' used instead of ','. The
rest of the warnings were all from underscores.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
v2:
- Disable check by default

 checks.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/checks.c b/checks.c
index 3d18e45374c8..22ef4748d7be 100644
--- a/checks.c
+++ b/checks.c
@@ -239,6 +239,7 @@ ERROR(duplicate_property_names, check_duplicate_property_names, NULL);
 #define UPPERCASE	"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
 #define DIGITS		"0123456789"
 #define PROPNODECHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
+#define PROPNODECHARSSTRICT	LOWERCASE UPPERCASE DIGITS ",-"

 static void check_node_name_chars(struct check *c, struct dt_info *dti,
 				  struct node *node)
@@ -299,6 +300,38 @@ static void check_property_name_chars(struct check *c, struct dt_info *dti,
 }
 ERROR(property_name_chars, check_property_name_chars, PROPNODECHARS);

+static void check_property_name_chars_strict(struct check *c,
+					     struct dt_info *dti,
+					     struct node *node)
+{
+	struct property *prop;
+
+	for_each_property(node, prop) {
+		const char *name = prop->name;
+		int n = strspn(name, c->data);
+
+		if (n == strlen(prop->name))
+			continue;
+
+		/* Certain names are whitelisted */
+		if (strcmp(name, "device_type") == 0)
+			continue;
+
+		/*
+		 * # is only allowed at the beginning of property names not counting
+		 * the vendor prefix.
+		 */
+		if (name[n] == '#' && ((n == 0) || (name[n-1] == ','))) {
+			name += n + 1;
+			n = strspn(name, c->data);
+		}
+		if (n < strlen(name))
+			FAIL(c, "Character '%c' not recommended in property name \"%s\", node %s",
+			     name[n], prop->name, node->fullpath);
+	}
+}
+CHECK(property_name_chars_strict, check_property_name_chars_strict, PROPNODECHARSSTRICT);
+
 #define DESCLABEL_FMT	"%s%s%s%s%s"
 #define DESCLABEL_ARGS(node,prop,mark)		\
 	((mark) ? "value of " : ""),		\
@@ -703,6 +736,8 @@ static struct check *check_table[] = {
 	&address_cells_is_cell, &size_cells_is_cell, &interrupt_cells_is_cell,
 	&device_type_is_string, &model_is_string, &status_is_string,

+	&property_name_chars_strict,
+
 	&addr_size_cells, &reg_format, &ranges_format,

 	&unit_address_vs_reg,
--
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
