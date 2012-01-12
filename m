From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v2 2/7] fdt: Add function to allow aliases to refer
	to multiple nodes
Date: Thu, 12 Jan 2012 11:00:13 -0800
Message-ID: <1326394818-32227-3-git-send-email-sjg@chromium.org>
References: <1326394818-32227-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1326394818-32227-1-git-send-email-sjg@chromium.org>
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

Some devices can deal with multiple compatible properties. The devices
need to know which nodes to bind to which features. For example an
I2C driver which supports two different controller types will want to
know which type it is dealing with in each case.

The new fdtdec_add_aliases_for_id() function deals with this by allowing
the driver to search for additional compatible nodes for a different ID.
It can then detect the new ones and perform appropriate processing.

Another option considered was to return a tuple (node offset, compat id)
and have the function be passed a list of compatible IDs. This is more
overhead for the common case though. We may add such a function later if
more drivers in U-Boot require it.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 include/fdtdec.h |   15 +++++++++++++++
 lib/fdtdec.c     |   16 ++++++++++++----
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index bd2222c..e6d63f9 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -200,6 +200,21 @@ int fdtdec_find_aliases_for_id(const void *blob, const char *name,
 			enum fdt_compat_id id, int *node_list, int maxcount);
 
 /*
+ * This function is similar to fdtdec_find_aliases_for_id() except that it
+ * adds to the node_list that is passed in. Any 0 elements are considered
+ * available for allocation - others are considered already used and are
+ * skipped.
+ *
+ * You can use this by calling fdtdec_find_aliases_for_id() with an
+ * uninitialised array, then setting the elements that are returned to -1,
+ * say, then calling this function, perhaps with a different compat id.
+ * Any elements you get back that are >0 are new nodes added by the call
+ * to this function.
+ */
+int fdtdec_add_aliases_for_id(const void *blob, const char *name,
+			enum fdt_compat_id id, int *node_list, int maxcount);
+
+/*
  * Get the name for a compatible ID
  *
  * @param id		Compatible ID to look for
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index daf2c7e..ddd56b9 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -151,10 +151,18 @@ int fdtdec_next_alias(const void *blob, const char *name,
 	return node;
 }
 
-/* TODO: Can we tighten this code up a little? */
 int fdtdec_find_aliases_for_id(const void *blob, const char *name,
 			enum fdt_compat_id id, int *node_list, int maxcount)
 {
+	memset(node_list, '\0', sizeof(*node_list) * maxcount);
+
+	return fdtdec_add_aliases_for_id(blob, name, id, node_list, maxcount);
+}
+
+/* TODO: Can we tighten this code up a little? */
+int fdtdec_add_aliases_for_id(const void *blob, const char *name,
+			enum fdt_compat_id id, int *node_list, int maxcount)
+{
 	int name_len = strlen(name);
 	int nodes[maxcount];
 	int num_found = 0;
@@ -184,8 +192,6 @@ int fdtdec_find_aliases_for_id(const void *blob, const char *name,
 		       __func__, name);
 
 	/* Now find all the aliases */
-	memset(node_list, '\0', sizeof(*node_list) * maxcount);
-
 	for (offset = fdt_first_property_offset(blob, alias_node);
 			offset > 0;
 			offset = fdt_next_property_offset(blob, offset)) {
@@ -232,11 +238,13 @@ int fdtdec_find_aliases_for_id(const void *blob, const char *name,
 		 * it as done.
 		 */
 		if (fdtdec_get_is_enabled(blob, node)) {
+			if (node_list[number])
+				continue;
 			node_list[number] = node;
 			if (number >= num_found)
 				num_found = number + 1;
 		}
-		nodes[j] = 0;
+		nodes[found] = 0;
 	}
 
 	/* Add any nodes not mentioned by an alias */
-- 
1.7.7.3
