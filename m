From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc: Add code to make diffing trees easier
Date: Tue, 12 Oct 2010 13:08:14 +1100
Message-ID: <20101012020814.GD22383@yookeroo>
References: <20101011003738.GA5463@yookeroo>
	<20101011055219.GK23588@angua.secretlab.ca>
	<E1P5JIE-0002Pw-J1@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <E1P5JIE-0002Pw-J1-CYoMK+44s/E@public.gmane.org>
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

On Mon, Oct 11, 2010 at 09:23:58AM -0500, Jon Loeliger wrote:
> > On Mon, Oct 11, 2010 at 11:37:38AM +1100, David Gibson wrote:
> > > This patch adds a "dtdiff" script to do a useful form diff of two
> > > device trees.  This automatically converts the tree to dts form (if
> > > it's not already) and uses a new "-s" option in dtc to "sort" the
> > > tree.  That is, it sorts the reserve entries, it sorts the properties
> > > within each node by name, and it sorts nodes by name within their
> > > parent.
> > > 
> > > This gives a pretty sensible diff between the trees, which will ignore
> > > semantically null internal rearrangements (directly diffing the dts
> > > files can give a lot of noise due to the order changes).
> > > 
> > > Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
> > 
> > Acked-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> 
> I am inclined to take this patch.  Any other comments?  Matt?

Oops, don't do it quite yet.  Realised I'd made a screwup in the
makefile so dtdiff would not properly install.  Version below fixes
that and also adds a little more error checking to dtdiff.

dtc: Add code to make diffing trees easier

This patch adds a "dtdiff" script to do a useful form diff of two
device trees.  This automatically converts the tree to dts form (if
it's not already) and uses a new "-s" option in dtc to "sort" the
tree.  That is, it sorts the reserve entries, it sorts the properties
within each node by name, and it sorts nodes by name within their
parent.

This gives a pretty sensible diff between the trees, which will ignore
semantically null internal rearrangements (directly diffing the dts
files can give a lot of noise due to the order changes).

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/dtc.c
===================================================================
--- dtc.orig/dtc.c	2010-10-12 13:01:14.201760800 +1100
+++ dtc/dtc.c	2010-10-12 13:01:15.329772533 +1100
@@ -81,6 +81,8 @@ static void  __attribute__ ((noreturn)) 
 	fprintf(stderr, "\t\tSet the physical boot cpu\n");
 	fprintf(stderr, "\t-f\n");
 	fprintf(stderr, "\t\tForce - try to produce output even if the input tree has errors\n");
+	fprintf(stderr, "\t-s\n");
+	fprintf(stderr, "\t\tSort nodes and properties before outputting (only useful for\n\t\tcomparing trees)\n");
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
--- dtc.orig/dtc.h	2010-10-12 13:01:14.273759124 +1100
+++ dtc/dtc.h	2010-10-12 13:01:15.329772533 +1100
@@ -220,6 +220,7 @@ struct boot_info {
 
 struct boot_info *build_boot_info(struct reserve_info *reservelist,
 				  struct node *tree, uint32_t boot_cpuid_phys);
+void sort_tree(struct boot_info *bi);
 
 /* Checks */
 
Index: dtc/livetree.c
===================================================================
--- dtc.orig/livetree.c	2010-10-12 13:01:14.213773861 +1100
+++ dtc/livetree.c	2010-10-12 13:01:15.333761218 +1100
@@ -470,3 +470,140 @@ uint32_t guess_boot_cpuid(struct node *t
 
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
--- dtc.orig/tests/run_tests.sh	2010-10-12 13:01:14.321754445 +1100
+++ dtc/tests/run_tests.sh	2010-10-12 13:01:15.333761218 +1100
@@ -368,6 +368,13 @@ cmp_tests () {
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
Index: dtc/dtdiff
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/dtdiff	2010-10-12 13:06:45.158129767 +1100
@@ -0,0 +1,38 @@
+#! /bin/bash
+
+# This script uses the bash <(...) extension.
+# If you want to change this to work with a generic /bin/sh, make sure
+# you fix that.
+
+
+DTC=dtc
+
+source_and_sort () {
+    DT="$1"
+    if [ -d "$DT" ]; then
+	IFORMAT=fs
+    elif [ -f "$DT" ]; then
+	case "$DT" in
+	    *.dts)
+		IFORMAT=dts
+		;;
+	    *.dtb)
+		IFORMAT=dtb
+		;;
+	esac
+    fi
+
+    if [ -z "$IFORMAT" ]; then
+	echo "Unrecognized format for $DT" >&2
+	exit 2
+    fi
+
+    $DTC -I $IFORMAT -O dts -qq -f -s -o - "$DT"
+}
+
+if [ $# != 2 ]; then
+    echo "Usage: dtdiff <device tree> <device tree>" >&2
+    exit 1
+fi
+
+diff -u <(source_and_sort "$1") <(source_and_sort "$2")
Index: dtc/Makefile
===================================================================
--- dtc.orig/Makefile	2010-10-12 13:04:06.652786797 +1100
+++ dtc/Makefile	2010-10-12 13:04:29.910773699 +1100
@@ -111,6 +111,7 @@ BIN += convert-dtsv0
 BIN += dtc
 BIN += ftdump
 
+SCRIPTS = dtdiff
 
 all: $(BIN) libfdt
 
@@ -155,10 +156,10 @@ endif
 # intermediate target and building them again "for real"
 .SECONDARY: $(DTC_GEN_SRCS) $(CONVERT_GEN_SRCS)
 
-install: all
+install: all $(SCRIPTS)
 	@$(VECHO) INSTALL
 	$(INSTALL) -d $(DESTDIR)$(BINDIR)
-	$(INSTALL) $(BIN) $(DESTDIR)$(BINDIR)
+	$(INSTALL) $(BIN) $(SCRIPTS) $(DESTDIR)$(BINDIR)
 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
 	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
 	$(INSTALL) -m 644 $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
