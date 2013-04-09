From: <Yuantian.Tang@freescale.com>
Subject: [PATCH] of: remove the unnecessary of_node_put for of_parse_phandle_with_args()
Date: Tue, 9 Apr 2013 14:56:09 +0800
Message-ID: <1365490569-32455-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@secretlab.ca
Cc: rob.herring@calxeda.com, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Tang Yuantian <yuantian.tang@freescale.com>, Tang Yuantian <Yuantian.Tang@freescale.com>
List-Id: devicetree@vger.kernel.org

From: Tang Yuantian <yuantian.tang@freescale.com>

As the function itself says it is caller's responsibility to call the
of_node_put().  So, remove it on success to keep the reference count
correct.

Signed-off-by: Tang Yuantian <Yuantian.Tang@freescale.com>
---
 drivers/of/base.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 321d3ef..e8b4c28 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1168,9 +1168,6 @@ static int __of_parse_phandle_with_args(const struct device_node *np,
 					out_args->args[i] = be32_to_cpup(list++);
 			}
 
-			/* Found it! return success */
-			if (node)
-				of_node_put(node);
 			return 0;
 		}
 
-- 
1.8.0
