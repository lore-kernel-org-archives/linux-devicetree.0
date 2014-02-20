From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RFC 2/5] dtc: livetree: Add more tree parsing helpers
Date: Thu, 20 Feb 2014 19:06:48 +0100
Message-ID: <1392919611-10746-3-git-send-email-t.figa@samsung.com>
References: <1392919611-10746-1-git-send-email-t.figa@samsung.com>
Return-path: <devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1392919611-10746-1-git-send-email-t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-compiler-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-compiler-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org, jdl-CYoMK+44s/E@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch extends the set of parsing helpers available in dtc with
string and phandle parsing.

Signed-off-by: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 dtc.h      |  28 ++++++++
 livetree.c | 230 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 258 insertions(+)

diff --git a/dtc.h b/dtc.h
index e95bed7..9ce9d12 100644
--- a/dtc.h
+++ b/dtc.h
@@ -163,6 +163,13 @@ struct node {
 	struct label *labels;
 };
 
+#define MAX_PHANDLE_ARGS 16
+struct of_phandle_args {
+	struct node *np;
+	int args_count;
+	uint32_t args[MAX_PHANDLE_ARGS];
+};
+
 #define for_each_label_withdel(l0, l) \
 	for ((l) = (l0); (l); (l) = (l)->next)
 
