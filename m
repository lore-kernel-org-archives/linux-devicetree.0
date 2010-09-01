From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: [RFC] dtc: Optionally sort nodes and properties
Date: Wed, 1 Sep 2010 12:47:18 +1000
Message-ID: <20100901024718.GA4828@yookeroo>
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
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi folks,

Here's a patch I made for dtc a little while ago, and I'm not sure if
it's something that sensibly ought to be merged into mainline dtc.

The patch adds a '-s' option to dtc, which causes it to "sort" the
tree before output.  That is, it sorts the reserve entries, it sorts
the properties within each node by name, and it sorts nodes by name
within their parent.

The main use for this is when looking at the differences between two
device trees which are similar, except for semantically null internal
rearrangements.  Directly diffing the dts files will give a lot of
noise due to the order changes, but running both trees through dtc -s
then diffing will usually give a pretty sensible summary of the
changes (it can still be confused by node name changes, of course).

Index: dtc/dtc.c
===================================================================
--- dtc.orig/dtc.c	2010-08-30 12:55:18.209765942 +1000
+++ dtc/dtc.c	2010-08-30 14:03:46.457785218 +1000
@@ -81,6 +81,8 @@ static void  __attribute__ ((noreturn)) 
 	fprintf(stderr, "\t\tSet the physical boot cpu\n");
 	fprintf(stderr, "\t-f\n");
 	fprintf(stderr, "\t\tForce - try to produce output even if the input tree has errors\n");
+	fprintf(stderr, "\t-s\n");
+	fprintf(stderr, "\t\tSort nodes and properties before outputting\n");
 	fprintf(stderr, "\t-v\n");
 	fprintf(stderr, "\t\tPrint DTC version and exit\n");
 	fprintf(stderr, "\t-H <phandle format>\n");
@@ -97,7 +99,7 @@ int main(int argc, char *argv[])
 	const char *inform = "dts";
 	const char *outform = "dts";
 	const char *outname = "-";
-	int force = 0, check = 0;
+	int force = 0, check = 0, sort = 0;
 	const char *arg;
 	int opt;
 	FILE *outf = NULL;
@@ -109,7 +111,7 @@ int main(int argc, char *argv[])
 	minsize    = 0;
 	padsize    = 0;
 
