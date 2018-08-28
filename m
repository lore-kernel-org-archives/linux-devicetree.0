From: Rob Herring <robh@kernel.org>
Subject: [PATCH 1/4] of/unittest: remove use of node name pointer in overlay high level test
Date: Tue, 28 Aug 2018 10:52:51 -0500
Message-ID: <20180828155254.10709-2-robh@kernel.org>
References: <20180828155254.10709-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828155254.10709-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In preparation for removing the node name pointer, it needs to be
removed from of_unittest_overlay_high_level. However, it's not really
correct to use the node name without the unit-address and we should use
the full node name. This most easily done by iterating over the child
nodes with for_each_child_of_node() which is what of_get_child_by_name()
does internally. While at it, we might as well convert the outer loop to
use for_each_child_of_node() too instead of open coding it.

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/unittest.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 722537e14848..69a522e48970 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2347,10 +2347,12 @@ static __init void of_unittest_overlay_high_level(void)
 		}
 	}
 
-	for (np = overlay_base_root->child; np; np = np->sibling) {
-		if (of_get_child_by_name(of_root, np->name)) {
-			unittest(0, "illegal node name in overlay_base %s",
-				np->name);
+	for_each_child_of_node(overlay_base_root, np) {
+		struct device_node *base_child;
+		for_each_child_of_node(of_root, base_child) {
+			if (!strcmp(np->full_name, base_child->full_name))
+				unittest(0, "illegal node name in overlay_base %pOFn",
+					np);
 			return;
 		}
 	}
-- 
2.17.1
