From: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Subject: Re: dtc: Allow multiple labels on nodes and properties (v2)
Date: Wed, 24 Feb 2010 18:22:17 +1100
Message-ID: <20100224072217.GJ7187@yookeroo>
References: <20100224010312.GF7187@yookeroo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20100224010312.GF7187@yookeroo>
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
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Oops, don't apply that one, it has an uninitialized variable bug.
Here's a fixed version.

dtc: Allow multiple labels on nodes and properties

At present, both the grammar and our internal data structures mean
that there can be only one label on a node or property.  This is a
fairly arbitrary constraint, given that any number of value labels can
appear at the same point, and that in C you can have any number of
labels on the same statement.

This is pretty much a non-issue now, but it may become important with
some of the extensions that Grant and I have in mind.  It's not that
hard to change, so this patch does so, allowing an arbitrary number of
labels on any given node or property.  As usual a testcase is added
too.

Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Index: dtc/tests/multilabel.dts
===================================================================
--- /dev/null	1970-01-01 00:00:00.000000000 +0000
+++ dtc/tests/multilabel.dts	2010-02-24 17:57:12.736958851 +1100
@@ -0,0 +1,38 @@
+/dts-v1/;
+
+m1: mq: /memreserve/ 0 0x1000;
+
+/ {
+	p1: px: prop = "foo";
+
+	/* Explicit phandles */
+	n1: nx: node1 {
+		linux,phandle = <0x2000>;
+		ref = <&{/node2}>; /* reference precedes target */
+		lref = <&ny>;
+	};
+	ny: n2: node2 {
+		phandle = <0x1>;
+		ref = <&{/node1}>; /* reference after target */
+		lref = <&nx>;
+	};
+
+	/* Implicit phandles */
+	n3: node3 {
+		ref = <&{/node4}>;
+		lref = <&n4>;
+	};
+	n4: node4 {
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
+	};
+};
Index: dtc/tests/run_tests.sh
===================================================================
--- dtc.orig/tests/run_tests.sh	2010-02-24 17:57:09.799958623 +1100
+++ dtc/tests/run_tests.sh	2010-02-24 18:19:49.104958482 +1100
@@ -222,6 +222,9 @@ dtc_tests () {
 	run_test phandle_format dtc_references.test.$f.dtb $f
     done
 
+    run_dtc_test -I dts -O dtb -o multilabel.test.dtb multilabel.dts
+    run_test references multilabel.test.dtb
+
     run_dtc_test -I dts -O dtb -o dtc_comments.test.dtb comments.dts
     run_dtc_test -I dts -O dtb -o dtc_comments-cmp.test.dtb comments-cmp.dts
     run_test dtbs_equal_ordered dtc_comments.test.dtb dtc_comments-cmp.test.dtb
Index: dtc/dtc-parser.y
===================================================================
--- dtc.orig/dtc-parser.y	2010-02-24 17:57:09.771961279 +1100
+++ dtc/dtc-parser.y	2010-02-24 17:57:12.740957125 +1100
@@ -78,7 +78,6 @@ static unsigned long long eval_literal(c
 %type <node> nodedef
 %type <node> subnode
 %type <nodelist> subnodes
-%type <labelref> label
 
 %%
 
@@ -102,9 +101,14 @@ memreserves:
 	;
 
 memreserve:
-	  label DT_MEMRESERVE addr addr ';'
+	  DT_MEMRESERVE addr addr ';'
 		{
-			$$ = build_reserve_entry($3, $4, $1);
+			$$ = build_reserve_entry($2, $3);
+		}
+	| DT_LABEL memreserve
+		{
+			add_label(&$2->labels, $1);
+			$$ = $2;
 		}
 	;
 
@@ -118,7 +122,7 @@ addr:
 devicetree:
 	  '/' nodedef
 		{
-			$$ = name_node($2, "", NULL);
+			$$ = name_node($2, "");
 		}
 	;
 
@@ -141,13 +145,18 @@ proplist:
 	;
 
 propdef:
-	  label DT_PROPNODENAME '=' propdata ';'
+	  DT_PROPNODENAME '=' propdata ';'
+		{
+			$$ = build_property($1, $3);
+		}
+	| DT_PROPNODENAME ';'
 		{
-			$$ = build_property($2, $4, $1);
+			$$ = build_property($1, empty_data);
 		}
-	| label DT_PROPNODENAME ';'
+	| DT_LABEL propdef
 		{
-			$$ = build_property($2, empty_data, $1);
+			add_label(&$2->labels, $1);
+			$$ = $2;
 		}
 	;
 
@@ -264,7 +273,7 @@ subnodes:
 		{
 			$$ = NULL;
 		}
-	|  subnode subnodes
+	| subnode subnodes
 		{
 			$$ = chain_node($1, $2);
 		}
@@ -276,20 +285,14 @@ subnodes:
 	;
 
 subnode:
-	  label DT_PROPNODENAME nodedef
+	  DT_PROPNODENAME nodedef
 		{
-			$$ = name_node($3, $2, $1);
+			$$ = name_node($2, $1);
 		}
-	;
-
-label:
-	  /* empty */
+	| DT_LABEL subnode
 		{
-			$$ = NULL;
-		}
-	| DT_LABEL
-		{
-			$$ = $1;
+			add_label(&$2->labels, $1);
+			$$ = $2;
 		}
 	;
 
Index: dtc/dtc.h
===================================================================
--- dtc.orig/dtc.h	2010-02-24 17:57:09.647957591 +1100
+++ dtc/dtc.h	2010-02-24 17:57:12.740957125 +1100
@@ -125,13 +125,18 @@ int data_is_one_string(struct data d);
 #define MAX_NODENAME_LEN	31
 
 /* Live trees */
+struct label {
+	char *label;
+	struct label *next;
+};
+
 struct property {
 	char *name;
 	struct data val;
 
 	struct property *next;
 
-	char *label;
+	struct label *labels;
 };
 
 struct node {
@@ -148,21 +153,26 @@ struct node {
 	cell_t phandle;
 	int addr_cells, size_cells;
 
-	char *label;
+	struct label *labels;
 };
 
+#define for_each_label(l0, l) \
+	for ((l) = (l0); (l); (l) = (l)->next)
+
 #define for_each_property(n, p) \
 	for ((p) = (n)->proplist; (p); (p) = (p)->next)
 
 #define for_each_child(n, c)	\
 	for ((c) = (n)->children; (c); (c) = (c)->next_sibling)
 
-struct property *build_property(char *name, struct data val, char *label);
+void add_label(struct label **labels, char *label);
+
+struct property *build_property(char *name, struct data val);
 struct property *chain_property(struct property *first, struct property *list);
 struct property *reverse_properties(struct property *first);
 
 struct node *build_node(struct property *proplist, struct node *children);
-struct node *name_node(struct node *node, char *name, char *label);
+struct node *name_node(struct node *node, char *name);
 struct node *chain_node(struct node *first, struct node *list);
 
 void add_property(struct node *node, struct property *prop);
@@ -191,10 +201,10 @@ struct reserve_info {
 
 	struct reserve_info *next;
 
-	char *label;
+	struct label *labels;
 };
 
-struct reserve_info *build_reserve_entry(uint64_t start, uint64_t len, char *label);
+struct reserve_info *build_reserve_entry(uint64_t start, uint64_t len);
 struct reserve_info *chain_reserve_entry(struct reserve_info *first,
 					 struct reserve_info *list);
 struct reserve_info *add_reserve_entry(struct reserve_info *list,
Index: dtc/flattree.c
===================================================================
--- dtc.orig/flattree.c	2010-02-24 17:57:09.851957689 +1100
+++ dtc/flattree.c	2010-02-24 17:57:12.740957125 +1100
@@ -52,9 +52,9 @@ struct emitter {
 	void (*string)(void *, char *, int);
 	void (*align)(void *, int);
 	void (*data)(void *, struct data);
-	void (*beginnode)(void *, const char *);
-	void (*endnode)(void *, const char *);
-	void (*property)(void *, const char *);
+	void (*beginnode)(void *, struct label *labels);
+	void (*endnode)(void *, struct label *labels);
+	void (*property)(void *, struct label *labels);
 };
 
 static void bin_emit_cell(void *e, cell_t val)
@@ -89,17 +89,17 @@ static void bin_emit_data(void *e, struc
 	*dtbuf = data_append_data(*dtbuf, d.val, d.len);
 }
 
-static void bin_emit_beginnode(void *e, const char *label)
+static void bin_emit_beginnode(void *e, struct label *labels)
 {
 	bin_emit_cell(e, FDT_BEGIN_NODE);
 }
 
-static void bin_emit_endnode(void *e, const char *label)
+static void bin_emit_endnode(void *e, struct label *labels)
 {
 	bin_emit_cell(e, FDT_END_NODE);
 }
 
-static void bin_emit_property(void *e, const char *label)
+static void bin_emit_property(void *e, struct label *labels)
 {
 	bin_emit_cell(e, FDT_PROP);
 }
@@ -191,37 +191,40 @@ static void asm_emit_data(void *e, struc
 	assert(off == d.len);
 }
 
-static void asm_emit_beginnode(void *e, const char *label)
+static void asm_emit_beginnode(void *e, struct label *labels)
 {
 	FILE *f = e;
+	struct label *l;
 
-	if (label) {
-		fprintf(f, "\t.globl\t%s\n", label);
-		fprintf(f, "%s:\n", label);
+	for_each_label(labels, l) {
+		fprintf(f, "\t.globl\t%s\n", l->label);
+		fprintf(f, "%s:\n", l->label);
 	}
 	fprintf(f, "\t/* FDT_BEGIN_NODE */\n");
 	asm_emit_cell(e, FDT_BEGIN_NODE);
 }
 
-static void asm_emit_endnode(void *e, const char *label)
+static void asm_emit_endnode(void *e, struct label *labels)
 {
 	FILE *f = e;
+	struct label *l;
 
 	fprintf(f, "\t/* FDT_END_NODE */\n");
 	asm_emit_cell(e, FDT_END_NODE);
-	if (label) {
-		fprintf(f, "\t.globl\t%s_end\n", label);
-		fprintf(f, "%s_end:\n", label);
+	for_each_label(labels, l) {
+		fprintf(f, "\t.globl\t%s_end\n", l->label);
+		fprintf(f, "%s_end:\n", l->label);
 	}
 }
 
-static void asm_emit_property(void *e, const char *label)
+static void asm_emit_property(void *e, struct label *labels)
 {
 	FILE *f = e;
+	struct label *l;
 
-	if (label) {
-		fprintf(f, "\t.globl\t%s\n", label);
-		fprintf(f, "%s:\n", label);
+	for_each_label(labels, l) {
+		fprintf(f, "\t.globl\t%s\n", l->label);
+		fprintf(f, "%s:\n", l->label);
 	}
 	fprintf(f, "\t/* FDT_PROP */\n");
 	asm_emit_cell(e, FDT_PROP);
@@ -260,7 +263,7 @@ static void flatten_tree(struct node *tr
 	struct node *child;
 	int seen_name_prop = 0;
 
-	emit->beginnode(etarget, tree->label);
+	emit->beginnode(etarget, tree->labels);
 
 	if (vi->flags & FTF_FULLPATH)
 		emit->string(etarget, tree->fullpath, 0);
@@ -277,7 +280,7 @@ static void flatten_tree(struct node *tr
 
 		nameoff = stringtable_insert(strbuf, prop->name);
 
-		emit->property(etarget, prop->label);
+		emit->property(etarget, prop->labels);
 		emit->cell(etarget, prop->val.len);
 		emit->cell(etarget, nameoff);
 
@@ -304,7 +307,7 @@ static void flatten_tree(struct node *tr
 		flatten_tree(child, emit, etarget, strbuf, vi);
 	}
 
-	emit->endnode(etarget, tree->label);
+	emit->endnode(etarget, tree->labels);
 }
 
 static struct data flatten_reserve_list(struct reserve_info *reservelist,
@@ -525,9 +528,11 @@ void dt_to_asm(FILE *f, struct boot_info
 	 * as it appears .quad isn't available in some assemblers.
 	 */
 	for (re = bi->reservelist; re; re = re->next) {
-		if (re->label) {
-			fprintf(f, "\t.globl\t%s\n", re->label);
-			fprintf(f, "%s:\n", re->label);
+		struct label *l;
+
+		for_each_label(re->labels, l) {
+			fprintf(f, "\t.globl\t%s\n", l->label);
+			fprintf(f, "%s:\n", l->label);
 		}
 		ASM_EMIT_BELONG(f, "0x%08x", (unsigned int)(re->re.address >> 32));
 		ASM_EMIT_BELONG(f, "0x%08x",
@@ -684,7 +689,7 @@ static struct property *flat_read_proper
 
 	val = flat_read_data(dtbuf, proplen);
 
-	return build_property(name, val, NULL);
+	return build_property(name, val);
 }
 
 
@@ -709,7 +714,7 @@ static struct reserve_info *flat_read_me
 		if (re.size == 0)
 			break;
 
-		new = build_reserve_entry(re.address, re.size, NULL);
+		new = build_reserve_entry(re.address, re.size);
 		reservelist = add_reserve_entry(reservelist, new);
 	}
 
Index: dtc/fstree.c
===================================================================
--- dtc.orig/fstree.c	2010-02-24 17:57:09.691957110 +1100
+++ dtc/fstree.c	2010-02-24 17:57:12.744957075 +1100
@@ -60,8 +60,7 @@ static struct node *read_fstree(const ch
 			} else {
 				prop = build_property(xstrdup(de->d_name),
 						      data_copy_file(pfile,
-								     st.st_size),
-						      NULL);
+								     st.st_size));
 				add_property(tree, prop);
 				fclose(pfile);
 			}
@@ -69,8 +68,7 @@ static struct node *read_fstree(const ch
 			struct node *newchild;
 
 			newchild = read_fstree(tmpnam);
-			newchild = name_node(newchild, xstrdup(de->d_name),
-					     NULL);
+			newchild = name_node(newchild, xstrdup(de->d_name));
 			add_child(tree, newchild);
 		}
 
@@ -85,7 +83,7 @@ struct boot_info *dt_from_fs(const char 
 	struct node *tree;
 
 	tree = read_fstree(dirname);
-	tree = name_node(tree, "", NULL);
+	tree = name_node(tree, "");
 
 	return build_boot_info(NULL, tree, guess_boot_cpuid(tree));
 }
Index: dtc/livetree.c
===================================================================
--- dtc.orig/livetree.c	2010-02-24 17:57:09.683978721 +1100
+++ dtc/livetree.c	2010-02-24 18:20:25.684957337 +1100
@@ -24,17 +24,24 @@
  * Tree building functions
  */
 
-struct property *build_property(char *name, struct data val, char *label)
+void add_label(struct label **labels, char *label)
+{
+	struct label *new = xmalloc(sizeof(*new));
+
+	new->label = label;
+	new->next = *labels;
+	*labels = new;
+}
+
+struct property *build_property(char *name, struct data val)
 {
 	struct property *new = xmalloc(sizeof(*new));
 
+	memset(new, 0, sizeof(*new));
+
 	new->name = name;
 	new->val = val;
 
-	new->next = NULL;
-
-	new->label = label;
-
 	return new;
 }
 
@@ -78,14 +85,12 @@ struct node *build_node(struct property 
 	return new;
 }
 
-struct node *name_node(struct node *node, char *name, char * label)
+struct node *name_node(struct node *node, char *name)
 {
 	assert(node->name == NULL);
 
 	node->name = name;
 
-	node->label = label;
-
 	return node;
 }
 
@@ -124,18 +129,15 @@ void add_child(struct node *parent, stru
 	*p = child;
 }
 
-struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size,
-					 char *label)
+struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
 {
 	struct reserve_info *new = xmalloc(sizeof(*new));
 
+	memset(new, 0, sizeof(*new));
+
 	new->re.address = address;
 	new->re.size = size;
 
-	new->next = NULL;
-
-	new->label = label;
-
 	return new;
 }
 
@@ -217,8 +219,11 @@ struct property *get_property_by_label(s
 	*node = tree;
 
 	for_each_property(tree, prop) {
-		if (prop->label && streq(prop->label, label))
-			return prop;
+		struct label *l;
+
+		for_each_label(prop->labels, l)
+			if (streq(l->label, label))
+				return prop;
 	}
 
 	for_each_child(tree, c) {
@@ -296,11 +301,13 @@ struct node *get_node_by_path(struct nod
 struct node *get_node_by_label(struct node *tree, const char *label)
 {
 	struct node *child, *node;
+	struct label *l;
 
 	assert(label && (strlen(label) > 0));
 
-	if (tree->label && streq(tree->label, label))
-		return tree;
+	for_each_label(tree->labels, l)
+		if (streq(l->label, label))
+			return tree;
 
 	for_each_child(tree, child) {
 		node = get_node_by_label(child, label);
@@ -353,15 +360,13 @@ cell_t get_node_phandle(struct node *roo
 	    && (phandle_format & PHANDLE_LEGACY))
 		add_property(node,
 			     build_property("linux,phandle",
-					    data_append_cell(empty_data, phandle),
-					    NULL));
+					    data_append_cell(empty_data, phandle)));
 
 	if (!get_property(node, "phandle")
 	    && (phandle_format & PHANDLE_EPAPR))
 		add_property(node,
 			     build_property("phandle",
-					    data_append_cell(empty_data, phandle),
-					    NULL));
+					    data_append_cell(empty_data, phandle)));
 
 	/* If the node *does* have a phandle property, we must
 	 * be dealing with a self-referencing phandle, which will be
Index: dtc/checks.c
===================================================================
--- dtc.orig/checks.c	2010-02-24 17:57:09.611978088 +1100
+++ dtc/checks.c	2010-02-24 17:57:12.744957075 +1100
@@ -314,16 +314,19 @@ static void check_duplicate_label(struct
 static void check_duplicate_label_node(struct check *c, struct node *dt,
 				       struct node *node)
 {
-	if (node->label)
-		check_duplicate_label(c, dt, node->label, node, NULL, NULL);
+	struct label *l;
+
+	for_each_label(node->labels, l)
+		check_duplicate_label(c, dt, l->label, node, NULL, NULL);
 }
 static void check_duplicate_label_prop(struct check *c, struct node *dt,
 				       struct node *node, struct property *prop)
 {
 	struct marker *m = prop->val.markers;
+	struct label *l;
 
-	if (prop->label)
-		check_duplicate_label(c, dt, prop->label, node, prop, NULL);
+	for_each_label(prop->labels, l)
+		check_duplicate_label(c, dt, l->label, node, prop, NULL);
 
 	for_each_marker_of_type(m, LABEL)
 		check_duplicate_label(c, dt, m->ref, node, prop, m);
Index: dtc/treesource.c
===================================================================
--- dtc.orig/treesource.c	2010-02-24 17:57:09.823956925 +1100
+++ dtc/treesource.c	2010-02-24 17:57:12.744957075 +1100
@@ -235,10 +235,11 @@ static void write_tree_source_node(FILE 
 {
 	struct property *prop;
 	struct node *child;
+	struct label *l;
 
 	write_prefix(f, level);
-	if (tree->label)
-		fprintf(f, "%s: ", tree->label);
+	for_each_label(tree->labels, l)
+		fprintf(f, "%s: ", l->label);
 	if (tree->name && (*tree->name))
 		fprintf(f, "%s {\n", tree->name);
 	else
@@ -246,8 +247,8 @@ static void write_tree_source_node(FILE 
 
 	for_each_property(tree, prop) {
 		write_prefix(f, level+1);
-		if (prop->label)
-			fprintf(f, "%s: ", prop->label);
+		for_each_label(prop->labels, l)
+			fprintf(f, "%s: ", l->label);
 		fprintf(f, "%s", prop->name);
 		write_propval(f, prop);
 	}
@@ -267,8 +268,10 @@ void dt_to_source(FILE *f, struct boot_i
 	fprintf(f, "/dts-v1/;\n\n");
 
 	for (re = bi->reservelist; re; re = re->next) {
-		if (re->label)
-			fprintf(f, "%s: ", re->label);
+		struct label *l;
+
+		for_each_label(re->labels, l)
+			fprintf(f, "%s: ", l->label);
 		fprintf(f, "/memreserve/\t0x%016llx 0x%016llx;\n",
 			(unsigned long long)re->re.address,
 			(unsigned long long)re->re.size);


-- 
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson
