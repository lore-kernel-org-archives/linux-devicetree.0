From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH] dtc: check for duplicate labels when they are defined
Date: Tue, 27 Mar 2012 21:39:44 -0600
Message-ID: <1332905984-2130-1-git-send-email-swarren@wwwdotorg.org>
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
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>, Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently, the DT is checked for duplicate labels after the entire DT has
been parsed. However, once parts of the DT can be deleted, some entities
with labels may have been deleted by this time, thus making those labels
invisible to the duplicate label check, which can then lead to false
negatives.

Instead, maintain a list of all known labels, from which entries are
never deleted, and check against this list for duplicates when adding
labels.

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
This patch should be applied before my previously posted "dtc: Add
ability to delete nodes and properties". I believe it addresses David's
concerns with that patch re: the assumption that labels are immutable.

 checks.c           |   58 ----------------------------------------------------
 data.c             |    3 ++
 dtc.h              |    1 +
 livetree.c         |   18 ++++++++++++---
 tests/run_tests.sh |   12 +++++-----
 5 files changed, 24 insertions(+), 68 deletions(-)

diff --git a/checks.c b/checks.c
index a662a00..a625e29 100644
--- a/checks.c
+++ b/checks.c
@@ -278,62 +278,6 @@ static void check_property_name_chars(struct check *c, struct node *dt,
 }
 PROP_CHECK(property_name_chars, PROPNODECHARS, ERROR);
 
-#define DESCLABEL_FMT	"%s%s%s%s%s"
-#define DESCLABEL_ARGS(node,prop,mark)		\
-	((mark) ? "value of " : ""),		\
-	((prop) ? "'" : ""), \
-	((prop) ? (prop)->name : ""), \
-	((prop) ? "' in " : ""), (node)->fullpath
-
-static void check_duplicate_label(struct check *c, struct node *dt,
-				  const char *label, struct node *node,
-				  struct property *prop, struct marker *mark)
-{
-	struct node *othernode = NULL;
-	struct property *otherprop = NULL;
-	struct marker *othermark = NULL;
-
-	othernode = get_node_by_label(dt, label);
-
-	if (!othernode)
-		otherprop = get_property_by_label(dt, label, &othernode);
-	if (!othernode)
-		othermark = get_marker_label(dt, label, &othernode,
-					       &otherprop);
-
-	if (!othernode)
-		return;
-
-	if ((othernode != node) || (otherprop != prop) || (othermark != mark))
-		FAIL(c, "Duplicate label '%s' on " DESCLABEL_FMT
-		     " and " DESCLABEL_FMT,
-		     label, DESCLABEL_ARGS(node, prop, mark),
-		     DESCLABEL_ARGS(othernode, otherprop, othermark));
-}
-
-static void check_duplicate_label_node(struct check *c, struct node *dt,
-				       struct node *node)
-{
-	struct label *l;
-
-	for_each_label(node->labels, l)
-		check_duplicate_label(c, dt, l->label, node, NULL, NULL);
-}
-static void check_duplicate_label_prop(struct check *c, struct node *dt,
-				       struct node *node, struct property *prop)
-{
-	struct marker *m = prop->val.markers;
-	struct label *l;
-
-	for_each_label(prop->labels, l)
-		check_duplicate_label(c, dt, l->label, node, prop, NULL);
-
-	for_each_marker_of_type(m, LABEL)
-		check_duplicate_label(c, dt, m->ref, node, prop, m);
-}
-CHECK(duplicate_label, NULL, check_duplicate_label_node,
-      check_duplicate_label_prop, NULL, ERROR);
-
 static void check_explicit_phandles(struct check *c, struct node *root,
 				    struct node *node, struct property *prop)
 {
@@ -630,8 +574,6 @@ static struct check *check_table[] = {
 	&node_name_chars, &node_name_format, &property_name_chars,
 	&name_is_string, &name_properties,
 
-	&duplicate_label,
-
 	&explicit_phandles,
 	&phandle_references, &path_references,
 
diff --git a/data.c b/data.c
index 4a40c5b..16091c1 100644
--- a/data.c
+++ b/data.c
@@ -241,6 +241,9 @@ struct data data_add_marker(struct data d, enum markertype type, char *ref)
 {
 	struct marker *m;
 
+	if (type == LABEL)
+		add_label(NULL, ref);
+
 	m = xmalloc(sizeof(*m));
 	m->offset = d.len;
 	m->type = type;
diff --git a/dtc.h b/dtc.h
index 7b4c65b..bcd5913 100644
--- a/dtc.h
+++ b/dtc.h
@@ -129,6 +129,7 @@ int data_is_one_string(struct data d);
 struct label {
 	char *label;
 	struct label *next;
+	struct label *all_next;
 };
 
 struct property {
diff --git a/livetree.c b/livetree.c
index c9209d5..f12f2c9 100644
--- a/livetree.c
+++ b/livetree.c
@@ -24,19 +24,29 @@
  * Tree building functions
  */
 
+struct label *all_labels;
+
+extern void print_error(char const *fmt, ...);
+
 void add_label(struct label **labels, char *label)
 {
 	struct label *new;
 
 	/* Make sure the label isn't already there */
-	for_each_label(*labels, new)
+	for_each_label(all_labels, new)
 		if (streq(new->label, label))
-			return;
+			print_error("Duplicate label '%s'", label);
 
 	new = xmalloc(sizeof(*new));
 	new->label = label;
-	new->next = *labels;
-	*labels = new;
+	if (labels)
+		new->next = *labels;
+	else
+		new->next = NULL;
+	new->all_next = all_labels;
+	if (labels)
+		*labels = new;
+	all_labels = new;
 }
 
 struct property *build_property(char *name, struct data val)
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index e470b82..006e5fb 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -391,12 +391,12 @@ dtc_tests () {
     run_sh_test dtc-checkfails.sh node_name_format -- -I dtb -O dtb bad_node_format.dtb
     run_sh_test dtc-checkfails.sh prop_name_chars -- -I dtb -O dtb bad_prop_char.dtb
 
-    run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label1.dts
-    run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label2.dts
-    run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label3.dts
-    run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label4.dts
-    run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label5.dts
-    run_sh_test dtc-checkfails.sh duplicate_label -- -I dts -O dtb reuse-label6.dts
+    run_sh_test dtc-fatal.sh -I dts -O dtb reuse-label1.dts
+    run_sh_test dtc-fatal.sh -I dts -O dtb reuse-label2.dts
+    run_sh_test dtc-fatal.sh -I dts -O dtb reuse-label3.dts
+    run_sh_test dtc-fatal.sh -I dts -O dtb reuse-label4.dts
+    run_sh_test dtc-fatal.sh -I dts -O dtb reuse-label5.dts
+    run_sh_test dtc-fatal.sh -I dts -O dtb reuse-label6.dts
 
     # Check for proper behaviour reading from stdin
     run_dtc_test -I dts -O dtb -o stdin_dtc_tree1.test.dtb - < test_tree1.dts
-- 
1.7.5.4
