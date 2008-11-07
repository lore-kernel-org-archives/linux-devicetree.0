From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: dtc: Handle linux,phandle properties which self-reference
Date: Fri, 7 Nov 2008 12:49:44 +1100
Message-ID: <20081107014944.GI6692@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Jon Loeliger <jdl-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently, dtc will generate phandles for nodes which are referenced
elsewhere in the tree.  phandles can also be explicitly assigned by
defining the linux,phandle property.  However, there is no way,
currently to tell dtc to generate a phandle for a node if it is not
referenced elsewhere.  This is inconvenient when it's expected that
later processing on the flat tree might add nodes which _will_
the node in question.

One way one might attempt to do this is with the construct:
	mynode: mynode {
		linux,phandle = <&mynode>;
		/* ... */
	};
Though it's a trifle odd, there's really only one sensible meaning
which can be assigned to this construct: allocate a unique phandle to
"mynode" and put that in its linux,phandle property (as always).

Currently, however, dtc will choke on this self-reference.  This patch
corrects this, making the construct above give the expected results.
It also ensures a more meaningful error message is given if you
attempt to process the nonsensical construct:
	mynode: mynode {
		linux,phandle = <&someothernode>;
		/* ... */
	};

The 'references' testcase is extended to cover this case, as well.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/tests/references.dts
===================================================================
--- dtc.orig/tests/references.dts	2008-11-07 12:47:24.000000000 +1100
+++ dtc/tests/references.dts	2008-11-07 12:47:27.000000000 +1100
@@ -20,4 +20,14 @@
 	};
 	n4: node4 {
 	};
+
+	/* Explicit phandle with implicit value */
+	/* This self-reference is the standard way to tag a node as requiring
+	 * a phandle (perhaps for reference by nodes that will be dynamically
+	 * added) without explicitly allocating it a phandle.
+	 * The self-reference requires some special internal handling, though
+	 * so check it actually works */
+	n5: node5 {
+		linux,phandle = <&n5>;
+	};
 };
