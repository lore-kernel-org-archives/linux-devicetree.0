From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v3 1/2] fdt: Add fdtdec_find_aliases() to deal with
	alias nodes
Date: Tue, 17 Jan 2012 10:20:50 -0800
Message-ID: <1326824452-14786-2-git-send-email-sjg@chromium.org>
References: <1326824452-14786-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1326824452-14786-1-git-send-email-sjg@chromium.org>
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

Stephen Warren pointed out that we should use nodes whether or not they
have an alias in the /aliases section. The aliases section specifies the
order so far as it can, but is not essential. Operating without alisses
is useful when the enumerated order of nodes does not matter (admittedly
rare in U-Boot).

This is considerably more complex, and it is important to keep this
complexity out of driver code. This patch creates a function
fdtdec_find_aliases() which returns an ordered list of node offsets
for a particular compatible ID, taking account of alias nodes.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v2:
- Allow gaps in the list returned to the caller
- Improve alias checking algorithm to reduce run time
- Rename function to fdtdec_find_aliases_for_id()
- Skip nodes marked as disabled

Changes in v3:
- Change 'continue' to 'break' in last loop, since we are done anyway
- Fix typos and add two assert() checks

 include/fdtdec.h |   47 ++++++++++++++++++++++
 lib/fdtdec.c     |  116 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 163 insertions(+), 0 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index d871cdd..492431c 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -126,3 +126,50 @@ int fdtdec_get_is_enabled(const void *blob, int node, int default_val);
  * if not.
  */
 int fdtdec_check_fdt(void);
+
+/**
+ * Find the nodes for a peripheral and return a list of them in the correct
+ * order. This is used to enumerate all the peripherals of a certain type.
+ *
+ * To use this, optionally set up a /aliases node with alias properties for
+ * a peripheral. For example, for usb you could have:
+ *
+ * aliases {
+ *		usb0 = "/ehci@c5008000";
+ *		usb1 = "/ehci@c5000000";
+ * };
+ *
+ * Pass "usb" as the name to this function and will return a list of two
+ * nodes offsets: /ehci@c5008000 and ehci@c5000000.
+ *
+ * All nodes returned will match the compatible ID, as it is assumed that
+ * all peripherals use the same driver.
+ *
+ * If no alias node is found, then the node list will be returned in the
+ * order found in the fdt. If the aliases mention a node which doesn't
+ * exist, then this will be ignored. If nodes are found with no aliases,
+ * they will be added in any order.
+ *
+ * If there is a gap in the aliases, then this function return a 0 node at
+ * that position. The return value will also count these gaps.
+ *
+ * This function checks node properties and will not return nodes which are
+ * marked disabled (status = "disabled").
+ *
+ * @param blob		FDT blob to use
+ * @param name		Root name of alias to search for
+ * @param id		Compatible ID to look for
+ * @param node_list	Place to put list of found nodes
+ * @param maxcount	Maximum number of nodes to find
+ * @return number of nodes found on success, FTD_ERR_... on error
+ */
+int fdtdec_find_aliases_for_id(const void *blob, const char *name,
+			enum fdt_compat_id id, int *node_list, int maxcount);
+
+/*
+ * Get the name for a compatible ID
+ *
+ * @param id		Compatible ID to look for
+ * @return compatible string for that id
+ */
+const char *fdtdec_get_compatible(enum fdt_compat_id id);
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 0f87163..55d5bdf 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -35,6 +35,13 @@ DECLARE_GLOBAL_DATA_PTR;
 static const char * const compat_names[COMPAT_COUNT] = {
 };
 
+const char *fdtdec_get_compatible(enum fdt_compat_id id)
+{
+	/* We allow reading of the 'unknown' ID for testing purposes */
+	assert(id >= 0 && id < COMPAT_COUNT);
+	return compat_names[id];
+}
+
 /**
  * Look in the FDT for an alias with the given name and return its node.
  *
@@ -132,6 +139,115 @@ int fdtdec_next_alias(const void *blob, const char *name,
 	return err ? -FDT_ERR_NOTFOUND : node;
 }
 
+/* TODO: Can we tighten this code up a little? */
+int fdtdec_find_aliases_for_id(const void *blob, const char *name,
+			enum fdt_compat_id id, int *node_list, int maxcount)
+{
+	int name_len = strlen(name);
+	int nodes[maxcount];
+	int num_found = 0;
+	int offset, node;
+	int alias_node;
+	int count;
+	int i, j;
+
+	/* find the alias node if present */
+	alias_node = fdt_path_offset(blob, "/aliases");
+
+	/*
+	 * start with nothing, and we can assume that the root node can't
+	 * match
+	 */
+	memset(nodes, '\0', sizeof(nodes));
+
+	/* First find all the compatible nodes */
+	for (node = count = 0; node >= 0 && count < maxcount;) {
+		node = fdtdec_next_compatible(blob, node, id);
+		if (node >= 0)
+			nodes[count++] = node;
+	}
+	if (node >= 0)
+		debug("%s: warning: maxcount exceeded with alias '%s'\n",
+		       __func__, name);
+
+	/* Now find all the aliases */
+	memset(node_list, '\0', sizeof(*node_list) * maxcount);
+
+	for (offset = fdt_first_property_offset(blob, alias_node);
+			offset > 0;
+			offset = fdt_next_property_offset(blob, offset)) {
+		const struct fdt_property *prop;
+		const char *path;
+		int number;
+		int found;
+
+		node = 0;
+		prop = fdt_get_property_by_offset(blob, offset, NULL);
+		path = fdt_string(blob, fdt32_to_cpu(prop->nameoff));
+		if (prop->len && 0 == strncmp(path, name, name_len))
+			node = fdt_path_offset(blob, prop->data);
+		if (node <= 0)
+			continue;
+
+		/* Get the alias number */
+		number = simple_strtoul(path + name_len, NULL, 10);
+		if (number < 0 || number >= maxcount) {
+			debug("%s: warning: alias '%s' is out of range\n",
+			       __func__, path);
+			continue;
+		}
+
+		/* Make sure the node we found is actually in our list! */
+		found = -1;
+		for (j = 0; j < count; j++)
+			if (nodes[j] == node) {
+				found = j;
+				break;
+			}
+
+		if (found == -1) {
+			debug("%s: warning: alias '%s' points to a node "
+				"'%s' that is missing or is not compatible "
+				" with '%s'\n", __func__, path,
+				fdt_get_name(blob, node, NULL),
+			       compat_names[id]);
+			continue;
+		}
+
+		/*
+		 * Add this node to our list in the right place, and mark
+		 * it as done.
+		 */
+		if (fdtdec_get_is_enabled(blob, node)) {
+			node_list[number] = node;
+			if (number >= num_found)
+				num_found = number + 1;
+		}
+		nodes[j] = 0;
+	}
+
+	/* Add any nodes not mentioned by an alias */
+	for (i = j = 0; i < maxcount; i++) {
+		if (!node_list[i]) {
+			for (; j < maxcount; j++)
+				if (nodes[j] &&
+					fdtdec_get_is_enabled(blob, nodes[j]))
+					break;
+
+			/* Have we run out of nodes to add? */
+			if (j == maxcount)
+				break;
+
+			assert(!node_list[i]);
+			node_list[i] = nodes[j++];
+			if (i >= num_found)
+				num_found = i + 1;
+		}
+	}
+
+	return num_found;
+}
+
 /*
  * This function is a little odd in that it accesses global data. At some
  * point if the architecture board.c files merge this will make more sense.
-- 
1.7.7.3
