From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] of/flattree: Early "find node by alias" function
Date: Fri, 21 Oct 2011 16:16:59 +0100
Message-ID: <1319210219-10707-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds a function for finding a node in flat tree
based on an alias name. It can be used in early boot code.

Typical use case is a situation when early code needs data
from a arbitrary tree node, eg. base address of "serial0" to
initialise debug output or some sort of ID register to
probe hardware.

The tree source could look like that:

/ {
	aliases {
		serial0 = &uart0;
	};

	uart0: uart@f0001000 {
		reg = <0xf0001000 0x1000>;
	};
}

Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
---
 drivers/of/fdt.c       |  117 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of_fdt.h |    3 +
 2 files changed, 120 insertions(+), 0 deletions(-)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index 65200af..0968809 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -502,6 +502,123 @@ int __init of_scan_flat_dt(int (*it)(unsigned long node,
 }
 
 /**
+ * Routines used by of_flat_dt_find_node_by_alias()
+ */
+
+struct of_flat_dt_find_node_by_alias_state {
+	const char *alias;
+	unsigned long node;
+	const char *path;
+	int depth;
+	int token_len;
+
+};
+
+static int __init of_flat_dt_scan_path_legacy(unsigned long node,
+		const char *uname, int depth, void *data)
+{
+	struct of_flat_dt_find_node_by_alias_state *state = data;
+
+	pr_debug("%s: uname='%s', state->path='%s'\n",
+			__func__, uname, state->path);
+
+	return strcmp(state->path, uname) == 0;
+}
+
+static int __init of_flat_dt_scan_path(unsigned long node,
+		const char *uname, int depth, void *data)
+{
+	struct of_flat_dt_find_node_by_alias_state *state = data;
+
+	pr_debug("%s: uname='%s', depth=%d, state->path='%s', state->depth=%d,"
+			" state->token_len=%d\n", __func__, uname, depth,
+			state->path, state->depth, state->token_len);
+
+	/* If the depth decreases, we didn't find the path */
+	if (depth < state->depth)
+		return -ENODEV;
+
+	/* Check if path ~= /^uname[\/\0]/ */
+	if (strncmp(state->path, uname, state->token_len) == 0 &&
+			uname[state->token_len] == 0) {
+		const char *slash;
+
+		state->depth++;
+		state->path += state->token_len; /* Next token */
+		if (*state->path == 0) { /* All path tokens processed? */
+			state->node = node;
+			return 1; /* Success! */
+		}
+		BUG_ON(*state->path != '/');
+		state->path++; /* Skip leading slash */
+		slash = strchr(state->path, '/');
+		if (!slash)
+			state->token_len = strlen(state->path);
+		else
+			state->token_len = slash - state->path;
+	}
+
+	return 0;
+}
+
+static int __init of_flat_dt_scan_aliases(unsigned long node,
+		const char *uname, int depth, void *data)
+{
+	int err;
+	struct of_flat_dt_find_node_by_alias_state *state = data;
+
+	if (depth != 1 || strcmp(uname, "aliases") != 0)
+		return 0;
+
+	state->path = of_get_flat_dt_prop(node, state->alias, NULL);
+	if (!state->path)
+		return -ENXIO;
+	if (*state->path != '/')
+		return -EFAULT;
+
+	state->token_len = 0; /* Root node has no name */
+
+	/* FDTs prior to version 16 (0x10) had full path in every node */
+	if (be32_to_cpu(initial_boot_params->version) < 0x10)
+		err = of_scan_flat_dt(of_flat_dt_scan_path_legacy, state);
+	else
+		err = of_scan_flat_dt(of_flat_dt_scan_path, state);
+
+	if (err == 0) /* Whole tree scanned, no path found */
+		err = -ENODEV;
+
+	return err;
+}
+
+/**
+ * of_flat_dt_find_node_by_alias - find a root node referenced by an alias
+ *
+ * @alias: alias name
+ * @node: pointer to a node reference to be filled on success
+ *
+ * returns 0 on success, negative value on error.
+ *
+ * This function can be used at boot time, before the tree is unflattened.
+ */
+int __init of_flat_dt_find_node_by_alias(const char *alias, unsigned long *node)
+{
+	int err;
+	struct of_flat_dt_find_node_by_alias_state state = {
+		.alias = alias,
+	};
+
+	err = of_scan_flat_dt(of_flat_dt_scan_aliases, &state);
+	if (err == 0) /* No 'aliases' node */
+		err = -ENOENT;
+	if (err > 0) {
+		/* Node found */
+		*node = state.node;
+		err = 0;
+	}
+	return err;
+}
+
+/**
  * of_get_flat_dt_root - find the root node in the flat blob
  */
 unsigned long __init of_get_flat_dt_root(void)
diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
index c84d900..8212e47 100644
--- a/include/linux/of_fdt.h
+++ b/include/linux/of_fdt.h
@@ -85,6 +85,9 @@ extern char *find_flat_dt_string(u32 offset);
 extern int of_scan_flat_dt(int (*it)(unsigned long node, const char *uname,
 				     int depth, void *data),
 			   void *data);
+extern int of_flat_dt_find_node_by_alias(const char *alias,
+					 unsigned long *node);
+
 extern void *of_get_flat_dt_prop(unsigned long node, const char *name,
 				 unsigned long *size);
 extern int of_flat_dt_is_compatible(unsigned long node, const char *name);
-- 
1.6.3.3
