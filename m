From: Simon Glass <sjg@chromium.org>
Subject: [PATCH 13/14] fdt: Add option to default to most
	compatible conf in a fit image
Date: Thu, 25 Oct 2012 19:31:10 -0700
Message-ID: <1351218671-15228-14-git-send-email-sjg@chromium.org>
References: <1351218671-15228-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1351218671-15228-1-git-send-email-sjg@chromium.org>
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
Cc: Gabe Black <gabeblack@google.com>, Jerry Van Baren <vanbaren@cideas.com>, Tom Rini <trini@ti.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org

From: Gabe Black <gabeblack@chromium.org>

When booting a fit image with multiple configurations, the user either has to
specify which configuration to use explicitly, or there has to be a default
defined which is chosen automatically. This change adds an option to change
that behavior so that a configuration can be selected explicitly, or the
configuration which has the device tree that claims to be compatible with the
earliest item in U-Boot's device tree.

In other words, if U-Boot claimed to be compatible with A, B, and then C, and
the configurations claimed to be compatible with A, D and B, D and D, E, the
first configuration, A, D, would be chosen. Both the first and second
configurations match, but the first one matches a more specific entry in
U-Boot's device tree. The order in the kernel's device tree is ignored.

Signed-off-by: Gabe Black <gabeblack@google.com>

Commit-Ready: Gabe Black <gabeblack@chromium.org>
Signed-off-by: Simon Glass <sjg@chromium.org>
---
 README             |   11 +++++
 common/cmd_bootm.c |   11 +++++
 common/image.c     |  127 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/image.h    |    1 +
 4 files changed, 150 insertions(+), 0 deletions(-)

diff --git a/README b/README
index 69da2b8..3912150 100644
--- a/README
+++ b/README
@@ -2582,6 +2582,17 @@ FIT uImage format:
  -150	common/cmd_nand.c	Incorrect FIT image format
   151	common/cmd_nand.c	FIT image format OK
 
+- FIT image support:
+		CONFIG_FIT
+		Enable support for the FIT uImage format.
+
+		CONFIG_FIT_BEST_MATCH
+		When no configuration is explicitly selected, default to the
+		one whose fdt's compatibility field best matches that of
+		U-Boot itself. A match is considered "best" if it matches the
+		most specific compatibility entry of U-Boot's fdt's root node.
+		The order of entries in the configuration's fdt is ignored.
+
 - Standalone program support:
 		CONFIG_STANDALONE_LOAD_ADDR
 
