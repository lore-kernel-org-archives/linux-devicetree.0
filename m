From: Stefani Seibold <stefani.seibold.ext@huawei.com>
Subject: [PATCH] external references for device tree overlays
Date: Mon,  5 Jun 2017 14:59:27 +0200
Message-ID: <1496667567-13266-1-git-send-email-stefani.seibold.ext@huawei.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Holm Rauchfuss <holm.rauchfuss@huawei.com>, Stefani Seibold <stefani@seibold.net>, Stefani Seibold <stefani.seibold.ext@huawei.com>
List-Id: devicetree@vger.kernel.org

From: Stefani Seibold <stefani@seibold.net>

This patch enables external references for symbols which are not
exported by the current device tree. For example

// RASPI example (only for testing)
/dts-v1/;
/plugin/;

/ {
    compatible = "brcm,bcm2835", "brcm,bcm2708", "brcm,bcm2709";

    fragment@0 {
        target-path = "/soc/i2s@7e203000";
        __overlay__ {
            #address-cells = <0x00000001>;
            #size-cells = <0x00000001>;
            test = "test";
            timer = <&timer>;
        };
    };

    __external_symbols__ {
        timer = "/soc/timer@7e003000";
    };
};

The "timer" symbol is not exported by the RASPI device tree, because it is
missing in the __symbols__ section of the device tree.

In case of the RASPI device tree this could be simple fixed by modifing
the device tree source, but when the device tree is provided by a closed
source BIOS this kind of missing symbol could not be fixed.

An additional benefit is to override a (possible broken) symbol exported
by the currect live device tree.

The patch is based and tested on linux 4.12-rc3.

Signed-off-by: Stefani Seibold <stefani.seibold.ext@huawei.com>
Signed-off-by: Stefani Seibold <stefani@seibold.net>
---
 drivers/of/overlay.c  | 19 +++++++++++++++++++
 drivers/of/resolver.c | 27 ++++++++++++++++++++++-----
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 7827786718d8..de6516ea0fcd 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -50,6 +50,7 @@ struct of_overlay {
 	int id;
 	struct list_head node;
 	int count;
+	struct device_node *tree;
 	struct of_overlay_info *ovinfo_tab;
 	struct of_changeset cset;
 };
@@ -422,6 +423,8 @@ int of_overlay_create(struct device_node *tree)
 	/* add to the tail of the overlay list */
 	list_add_tail(&ov->node, &ov_list);
 
+	ov->tree = tree;
+
 	of_overlay_notify(ov, OF_OVERLAY_POST_APPLY);
 
 	mutex_unlock(&of_mutex);
@@ -524,6 +527,7 @@ int of_overlay_destroy(int id)
 {
 	struct of_overlay *ov;
 	int err;
+	phandle phandle;
 
 	mutex_lock(&of_mutex);
 
@@ -540,6 +544,8 @@ int of_overlay_destroy(int id)
 		goto out;
 	}
 
+	phandle = ov->tree->phandle;
+
 	of_overlay_notify(ov, OF_OVERLAY_PRE_REMOVE);
 	list_del(&ov->node);
 	__of_changeset_revert(&ov->cset);
@@ -549,6 +555,19 @@ int of_overlay_destroy(int id)
 	of_changeset_destroy(&ov->cset);
 	kfree(ov);
 
+	if (phandle) {
+		struct device_node *node;
+		unsigned long flags;
+
+		raw_spin_lock_irqsave(&devtree_lock, flags);
+		for_each_of_allnodes(node) {
+			if (node->phandle >= phandle)
+				node->phandle = 0;
+		}
+		raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	}
+
+
 	err = 0;
 
 out:
diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 771f4844c781..31b5f32c9b27 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -286,13 +286,14 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
 int of_resolve_phandles(struct device_node *overlay)
 {
 	struct device_node *child, *local_fixups, *refnode;
-	struct device_node *tree_symbols, *overlay_fixups;
+	struct device_node *tree_symbols, *ext_symbols, *overlay_fixups;
 	struct property *prop;
 	const char *refpath;
 	phandle phandle, phandle_delta;
 	int err;
 
 	tree_symbols = NULL;
+	ext_symbols = NULL;
 
 	if (!overlay) {
 		pr_err("null overlay\n");
@@ -321,6 +322,9 @@ int of_resolve_phandles(struct device_node *overlay)
 	for_each_child_of_node(overlay, child) {
 		if (!of_node_cmp(child->name, "__fixups__"))
 			overlay_fixups = child;
+		else
+		if (!of_node_cmp(child->name, "__external_symbols__"))
+			ext_symbols = child;
 	}
 
 	if (!overlay_fixups) {
@@ -329,20 +333,30 @@ int of_resolve_phandles(struct device_node *overlay)
 	}
 
 	tree_symbols = of_find_node_by_path("/__symbols__");
-	if (!tree_symbols) {
-		pr_err("no symbols in root of device tree.\n");
+	if (!tree_symbols && !ext_symbols) {
+		pr_err("no symbols for resolve in device tree.\n");
 		err = -EINVAL;
 		goto out;
 	}
 
+	phandle_delta = live_tree_max_phandle() + 1;
+
 	for_each_property_of_node(overlay_fixups, prop) {
 
 		/* skip properties added automatically */
 		if (!of_prop_cmp(prop->name, "name"))
 			continue;
 
-		err = of_property_read_string(tree_symbols,
-				prop->name, &refpath);
+		err = -1;
+
+		if (ext_symbols)
+			err = of_property_read_string(ext_symbols,
+					prop->name, &refpath);
+
+		if (err && tree_symbols)
+			err = of_property_read_string(tree_symbols,
+					prop->name, &refpath);
+
 		if (err)
 			goto out;
 
@@ -352,6 +366,9 @@ int of_resolve_phandles(struct device_node *overlay)
 			goto out;
 		}
 
+		if (!refnode->phandle)
+			refnode->phandle = ++phandle_delta;
+
 		phandle = refnode->phandle;
 		of_node_put(refnode);
 
-- 
2.13.0
