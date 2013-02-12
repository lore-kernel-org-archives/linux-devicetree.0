From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH v3 3/5] of/base: Clean up exit paths for
 of_parse_phandle_with_args()
Date: Tue, 12 Feb 2013 23:06:39 +0000
Message-ID: <1360710401-16757-4-git-send-email-grant.likely@secretlab.ca>
References: <1360710401-16757-1-git-send-email-grant.likely@secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1360710401-16757-1-git-send-email-grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
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
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some of the exit paths were not correctly releasing the node. Fix it by
creating an 'err' label for collecting the error paths and releasing the
node.

Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 drivers/of/base.c |   26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index e2d44e0..c4538ab 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1087,7 +1087,7 @@ int of_parse_phandle_with_args(const struct device_node *np, const char *list_na
 				struct of_phandle_args *out_args)
 {
 	const __be32 *list, *list_end;
-	int size, cur_index = 0;
+	int rc = 0, size, cur_index = 0;
 	uint32_t count = 0;
 	struct device_node *node = NULL;
 	phandle phandle;
@@ -1100,6 +1100,7 @@ int of_parse_phandle_with_args(const struct device_node *np, const char *list_na
 
 	/* Loop over the phandles until all the requested entry is found */
 	while (list < list_end) {
+		rc = -EINVAL;
 		count = 0;
 
 		/*
@@ -1116,13 +1117,13 @@ int of_parse_phandle_with_args(const struct device_node *np, const char *list_na
 			if (!node) {
 				pr_err("%s: could not find phandle\n",
 					 np->full_name);
-				break;
+				goto err;
 			}
 			if (of_property_read_u32(node, cells_name, &count)) {
 				pr_err("%s: could not get %s for %s\n",
 					 np->full_name, cells_name,
 					 node->full_name);
-				break;
+				goto err;
 			}
 
 			/*
@@ -1132,7 +1133,7 @@ int of_parse_phandle_with_args(const struct device_node *np, const char *list_na
 			if (list + count > list_end) {
 				pr_err("%s: arguments longer than property\n",
 					 np->full_name);
-				break;
+				goto err;
 			}
 		}
 
@@ -1142,9 +1143,10 @@ int of_parse_phandle_with_args(const struct device_node *np, const char *list_na
 		 * index matches, then fill the out_args structure and return,
 		 * or return -ENOENT for an empty entry.
 		 */
+		rc = -ENOENT;
 		if (cur_index == index) {
 			if (!phandle)
-				return -ENOENT;
+				goto err;
 
 			if (out_args) {
 				int i;
@@ -1155,6 +1157,10 @@ int of_parse_phandle_with_args(const struct device_node *np, const char *list_na
 				for (i = 0; i < count; i++)
 					out_args->args[i] = be32_to_cpup(list++);
 			}
+
+			/* Found it! return success */
+			if (node)
+				of_node_put(node);
 			return 0;
 		}
 
@@ -1164,10 +1170,16 @@ int of_parse_phandle_with_args(const struct device_node *np, const char *list_na
 		cur_index++;
 	}
 
-	/* Loop exited without finding a valid entry; return an error */
+	/*
+	 * Unlock node before returning result; will be one of:
+	 * -ENOENT : index is for empty phandle
+	 * -EINVAL : parsing error on data
+	 */
+	rc = -ENOENT;
+ err:
 	if (node)
 		of_node_put(node);
-	return -EINVAL;
+	return rc;
 }
 EXPORT_SYMBOL(of_parse_phandle_with_args);
 
-- 
1.7.10.4
