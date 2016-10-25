From: frowand.list@gmail.com
Subject: [RFC PATCH 12/13] of: Move setting of pointer to beside test for non-null
Date: Tue, 25 Oct 2016 13:59:05 -0700
Message-ID: <1477429146-27039-13-git-send-email-frowand.list@gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477429146-27039-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@am.sony.com>

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 drivers/of/resolver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 664c97e1ecb4..3f7cf569c7ea 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -305,8 +305,6 @@ int of_resolve_phandles(struct device_node *overlay)
 	overlay_symbols = NULL;
 	overlay_fixups = NULL;
 
-	tree_symbols = of_find_node_by_path("/__symbols__");
-
 	for_each_child_of_node(overlay, child) {
 		if (!of_node_cmp(child->name, "__symbols__"))
 			overlay_symbols = child;
@@ -319,6 +317,7 @@ int of_resolve_phandles(struct device_node *overlay)
 		goto out;
 	}
 
+	tree_symbols = of_find_node_by_path("/__symbols__");
 	if (!tree_symbols) {
 		pr_err("no symbols in root of device tree.\n");
 		err = -EINVAL;
-- 
1.9.1
