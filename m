From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Disallow re-use of the same label within a dts file
Date: Tue, 23 Feb 2010 19:56:41 +1100
Message-ID: <20100223085641.GG12285@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently, nothing will stop you from re-using the same label string
multiple times in a dts, e.g.:
	/ {
		samelabel: prop1 = "foo";
		samelabel: prop2 = "bar";
	};

or
	/ {
		samelabel: prop1 = "foo";
		samelabel: subnode {
		};
	};

When using node references by label, this could lead to confusing
results (with no warning), and in -Oasm mode will result in output
which the assembler will complain about (since it too will have
duplicate labels).

This patch, therefore, adds code to checks.c to give errors if you
attempt to re-use the same label.  It treats all labels (node,
property, and value) as residing in the same namespace, since the
assembler will treat them so for -Oasm mode.

Testcases for the new code are also added.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

---
 checks.c               |   56 +++++++++++++++++++++++++++++++++++++++++++++++++
 dtc.h                  |    4 +++
 livetree.c             |   51 ++++++++++++++++++++++++++++++++++++++++++++
 tests/reuse-label.dts  |   15 +++++++++++++
 tests/reuse-label1.dts |   10 ++++++++
 tests/reuse-label2.dts |    6 +++++
 tests/reuse-label3.dts |    9 +++++++
 tests/reuse-label4.dts |    5 ++++
 tests/reuse-label5.dts |    6 +++++
 tests/reuse-label6.dts |    6 +++++
 tests/run_tests.sh     |    7 ++++++
 11 files changed, 175 insertions(+)

Index: dtc/livetree.c
===================================================================
--- dtc.orig/livetree.c	2010-02-23 16:30:44.736979657 +1100
+++ dtc/livetree.c	2010-02-23 19:50:19.865595710 +1100
@@ -208,6 +208,57 @@ cell_t propval_cell(struct property *pro
 	return fdt32_to_cpu(*((cell_t *)prop->val.val));
 }
 
