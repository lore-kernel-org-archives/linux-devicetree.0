From: frowand.list@gmail.com
Subject: [PATCH 12/12] of: Remove unused variable overlay_symbols
Date: Fri, 28 Oct 2016 23:26:32 -0700
Message-ID: <1477722392-32172-13-git-send-email-frowand.list@gmail.com>
References: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@am.sony.com>

Remove unused pointer to node "__symbols__".

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 drivers/of/resolver.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 53353cc8f2bb..783bd09463b5 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -287,7 +287,7 @@ static int adjust_local_phandle_references(struct device_node *local_fixups,
 int of_resolve_phandles(struct device_node *overlay)
 {
 	struct device_node *child, *local_fixups, *refnode;
-	struct device_node *tree_symbols, *overlay_symbols, *overlay_fixups;
+	struct device_node *tree_symbols, *overlay_fixups;
 	struct property *prop;
 	const char *refpath;
 	phandle phandle, phandle_delta;
@@ -317,12 +317,9 @@ int of_resolve_phandles(struct device_node *overlay)
 	if (err)
 		goto err_out;
 
-	overlay_symbols = NULL;
 	overlay_fixups = NULL;
 
 	for_each_child_of_node(overlay, child) {
-		if (!of_node_cmp(child->name, "__symbols__"))
-			overlay_symbols = child;
 		if (!of_node_cmp(child->name, "__fixups__"))
 			overlay_fixups = child;
 	}
-- 
1.9.1
