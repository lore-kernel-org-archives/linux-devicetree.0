From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH v3] Allow device tree to be modified by additonal device tree
	sections
Date: Thu, 25 Feb 2010 09:58:29 -0700
Message-ID: <20100225165352.7745.68056.stgit@angua>
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
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch allows the following construct:

/ {
	property-a = "old";
	property-b = "does not change";
};

/ {
	property-a = "changed";
	property-c = "new";
	node-a {
	};
};

Where the later device tree overrides the properties found in the
earlier tree.  This is useful for laying down a template device tree
in an include file and modifying it for a specific board without having
to clone the entire tree.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

Changes since RFC (v1):
- Fix parser to ensure at least one 'devicetree' section
- merge labels too
- Don't change property value if property already has a value and
  the redefinition is in the form of an empty property
  ie: 'label: property;'
- Add test cases

Changes since v2:
- Revert code that doesn't change property value if the redefinition
  is in the form of an empty property
- Improvements to test cases

 dtc-parser.y               |   14 ++++++++
 dtc.h                      |    1 +
 livetree.c                 |   75 +++++++++++++++++++++++++++++++++++++++++++-
 tests/multilabel.dts       |   12 +++++--
 tests/multilabel_merge.dts |   66 +++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh         |    7 ++++
 tests/test_tree1_merge.dts |   45 ++++++++++++++++++++++++++
 7 files changed, 214 insertions(+), 6 deletions(-)
 create mode 100644 tests/multilabel_merge.dts
 create mode 100644 tests/test_tree1_merge.dts

diff --git a/dtc-parser.y b/dtc-parser.y
index 8fa1e4f..dea19c1 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -75,6 +75,7 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 %type <proplist> proplist
 
 %type <node> devicetree
+%type <node> devicetrees
 %type <node> nodedef
 %type <node> subnode
 %type <nodelist> subnodes
@@ -82,7 +83,7 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 %%
 
 sourcefile:
-	  DT_V1 ';' memreserves devicetree
+	  DT_V1 ';' memreserves devicetrees
 		{
 			the_boot_info = build_boot_info($3, $4,
 							guess_boot_cpuid($4));
@@ -119,6 +120,17 @@ addr:
 		}
 	  ;
 