Index: dtc/checks.c
===================================================================
--- dtc.orig/checks.c	2008-11-07 12:47:24.000000000 +1100
+++ dtc/checks.c	2008-11-07 12:47:27.000000000 +1100
@@ -282,6 +282,7 @@ static void check_explicit_phandles(stru
 					  struct node *node)
 {
 	struct property *prop;
+	struct marker *m;
 	struct node *other;
 	cell_t phandle;
 
@@ -295,6 +296,23 @@ static void check_explicit_phandles(stru
 		return;
 	}
 
+	m = prop->val.markers;
+	for_each_marker_of_type(m, REF_PHANDLE) {
+		assert(m->offset == 0);
+		if (node != get_node_by_ref(root, m->ref))
+			/* "Set this node's phandle equal to some
+			 * other node's phandle".  That's nonsensical
+			 * by construction. */
+			FAIL(c, "linux,phandle in %s is a reference to another node",
+			     node->fullpath);
+		/* But setting this node's phandle equal to its own
+		 * phandle is allowed - that means allocate a unique
+		 * phandle for this node, even if it's not otherwise
+		 * referenced.  The value will be filled in later, so
+		 * no further checking for now. */
+		return;
+	}
+
 	phandle = propval_cell(prop);
 	if ((phandle == 0) || (phandle == -1)) {
 		FAIL(c, "%s has invalid linux,phandle value 0x%x",
Index: dtc/livetree.c
===================================================================
--- dtc.orig/livetree.c	2008-11-07 12:47:24.000000000 +1100
+++ dtc/livetree.c	2008-11-07 12:47:27.000000000 +1100
@@ -293,16 +293,18 @@ cell_t get_node_phandle(struct node *roo
 	if ((node->phandle != 0) && (node->phandle != -1))
 		return node->phandle;
 
-	assert(! get_property(node, "linux,phandle"));
-
 	while (get_node_by_phandle(root, phandle))
 		phandle++;
 
 	node->phandle = phandle;
-	add_property(node,
-		     build_property("linux,phandle",
-				    data_append_cell(empty_data, phandle),
-				    NULL));
+	if (!get_property(node, "linux,phandle"))
+		add_property(node,
+			     build_property("linux,phandle",
+					    data_append_cell(empty_data, phandle),
+					    NULL));
+	/* If the node *does* have a linux,phandle property, we must
+	 * be dealing with a self-referencing phandle, which will be
+	 * fixed up momentarily in the caller */
 
 	return node->phandle;
 }
Index: dtc/tests/references.c
===================================================================
--- dtc.orig/tests/references.c	2008-11-07 12:47:24.000000000 +1100
+++ dtc/tests/references.c	2008-11-07 12:47:27.000000000 +1100
@@ -60,8 +60,8 @@ static void check_ref(const void *fdt, i
 int main(int argc, char *argv[])
 {
 	void *fdt;
-	int n1, n2, n3, n4;
-	uint32_t h1, h2, h4;
+	int n1, n2, n3, n4, n5;
+	uint32_t h1, h2, h4, h5;
 
 	test_init(argc, argv);
 	fdt = load_blob_arg(argc, argv);
@@ -78,10 +78,14 @@ int main(int argc, char *argv[])
 	n4 = fdt_path_offset(fdt, "/node4");
 	if (n4 < 0)
 		FAIL("fdt_path_offset(/node4): %s", fdt_strerror(n4));
+	n5 = fdt_path_offset(fdt, "/node5");
+	if (n5 < 0)
+		FAIL("fdt_path_offset(/node5): %s", fdt_strerror(n5));
 
 	h1 = fdt_get_phandle(fdt, n1);
 	h2 = fdt_get_phandle(fdt, n2);
 	h4 = fdt_get_phandle(fdt, n4);
+	h5 = fdt_get_phandle(fdt, n5);
 
 	if (h1 != 0x2000)
 		FAIL("/node1 has wrong phandle, 0x%x instead of 0x%x",
@@ -92,6 +96,11 @@ int main(int argc, char *argv[])
 	if ((h4 == 0x2000) || (h4 == 0x1) || (h4 == 0))
 		FAIL("/node4 has bad phandle, 0x%x", h4);
 
+	if ((h5 == 0) || (h5 == -1))
+		FAIL("/node5 has bad phandle, 0x%x", h5);
+	if ((h5 == h4) || (h5 == h2) || (h5 == h1))
+		FAIL("/node5 has duplicate phandle, 0x%x", h5);
+
 	check_ref(fdt, n1, h2);
 	check_ref(fdt, n2, h1);
 	check_ref(fdt, n3, h4);
Index: dtc/tests/references_dts0.dts
===================================================================
--- dtc.orig/tests/references_dts0.dts	2008-11-07 12:47:24.000000000 +1100
+++ dtc/tests/references_dts0.dts	2008-11-07 12:47:27.000000000 +1100
@@ -20,4 +20,7 @@
 	};
 	n4: node4 {
 	};
+	n5: node5 {
+		linux,phandle = <&n5>;
+	};
 };
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2008-11-07 12:47:25.000000000 +1100
+++ dtc/tests/run_tests.sh	2008-11-07 12:47:27.000000000 +1100
@@ -229,7 +229,8 @@ dtc_tests () {
     run_test dtbs_equal_ordered boot_cpuid_preserved_test_tree1.test.dtb boot_cpuid_test_tree1.test.dtb
 
     # Check -Odts mode preserve all dtb information
-    for tree in test_tree1.dtb dtc_tree1.test.dtb dtc_escapes.test.dtb ; do
+    for tree in test_tree1.dtb dtc_tree1.test.dtb dtc_escapes.test.dtb \
+	dtc_references.test.dtb; do
 	run_dtc_test -I dtb -O dts -o odts_$tree.test.dts $tree
 	run_dtc_test -I dts -O dtb -o odts_$tree.test.dtb odts_$tree.test.dts
 	run_test dtbs_equal_ordered $tree odts_$tree.test.dtb


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
