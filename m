From: Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Subject: [RFC 2/2] fdtput: use libfdt realloc functions.
Date: Wed, 10 Apr 2013 15:33:26 +0100
Message-ID: <1365604406-18100-1-git-send-email-srinivas.kandagatla@st.com>
References: <1365604278-17956-1-git-send-email-srinivas.kandagatla@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1365604278-17956-1-git-send-email-srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
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

This patch makes use of realloc functions added to libfdt.
Now the tool can insert a new node or property or extend a property with
new value greater than original size.

Without this patch fdtput tool complains with FDT_ERR_NOSPACE when we
try to add a node/property or extend the value of a property.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
---
 fdtput.c |   30 +++++++++++++++++-------------
 1 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/fdtput.c b/fdtput.c
index f2197f5..8e80f37 100644
--- a/fdtput.c
+++ b/fdtput.c
@@ -131,19 +131,20 @@ static int encode_value(struct display_info *disp, char **arg, int arg_count,
 	return 0;
 }
 
-static int store_key_value(void *blob, const char *node_name,
+static int store_key_value(void **blob, const char *node_name,
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
+	fdt_realloc_property(blob, node, property, len);
+	err = fdt_setprop(*blob, node, property, buf, len);
 	if (err) {
 		report_error(property, -1, err);
 		return -1;
@@ -161,7 +162,7 @@ static int store_key_value(void *blob, const char *node_name,
  * @param in_path	Path to process
  * @return 0 if ok, -1 on error
  */
-static int create_paths(void *blob, const char *in_path)
+static int create_paths(void **blob, const char *in_path)
 {
 	const char *path = in_path;
 	const char *sep;
@@ -177,10 +178,11 @@ static int create_paths(void *blob, const char *in_path)
 		if (!sep)
 			sep = path + strlen(path);
 
-		node = fdt_subnode_offset_namelen(blob, offset, path,
+		node = fdt_subnode_offset_namelen(*blob, offset, path,
 				sep - path);
 		if (node == -FDT_ERR_NOTFOUND) {
-			node = fdt_add_subnode_namelen(blob, offset, path,
+			fdt_realloc_node(blob, path);
+			node = fdt_add_subnode_namelen(*blob, offset, path,
 						       sep - path);
 		}
 		if (node < 0) {
@@ -203,7 +205,7 @@ static int create_paths(void *blob, const char *in_path)
  * @param node_name	Name of node to create
  * @return new node offset if found, or -1 on failure
  */
-static int create_node(void *blob, const char *node_name)
+static int create_node(void **blob, const char *node_name)
 {
 	int node = 0;
 	char *p;
@@ -216,14 +218,15 @@ static int create_node(void *blob, const char *node_name)
 	*p = '\0';
 
 	if (p > node_name) {
-		node = fdt_path_offset(blob, node_name);
+		node = fdt_path_offset(*blob, node_name);
 		if (node < 0) {
 			report_error(node_name, -1, node);
 			return -1;
 		}
 	}
 
-	node = fdt_add_subnode(blob, node, p + 1);
+	fdt_realloc_node(blob, p + 1);
+	node = fdt_add_subnode(*blob, node, p + 1);
 	if (node < 0) {
 		report_error(p + 1, -1, node);
 		return -1;
@@ -250,18 +253,19 @@ static int do_fdtput(struct display_info *disp, const char *filename,
 		 * store them into the property.
 		 */
 		assert(arg_count >= 2);
-		if (disp->auto_path && create_paths(blob, *arg))
+		if (disp->auto_path && create_paths((void **)&blob, *arg))
 			return -1;
 		if (encode_value(disp, arg + 2, arg_count - 2, &value, &len) ||
-			store_key_value(blob, *arg, arg[1], value, len))
+			store_key_value((void **)&blob, *arg,
+							arg[1], value, len))
 			ret = -1;
 		break;
 	case OPER_CREATE_NODE:
 		for (; ret >= 0 && arg_count--; arg++) {
 			if (disp->auto_path)
-				ret = create_paths(blob, *arg);
+				ret = create_paths((void **)&blob, *arg);
 			else
-				ret = create_node(blob, *arg);
+				ret = create_node((void **)&blob, *arg);
 		}
 		break;
 	}
-- 
1.7.6.5