+devicetrees:
+	  devicetree
+		{
+			$$ = $1;
+		}
+	| devicetrees devicetree
+		{
+			$$ = merge_nodes($1, $2);
+		}
+	;
+
 devicetree:
 	  '/' nodedef
 		{
diff --git a/dtc.h b/dtc.h
index 6d61b6d..b36ac5d 100644
--- a/dtc.h
+++ b/dtc.h
@@ -174,6 +174,7 @@ struct property *reverse_properties(struct property *first);
 struct node *build_node(struct property *proplist, struct node *children);
 struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
+struct node *merge_nodes(struct node *old_node, struct node *new_node);
 
 void add_property(struct node *node, struct property *prop);
 void add_child(struct node *parent, struct node *child);
diff --git a/livetree.c b/livetree.c
index f612b72..13c5f10 100644
--- a/livetree.c
+++ b/livetree.c
@@ -26,8 +26,14 @@
 
 void add_label(struct label **labels, char *label)
 {
-	struct label *new = xmalloc(sizeof(*new));
+	struct label *new;
 
+	/* Make sure the label isn't already there */
+	for_each_label(*labels, new)
+		if (streq(new->label, label))
+			return;
+
+	new = xmalloc(sizeof(*new));
 	new->label = label;
 	new->next = *labels;
 	*labels = new;
@@ -94,6 +100,73 @@ struct node *name_node(struct node *node, char *name)
 	return node;
 }
 
+struct node *merge_nodes(struct node *old_node, struct node *new_node)
+{
+	struct property *new_prop, *old_prop;
+	struct node *new_child, *old_child;
+	struct label *l;
+
+	/* Add new node labels to old node */
+	for_each_label(new_node->labels, l)
+		add_label(&old_node->labels, l->label);
+
+	/* Move properties from the new node to the old node.  If there
+	 * is a collision, replace the old value with the new */
+	while (new_node->proplist) {
+		/* Pop the property off the list */
+		new_prop = new_node->proplist;
+		new_node->proplist = new_prop->next;
+		new_prop->next = NULL;
+
+		/* Look for a collision, set new value if there is */
+		for_each_property(old_node, old_prop) {
+			if (streq(old_prop->name, new_prop->name)) {
+				/* Add new labels to old property */
+				for_each_label(new_prop->labels, l)
+					add_label(&old_prop->labels, l->label);
+
+				old_prop->val = new_prop->val;
+				free(new_prop);
+				new_prop = NULL;
+				break;
+			}
+		}
+
+		/* if no collision occurred, add property to the old node. */
+		if (new_prop)
+			add_property(old_node, new_prop);
+	}
+
+	/* Move the override child nodes into the primary node.  If
+	 * there is a collision, then merge the nodes. */
+	while (new_node->children) {
+		/* Pop the child node off the list */
+		new_child = new_node->children;
+		new_node->children = new_child->next_sibling;
+		new_child->parent = NULL;
+		new_child->next_sibling = NULL;
+
+		/* Search for a collision.  Merge if there is */
+		for_each_child(old_node, old_child) {
+			if (streq(old_child->name, new_child->name)) {
+				merge_nodes(old_child, new_child);
+				new_child = NULL;
+				break;
+			}
+		}
+
+		/* if no collision occured, add child to the old node. */
+		if (new_child)
+			add_child(old_node, new_child);
+	}
+
+	/* The new node contents are now merged into the old node.  Free
+	 * the new node. */
+	free(new_node);
+
+	return old_node;
+}
+
 struct node *chain_node(struct node *first, struct node *list)
 {
 	assert(first->next_sibling == NULL);
diff --git a/tests/multilabel.dts b/tests/multilabel.dts
index 87c175c..31116ce 100644
--- a/tests/multilabel.dts
+++ b/tests/multilabel.dts
@@ -3,26 +3,27 @@
 m1: mq: /memreserve/ 0 0x1000;
 
 / {
-	p1: px: prop = "foo";
+	p0: pw: prop = "foo";
 
 	/* Explicit phandles */
 	n1: nx: node1 {
 		linux,phandle = <0x2000>;
 		ref = <&{/node2}>; /* reference precedes target */
-		lref = <&ny>;
+		p1: px: lref = <&ny>;
 	};
 	ny: n2: node2 {
-		phandle = <0x1>;
+		p2: py: phandle = <0x1>;
 		ref = <&{/node1}>; /* reference after target */
 		lref = <&nx>;
 	};
 
 	/* Implicit phandles */
 	n3: node3 {
-		ref = <&{/node4}>;
+		p3: ref = <&{/node4}>;
 		lref = <&n4>;
 	};
 	n4: node4 {
+		p4: prop;
 	};
 
 	/* Explicit phandle with implicit value */
@@ -34,5 +35,8 @@ m1: mq: /memreserve/ 0 0x1000;
 	n5: nz: node5 {
 		linux,phandle = <&n5>;
 		phandle = <&nz>;
+		n1 = &n1;
+		n2 = &n2;
+		n3 = &n3;
 	};
 };
diff --git a/tests/multilabel_merge.dts b/tests/multilabel_merge.dts
new file mode 100644
index 0000000..1632300
--- /dev/null
+++ b/tests/multilabel_merge.dts
@@ -0,0 +1,66 @@
+/dts-v1/;
+
+m1: mq: /memreserve/ 0 0x1000;
+
+/ {
+	p0: pw: prop = "foo";
+
+	/* Explicit phandles */
+	n1: node1 {
+		linux,phandle = <0x2000>;
+		ref = <&{/node2}>; /* reference precedes target */
+		p1: lref;
+	};
+	node2 {
+		phandle = <0x1>;
+		ref = <&{/node1}>; /* reference after target */
+		lref = <&nx>;
+	};
+
+	/* Implicit phandles */
+	n3: node3 {
+		p3: ref = <&{/node4}>;
+		lref = <&n4>;
+	};
+	n4: node4 {
+		p4: prop = "foo";
+	};
+
+	/* Explicit phandle with implicit value */
+	/* This self-reference is the standard way to tag a node as requiring
+	 * a phandle (perhaps for reference by nodes that will be dynamically
+	 * added) without explicitly allocating it a phandle.
+	 * The self-reference requires some special internal handling, though
+	 * so check it actually works */
+	n5: nz: node5 {
+		linux,phandle = <&n5>;
+		phandle = <&nz>;
+		n1 = &n1;
+		n2 = &n2;
+		n3 = &n3;
+	};
+};
+
+/ {
+	/* Append labels (also changes property content) */
+	nx: node1 {
+		px: lref = <&ny>;
+	};
+
+	/* Add multiple labels */
+	ny: n2: node2 {
+		/* Add a label to a property */
+		p2: py: phandle = <0x1>;
+	};
+
+	/* Reassigning the same label should be a no-op */
+	n3: node3 {
+		p3: ref = <&{/node4}>;
+	};
+
+	/* Redefining a node/property should not remove labels */
+	node4 {
+		prop;
+	};
+
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 08535ad..43b9d44 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -297,6 +297,13 @@ dtc_tests () {
 	 done
     done
 
+    # Check merge/overlay functionality
+    run_dtc_test -I dts -O dtb -o dtc_tree1_merge.test.dtb test_tree1_merge.dts
+    tree1_tests dtc_tree1_merge.test.dtb test_tree1.dtb
+    run_dtc_test -I dts -O dtb -o multilabel_merge.test.dtb multilabel_merge.dts
+    run_test references multilabel.test.dtb
+    run_test dtbs_equal_ordered multilabel.test.dtb multilabel_merge.test.dtb
+
     # Check some checks
     check_tests dup-nodename.dts duplicate_node_names
     check_tests dup-propname.dts duplicate_property_names
diff --git a/tests/test_tree1_merge.dts b/tests/test_tree1_merge.dts
new file mode 100644
index 0000000..f580da8
--- /dev/null
+++ b/tests/test_tree1_merge.dts
@@ -0,0 +1,45 @@
+/dts-v1/;
+/memreserve/ 0xdeadbeef00000000 0x100000;
+/memreserve/ 123456789 010000;
+
+/ {
+	compatible = "test_tree1";
+	prop-int = "wrong!";
+	prop-str = "hello world";
+
+	subnode@1 {
+		compatible = "subnode1";
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
+		ss2 {
+		};
+	};
+};
+
+/ {
+	prop-int = <0xdeadbeef>;
+	subnode@1 {
+		prop-int = [deadbeef];
+	};
+	subnode@2 {
+		subsubnode@0 {
+			phandle = <0x2001>;
+			compatible = "subsubnode2", "subsubnode";
+			prop-int = <0726746425>;
+		};
+	};
+};
+
+