+struct property *get_property_by_label(struct node *tree, const char *label,
+				       struct node **node)
+{
+	struct property *prop;
+	struct node *c;
+
+	*node = tree;
+
+	for_each_property(tree, prop) {
+		if (prop->label && streq(prop->label, label))
+			return prop;
+	}
+
+	for_each_child(tree, c) {
+		prop = get_property_by_label(c, label, node);
+		if (prop)
+			return prop;
+	}
+
+	*node = NULL;
+	return NULL;
+}
+
+struct marker *get_marker_label(struct node *tree, const char *label,
+				struct node **node, struct property **prop)
+{
+	struct marker *m;
+	struct property *p;
+	struct node *c;
+
+	*node = tree;
+
+	for_each_property(tree, p) {
+		*prop = p;
+		m = p->val.markers;
+		for_each_marker_of_type(m, LABEL)
+			if (streq(m->ref, label))
+				return m;
+	}
+
+	for_each_child(tree, c) {
+		m = get_marker_label(c, label, node, prop);
+		if (m)
+			return m;
+	}
+
+	*prop = NULL;
+	*node = NULL;
+	return NULL;
+}
+
 struct node *get_subnode(struct node *node, const char *nodename)
 {
 	struct node *child;
Index: dtc/tests/reuse-label.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/reuse-label.dts	2010-02-23 15:40:40.495977222 +1100
@@ -0,0 +1,15 @@
+/dts-v1/;
+
+/ {
+	label: property1 = "foo";
+	label: property2 = "bar";
+
+	test1 = &label;
+
+	label: node1 {
+		prop = "foo";
+	};
+	label: node2 {
+		prop = "bar";
+	};
+};
Index: dtc/tests/reuse-label1.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/reuse-label1.dts	2010-02-23 18:30:42.864988930 +1100
@@ -0,0 +1,10 @@
+/dts-v1/;
+
+/ {
+	label: node1 {
+		prop = "foo";
+	};
+	label: node2 {
+		prop = "bar";
+	};
+};
Index: dtc/tests/reuse-label2.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/reuse-label2.dts	2010-02-23 18:31:06.040990550 +1100
@@ -0,0 +1,6 @@
+/dts-v1/;
+
+/ {
+	label: property1 = "foo";
+	label: property2 = "bar";
+};
Index: dtc/tests/reuse-label3.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/reuse-label3.dts	2010-02-23 18:31:45.672996647 +1100
@@ -0,0 +1,9 @@
+/dts-v1/;
+
+/ {
+	label: property = "foo";
+
+	label: node {
+		property = "foo";
+	};
+};
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2010-02-23 18:32:43.836963106 +1100
+++ dtc/tests/run_tests.sh	2010-02-23 19:28:19.777428006 +1100
@@ -319,6 +319,13 @@ dtc_tests () {
     run_sh_test dtc-checkfails.sh node_name_format -- -I dtb -O dtb bad_node_format.dtb
     run_sh_test dtc-checkfails.sh prop_name_chars -- -I dtb -O dtb bad_prop_char.dtb
 
+    run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label1.dts
+    run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label2.dts
+    run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label3.dts
+    run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label4.dts
+    run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label5.dts
+    run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label6.dts
+
     # Check for proper behaviour reading from stdin
     run_dtc_test -I dts -O dtb -o stdin_dtc_tree1.test.dtb - < test_tree1.dts
     run_wrap_test cmp stdin_dtc_tree1.test.dtb dtc_tree1.test.dtb
Index: dtc/checks.c
===================================================================
--- dtc.orig/checks.c	2010-02-23 18:34:59.127957065 +1100
+++ dtc/checks.c	2010-02-23 19:47:35.609574614 +1100
@@ -278,6 +278,59 @@ static void check_property_name_chars(st
 }
 PROP_CHECK(property_name_chars, PROPNODECHARS, ERROR);
 
+#define DESCLABEL_FMT	"%s%s%s%s%s"
+#define DESCLABEL_ARGS(node,prop,mark)		\
+	((mark) ? "value of " : ""),		\
+	((prop) ? "'" : ""), \
+	((prop) ? (prop)->name : ""), \
+	((prop) ? "' in " : ""), (node)->fullpath
+
+static void check_duplicate_label(struct check *c, struct node *dt,
+				  const char *label, struct node *node,
+				  struct property *prop, struct marker *mark)
+{
+	struct node *othernode = NULL;
+	struct property *otherprop = NULL;
+	struct marker *othermark = NULL;
+
+	othernode = get_node_by_label(dt, label);
+
+	if (!othernode)
+		otherprop = get_property_by_label(dt, label, &othernode);
+	if (!othernode)
+		othermark = get_marker_label(dt, label, &othernode,
+					       &otherprop);
+
+	if (!othernode)
+		return;
+
+	if ((othernode != node) || (otherprop != prop) || (othermark != mark))
+		FAIL(c, "Duplicate label '%s' on " DESCLABEL_FMT
+		     " and " DESCLABEL_FMT,
+		     label, DESCLABEL_ARGS(node, prop, mark),
+		     DESCLABEL_ARGS(othernode, otherprop, othermark));
+}
+
+static void check_duplicate_label_node(struct check *c, struct node *dt,
+				       struct node *node)
+{
+	if (node->label)
+		check_duplicate_label(c, dt, node->label, node, NULL, NULL);
+}
+static void check_duplicate_label_prop(struct check *c, struct node *dt,
+				       struct node *node, struct property *prop)
+{
+	struct marker *m = prop->val.markers;
+
+	if (prop->label)
+		check_duplicate_label(c, dt, prop->label, node, prop, NULL);
+
+	for_each_marker_of_type(m, LABEL)
+		check_duplicate_label(c, dt, m->ref, node, prop, m);
+}
+CHECK(duplicate_label, NULL, check_duplicate_label_node,
+      check_duplicate_label_prop, NULL, ERROR);
+
 static void check_explicit_phandles(struct check *c, struct node *root,
 				    struct node *node, struct property *prop)
 {
@@ -573,6 +626,9 @@ static struct check *check_table[] = {
 	&duplicate_node_names, &duplicate_property_names,
 	&node_name_chars, &node_name_format, &property_name_chars,
 	&name_is_string, &name_properties,
+
+	&duplicate_label,
+
 	&explicit_phandles,
 	&phandle_references, &path_references,
 
Index: dtc/dtc.h
===================================================================
--- dtc.orig/dtc.h	2010-02-23 18:45:15.744979198 +1100
+++ dtc/dtc.h	2010-02-23 19:40:56.513523796 +1100
@@ -171,6 +171,10 @@ void add_child(struct node *parent, stru
 const char *get_unitname(struct node *node);
 struct property *get_property(struct node *node, const char *propname);
 cell_t propval_cell(struct property *prop);
+struct property *get_property_by_label(struct node *tree, const char *label,
+				       struct node **node);
+struct marker *get_marker_label(struct node *tree, const char *label,
+				struct node **node, struct property **prop);
 struct node *get_subnode(struct node *node, const char *nodename);
 struct node *get_node_by_path(struct node *tree, const char *path);
 struct node *get_node_by_label(struct node *tree, const char *label);
Index: dtc/tests/reuse-label4.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/reuse-label4.dts	2010-02-23 19:26:24.113412394 +1100
@@ -0,0 +1,5 @@
+/dts-v1/;
+
+/ {
+	property = label: "foo" label:;
+};
Index: dtc/tests/reuse-label5.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/reuse-label5.dts	2010-02-23 19:26:49.628022281 +1100
@@ -0,0 +1,6 @@
+/dts-v1/;
+
+/ {
+	prop1 = label: "foo";
+	prop2 = "bar" label:;
+};
Index: dtc/tests/reuse-label6.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/reuse-label6.dts	2010-02-23 19:27:29.587956369 +1100
@@ -0,0 +1,6 @@
+/dts-v1/;
+
+/ {
+	label: prop1 = "foo";
+	prop2 = "bar" label:;
+};


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
