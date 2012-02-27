From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 01/20] fdt: Tidy up a few fdtdec problems
Date: Mon, 27 Feb 2012 12:52:34 -0800
Message-ID: <1330375973-10681-2-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg@chromium.org>
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
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <twarren@nvidia.com>, Jerry Van Baren <vanbaren@cideas.com>
List-Id: devicetree@vger.kernel.org

This fixes five trivial issues in fdtdec.c:
1. fdtdec_get_is_enabled() doesn't really need a default value
2. The fdt must be word-aligned, since otherwise it will fail on ARM
3. The compat_names[] array is missing its first element. This is needed
only because the first fdt_compat_id is defined to be invalid.
4. Added a header prototype for fdtdec_next_compatible()
5. Change fdtdec_next_alias() to only increment its 'upto' parameter
on success, to make the display error messages in the caller easier.

Signed-off-by: Simon Glass <sjg@chromium.org>
Acked-by: Gerald Van Baren <vanbaren@cideas.com>
Acked-by: Stephen Warren <swarren@nvidia.com>
---

 include/fdtdec.h |   23 +++++++++++++++++++----
 lib/fdtdec.c     |   22 ++++++++++++++++------
 2 files changed, 35 insertions(+), 10 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index 3a15f55..01badd4 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -82,6 +82,21 @@ int fdtdec_next_alias(const void *blob, const char *name,
 		enum fdt_compat_id id, int *upto);
 
 /**
+ * Find the next compatible node for a peripheral.
+ *
+ * Do the first call with node = 0. This function will return a pointer to
+ * the next compatible node. Next time you call this function, pass the
+ * value returned, and the next node will be provided.
+ *
+ * @param blob		FDT blob to use
+ * @param node		Start node for search
+ * @param id		Compatible ID to look for (enum fdt_compat_id)
+ * @return offset of next compatible node, or -FDT_ERR_NOTFOUND if no more
+ */
+int fdtdec_next_compatible(const void *blob, int node,
+		enum fdt_compat_id id);
+
+/**
  * Look up an address property in a node and return it as an address.
  * The property must hold either one address with no trailing data or
  * one address with a length. This is only tested on 32-bit machines.
@@ -112,14 +127,14 @@ s32 fdtdec_get_int(const void *blob, int node, const char *prop_name,
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
index 3852038..846ec3f 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -33,6 +33,7 @@ DECLARE_GLOBAL_DATA_PTR;
  */
 #define COMPAT(id, name) name
 static const char * const compat_names[COMPAT_COUNT] = {
+	COMPAT(UNKNOWN, "<none>"),
 };
 
 const char *fdtdec_get_compatible(enum fdt_compat_id id)
@@ -89,14 +90,21 @@ s32 fdtdec_get_int(const void *blob, int node, const char *prop_name,
 	return default_val;
 }
 
-int fdtdec_get_is_enabled(const void *blob, int node, int default_val)
+int fdtdec_get_is_enabled(const void *blob, int node)
 {
 	const char *cell;
 
+	/*
+	 * It should say "okay", so only allow that. Some fdts use "ok" but
+	 * this is a bug. Please fix your device tree source file. See here
+	 * for discussion:
+	 *
+	 * http://www.mail-archive.com/u-boot@lists.denx.de/msg71598.html
+	 */
 	cell = fdt_getprop(blob, node, "status", NULL);
 	if (cell)
-		return 0 == strcmp(cell, "ok");
-	return default_val;
+		return 0 == strcmp(cell, "okay");
+	return 1;
 }
 
 enum fdt_compat_id fd_dec_lookup(const void *blob, int node)
@@ -127,14 +135,16 @@ int fdtdec_next_alias(const void *blob, const char *name,
 	/* snprintf() is not available */
 	assert(strlen(name) < MAX_STR_LEN);
 	sprintf(str, "%.*s%d", MAX_STR_LEN, name, *upto);
-	(*upto)++;
 	node = find_alias_node(blob, str);
 	if (node < 0)
 		return node;
 	err = fdt_node_check_compatible(blob, node, compat_names[id]);
 	if (err < 0)
 		return err;
-	return err ? -FDT_ERR_NOTFOUND : node;
+	if (err)
+		return -FDT_ERR_NOTFOUND;
+	(*upto)++;
+	return node;
 }
 
 /* TODO: Can we tighten this code up a little? */
@@ -254,7 +264,7 @@ int fdtdec_find_aliases_for_id(const void *blob, const char *name,
 int fdtdec_check_fdt(void)
 {
 	/* We must have an fdt */
-	if (fdt_check_header(gd->fdt_blob))
+	if (((uintptr_t)gd->fdt_blob & 3) || fdt_check_header(gd->fdt_blob))
 		panic("No valid fdt found - please append one to U-Boot\n"
 			"binary or define CONFIG_OF_EMBED\n");
 	return 0;
-- 
1.7.7.3
