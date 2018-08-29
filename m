From: Rob Herring <robh@kernel.org>
Subject: [PATCH] of: make PowerMac cache node search conditional on CONFIG_PPC_PMAC
Date: Wed, 29 Aug 2018 14:04:00 -0500
Message-ID: <20180829190400.23146-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

Cache nodes under the cpu node(s) is PowerMac specific according to the
comment above, so make the code enforce that.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 466e3c8582f0..cadcb470198a 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1963,7 +1963,7 @@ struct device_node *of_find_next_cache_node(const struct device_node *np)
 	/* OF on pmac has nodes instead of properties named "l2-cache"
 	 * beneath CPU nodes.
 	 */
-	if (!strcmp(np->type, "cpu"))
+	if (IS_ENABLED(CONFIG_PPC_PMAC) && !strcmp(np->type, "cpu"))
 		for_each_child_of_node(np, child)
 			if (!strcmp(child->type, "cache"))
 				return child;
-- 
2.17.1