@@ -184,6 +191,11 @@ struct node {
 	for_each_child_withdel(n, c) \
 		if (!(c)->deleted)
 
+#define for_each_propval_string(p, s)	\
+	for (s = propval_next_string(p, NULL);		\
+		s;					\
+		s = propval_next_string(p, s))
+
 void add_label(struct label **labels, char *label);
 void delete_labels(struct label **labels);
 
@@ -208,6 +220,22 @@ void delete_node(struct node *node);
 const char *get_unitname(struct node *node);
 struct property *get_property(struct node *node, const char *propname);
 cell_t propval_cell(struct property *prop);
+int propval_string_count(struct node *np, struct property *prop);
+const char *propval_next_string(struct property *prop, const char *cur);
+int propval_match_string(struct property *prop, const char *string);
+struct node *propval_parse_phandle(struct node *root,
+				     struct property *prop, int index);
+int propval_parse_phandle_with_args(struct node *root,
+				    struct property *prop,
+				    const char *cells_name, int index,
+				    struct of_phandle_args *out_args);
+int propval_parse_phandle_with_fixed_args(struct node *root,
+					  struct property *prop, int cell_count,
+					  int index,
+					  struct of_phandle_args *out_args);
+int propval_count_phandle_with_args(struct node *root,
+				    struct property *prop,
+				    const char *cells_name);
 struct property *get_property_by_label(struct node *tree, const char *label,
 				       struct node **node);
 struct marker *get_marker_label(struct node *tree, const char *label,
diff --git a/livetree.c b/livetree.c
index b61465f..015ed06 100644
--- a/livetree.c
+++ b/livetree.c
@@ -377,6 +377,230 @@ cell_t propval_cell(struct property *prop)
 	return fdt32_to_cpu(*((cell_t *)prop->val.val));
 }
 
+int propval_string_count(struct node *np, struct property *prop)
+{
+	int i = 0;
+	size_t l = 0, total = 0;
+	const char *p;
+
+	if (!prop)
+		return -EINVAL;
+	if (!prop->val.val)
+		return -ENODATA;
+	if (strnlen(prop->val.val, prop->val.len) >= prop->val.len)
+		return -EILSEQ;
+
+	p = prop->val.val;
+
+	for (i = 0; total < prop->val.len; total += l, p += l, i++)
+		l = strlen(p) + 1;
+
+	return i;
+}
+
+const char *propval_next_string(struct property *prop, const char *cur)
+{
+	const char *curv = cur;
+
+	if (!prop)
+		return NULL;
+
+	if (!cur)
+		return prop->val.val;
+
+	curv += strlen(cur) + 1;
+	if (curv >= prop->val.val + prop->val.len)
+		return NULL;
+
+	return curv;
+}
+
+int propval_match_string(struct property *prop, const char *string)
+{
+	size_t l;
+	int i;
+	const char *p, *end;
+
+	if (!prop)
+		return -EINVAL;
+	if (!prop->val.val)
+		return -ENODATA;
+
+	p = prop->val.val;
+	end = p + prop->val.len;
+
+	for (i = 0; p < end; i++, p += l) {
+		l = strlen(p) + 1;
+		if (p + l > end)
+			return -EILSEQ;
+		if (strcmp(string, p) == 0)
+			return i; /* Found it; return index */
+	}
+	return -ENODATA;
+}
+
+static int parse_phandle_with_args(struct node *root,
+					struct property *prop,
+					const char *cells_name,
+					int cell_count, int index,
+					struct of_phandle_args *out_args)
+{
+	const cell_t *list, *list_end;
+	int rc = 0, size, cur_index = 0;
+	uint32_t count = 0;
+	struct node *node = NULL;
+	cell_t phandle;
+
+	/* Retrieve the phandle list property */
+	size = prop->val.len;
+	list = (const cell_t *)prop->val.val;
+	if (!list)
+		return -ENOENT;
+	list_end = list + size / sizeof(*list);
+
+	/* Loop over the phandles until all the requested entry is found */
+	while (list < list_end) {
+		rc = -EINVAL;
+		count = 0;
+
+		/*
+		 * If phandle is 0, then it is an empty entry with no
+		 * arguments.  Skip forward to the next entry.
+		 */
+		phandle = fdt32_to_cpu(*list++);
+		if (phandle) {
+			/*
+			 * Find the provider node and parse the #*-cells
+			 * property to determine the argument length.
+			 *
+			 * This is not needed if the cell count is hard-coded
+			 * (i.e. cells_name not set, but cell_count is set),
+			 * except when we're going to return the found node
+			 * below.
+			 */
+			if (cells_name || cur_index == index) {
+				node = get_node_by_phandle(root, phandle);
+				if (!node) {
+					pr_err("could not find phandle %u\n",
+						phandle);
+					goto err;
+				}
+			}
+
+			if (cells_name) {
+				struct property *cells_prop;
+
+				cells_prop = get_property(node, cells_name);
+				if (!cells_prop) {
+					pr_err("could not get %s for %s\n",
+						cells_name,
+						node->fullpath);
+					goto err;
+				}
+
+				count = propval_cell(cells_prop);
+			} else {
+				count = cell_count;
+			}
+
+			/*
+			 * Make sure that the arguments actually fit in the
+			 * remaining property data length
+			 */
+			if (list + count > list_end) {
+				pr_err("arguments longer than property\n");
+				goto err;
+			}
+		}
+
+		/*
+		 * All of the error cases above bail out of the loop, so at
+		 * this point, the parsing is successful. If the requested
+		 * index matches, then fill the out_args structure and return,
+		 * or return -ENOENT for an empty entry.
+		 */
+		rc = -ENOENT;
+		if (cur_index == index) {
+			if (!phandle)
+				goto err;
+
+			if (out_args) {
+				int i;
+				if (count > MAX_PHANDLE_ARGS) {
+					pr_warn("argument count higher than MAX_PHANDLE_ARGS\n");
+					count = MAX_PHANDLE_ARGS;
+				}
+				out_args->np = node;
+				out_args->args_count = count;
+				for (i = 0; i < count; i++)
+					out_args->args[i] = fdt32_to_cpu(*list++);
+			}
+
+			/* Found it! return success */
+			return 0;
+		}
+
+		node = NULL;
+		list += count;
+		cur_index++;
+	}
+
+	/*
+	 * Unlock node before returning result; will be one of:
+	 * -ENOENT : index is for empty phandle
+	 * -EINVAL : parsing error on data
+	 * [1..n]  : Number of phandle (count mode; when index = -1)
+	 */
+	rc = index < 0 ? cur_index : -ENOENT;
+ err:
+	return rc;
+}
+
+struct node *propval_parse_phandle(struct node *root,
+				     struct property *prop, int index)
+{
+	struct of_phandle_args args;
+
+	if (index < 0)
+		return NULL;
+
+	if (parse_phandle_with_args(root, prop, NULL, 0,
+					 index, &args))
+		return NULL;
+
+	return args.np;
+}
+
+int propval_parse_phandle_with_args(struct node *root,
+				    struct property *prop,
+				    const char *cells_name, int index,
+				    struct of_phandle_args *out_args)
+{
+	if (index < 0)
+		return -EINVAL;
+	return parse_phandle_with_args(root, prop, cells_name, 0,
+						index, out_args);
+}
+
+int propval_parse_phandle_with_fixed_args(struct node *root,
+					  struct property *prop, int cell_count,
+					  int index,
+					  struct of_phandle_args *out_args)
+{
+	if (index < 0)
+		return -EINVAL;
+	return parse_phandle_with_args(root, prop, NULL, cell_count,
+					   index, out_args);
+}
+
+int propval_count_phandle_with_args(struct node *root,
+				    struct property *prop,
+				    const char *cells_name)
+{
+	return parse_phandle_with_args(root, prop, cells_name, 0, -1,
+						NULL);
+}
+
 struct property *get_property_by_label(struct node *tree, const char *label,
 				       struct node **node)
 {
@@ -456,6 +680,12 @@ struct node *get_node_by_path(struct node *tree, const char *path)
 	while (path[0] == '/')
 		path++;
 
+	if (!(*path)) {
+		if (tree->deleted)
+			return NULL;
+		return tree;
+	}
+
 	p = strchr(path, '/');
 
 	for_each_child(tree, child) {
-- 
1.8.5.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree-compiler" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
