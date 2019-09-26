From: Chris Goldsworthy <cgoldswo@codeaurora.org>
Subject: [PATCH] of: reserved_mem: add missing of_node_put() for proper ref-counting
Date: Thu, 26 Sep 2019 15:48:12 -0700
Message-ID: <1569538092-16913-1-git-send-email-cgoldswo@codeaurora.org>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: Chris Goldsworthy <cgoldswo@codeaurora.org>, devicetree@vger.kernel.org, stable@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Commit d698a388146c ("of: reserved-memory: ignore disabled memory-region
nodes") added an early return in of_reserved_mem_device_init_by_idx(), but
didn't call of_node_put() on a device_node whose ref-count was incremented
in the call to of_parse_phandle() preceding the early exit.

Fixes: d698a388146c ("of: reserved-memory: ignore disabled memory-region nodes")
Signed-off-by: Chris Goldsworthy <cgoldswo@codeaurora.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: stable@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/of/of_reserved_mem.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 7989703..6bd610e 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -324,8 +324,10 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
 	if (!target)
 		return -ENODEV;
 
-	if (!of_device_is_available(target))
+	if (!of_device_is_available(target)) {
+		of_node_put(target);
 		return 0;
+	}
 
 	rmem = __find_rmem(target);
 	of_node_put(target);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
