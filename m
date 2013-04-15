From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH] fdtput: expand fdt if value does not fit.
Date: Mon, 15 Apr 2013 07:36:50 +0100
Message-ID: <1366007810-17881-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: jdl-CYoMK+44s/E@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dwg-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org, srinivas.kandagatla-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>

If you try to insert a new node or extend a property with large value,
using fdtput you will notice that it always fails.

example:
fdtput -v -p -ts ./tst.dtb "/node-1" "property-1" "value-1
Error at 'node-1': FDT_ERR_NOSPACE

or

fdtput -v -c ./tst.dtb "/node-1"
Error at 'node-1': FDT_ERR_NOSPACE

or

fdtput -v  -ts ./tst.dtb "/node" "property" "very big value"
Decoding value:
	string: 'very big value'
Value size 15
Error at 'property': FDT_ERR_NOSPACE

All these error are returned from libfdt, as the size of the fdt passed
has no space to accomdate these new properties.

This patch adds realloc functions in fdtput to allocate new space in fdt
when it detects a shortage in space for new value or node. With this
patch, fdtput can insert a new node or property or extend a property
with new value greater than original size.

Without this patch fdtput tool complains with FDT_ERR_NOSPACE when we
try to add a node/property or extend the value of a property.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
---
 fdtput.c |   83 +++++++++++++++++++++++++++++++++++++++++++++++++++----------
 1 files changed, 69 insertions(+), 14 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index f2197f5..2b158f3 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -131,19 +131,72 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
 	return 0;
 }
 
-static int store_key_value(void *blob, const char *node_name,
+#define ALIGN(x)		(((x) + (FDT_TAGSIZE) - 1) & ~((FDT_TAGSIZE) - 1))
+
+static char *_realloc_fdt(char *fdt, int delta)
+{
+	int new_sz;
+	char *new_fdt;
+
+	if (!delta)
+		return fdt;
+
+	new_sz = fdt_totalsize(fdt) + delta;
+	new_fdt = malloc(new_sz);
+	if (!new_fdt) {
+		fprintf(stderr, "Unable to allocate memory to new fdt\n");
+		return fdt;
+	}
+	fdt_open_into(fdt, new_fdt, new_sz);
+	free(fdt);
+	return new_fdt;
+}
+
+static char *realloc_node(char *fdt, const char *name)
+{
+	int delta = 0;
+	int newlen = strlen(name);
+	if (newlen)
+		delta = sizeof(struct fdt_node_header) +
+				ALIGN(newlen + 1) + FDT_TAGSIZE;
+
+	return _realloc_fdt(fdt, delta);
+}
+
+static char *realloc_property(char *fdt, int nodeoffset,
+		const char *name, int newlen)
+{
+	int delta = 0;
+	int oldlen;
+
+	if (!fdt_get_property(fdt, nodeoffset, name, &oldlen))
+		/* strings + property header */
+		delta = sizeof(struct fdt_property) + strlen(name) + 1;
+
+	if (newlen > oldlen)
+		/* actual value in off_struct */
+		delta += ALIGN(newlen) - ALIGN(oldlen);
+
+	return _realloc_fdt(fdt, delta);
+}
+
+static int store_key_value(char **blob, const char *node_name,
 		const char *property, const char *buf, int len)
 {
 	int node;
 	int err;
 
-	node = fdt_path_offset(blob, node_name);
+	node = fdt_path_offset(*blob, node_name);
 	if (node < 0) {
 		report_error(node_name, -1, node);
 		return -1;
 	}
 
-	err = fdt_setprop(blob, node, property, buf, len);
+	err = fdt_setprop(*blob, node, property, buf, len);
+	if (err == -FDT_ERR_NOSPACE) {
+		*blob = realloc_property(*blob, node, property, len);
+		err = fdt_setprop(*blob, node, property, buf, len);
+	}
 	if (err) {
 		report_error(property, -1, err);
 		return -1;
@@ -161,7 +214,7 @@ static int store_key_value(void *blob, const char *node_name,
  * @param in_path	Path to process
  * @return 0 if ok, -1 on error
  */
-static int create_paths(void *blob, const char *in_path)
+static int create_paths(char **blob, const char *in_path)
 {
 	const char *path = in_path;
 	const char *sep;
@@ -177,10 +230,11 @@ static int create_paths(void *blob, const char *in_path)
 		if (!sep)
 			sep = path + strlen(path);
 
-		node = fdt_subnode_offset_namelen(blob, offset, path,
+		node = fdt_subnode_offset_namelen(*blob, offset, path,
 				sep - path);
 		if (node == -FDT_ERR_NOTFOUND) {
-			node = fdt_add_subnode_namelen(blob, offset, path,
+			*blob = realloc_node(*blob, path);
+			node = fdt_add_subnode_namelen(*blob, offset, path,
 						       sep - path);
 		}
 		if (node < 0) {
@@ -203,7 +257,7 @@ static int create_paths(void *blob, const char *in_path)
  * @param node_name	Name of node to create
  * @return new node offset if found, or -1 on failure
  */
-static int create_node(void *blob, const char *node_name)
+static int create_node(char **blob, const char *node_name)
 {
 	int node = 0;
 	char *p;
@@ -215,15 +269,17 @@ static int create_node(void *blob, const char *node_name)
 	}
 	*p = '\0';
 
+	*blob = realloc_node(*blob, p + 1);
+
 	if (p > node_name) {
-		node = fdt_path_offset(blob, node_name);
+		node = fdt_path_offset(*blob, node_name);
 		if (node < 0) {
 			report_error(node_name, -1, node);
 			return -1;
 		}
 	}
 
-	node = fdt_add_subnode(blob, node, p + 1);
+	node = fdt_add_subnode(*blob, node, p + 1);
 	if (node < 0) {
 		report_error(p + 1, -1, node);
 		return -1;
@@ -250,18 +306,18 @@ static int do_fdtput(struct display_info *disp, const char *filename,
 		 * store them into the property.
 		 */
 		assert(arg_count >= 2);
-		if (disp->auto_path && create_paths(blob, *arg))
+		if (disp->auto_path && create_paths(&blob, *arg))
 			return -1;
 		if (encode_value(disp, arg + 2, arg_count - 2, &value, &len) ||
-			store_key_value(blob, *arg, arg[1], value, len))
+			store_key_value(&blob, *arg, arg[1], value, len))
 			ret = -1;
 		break;
 	case OPER_CREATE_NODE:
 		for (; ret >= 0 && arg_count--; arg++) {
 			if (disp->auto_path)
-				ret = create_paths(blob, *arg);
+				ret = create_paths(&blob, *arg);
 			else
-				ret = create_node(blob, *arg);
+				ret = create_node(&blob, *arg);
 		}
 		break;
 	}
@@ -317,7 +373,6 @@ int main(int argc, char *argv[])
 		 * - rename node
 		 * - pack fdt before writing
 		 * - set amount of free space when writing
-		 * - expand fdt if value doesn't fit
 		 */
 		switch (c) {
 		case 'c':
-- 
1.7.6.5
