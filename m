From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V2] dtc: Add ability to delete nodes and properties
Date: Tue, 12 Jun 2012 17:10:20 -0600
Message-ID: <1339542620-24590-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

dtc currently allows the contents of properties to be changed, and the
contents of nodes to be added to. There are situations where removing
properties or nodes may be useful. This change implements the following
syntax to do that:

    / {
        propname /delprop/;
        nodename /delnode/;
    };

or:

    &noderef /delnode/;

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v2: Implemented in a significantly different fashion: Rather than actually
deleting nodes/properties as the DT is parsed, simply mark them deleted,
and skip deleted nodes during later processing. This allows implementation
without needing rework of various error-checks, such as duplicate labels.

 checks.c                                       |   37 ++++++--
 dtc-lexer.l                                    |   12 ++
 dtc-parser.y                                   |   21 ++++
 dtc.h                                          |   10 ++
 flattree.c                                     |   12 ++
 livetree.c                                     |  130 ++++++++++++++++++++++--
 tests/run_tests.sh                             |    4 +
 tests/test_tree1.dts                           |   37 +-------
 tests/{test_tree1.dts => test_tree1_body.dtsi} |    2 -
 tests/test_tree1_delete.dts                    |   68 ++++++++++++
 10 files changed, 281 insertions(+), 52 deletions(-)
 copy tests/{test_tree1.dts => test_tree1_body.dtsi} (98%)
 create mode 100644 tests/test_tree1_delete.dts

diff --git a/checks.c b/checks.c
index a662a00..23a30ae 100644
--- a/checks.c
+++ b/checks.c
@@ -122,12 +122,17 @@ static void check_nodes_props(struct check *c, struct node *dt, struct node *nod
 
 	if (c->prop_fn)
 		for_each_property(node, prop) {
+			if (prop->deleted)
+				continue;
 			TRACE(c, "%s\t'%s'", node->fullpath, prop->name);
 			c->prop_fn(c, dt, node, prop);
 		}
 
-	for_each_child(node, child)
+	for_each_child(node, child) {
+		if (child->deleted)
+			continue;
 		check_nodes_props(c, dt, child);
+	}
 }
 
 static int run_check(struct check *c, struct node *dt)
@@ -219,13 +224,19 @@ static void check_duplicate_node_names(struct check *c, struct node *dt,
 {
 	struct node *child, *child2;
 
-	for_each_child(node, child)
+	for_each_child(node, child) {
+		if (child->deleted)
+			continue;
 		for (child2 = child->next_sibling;
 		     child2;
-		     child2 = child2->next_sibling)
+		     child2 = child2->next_sibling) {
+			if (child2->deleted)
+				continue;
 			if (streq(child->name, child2->name))
 				FAIL(c, "Duplicate node name %s",
 				     child->fullpath);
+		}
+	}
 }
 NODE_CHECK(duplicate_node_names, NULL, ERROR);
 
@@ -234,11 +245,17 @@ static void check_duplicate_property_names(struct check *c, struct node *dt,
 {
 	struct property *prop, *prop2;
 
-	for_each_property(node, prop)
-		for (prop2 = prop->next; prop2; prop2 = prop2->next)
+	for_each_property(node, prop) {
+		if (prop->deleted)
+			continue;
+		for (prop2 = prop->next; prop2; prop2 = prop2->next) {
+			if (prop2->deleted)
+				continue;
 			if (streq(prop->name, prop2->name))
 				FAIL(c, "Duplicate property name %s in %s",
 				     prop->name, node->fullpath);
+		}
+	}
 }
 NODE_CHECK(duplicate_property_names, NULL, ERROR);
 
@@ -316,8 +333,11 @@ static void check_duplicate_label_node(struct check *c, struct node *dt,
 {
 	struct label *l;
 
-	for_each_label(node->labels, l)
+	for_each_label(node->labels, l) {
+		if (l->deleted)
+			continue;
 		check_duplicate_label(c, dt, l->label, node, NULL, NULL);
+	}
 }
 static void check_duplicate_label_prop(struct check *c, struct node *dt,
 				       struct node *node, struct property *prop)
@@ -325,8 +345,11 @@ static void check_duplicate_label_prop(struct check *c, struct node *dt,
 	struct marker *m = prop->val.markers;
 	struct label *l;
 
-	for_each_label(prop->labels, l)
+	for_each_label(prop->labels, l) {
+		if (l->deleted)
+			continue;
 		check_duplicate_label(c, dt, l->label, node, prop, NULL);
+	}
 
 	for_each_marker_of_type(m, LABEL)
 		check_duplicate_label(c, dt, m->ref, node, prop, m);
diff --git a/dtc-lexer.l b/dtc-lexer.l
index 4715f31..0d54b60 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -103,6 +103,18 @@ static int pop_input_file(void);
 			return DT_BITS;
 		}
 
+<*>"/delprop/"	{
+			DPRINT("Keyword: /delprop/\n");
+			BEGIN_DEFAULT();
+			return DT_DEL_PROP;
+		}
+
+<*>"/delnode/"	{
+			DPRINT("Keyword: /delnode/\n");
+			BEGIN_DEFAULT();
+			return DT_DEL_NODE;
+		}
+
 <*>{LABEL}:	{
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
diff --git a/dtc-parser.y b/dtc-parser.y
index 6d5c2c2..735b657 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -62,6 +62,8 @@ static unsigned char eval_char_literal(const char *s);
 %token DT_MEMRESERVE
 %token DT_LSHIFT DT_RSHIFT DT_LE DT_GE DT_EQ DT_NE DT_AND DT_OR
 %token DT_BITS
+%token DT_DEL_PROP
+%token DT_DEL_NODE
 %token <propnodename> DT_PROPNODENAME
 %token <literal> DT_LITERAL
 %token <literal> DT_CHAR_LITERAL
@@ -153,6 +155,17 @@ devicetree:
 				print_error("label or path, '%s', not found", $2);
 			$$ = $1;
 		}
+	| devicetree DT_REF DT_DEL_NODE ';'
+		{
+			struct node *target = get_node_by_ref($1, $2);
+
+			if (!target)
+				print_error("label or path, '%s', not found", $2);
+			else
+				delete_node(target);
+
+			$$ = $1;
+		}
 	;
 
 nodedef:
@@ -182,6 +195,10 @@ propdef:
 		{
 			$$ = build_property($1, empty_data);
 		}
+	| DT_PROPNODENAME DT_DEL_PROP ';'
+		{
+			$$ = build_property_delete($1);
+		}
 	| DT_LABEL propdef
 		{
 			add_label(&$2->labels, $1);
@@ -440,6 +457,10 @@ subnode:
 		{
 			$$ = name_node($2, $1);
 		}
+	| DT_PROPNODENAME DT_DEL_NODE ';'
+		{
+			$$ = name_node(build_node_delete(), $1);
+		}
 	| DT_LABEL subnode
 		{
 			add_label(&$2->labels, $1);
diff --git a/dtc.h b/dtc.h
index 7b4c65b..67c3ed0 100644
--- a/dtc.h
+++ b/dtc.h
@@ -127,11 +127,13 @@ int data_is_one_string(struct data d);
 
 /* Live trees */
 struct label {
+	int deleted;
 	char *label;
 	struct label *next;
 };
 
 struct property {
+	int deleted;
 	char *name;
 	struct data val;
 
@@ -141,6 +143,7 @@ struct property {
 };
 
 struct node {
+	int deleted;
 	char *name;
 	struct property *proplist;
 	struct node *children;
@@ -167,18 +170,25 @@ struct node {
 	for ((c) = (n)->children; (c); (c) = (c)->next_sibling)
 
 void add_label(struct label **labels, char *label);
+void delete_labels(struct label **labels);
 
 struct property *build_property(char *name, struct data val);
+struct property *build_property_delete(char *name);
 struct property *chain_property(struct property *first, struct property *list);
 struct property *reverse_properties(struct property *first);
 
 struct node *build_node(struct property *proplist, struct node *children);
+struct node *build_node_delete(void);
 struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
 struct node *merge_nodes(struct node *old_node, struct node *new_node);
 
 void add_property(struct node *node, struct property *prop);
+void delete_property_by_name(struct node *node, char *name);
+void delete_property(struct property *prop);
 void add_child(struct node *parent, struct node *child);
+void delete_node_by_name(struct node *parent, char *name);
+void delete_node(struct node *node);
 
 const char *get_unitname(struct node *node);
 struct property *get_property(struct node *node, const char *propname);
diff --git a/flattree.c b/flattree.c
index 28d0b23..7448304 100644
--- a/flattree.c
+++ b/flattree.c
@@ -197,6 +197,8 @@ static void asm_emit_beginnode(void *e, struct label *labels)
 	struct label *l;
 
 	for_each_label(labels, l) {
+		if (l->deleted)
+			continue;
 		fprintf(f, "\t.globl\t%s\n", l->label);
 		fprintf(f, "%s:\n", l->label);
 	}
@@ -212,6 +214,8 @@ static void asm_emit_endnode(void *e, struct label *labels)
 	fprintf(f, "\t/* FDT_END_NODE */\n");
 	asm_emit_cell(e, FDT_END_NODE);
 	for_each_label(labels, l) {
+		if (l->deleted)
+			continue;
 		fprintf(f, "\t.globl\t%s_end\n", l->label);
 		fprintf(f, "%s_end:\n", l->label);
 	}
@@ -223,6 +227,8 @@ static void asm_emit_property(void *e, struct label *labels)
 	struct label *l;
 
 	for_each_label(labels, l) {
+		if (l->deleted)
+			continue;
 		fprintf(f, "\t.globl\t%s\n", l->label);
 		fprintf(f, "%s:\n", l->label);
 	}
@@ -263,6 +269,9 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 	struct node *child;
 	int seen_name_prop = 0;
 
+	if (tree->deleted)
+		return;
+
 	emit->beginnode(etarget, tree->labels);
 
 	if (vi->flags & FTF_FULLPATH)
@@ -275,6 +284,9 @@ static void flatten_tree(struct node *tree, struct emitter *emit,
 	for_each_property(tree, prop) {
 		int nameoff;
 
+		if (prop->deleted)
+			continue;
+
 		if (streq(prop->name, "name"))
 			seen_name_prop = 1;
 
diff --git a/livetree.c b/livetree.c
index c9209d5..9c93529 100644
--- a/livetree.c
+++ b/livetree.c
@@ -29,9 +29,12 @@ void add_label(struct label **labels, char *label)
 	struct label *new;
 
 	/* Make sure the label isn't already there */
-	for_each_label(*labels, new)
-		if (streq(new->label, label))
+	for_each_label(*labels, new) {
+		if (streq(new->label, label)) {
+			new->deleted = 0;
 			return;
+		}
+	}
 
 	new = xmalloc(sizeof(*new));
 	new->label = label;
@@ -39,6 +42,14 @@ void add_label(struct label **labels, char *label)
 	*labels = new;
 }
 
+void delete_labels(struct label **labels)
+{
+	struct label *label;
+
+	for_each_label(*labels, label)
+		label->deleted = 1;
+}
+
 struct property *build_property(char *name, struct data val)
 {
 	struct property *new = xmalloc(sizeof(*new));
@@ -51,6 +62,18 @@ struct property *build_property(char *name, struct data val)
 	return new;
 }
 
+struct property *build_property_delete(char *name)
+{
+	struct property *new = xmalloc(sizeof(*new));
+
+	memset(new, 0, sizeof(*new));
+
+	new->name = name;
+	new->deleted = 1;
+
+	return new;
+}
+
 struct property *chain_property(struct property *first, struct property *list)
 {
 	assert(first->next == NULL);
@@ -91,6 +114,17 @@ struct node *build_node(struct property *proplist, struct node *children)
 	return new;
 }
 
+struct node *build_node_delete(void)
+{
+	struct node *new = xmalloc(sizeof(*new));
+
+	memset(new, 0, sizeof(*new));
+
+	new->deleted = 1;
+
+	return new;
+}
+
 struct node *name_node(struct node *node, char *name)
 {
 	assert(node->name == NULL);
@@ -106,6 +140,8 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 	struct node *new_child, *old_child;
 	struct label *l;
 
+	old_node->deleted = 0;
+
 	/* Add new node labels to old node */
 	for_each_label(new_node->labels, l)
 		add_label(&old_node->labels, l->label);
@@ -118,6 +154,12 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 		new_node->proplist = new_prop->next;
 		new_prop->next = NULL;
 
+		if (new_prop->deleted) {
+			delete_property_by_name(old_node, new_prop->name);
+			free(new_prop);
+			continue;
+		}
+
 		/* Look for a collision, set new value if there is */
 		for_each_property(old_node, old_prop) {
 			if (streq(old_prop->name, new_prop->name)) {
@@ -126,6 +168,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 					add_label(&old_prop->labels, l->label);
 
 				old_prop->val = new_prop->val;
+				old_prop->deleted = 0;
 				free(new_prop);
 				new_prop = NULL;
 				break;
@@ -146,6 +189,12 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 		new_child->parent = NULL;
 		new_child->next_sibling = NULL;
 
+		if (new_child->deleted) {
+			delete_node_by_name(old_node, new_child->name);
+			free(new_child);
+			continue;
+		}
+
 		/* Search for a collision.  Merge if there is */
 		for_each_child(old_node, old_child) {
 			if (streq(old_child->name, new_child->name)) {
@@ -188,6 +237,25 @@ void add_property(struct node *node, struct property *prop)
 	*p = prop;
 }
 
+void delete_property_by_name(struct node *node, char *name)
+{
+	struct property *prop = node->proplist;
+
+	while (prop) {
+		if (!strcmp(prop->name, name)) {
+			delete_property(prop);
+			return;
+		}
+		prop = prop->next;
+	}
+}
+
+void delete_property(struct property *prop)
+{
+	prop->deleted = 1;
+	delete_labels(&prop->labels);
+}
+
 void add_child(struct node *parent, struct node *child)
 {
 	struct node **p;
@@ -202,6 +270,32 @@ void add_child(struct node *parent, struct node *child)
 	*p = child;
 }
 
+void delete_node_by_name(struct node *parent, char *name)
+{
+	struct node *node = parent->children;
+
+	while (node) {
+		if (!strcmp(node->name, name)) {
+			delete_node(node);
+			return;
+		}
+		node = node->next_sibling;
+	}
+}
+
+void delete_node(struct node *node)
+{
+	struct property *prop;
+	struct node *child;
+
+	node->deleted = 1;
+	for_each_child(node, child)
+		delete_node(child);
+	for_each_property(node, prop)
+		delete_property(prop);
+	delete_labels(&node->labels);
+}
+
 struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
 {
 	struct reserve_info *new = xmalloc(sizeof(*new));
@@ -270,9 +364,12 @@ struct property *get_property(struct node *node, const char *propname)
 {
 	struct property *prop;
 
-	for_each_property(node, prop)
+	for_each_property(node, prop) {
+		if (prop->deleted)
+			return NULL;
 		if (streq(prop->name, propname))
 			return prop;
+	}
 
 	return NULL;
 }
@@ -294,6 +391,9 @@ struct property *get_property_by_label(struct node *tree, const char *label,
 	for_each_property(tree, prop) {
 		struct label *l;
 
+		if (prop->deleted)
+			continue;
+
 		for_each_label(prop->labels, l)
 			if (streq(l->label, label))
 				return prop;
@@ -319,6 +419,8 @@ struct marker *get_marker_label(struct node *tree, const char *label,
 	*node = tree;
 
 	for_each_property(tree, p) {
+		if (p->deleted)
+			continue;
 		*prop = p;
 		m = p->val.markers;
 		for_each_marker_of_type(m, LABEL)
@@ -341,9 +443,12 @@ struct node *get_subnode(struct node *node, const char *nodename)
 {
 	struct node *child;
 
-	for_each_child(node, child)
+	for_each_child(node, child) {
+		if (child->deleted)
+			continue;
 		if (streq(child->name, nodename))
 			return child;
+	}
 
 	return NULL;
 }
@@ -353,8 +458,11 @@ struct node *get_node_by_path(struct node *tree, const char *path)
 	const char *p;
 	struct node *child;
 
-	if (!path || ! (*path))
+	if (!path || ! (*path)) {
+		if (tree->deleted)
+			return NULL;
 		return tree;
+	}
 
 	while (path[0] == '/')
 		path++;
@@ -362,6 +470,8 @@ struct node *get_node_by_path(struct node *tree, const char *path)
 	p = strchr(path, '/');
 
 	for_each_child(tree, child) {
+		if (child->deleted)
+			continue;
 		if (p && strneq(path, child->name, p-path))
 			return get_node_by_path(child, p+1);
 		else if (!p && streq(path, child->name))
@@ -378,9 +488,12 @@ struct node *get_node_by_label(struct node *tree, const char *label)
 
 	assert(label && (strlen(label) > 0));
 
-	for_each_label(tree->labels, l)
+	for_each_label(tree->labels, l) {
+		if (l->deleted)
+			continue;
 		if (streq(l->label, label))
 			return tree;
+	}
 
 	for_each_child(tree, child) {
 		node = get_node_by_label(child, label);
@@ -397,8 +510,11 @@ struct node *get_node_by_phandle(struct node *tree, cell_t phandle)
 
 	assert((phandle != 0) && (phandle != -1));
 
-	if (tree->phandle == phandle)
+	if (tree->phandle == phandle) {
+		if (tree->deleted)
+			return NULL;
 		return tree;
+	}
 
 	for_each_child(tree, child) {
 		node = get_node_by_phandle(child, phandle);
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e0299e3..f9d8771 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -367,6 +367,10 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_tree1_merge_path.test.dtb test_tree1_merge_path.dts
     tree1_tests dtc_tree1_merge_path.test.dtb test_tree1.dtb
 
+    # Check prop/node delete functionality
+    run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb test_tree1_delete.dts
+    tree1_tests dtc_tree1_delete.test.dtb
+
     # Check some checks
     check_tests dup-nodename.dts duplicate_node_names
     check_tests dup-propname.dts duplicate_property_names
diff --git a/tests/test_tree1.dts b/tests/test_tree1.dts
index cf530ce..c7b170c 100644
--- a/tests/test_tree1.dts
+++ b/tests/test_tree1.dts
@@ -1,38 +1,3 @@
 /dts-v1/;
 
-/memreserve/ 0xdeadbeef00000000 0x100000;
-/memreserve/ 123456789 010000;
-
-/ {
-	compatible = "test_tree1";
-	prop-int = <0xdeadbeef>;
-	prop-int64 = /bits/ 64 <0xdeadbeef01abcdef>;
-	prop-str = "hello world";
-
-	subnode@1 {
-		compatible = "subnode1";
-		prop-int = [deadbeef];
-
-		subsubnode {
-			compatible = "subsubnode1", "subsubnode";
-			prop-int = <0xdeadbeef>;
-		};
-
-		ss1 {
-		};
-	};
-
-	subnode@2 {
-		linux,phandle = <0x2000>;
-		prop-int = <123456789>;
-
-		ssn0: subsubnode@0 {
-			phandle = <0x2001>;
-			compatible = "subsubnode2", "subsubnode";
-			prop-int = <0726746425>;
-		};
-
-		ss2 {
-		};
-	};
-};
+/include/ "test_tree1_body.dtsi"
diff --git a/tests/test_tree1.dts b/tests/test_tree1_body.dtsi
similarity index 98%
copy from tests/test_tree1.dts
copy to tests/test_tree1_body.dtsi
index cf530ce..1446191 100644
--- a/tests/test_tree1.dts
+++ b/tests/test_tree1_body.dtsi
@@ -1,5 +1,3 @@
-/dts-v1/;
-
 /memreserve/ 0xdeadbeef00000000 0x100000;
 /memreserve/ 123456789 010000;
 
diff --git a/tests/test_tree1_delete.dts b/tests/test_tree1_delete.dts
new file mode 100644
index 0000000..5ab29d3
--- /dev/null
+++ b/tests/test_tree1_delete.dts
@@ -0,0 +1,68 @@
+/dts-v1/;
+
+/include/ "test_tree1_body.dtsi"
+
+/ {
+	nonexistant-property = <0xdeadbeef>;
+
+	nonexistant-subnode {
+		prop-int = <1>;
+	};
+
+	dellabel: deleted-by-label {
+		prop-int = <1>;
+	};
+
+	subnode@1 {
+		delete-this-str = "deadbeef";
+	};
+
+};
+
+/ {
+	nonexistant-property /delprop/;
+
+	nonexistant-subnode /delnode/;
+
+	subnode@1 {
+		delete-this-str /delprop/;
+	};
+};
+
+&dellabel /delnode/;
+
+/ {
+	prop-str /delprop/;
+};
+
+/ {
+	prop-str = "hello world";
+};
+
+/ {
+	subnode@1 {
+		ss1 /delnode/;
+	};
+};
+
+/ {
+	subnode@1 {
+		ss1 {
+		};
+	};
+};
+
+/{
+	duplabel1: foo1 = "bar";
+	duplabel2: foo2 = "bar";
+};
+
+/{
+	duplabel1: baz1 = "qux";
+	duplabel2: baz2 = "qux";
+};
+
+/{
+	foo1 /delprop/;
+	baz2 /delprop/;
+};
-- 
1.7.0.4
