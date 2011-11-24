From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 01/14] fdt: Tidy up a few fdtdec problems
Date: Wed, 23 Nov 2011 19:54:43 -0800
Message-ID: <1322106896-23054-2-git-send-email-sjg@chromium.org>
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
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Albert ARIBAUD <albert.u.boot@aribaud.net>, Tom Warren <twarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

This fixes three trivial issues in fdtdec.c:
1. fdtdec_get_is_enabled() doesn't really need a default value
2. The fdt must be word-aligned, since otherwise it will fail on ARM
3. The compat_names[] array is missing its first element

Signed-off-by: Simon Glass <sjg@chromium.org>
---
 include/fdtdec.h |    8 ++++----
 lib/fdtdec.c     |    7 ++++---
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index d871cdd..9018181 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -112,14 +112,14 @@ s32 fdtdec_get_int(const void *blob, int node, const char *prop_name,
  * Checks whether a node is enabled.
  * This looks for a 'status' property. If this exists, then returns 1 if
  * the status is 'ok' and 0 otherwise. If there is no status property,
- * it returns the default value.
+ * it returns 1 on the assumption that anything mentioned should be enabled
+ * by default.
  *
  * @param blob	FDT blob
  * @param node	node to examine
- * @param default_val	default value to return if no 'status' property exists
- * @return integer value 0/1, if found, or default_val if not
+ * @return integer value 0 (not enabled) or 1 (enabled)
  */
-int fdtdec_get_is_enabled(const void *blob, int node, int default_val);
+int fdtdec_get_is_enabled(const void *blob, int node);
 
 /**
  * Checks whether we have a valid fdt available to control U-Boot, and panic
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 0f87163..d1321a8 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -33,6 +33,7 @@ DECLARE_GLOBAL_DATA_PTR;
  */
 #define COMPAT(id, name) name
 static const char * const compat_names[COMPAT_COUNT] = {
+	COMPAT(UNKNOWN, "<none>"),
 };
 
 /**
@@ -84,14 +85,14 @@ s32 fdtdec_get_int(const void *blob, int node, const char *prop_name,
 	return default_val;
 }
 
-int fdtdec_get_is_enabled(const void *blob, int node, int default_val)
+int fdtdec_get_is_enabled(const void *blob, int node)
 {
 	const char *cell;
 
 	cell = fdt_getprop(blob, node, "status", NULL);
 	if (cell)
 		return 0 == strcmp(cell, "ok");
-	return default_val;
+	return 1;
 }
 
 enum fdt_compat_id fd_dec_lookup(const void *blob, int node)
@@ -140,7 +141,7 @@ int fdtdec_next_alias(const void *blob, const char *name,
 int fdtdec_check_fdt(void)
 {
 	/* We must have an fdt */
-	if (fdt_check_header(gd->fdt_blob))
+	if (((uintptr_t)gd->fdt_blob & 3) || fdt_check_header(gd->fdt_blob))
 		panic("No valid fdt found - please append one to U-Boot\n"
 			"binary or define CONFIG_OF_EMBED\n");
 	return 0;
-- 
1.7.3.1
