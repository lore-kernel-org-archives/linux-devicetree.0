From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] dtc: Add ability to delete nodes and properties
Date: Tue, 13 Mar 2012 16:48:14 -0600
Message-ID: <1331678894-31251-1-git-send-email-swarren@wwwdotorg.org>
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
To: jdl-CYoMK+44s/E@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

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

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
Jean-Christophe was lamenting the lack of this feature earlier today, and
I had just been thinking yesterday that it'd be potentially useful for
the Tegra pinmux binding I was thinking of. So, here it is!

 dtc-lexer.l                 |   12 ++++++++
 dtc-parser.y                |   23 +++++++++++++++
 dtc.h                       |    6 ++++
 livetree.c                  |   67 +++++++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh          |    4 ++
 tests/test_tree1_delete.dts |   59 +++++++++++++++++++++++++++++++++++++
 6 files changed, 171 insertions(+), 0 deletions(-)
 create mode 100644 tests/test_tree1_delete.dts

diff --git a/dtc-lexer.l b/dtc-lexer.l
index 73d190c..de92fee 100644
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
index 348616b..a0d6b4e 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -61,6 +61,8 @@ static unsigned char eval_char_literal(const char *s);
 %token DT_V1
 %token DT_MEMRESERVE
 %token DT_BITS
+%token DT_DEL_PROP
+%token DT_DEL_NODE
 %token <propnodename> DT_PROPNODENAME
 %token <literal> DT_LITERAL
 %token <literal> DT_CHAR_LITERAL
@@ -145,6 +147,19 @@ devicetree:
 				print_error("label or path, '%s', not found", $2);
 			$$ = $1;
 		}
+	| devicetree DT_REF DT_DEL_NODE ';'
+		{
+			struct node *target = get_node_by_ref($1, $2);
+
+			if (!target)
+				print_error("label or path, '%s', not found", $2);
+			else if (!target->parent)
+				print_error("cannot delete root");
+			else
+				remove_child(target->parent, target->name);
+
+			$$ = $1;
+		}
 	;
 
 nodedef:
