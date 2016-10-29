From: frowand.list@gmail.com
Subject: [PATCH 11/12] of: Move setting of pointer to beside test for non-null
Date: Fri, 28 Oct 2016 23:26:31 -0700
Message-ID: <1477722392-32172-12-git-send-email-frowand.list@gmail.com>
References: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477722392-32172-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, pantelis.antoniou@konsulko.com, Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@am.sony.com>

Value of pointer was calculated in an earlier block than
where it was used.  Move it down into the block where it
is used, immediately before where is is checked to be valid.

Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
---
 drivers/of/resolver.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index eb78010c21a3..53353cc8f2bb 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -320,8 +320,6 @@ int of_resolve_phandles(struct device_node *overlay)
 	overlay_symbols = NULL;
 	overlay_fixups = NULL;
 
-	tree_symbols = of_find_node_by_path("/__symbols__");
-
 	for_each_child_of_node(overlay, child) {
 		if (!of_node_cmp(child->name, "__symbols__"))
 			overlay_symbols = child;
@@ -334,6 +332,7 @@ int of_resolve_phandles(struct device_node *overlay)
 		goto out;
 	}
 
+	tree_symbols = of_find_node_by_path("/__symbols__");
 	if (!tree_symbols) {
 		pr_err("no symbols in root of device tree.\n");
 		err = -EINVAL;
-- 
1.9.1