diff --git a/common/cmd_bootm.c b/common/cmd_bootm.c
index 83fa5d7..4e6042c 100644
--- a/common/cmd_bootm.c
+++ b/common/cmd_bootm.c
@@ -949,8 +949,19 @@ static void *boot_get_kernel(cmd_tbl_t *cmdtp, int flag, int argc,
 			 * node
 			 */
 			bootstage_mark(BOOTSTAGE_ID_FIT_NO_UNIT_NAME);
+#ifdef CONFIG_FIT_BEST_MATCH
+			if (fit_uname_config)
+				cfg_noffset =
+					fit_conf_get_node(fit_hdr,
+							  fit_uname_config);
+			else
+				cfg_noffset =
+					fit_conf_find_compat(fit_hdr,
+							     gd->fdt_blob);
+#else
 			cfg_noffset = fit_conf_get_node(fit_hdr,
 							fit_uname_config);
+#endif
 			if (cfg_noffset < 0) {
 				bootstage_error(BOOTSTAGE_ID_FIT_NO_UNIT_NAME);
 				return NULL;
diff --git a/common/image.c b/common/image.c
index 750a98b..8877395 100644
--- a/common/image.c
+++ b/common/image.c
@@ -3049,6 +3049,133 @@ int fit_check_format(const void *fit)
 	return 1;
 }
 
+
+/**
+ * fit_conf_find_compat
+ * @fit: pointer to the FIT format image header
+ * @fdt: pointer to the device tree to compare against
+ *
+ * fit_conf_find_compat() attempts to find the configuration whose fdt is the
+ * most compatible with the passed in device tree.
+ *
+ * Example:
+ *
+ * / o image-tree
+ *   |-o images
+ *   | |-o fdt@1
+ *   | |-o fdt@2
+ *   |
+ *   |-o configurations
+ *     |-o config@1
+ *     | |-fdt = fdt@1
+ *     |
+ *     |-o config@2
+ *       |-fdt = fdt@2
+ *
+ * / o U-Boot fdt
+ *   |-compatible = "foo,bar", "bim,bam"
+ *
+ * / o kernel fdt1
+ *   |-compatible = "foo,bar",
+ *
+ * / o kernel fdt2
+ *   |-compatible = "bim,bam", "baz,biz"
+ *
+ * Configuration 1 would be picked because the first string in U-Boot's
+ * compatible list, "foo,bar", matches a compatible string in the root of fdt1.
+ * "bim,bam" in fdt2 matches the second string which isn't as good as fdt1.
+ *
+ * returns:
+ *     offset to the configuration to use if one was found
+ *     -1 otherwise
+ */
+int fit_conf_find_compat(const void *fit, const void *fdt)
+{
+	int ndepth = 0;
+	int noffset, confs_noffset, images_noffset;
+	const void *fdt_compat;
+	int fdt_compat_len;
+	int best_match_offset = 0;
+	int best_match_pos = 0;
+
+	confs_noffset = fdt_path_offset(fit, FIT_CONFS_PATH);
+	images_noffset = fdt_path_offset(fit, FIT_IMAGES_PATH);
+	if (confs_noffset < 0 || images_noffset < 0) {
+		debug("Can't find configurations or images nodes.\n");
+		return -1;
+	}
+
+	fdt_compat = fdt_getprop(fdt, 0, "compatible", &fdt_compat_len);
+	if (!fdt_compat) {
+		debug("Fdt for comparison has no \"compatible\" property.\n");
+		return -1;
+	}
+
+	/*
+	 * Loop over the configurations in the FIT image.
+	 */
+	for (noffset = fdt_next_node(fit, confs_noffset, &ndepth);
+			(noffset >= 0) && (ndepth > 0);
+			noffset = fdt_next_node(fit, noffset, &ndepth)) {
+		const void *kfdt;
+		const char *kfdt_name;
+		int kfdt_noffset;
+		const char *cur_fdt_compat;
+		int len;
+		size_t size;
+		int i;
+
+		if (ndepth > 1)
+			continue;
+
+		kfdt_name = fdt_getprop(fit, noffset, "fdt", &len);
+		if (!kfdt_name) {
+			debug("No fdt property found.\n");
+			continue;
+		}
+		kfdt_noffset = fdt_subnode_offset(fit, images_noffset,
+						  kfdt_name);
+		if (kfdt_noffset < 0) {
+			debug("No image node named \"%s\" found.\n",
+			      kfdt_name);
+			continue;
+		}
+		/*
+		 * Get a pointer to this configuration's fdt.
+		 */
+		if (fit_image_get_data(fit, kfdt_noffset, &kfdt, &size)) {
+			debug("Failed to get fdt \"%s\".\n", kfdt_name);
+			continue;
+		}
+
+		len = fdt_compat_len;
+		cur_fdt_compat = fdt_compat;
+		/*
+		 * Look for a match for each U-Boot compatibility string in
+		 * turn in this configuration's fdt.
+		 */
+		for (i = 0; len > 0 &&
+		     (!best_match_offset || best_match_pos > i); i++) {
+			int cur_len = strlen(cur_fdt_compat) + 1;
+
+			if (!fdt_node_check_compatible(kfdt, 0,
+						       cur_fdt_compat)) {
+				best_match_offset = noffset;
+				best_match_pos = i;
+				break;
+			}
+			len -= cur_len;
+			cur_fdt_compat += cur_len;
+		}
+	}
+	if (!best_match_offset) {
+		debug("No match found.\n");
+		return -1;
+	}
+
+	return best_match_offset;
+}
+
 /**
  * fit_conf_get_node - get node offset for configuration of a given unit name
  * @fit: pointer to the FIT format image header
diff --git a/include/image.h b/include/image.h
index 4e5863f..d786559 100644
--- a/include/image.h
+++ b/include/image.h
@@ -614,6 +614,7 @@ int fit_image_check_type(const void *fit, int noffset, uint8_t type);
 int fit_image_check_comp(const void *fit, int noffset, uint8_t comp);
 int fit_check_format(const void *fit);
 
+int fit_conf_find_compat(const void *fit, const void *fdt);
 int fit_conf_get_node(const void *fit, const char *conf_uname);
 int fit_conf_get_kernel_node(const void *fit, int noffset);
 int fit_conf_get_ramdisk_node(const void *fit, int noffset);
-- 
1.7.7.3
