From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 5/5] checks: add aliases node checks
Date: Fri, 17 Nov 2017 08:45:15 -0600
Message-ID: <20171117144515.10870-6-robh@kernel.org>
References: <20171117144515.10870-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117144515.10870-1-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add checks for aliases node that properties are a valid path and that the
alias property names are a known, standard name.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 checks.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/checks.c b/checks.c
index a785b81bea07..2c5b6c2eacb3 100644
--- a/checks.c
+++ b/checks.c
@@ -637,6 +637,48 @@ static void check_names_is_string_list(struct check *c, struct dt_info *dti,
 }
 WARNING(names_is_string_list, check_names_is_string_list, NULL);
 
+static void check_alias_paths(struct check *c, struct dt_info *dti,
+				    struct node *node)
+{
+	struct property *prop;
+
+	if (!streq(node->name, "aliases"))
+		return;
+
+	for_each_property(node, prop) {
+		if (!prop->val.val || !get_node_by_path(dti->dt, prop->val.val))
+			FAIL(c, dti, "aliases property '%s' is not a valid node (%s)",
+			     prop->name, prop->val.val);
+	}
+}
+WARNING(alias_paths, check_alias_paths, NULL);
+
+static void check_known_aliases(struct check *c, struct dt_info *dti,
+				    struct node *node)
+{
+	int i;
+	struct property *prop;
+	static char *aliases_strings[] = {
+		"ethernet", "gpio", "i2c", "rtc", "serial", "spi"
+	};
+
+	if (!streq(node->name, "aliases"))
+		return;
+
+	for_each_property(node, prop) {
+		for (i = 0; i < ARRAY_SIZE(aliases_strings); i++) {
+			if (strstarts(prop->name, aliases_strings[i]))
+				break;
+		}
+
+		if (i == ARRAY_SIZE(aliases_strings)) {
+			FAIL(c, dti, "unknown alias name %s", prop->name);
+			continue;
+		}
+	}
+}
+WARNING(known_aliases, check_known_aliases, NULL);
+
 static void fixup_addr_size_cells(struct check *c, struct dt_info *dti,
 				  struct node *node)
 {
@@ -1355,6 +1397,8 @@ static struct check *check_table[] = {
 	&gpios_property,
 	&interrupts_property,
 
+	&known_aliases,	&alias_paths,
+
 	&always_fail,
 };
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
