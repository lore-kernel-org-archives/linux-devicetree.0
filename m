From: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH 2/4] Implements a new feature for deleting existing device
	tree nodes.
Date: Tue, 02 Nov 2010 15:55:13 -0700
Message-ID: <20101102225513.1707.63945.stgit@riker>
References: <20101102225243.1707.23433.stgit@riker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20101102225243.1707.23433.stgit@riker>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is interesting when the /include/ "<filename>" feature is used. This way
we can create base device tree source files for a family of systems and modify
the device tree for a specific system.

The current sytem allows an existing node to be extended with new properties
and subnodes.

The new features allow an existing node to be replaced completely by the new
properties and subnodes. The new features also allow an existing node to be
deleted.

Signed-off-by: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---

 Makefile.dtc       |    1 +
 checks.c           |   20 ++++++++++++++++++++
 dtc-lexer.l        |    6 ++++++
 dtc-parser.y       |   15 +++++++++++++++
 dtc.h              |    5 +++++
 livetree.c         |   39 +++++++++++++++++++++++++++++++++++++++
 tests/run_tests.sh |    2 ++
 util.h             |   10 ++++++++++
 8 files changed, 98 insertions(+), 0 deletions(-)

diff --git a/Makefile.dtc b/Makefile.dtc
index bece49b..0fe3186 100644
--- a/Makefile.dtc
+++ b/Makefile.dtc
@@ -12,6 +12,7 @@ DTC_SRCS = \
 	livetree.c \
 	srcpos.c \
 	treesource.c \
+	strtbl.c \
 	util.c
 
 DTC_GEN_SRCS = dtc-lexer.lex.c dtc-parser.tab.c
diff --git a/checks.c b/checks.c
index a662a00..56e8817 100644
--- a/checks.c
+++ b/checks.c
@@ -19,6 +19,7 @@
  */
 
 #include "dtc.h"
+#include "srcpos.h"
 
 #ifdef TRACE_CHECKS
 #define TRACE(c, ...) \
@@ -292,6 +293,25 @@ static void check_duplicate_label(struct check *c, struct node *dt,
 	struct node *othernode = NULL;
 	struct property *otherprop = NULL;
 	struct marker *othermark = NULL;
+	struct srcpos *pos;
+
+	pos = strtbl_str_data(removed_labels, label);
+
+	if (pos) {
+		/* Then the label did exist, but the node it's in was removed */
+		if (pos->file)
+			FAIL(c, "Duplicate label '%s' on " DESCLABEL_FMT
+			     " and removed node defined at line %d in file %s",
+			     label, DESCLABEL_ARGS(node, prop, mark),
+			     pos->first_line, pos->file->name);
+		else
+			FAIL(c, "Duplicate label '%s' on " DESCLABEL_FMT
+			     " and removed node defined at line %d",
+			     label, DESCLABEL_ARGS(node, prop, mark),
+			     pos->first_line);
+	} else {
+		/* Check to see if the label is already in another node */
+	}
 
 	othernode = get_node_by_label(dt, label);
 
diff --git a/dtc-lexer.l b/dtc-lexer.l
index e866ea5..bcabbfe 100644
--- a/dtc-lexer.l
+++ b/dtc-lexer.l
@@ -96,6 +96,12 @@ static int pop_input_file(void);
 			return DT_MEMRESERVE;
 		}
 
+<*>"/remove-node/"	{
+			DPRINT("Keyword: /remove-node/\n");
+			BEGIN_DEFAULT();
+			return DT_REMOVENODE;
+		}
+
 <*>{LABEL}:	{
 			DPRINT("Label: %s\n", yytext);
 			yylval.labelref = xstrdup(yytext);
diff --git a/dtc-parser.y b/dtc-parser.y
index 5e84a67..4814d34 100644
--- a/dtc-parser.y
+++ b/dtc-parser.y
@@ -33,6 +33,8 @@ extern void yyerror(char const *s);
 extern struct boot_info *the_boot_info;
 extern int treesource_error;
 
+strtbl label_table = NULL;
+
 static unsigned long long eval_literal(const char *s, int base, int bits);
 %}
 
@@ -55,6 +57,7 @@ static unsigned long long eval_literal(const char *s, int base, int bits);
 
 %token DT_V1
 %token DT_MEMRESERVE
+%token DT_REMOVENODE
 %token <propnodename> DT_PROPNODENAME
 %token <literal> DT_LITERAL
 %token <cbase> DT_BASE
@@ -108,6 +111,7 @@ memreserve:
 		}
 	| DT_LABEL memreserve
 		{
+			strtbl_insert(&label_table, $1, srcpos_copy(&yylloc));
 			add_label(&$2->labels, $1);
 			$$ = $2;
 		}
@@ -139,6 +143,15 @@ devicetree:
 				print_error("label or path, '%s', not found", $2);
 			$$ = $1;
 		}