@@ -174,6 +189,10 @@ propdef:
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
@@ -335,6 +354,10 @@ subnode:
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
index 7b4c65b..980c4df 100644
--- a/dtc.h
+++ b/dtc.h
@@ -133,6 +133,7 @@ struct label {
 
 struct property {
 	char *name;
+	int propdel;
 	struct data val;
 
 	struct property *next;
@@ -142,6 +143,7 @@ struct property {
 
 struct node {
 	char *name;
+	int nodedel;
 	struct property *proplist;
 	struct node *children;
 
@@ -169,16 +171,20 @@ struct node {
 void add_label(struct label **labels, char *label);
 
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
+void remove_property(struct node *node, char *name);
 void add_child(struct node *parent, struct node *child);
+void remove_child(struct node *parent, char *name);
 
 const char *get_unitname(struct node *node);
 struct property *get_property(struct node *node, const char *propname);
diff --git a/livetree.c b/livetree.c
index c9209d5..7412777 100644
--- a/livetree.c
+++ b/livetree.c
@@ -51,6 +51,18 @@ struct property *build_property(char *name, struct data val)
 	return new;
 }
 
+struct property *build_property_delete(char *name)
+{
+	struct property *new = xmalloc(sizeof(*new));
+
+	memset(new, 0, sizeof(*new));
+
+	new->name = name;
+	new->propdel = 1;
+
+	return new;
+}
+
 struct property *chain_property(struct property *first, struct property *list)
 {
 	assert(first->next == NULL);
@@ -91,6 +103,17 @@ struct node *build_node(struct property *proplist, struct node *children)
 	return new;
 }
 
+struct node *build_node_delete(void)
+{
+	struct node *new = xmalloc(sizeof(*new));
+
+	memset(new, 0, sizeof(*new));
+
+	new->nodedel = 1;
+
+	return new;
+}
+
 struct node *name_node(struct node *node, char *name)
 {
 	assert(node->name == NULL);
@@ -118,6 +141,12 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 		new_node->proplist = new_prop->next;
 		new_prop->next = NULL;
 
+		if (new_prop->propdel) {
+			remove_property(old_node, new_prop->name);
+			free(new_prop);
+			continue;
+		}
+
 		/* Look for a collision, set new value if there is */
 		for_each_property(old_node, old_prop) {
 			if (streq(old_prop->name, new_prop->name)) {
@@ -146,6 +175,12 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node)
 		new_child->parent = NULL;
 		new_child->next_sibling = NULL;
 
+		if (new_child->nodedel) {
+			remove_child(old_node, new_child->name);
+			free(new_child);
+			continue;
+		}
+
 		/* Search for a collision.  Merge if there is */
 		for_each_child(old_node, old_child) {
 			if (streq(old_child->name, new_child->name)) {
@@ -188,6 +223,22 @@ void add_property(struct node *node, struct property *prop)
 	*p = prop;
 }
 
+void remove_property(struct node *node, char *name)
+{
+	struct property **p, *pdel;
+
+	p = &node->proplist;
+	while (*p) {
+		if (!strcmp((*p)->name, name)) {
+			pdel = *p;
+			*p = (*p)->next;
+			free(pdel);
+			return;
+		}
+		p = &((*p)->next);
+	}
+}
+
 void add_child(struct node *parent, struct node *child)
 {
 	struct node **p;
@@ -202,6 +253,22 @@ void add_child(struct node *parent, struct node *child)
 	*p = child;
 }
 
+void remove_child(struct node *parent, char *name)
+{
+	struct node **n, *ndel;
+
+	n = &parent->children;
+	while (*n) {
+		if (!strcmp((*n)->name, name)) {
+			ndel = *n;
+			*n = (*n)->next_sibling;
+			free(ndel);
+			return;
+		}
+		n = &((*n)->next_sibling);
+	}
+}
+
 struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
 {
 	struct reserve_info *new = xmalloc(sizeof(*new));
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index deffae3..7b6210e 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -369,6 +369,10 @@ dtc_tests () {
     run_dtc_test -I dts -O dtb -o dtc_tree1_merge_path.test.dtb test_tree1_merge_path.dts
     tree1_tests dtc_tree1_merge_path.test.dtb test_tree1.dtb
 
+    # Check prop/node delete functionality
+    run_dtc_test -I dts -O dtb -o dtc_tree1_delete.test.dtb test_tree1_delete.dts
+    tree1_tests dtc_tree1_delete.test.dtb
+
     # Check some checks
     check_tests dup-nodename.dts duplicate_node_names
     check_tests dup-propname.dts duplicate_property_names
diff --git a/tests/test_tree1_delete.dts b/tests/test_tree1_delete.dts
new file mode 100644
index 0000000..658e339
--- /dev/null
+++ b/tests/test_tree1_delete.dts
@@ -0,0 +1,59 @@
+/dts-v1/;
+
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = <0xdeadbeef>;
+	prop-str = "hello world";
+	nonexistant-property = <0xdeadbeef>;
+
+	subnode@1 {
+		compatible = "subnode1";
+		prop-int = [deadbeef];
+		prop-str = "deadbeef";
+
+		subsubnode {
+			compatible = "subsubnode1", "subsubnode";
+			prop-int = <0xdeadbeef>;
+		};
+
+		ss1 {
+		};
+	};
+
+	subnode@2 {
+		linux,phandle = <0x2000>;
+		prop-int = <123456789>;
+
+		ssn0: subsubnode@0 {
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+
+		ss2 {
+		};
+	};
+
+	nonexistant-subnode {
+		prop-int = <1>;
+	};
+
+	subsub: subsubnode {
+		prop-int = <1>;
+	};
+};
+
+/ {
+	nonexistant-property /delprop/;
+
+	nonexistant-subnode /delnode/;
+
+	subnode@1 {
+		prop-str /delprop/;
+	};
+};
+
+&subsub /delnode/;
-- 
1.7.0.4
