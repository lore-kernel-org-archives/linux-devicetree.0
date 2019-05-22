From: Puneet Saxena <puneets@nvidia.com>
Subject: [PATCH V2] of: reserved-memory: ignore disabled memory-region nodes
Date: Wed, 22 May 2019 16:17:11 +0530
Message-ID: <1558522031-549-2-git-send-email-puneets@nvidia.com>
References: <1558522031-549-1-git-send-email-puneets@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1558522031-549-1-git-send-email-puneets@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, pantelis.antoniou@konsulko.com, frowand.list@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: treding@nvidia.com, vdumpa@nvidia.com, snikam@nvidia.com, jonathanh@nvidia.com, Puneet Saxena <puneets@nvidia.com>
List-Id: devicetree@vger.kernel.org

From: Krishna Reddy <vdumpa@nvidia.com>

Ignore disabled nodes in the memory-region 
nodes list and continue to initialize the rest 
of enabled nodes.

Check if the "reserved-memory" node is available
and if it's not available, return 0 to ignore the 
"reserved-memory" node and continue parsing with 
next node in memory-region nodes list.

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
Signed-off-by: Puneet Saxena <puneets@nvidia.com>
---
v2:
* Fixed typo in commit message.
* Used "of_device_is_available" to check "reserved-memory"
  nodes are disabled/enabled.

 drivers/of/of_reserved_mem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 1977ee0adcb1..b0b7a0c4431d 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -322,6 +322,9 @@ int of_reserved_mem_device_init_by_idx(struct device *dev,
 	if (!target)
 		return -ENODEV;
 
+	if (!of_device_is_available(target))
+		return 0;
+
 	rmem = __find_rmem(target);
 	of_node_put(target);
 
-- 
2.7.4