+	| devicetree DT_REMOVENODE DT_REF ';'
+		{
+			struct node *target = get_node_by_ref($1, $3);
+
+			if (target)
+				remove_child(target->parent, target);
+			else
+				print_error("label or path, '%s', not found", $3);
+		}
 	;
 
 nodedef:
@@ -170,6 +183,7 @@ propdef:
 		}
 	| DT_LABEL propdef
 		{
+			strtbl_insert(&label_table, $1, srcpos_copy(&yylloc));
 			add_label(&$2->labels, $1);
 			$$ = $2;
 		}
@@ -305,6 +319,7 @@ subnode:
 		}
 	| DT_LABEL subnode
 		{
+			strtbl_insert(&label_table, $1, srcpos_copy(&yylloc));
 			add_label(&$2->labels, $1);
 			$$ = $2;
 		}
diff --git a/dtc.h b/dtc.h
index b36ac5d..95e3bd1 100644
--- a/dtc.h
+++ b/dtc.h
@@ -35,6 +35,7 @@
 #include <fdt.h>
 
 #include "util.h"
+#include "strtbl.h"
 
 #ifdef DEBUG
 #define debug(fmt,args...)	printf(fmt, ##args)
@@ -178,6 +179,7 @@ struct node *merge_nodes(struct node *old_node, struct node *new_node);
 
 void add_property(struct node *node, struct property *prop);
 void add_child(struct node *parent, struct node *child);
+void remove_child(struct node *parent, struct node *child);
 
 const char *get_unitname(struct node *node);
 struct property *get_property(struct node *node, const char *propname);
@@ -221,6 +223,9 @@ struct boot_info {
 struct boot_info *build_boot_info(struct reserve_info *reservelist,
 				  struct node *tree, uint32_t boot_cpuid_phys);
 
+extern strtbl label_table;
+extern strtbl removed_labels;
+
 /* Checks */
 
 void process_checks(int force, struct boot_info *bi);
diff --git a/livetree.c b/livetree.c
index 13c5f10..88de3c3 100644
--- a/livetree.c
+++ b/livetree.c
@@ -20,6 +20,8 @@
 
 #include "dtc.h"
 
+strtbl removed_labels = NULL;
+
 /*
  * Tree building functions
  */
@@ -202,6 +204,43 @@ void add_child(struct node *parent, struct node *child)
 	*p = child;
 }
 
+void remove_child(struct node *parent, struct node *child)
+{
+	struct node **p;
+	struct property *prop;
+	struct label *l;
+	void *data;
+
+	/* Make sure we've got a consistent tree here */
+	assert(child->parent == parent);
+
+	/* Keep track of removed node labels, maintaining the original
+	 * data associated with the label collected by the parser */
+	for_each_label(child->labels, l) {
+		data = strtbl_str_data(label_table, l->label);
+		strtbl_insert(&removed_labels, l->label, data);
+	}
+
+	/* Keep track of removed property labels, maintaining the original
+	 * data associated with the label collected by the parser */
+	for_each_property(child, prop) {
+		for_each_label(prop->labels, l) {
+			data = strtbl_str_data(label_table, l->label);
+			strtbl_insert(&removed_labels, l->label, data);
+		}
+	}
+
+	p = &parent->children;
+	while (*p) {
+		if (*p == child) {
+			*p = (*p)->next_sibling;
+			break;
+		}
+		p = &((*p)->next_sibling);
+	}
+	child->parent = NULL;
+}
+
 struct reserve_info *build_reserve_entry(uint64_t address, uint64_t size)
 {
 	struct reserve_info *new = xmalloc(sizeof(*new));
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index a887254..495e759 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -307,6 +307,8 @@ dtc_tests () {
     run_test dtbs_equal_ordered multilabel.test.dtb multilabel_merge.test.dtb
     run_dtc_test -I dts -O dtb -o dtc_tree1_merge_path.test.dtb test_tree1_merge_path.dts
     tree1_tests dtc_tree1_merge_path.test.dtb test_tree1.dtb
+    run_dtc_test -I dts -O dtb -o dtc_tree1_merge_remove.test.dtb test_tree1_merge_remove.dts
+    tree1_tests dtc_tree1_merge_remove.test.dtb test_tree1.dtb
 
     # Check some checks
     check_tests dup-nodename.dts duplicate_node_names
diff --git a/util.h b/util.h
index 9cead84..b544cbc 100644
--- a/util.h
+++ b/util.h
@@ -40,6 +40,16 @@ static inline void *xmalloc(size_t len)
 	return new;
 }
 
+static inline void *xcalloc(size_t nmemb, size_t len) {
+	void *new = calloc(nmemb, len);
+
+	if (!new)
+		die("calloc() failed\n");
+
+	return new;
+}
+
+
 static inline void *xrealloc(void *p, size_t len)
 {
 	void *new = realloc(p, len);
