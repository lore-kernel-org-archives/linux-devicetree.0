From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH 05/14] fdt: Export fdtdec_find_alias_node() function
Date: Thu, 25 Oct 2012 19:31:02 -0700
Message-ID: <1351218671-15228-6-git-send-email-sjg@chromium.org>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1351218671-15228-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
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
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Rini <trini-l0cyMroinI0@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This function is useful outside fdtdec, so export it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 include/fdtdec.h |    9 +++++++++
 lib/fdtdec.c     |    6 +++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index e70714b..e566e47 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -110,6 +110,15 @@ int fdtdec_next_alias(const void *blob, const char *name,
 		enum fdt_compat_id id, int *upto);
 
 /**
+ * Look in the FDT for an alias with the given name and return its node.
+ *
+ * @param blob	FDT blob
+ * @param name	alias name to look up
+ * @return node offset if found, or an error code < 0 otherwise
+ */
+int fdtdec_find_alias_node(const void *blob, const char *name);
+
+/**
  * Find the next compatible node for a peripheral.
  *
  * Do the first call with node = 0. This function will return a pointer to
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 32f03cc..16435b7 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -59,12 +59,12 @@ const char *fdtdec_get_compatible(enum fdt_compat_id id)
  * @param name	alias name to look up
  * @return node offset if found, or an error code < 0 otherwise
  */
-static int find_alias_node(const void *blob, const char *name)
+int fdtdec_find_alias_node(const void *blob, const char *name)
 {
 	const char *path;
 	int alias_node;
 
-	debug("find_alias_node: %s\n", name);
+	debug("%s: %s\n", __func__, name);
 	alias_node = fdt_path_offset(blob, "/aliases");
 	if (alias_node < 0)
 		return alias_node;
@@ -171,7 +171,7 @@ int fdtdec_next_alias(const void *blob, const char *name,
 	/* snprintf() is not available */
 	assert(strlen(name) < MAX_STR_LEN);
 	sprintf(str, "%.*s%d", MAX_STR_LEN, name, *upto);
-	node = find_alias_node(blob, str);
+	node = fdtdec_find_alias_node(blob, str);
 	if (node < 0)
 		return node;
 	err = fdt_node_check_compatible(blob, node, compat_names[id]);
-- 
1.7.7.3
