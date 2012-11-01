From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 05/14] fdt: Remove fdtdec_find_alias_node()
	function
Date: Wed, 31 Oct 2012 17:02:42 -0700
Message-ID: <1351728171-27070-6-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Tom Rini <trini@ti.com>, Jerry Van Baren <vanbaren@cideas.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

This function is not needed, since fdt_path_offset() performs the same
service. Remove it.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v2:
- Remove fdtdec_find_alias_node() function

 lib/fdtdec.c |   24 +-----------------------
 1 files changed, 1 insertions(+), 23 deletions(-)

diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 32f03cc..4d6d392 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -52,28 +52,6 @@ const char *fdtdec_get_compatible(enum fdt_compat_id id)
 	return compat_names[id];
 }
 
-/**
- * Look in the FDT for an alias with the given name and return its node.
- *
- * @param blob	FDT blob
- * @param name	alias name to look up
- * @return node offset if found, or an error code < 0 otherwise
- */
-static int find_alias_node(const void *blob, const char *name)
-{
-	const char *path;
-	int alias_node;
-
-	debug("find_alias_node: %s\n", name);
-	alias_node = fdt_path_offset(blob, "/aliases");
-	if (alias_node < 0)
-		return alias_node;
-	path = fdt_getprop(blob, alias_node, name, NULL);
-	if (!path)
-		return -FDT_ERR_NOTFOUND;
-	return fdt_path_offset(blob, path);
-}
-
 fdt_addr_t fdtdec_get_addr(const void *blob, int node,
 		const char *prop_name)
 {
@@ -171,7 +149,7 @@ int fdtdec_next_alias(const void *blob, const char *name,
 	/* snprintf() is not available */
 	assert(strlen(name) < MAX_STR_LEN);
 	sprintf(str, "%.*s%d", MAX_STR_LEN, name, *upto);
-	node = find_alias_node(blob, str);
+	node = fdt_path_offset(blob, str);
 	if (node < 0)
 		return node;
 	err = fdt_node_check_compatible(blob, node, compat_names[id]);
-- 
1.7.7.3
