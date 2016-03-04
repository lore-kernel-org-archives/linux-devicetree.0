From: Rob Herring <robh@kernel.org>
Subject: [PATCH] scripts/dtc: Update to upstream version 53bf130b1cdd
Date: Fri,  4 Mar 2016 09:13:40 -0600
Message-ID: <1457104420-18350-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Sync to upstream dtc commit 53bf130b1cdd ("libfdt: simplify
fdt_node_check_compatible()"). This adds the following commits from
upstream:

53bf130 libfdt: simplify fdt_node_check_compatible()
c9d9121 Warn on node name unit-address presence/absence mismatch
2e53f9d Catch unsigned 32bit overflow when parsing flattened device tree offsets

Signed-off-by: Rob Herring <robh@kernel.org>
---
As usual, this is just an automated copy of upstream dtc into the kernel 
tree. The changeset is small enough that I have left it here.

The main reason for this sync is to pick-up the new unit-address 
warnings.

Rob

 scripts/dtc/checks.c        | 26 ++++++++++++++++++++++++++
 scripts/dtc/flattree.c      |  4 ++--
 scripts/dtc/libfdt/fdt_ro.c |  6 ++----
 scripts/dtc/version_gen.h   |  2 +-
 4 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/scripts/dtc/checks.c b/scripts/dtc/checks.c
index 0c03ac9..386f956 100644
--- a/scripts/dtc/checks.c
+++ b/scripts/dtc/checks.c
@@ -294,6 +294,30 @@ static void check_node_name_format(struct check *c, struct node *dt,
 }
 NODE_ERROR(node_name_format, NULL, &node_name_chars);
 
+static void check_unit_address_vs_reg(struct check *c, struct node *dt,
+			     struct node *node)
+{
+	const char *unitname = get_unitname(node);
+	struct property *prop = get_property(node, "reg");
+
+	if (!prop) {
+		prop = get_property(node, "ranges");
+		if (prop && !prop->val.len)
+			prop = NULL;
+	}
+
+	if (prop) {
+		if (!unitname[0])
+			FAIL(c, "Node %s has a reg or ranges property, but no unit name",
+			    node->fullpath);
+	} else {
+		if (unitname[0])
+			FAIL(c, "Node %s has a unit name, but no reg property",
+			    node->fullpath);
+	}
+}
+NODE_WARNING(unit_address_vs_reg, NULL);
+
 static void check_property_name_chars(struct check *c, struct node *dt,
 				      struct node *node, struct property *prop)
 {
@@ -667,6 +691,8 @@ static struct check *check_table[] = {
 
 	&addr_size_cells, &reg_format, &ranges_format,
 
+	&unit_address_vs_reg,
+
 	&avoid_default_addr_size,
 	&obsolete_chosen_interrupt_controller,
 
diff --git a/scripts/dtc/flattree.c b/scripts/dtc/flattree.c
index bd99fa2..ec14954 100644
--- a/scripts/dtc/flattree.c
+++ b/scripts/dtc/flattree.c
@@ -889,7 +889,7 @@ struct boot_info *dt_from_blob(const char *fname)
 
 	if (version >= 3) {
 		uint32_t size_str = fdt32_to_cpu(fdt->size_dt_strings);
-		if (off_str+size_str > totalsize)
+		if ((off_str+size_str < off_str) || (off_str+size_str > totalsize))
 			die("String table extends past total size\n");
 		inbuf_init(&strbuf, blob + off_str, blob + off_str + size_str);
 	} else {
@@ -898,7 +898,7 @@ struct boot_info *dt_from_blob(const char *fname)
 
 	if (version >= 17) {
 		size_dt = fdt32_to_cpu(fdt->size_dt_struct);
-		if (off_dt+size_dt > totalsize)
+		if ((off_dt+size_dt < off_dt) || (off_dt+size_dt > totalsize))
 			die("Structure block extends past total size\n");
 	}
 
diff --git a/scripts/dtc/libfdt/fdt_ro.c b/scripts/dtc/libfdt/fdt_ro.c
index e5b3136..50cce86 100644
--- a/scripts/dtc/libfdt/fdt_ro.c
+++ b/scripts/dtc/libfdt/fdt_ro.c
@@ -647,10 +647,8 @@ int fdt_node_check_compatible(const void *fdt, int nodeoffset,
 	prop = fdt_getprop(fdt, nodeoffset, "compatible", &len);
 	if (!prop)
 		return len;
-	if (fdt_stringlist_contains(prop, len, compatible))
-		return 0;
-	else
-		return 1;
+
+	return !fdt_stringlist_contains(prop, len, compatible);
 }
 
 int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
diff --git a/scripts/dtc/version_gen.h b/scripts/dtc/version_gen.h
index 11d93e6..ad9b05a 100644
--- a/scripts/dtc/version_gen.h
+++ b/scripts/dtc/version_gen.h
@@ -1 +1 @@
-#define DTC_VERSION "DTC 1.4.1-gb06e55c8"
+#define DTC_VERSION "DTC 1.4.1-g53bf130b"
-- 
2.5.0