-	while ((opt = getopt(argc, argv, "hI:O:o:V:R:S:p:fcqb:vH:")) != EOF) {
+	while ((opt = getopt(argc, argv, "hI:O:o:V:R:S:p:fcqb:vH:s")) != EOF) {
 		switch (opt) {
 		case 'I':
 			inform = optarg;
@@ -159,6 +161,10 @@ int main(int argc, char *argv[])
 				    optarg);
 			break;
 
+		case 's':
+			sort = 1;
+			break;
+
 		case 'h':
 		default:
 			usage();
@@ -197,6 +203,8 @@ int main(int argc, char *argv[])
 	fill_fullpaths(bi->dt, "");
 	process_checks(force, bi);
 
+	if (sort)
+		sort_tree(bi);
 
 	if (streq(outname, "-")) {
 		outf = stdout;
Index: dtc/dtc.h
===================================================================
--- dtc.orig/dtc.h	2010-08-30 13:55:02.577766011 +1000
+++ dtc/dtc.h	2010-08-30 14:03:46.457785218 +1000
@@ -223,6 +223,7 @@ struct boot_info {
 
 struct boot_info *build_boot_info(struct reserve_info *reservelist,
 				  struct node *tree, uint32_t boot_cpuid_phys);
+void sort_tree(struct boot_info *bi);
 
 /* Checks */
 
Index: dtc/livetree.c
===================================================================
--- dtc.orig/livetree.c	2010-08-30 13:55:02.577766011 +1000
+++ dtc/livetree.c	2010-08-30 14:03:46.461763776 +1000
@@ -505,3 +505,140 @@ uint32_t guess_boot_cpuid(struct node *t
 
 	return propval_cell(reg);
 }
+
+static int cmp_reserve_info(const void *ax, const void *bx)
+{
+	const struct reserve_info *a, *b;
+
+	a = *((const struct reserve_info * const *)ax);
+	b = *((const struct reserve_info * const *)bx);
+
+	if (a->re.address < b->re.address)
+		return -1;
+	else if (a->re.address > b->re.address)
+		return 1;
+	else if (a->re.size < b->re.size)
+		return -1;
+	else if (a->re.size > b->re.size)
+		return 1;
+	else
+		return 0;
+}
+
+static void sort_reserve_entries(struct boot_info *bi)
+{
+	struct reserve_info *ri, **tbl;
+	int n = 0, i = 0;
+
+	for (ri = bi->reservelist;
+	     ri;
+	     ri = ri->next)
+		n++;
+
+	if (n == 0)
+		return;
+
+	tbl = xmalloc(n * sizeof(*tbl));
+
+	for (ri = bi->reservelist;
+	     ri;
+	     ri = ri->next)
+		tbl[i++] = ri;
+
+	qsort(tbl, n, sizeof(*tbl), cmp_reserve_info);
+
+	bi->reservelist = tbl[0];
+	for (i = 0; i < (n-1); i++)
+		tbl[i]->next = tbl[i+1];
+	tbl[n-1]->next = NULL;
+
+	free(tbl);
+}
+
+static int cmp_prop(const void *ax, const void *bx)
+{
+	const struct property *a, *b;
+
+	a = *((const struct property * const *)ax);
+	b = *((const struct property * const *)bx);
+
+	return strcmp(a->name, b->name);
+}
+
+static void sort_properties(struct node *node)
+{
+	int n = 0, i = 0;
+	struct property *prop, **tbl;
+
+	for_each_property(node, prop)
+		n++;
+
+	if (n == 0)
+		return;
+
+	tbl = xmalloc(n * sizeof(*tbl));
+
+	for_each_property(node, prop)
+		tbl[i++] = prop;
+
+	qsort(tbl, n, sizeof(*tbl), cmp_prop);
+
+	node->proplist = tbl[0];
+	for (i = 0; i < (n-1); i++)
+		tbl[i]->next = tbl[i+1];
+	tbl[n-1]->next = NULL;
+
+	free(tbl);
+}
+
+static int cmp_subnode(const void *ax, const void *bx)
+{
+	const struct node *a, *b;
+
+	a = *((const struct node * const *)ax);
+	b = *((const struct node * const *)bx);
+
+	return strcmp(a->name, b->name);
+}
+
+static void sort_subnodes(struct node *node)
+{
+	int n = 0, i = 0;
+	struct node *subnode, **tbl;
+
+	for_each_child(node, subnode)
+		n++;
+
+	if (n == 0)
+		return;
+
+	tbl = xmalloc(n * sizeof(*tbl));
+
+	for_each_child(node, subnode)
+		tbl[i++] = subnode;
+
+	qsort(tbl, n, sizeof(*tbl), cmp_subnode);
+
+	node->children = tbl[0];
+	for (i = 0; i < (n-1); i++)
+		tbl[i]->next_sibling = tbl[i+1];
+	tbl[n-1]->next_sibling = NULL;
+
+	free(tbl);
+}
+
+static void sort_node(struct node *node)
+{
+	struct node *c;
+
+	sort_properties(node);
+	sort_subnodes(node);
+	for_each_child(node, c)
+		sort_node(c);
+}
+
+void sort_tree(struct boot_info *bi)
+{
+	sort_reserve_entries(bi);
+	sort_node(bi->dt);
+}
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2010-08-30 14:03:42.218764527 +1000
+++ dtc/tests/run_tests.sh	2010-08-30 14:03:46.461763776 +1000
@@ -377,6 +377,13 @@ cmp_tests () {
     for tree in $wrongtrees; do
 	run_test dtbs_equal_unordered -n $basetree $tree
     done
+
+    # now dtc --sort
+    run_dtc_test -I dtb -O dtb -s -o $basetree.sorted.test.dtb $basetree
+    run_test dtbs_equal_unordered $basetree $basetree.sorted.test.dtb
+    run_dtc_test -I dtb -O dtb -s -o $basetree.reversed.sorted.test.dtb $basetree.reversed.test.dtb
+    run_test dtbs_equal_unordered $basetree.reversed.test.dtb $basetree.reversed.sorted.test.dtb
+    run_test dtbs_equal_ordered $basetree.sorted.test.dtb $basetree.reversed.sorted.test.dtb
 }
 
 dtbs_equal_tests () {



-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
