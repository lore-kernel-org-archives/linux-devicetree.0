From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v9 1/4] checks: Pass boot_info to the check methods
Date: Thu, 24 Nov 2016 14:31:30 +0200
Message-ID: <1479990693-14260-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1479990693-14260-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479990693-14260-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, Grant Likely <glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jan Luebbe <jlu-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Phil Elwell <phil-FnsA7b+Nu9XbIbC87yuRow@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Devicetree Compiler <devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As preparation for overlay support we need to pass boot info
as an extra boot_info parameter to each check method.

No other functional changes are made.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 checks.c | 113 +++++++++++++++++++++++++++++++++------------------------------
 1 file changed, 59 insertions(+), 54 deletions(-)

diff --git a/checks.c b/checks.c
index 0381c98..609975a 100644
--- a/checks.c
+++ b/checks.c
@@ -40,7 +40,8 @@ enum checkstatus {
 
 struct check;
 
-typedef void (*check_fn)(struct check *c, struct node *dt, struct node *node);
+typedef void (*check_fn)(struct check *c, struct boot_info *bi,
+			 struct node *dt, struct node *node);
 
 struct check {
 	const char *name;
@@ -97,19 +98,20 @@ static inline void check_msg(struct check *c, const char *fmt, ...)
 		check_msg((c), __VA_ARGS__); \
 	} while (0)
 
-static void check_nodes_props(struct check *c, struct node *dt, struct node *node)
+static void check_nodes_props(struct check *c, struct boot_info *bi,
+			      struct node *dt, struct node *node)
 {
 	struct node *child;
 
 	TRACE(c, "%s", node->fullpath);
 	if (c->fn)
-		c->fn(c, dt, node);
+		c->fn(c, bi, dt, node);
 
 	for_each_child(node, child)
-		check_nodes_props(c, dt, child);
+		check_nodes_props(c, bi, dt, child);
 }
 
-static bool run_check(struct check *c, struct node *dt)
+static bool run_check(struct check *c, struct boot_info *bi, struct node *dt)
 {
 	bool error = false;
 	int i;
@@ -123,7 +125,7 @@ static bool run_check(struct check *c, struct node *dt)
 
 	for (i = 0; i < c->num_prereqs; i++) {
 		struct check *prq = c->prereq[i];
-		error = error || run_check(prq, dt);
+		error = error || run_check(prq, bi, dt);
 		if (prq->status != PASSED) {
 			c->status = PREREQ;
 			check_msg(c, "Failed prerequisite '%s'",
@@ -134,7 +136,7 @@ static bool run_check(struct check *c, struct node *dt)
 	if (c->status != UNCHECKED)
 		goto out;
 
-	check_nodes_props(c, dt, dt);
+	check_nodes_props(c, bi, dt, dt);
 
 	if (c->status == UNCHECKED)
 		c->status = PASSED;
@@ -153,15 +155,15 @@ out:
  */
 
 /* A check which always fails, for testing purposes only */
-static inline void check_always_fail(struct check *c, struct node *dt,
-				     struct node *node)
+static inline void check_always_fail(struct check *c, struct boot_info *bi,
+				     struct node *dt, struct node *node)
 {
 	FAIL(c, "always_fail check");
 }
 CHECK(always_fail, check_always_fail, NULL);
 
-static void check_is_string(struct check *c, struct node *root,
-			    struct node *node)
+static void check_is_string(struct check *c, struct boot_info *bi,
+			    struct node *root, struct node *node)
 {
 	struct property *prop;
 	char *propname = c->data;
@@ -179,8 +181,8 @@ static void check_is_string(struct check *c, struct node *root,
 #define ERROR_IF_NOT_STRING(nm, propname) \
 	ERROR(nm, check_is_string, (propname))
 
-static void check_is_cell(struct check *c, struct node *root,
-			  struct node *node)
+static void check_is_cell(struct check *c, struct boot_info *bi,
+			  struct node *root, struct node *node)
 {
 	struct property *prop;
 	char *propname = c->data;
@@ -202,8 +204,8 @@ static void check_is_cell(struct check *c, struct node *root,
  * Structural check functions
  */
 
-static void check_duplicate_node_names(struct check *c, struct node *dt,
-				       struct node *node)
+static void check_duplicate_node_names(struct check *c, struct boot_info *bi,
+				       struct node *dt, struct node *node)
 {
 	struct node *child, *child2;
 
@@ -217,8 +219,8 @@ static void check_duplicate_node_names(struct check *c, struct node *dt,
 }
 ERROR(duplicate_node_names, check_duplicate_node_names, NULL);
 
-static void check_duplicate_property_names(struct check *c, struct node *dt,
-					   struct node *node)
+static void check_duplicate_property_names(struct check *c, struct boot_info *bi,
+					   struct node *dt, struct node *node)
 {
 	struct property *prop, *prop2;
 
@@ -239,8 +241,8 @@ ERROR(duplicate_property_names, check_duplicate_property_names, NULL);
 #define DIGITS		"0123456789"
 #define PROPNODECHARS	LOWERCASE UPPERCASE DIGITS ",._+*#?-"
 
-static void check_node_name_chars(struct check *c, struct node *dt,
-				  struct node *node)
+static void check_node_name_chars(struct check *c, struct boot_info *bi,
+				  struct node *dt, struct node *node)
 {
 	int n = strspn(node->name, c->data);
 
@@ -250,8 +252,8 @@ static void check_node_name_chars(struct check *c, struct node *dt,
 }
 ERROR(node_name_chars, check_node_name_chars, PROPNODECHARS "@");
 
-static void check_node_name_format(struct check *c, struct node *dt,
-				   struct node *node)
+static void check_node_name_format(struct check *c, struct boot_info *bi,
+				   struct node *dt, struct node *node)
 {
 	if (strchr(get_unitname(node), '@'))
 		FAIL(c, "Node %s has multiple '@' characters in name",
@@ -259,8 +261,8 @@ static void check_node_name_format(struct check *c, struct node *dt,
 }
 ERROR(node_name_format, check_node_name_format, NULL, &node_name_chars);
 
-static void check_unit_address_vs_reg(struct check *c, struct node *dt,
-			     struct node *node)
+static void check_unit_address_vs_reg(struct check *c, struct boot_info *bi,
+				      struct node *dt, struct node *node)
 {
 	const char *unitname = get_unitname(node);
 	struct property *prop = get_property(node, "reg");
@@ -283,8 +285,8 @@ static void check_unit_address_vs_reg(struct check *c, struct node *dt,
 }
 WARNING(unit_address_vs_reg, check_unit_address_vs_reg, NULL);
 
-static void check_property_name_chars(struct check *c, struct node *dt,
-				      struct node *node)
+static void check_property_name_chars(struct check *c, struct boot_info *bi,
+				      struct node *dt, struct node *node)
 {
 	struct property *prop;
 
@@ -305,9 +307,10 @@ ERROR(property_name_chars, check_property_name_chars, PROPNODECHARS);
 	((prop) ? (prop)->name : ""), \
 	((prop) ? "' in " : ""), (node)->fullpath
 
-static void check_duplicate_label(struct check *c, struct node *dt,
-				  const char *label, struct node *node,
-				  struct property *prop, struct marker *mark)
+static void check_duplicate_label(struct check *c, struct boot_info *bi,
+				  struct node *dt, const char *label,
+				  struct node *node, struct property *prop,
+				  struct marker *mark)
 {
 	struct node *othernode = NULL;
 	struct property *otherprop = NULL;
@@ -331,29 +334,30 @@ static void check_duplicate_label(struct check *c, struct node *dt,
 		     DESCLABEL_ARGS(othernode, otherprop, othermark));
 }
 
-static void check_duplicate_label_node(struct check *c, struct node *dt,
-				       struct node *node)
+static void check_duplicate_label_node(struct check *c, struct boot_info *bi,
+				       struct node *dt, struct node *node)
 {
 	struct label *l;
 	struct property *prop;
 
 	for_each_label(node->labels, l)
-		check_duplicate_label(c, dt, l->label, node, NULL, NULL);
+		check_duplicate_label(c, bi, dt, l->label, node, NULL, NULL);
 
 	for_each_property(node, prop) {
 		struct marker *m = prop->val.markers;
 
 		for_each_label(prop->labels, l)
-			check_duplicate_label(c, dt, l->label, node, prop, NULL);
+			check_duplicate_label(c, bi, dt, l->label, node, prop, NULL);
 
 		for_each_marker_of_type(m, LABEL)
-			check_duplicate_label(c, dt, m->ref, node, prop, m);
+			check_duplicate_label(c, bi, dt, m->ref, node, prop, m);
 	}
 }
 ERROR(duplicate_label, check_duplicate_label_node, NULL);
 
-static cell_t check_phandle_prop(struct check *c, struct node *root,
-				 struct node *node, const char *propname)
+static cell_t check_phandle_prop(struct check *c, struct boot_info *bi,
+				 struct node *root, struct node *node,
+				 const char *propname)
 {
 	struct property *prop;
 	struct marker *m;
@@ -398,8 +402,8 @@ static cell_t check_phandle_prop(struct check *c, struct node *root,
 	return phandle;
 }
 
-static void check_explicit_phandles(struct check *c, struct node *root,
-				    struct node *node)
+static void check_explicit_phandles(struct check *c, struct boot_info *bi,
+				    struct node *root, struct node *node)
 {
 	struct node *other;
 	cell_t phandle, linux_phandle;
@@ -407,9 +411,9 @@ static void check_explicit_phandles(struct check *c, struct node *root,
 	/* Nothing should have assigned phandles yet */
 	assert(!node->phandle);
 
-	phandle = check_phandle_prop(c, root, node, "phandle");
+	phandle = check_phandle_prop(c, bi, root, node, "phandle");
 
-	linux_phandle = check_phandle_prop(c, root, node, "linux,phandle");
+	linux_phandle = check_phandle_prop(c, bi, root, node, "linux,phandle");
 
 	if (!phandle && !linux_phandle)
 		/* No valid phandles; nothing further to check */
@@ -433,8 +437,8 @@ static void check_explicit_phandles(struct check *c, struct node *root,
 }
 ERROR(explicit_phandles, check_explicit_phandles, NULL);
 
-static void check_name_properties(struct check *c, struct node *root,
-				  struct node *node)
+static void check_name_properties(struct check *c, struct boot_info *bi,
+				  struct node *root, struct node *node)
 {
 	struct property **pp, *prop = NULL;
 
@@ -467,8 +471,8 @@ ERROR(name_properties, check_name_properties, NULL, &name_is_string);
  * Reference fixup functions
  */
 
-static void fixup_phandle_references(struct check *c, struct node *dt,
-				     struct node *node)
+static void fixup_phandle_references(struct check *c, struct boot_info *bi,
+				     struct node *dt, struct node *node)
 {
 	struct property *prop;
 
@@ -495,8 +499,8 @@ static void fixup_phandle_references(struct check *c, struct node *dt,
 ERROR(phandle_references, fixup_phandle_references, NULL,
       &duplicate_node_names, &explicit_phandles);
 
-static void fixup_path_references(struct check *c, struct node *dt,
-				  struct node *node)
+static void fixup_path_references(struct check *c, struct boot_info *bi,
+				  struct node *dt, struct node *node)
 {
 	struct property *prop;
 
@@ -534,8 +538,8 @@ WARNING_IF_NOT_STRING(device_type_is_string, "device_type");
 WARNING_IF_NOT_STRING(model_is_string, "model");
 WARNING_IF_NOT_STRING(status_is_string, "status");
 
-static void fixup_addr_size_cells(struct check *c, struct node *dt,
-				  struct node *node)
+static void fixup_addr_size_cells(struct check *c, struct boot_info *bi,
+				  struct node *dt, struct node *node)
 {
 	struct property *prop;
 
@@ -558,8 +562,8 @@ WARNING(addr_size_cells, fixup_addr_size_cells, NULL,
 #define node_size_cells(n) \
 	(((n)->size_cells == -1) ? 1 : (n)->size_cells)
 
-static void check_reg_format(struct check *c, struct node *dt,
-			     struct node *node)
+static void check_reg_format(struct check *c, struct boot_info *bi,
+			     struct node *dt, struct node *node)
 {
 	struct property *prop;
 	int addr_cells, size_cells, entrylen;
@@ -587,8 +591,8 @@ static void check_reg_format(struct check *c, struct node *dt,
 }
 WARNING(reg_format, check_reg_format, NULL, &addr_size_cells);
 
-static void check_ranges_format(struct check *c, struct node *dt,
-				struct node *node)
+static void check_ranges_format(struct check *c, struct boot_info *bi,
+				struct node *dt, struct node *node)
 {
 	struct property *prop;
 	int c_addr_cells, p_addr_cells, c_size_cells, p_size_cells, entrylen;
@@ -631,8 +635,8 @@ WARNING(ranges_format, check_ranges_format, NULL, &addr_size_cells);
 /*
  * Style checks
  */
-static void check_avoid_default_addr_size(struct check *c, struct node *dt,
-					  struct node *node)
+static void check_avoid_default_addr_size(struct check *c, struct boot_info *bi,
+					  struct node *dt, struct node *node)
 {
 	struct property *reg, *ranges;
 
@@ -657,6 +661,7 @@ WARNING(avoid_default_addr_size, check_avoid_default_addr_size, NULL,
 	&addr_size_cells);
 
 static void check_obsolete_chosen_interrupt_controller(struct check *c,
+						       struct boot_info *bi,
 						       struct node *dt,
 						       struct node *node)
 {
@@ -773,7 +778,7 @@ void process_checks(bool force, struct boot_info *bi)
 		struct check *c = check_table[i];
 
 		if (c->warn || c->error)
-			error = error || run_check(c, dt);
+			error = error || run_check(c, bi, dt);
 	}
 
 	if (error) {
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
