From: Rob Herring <robh@kernel.org>
Subject: [PATCH] of/numa: drop export of of_node_to_nid
Date: Tue, 17 Apr 2018 08:38:02 -0500
Message-ID: <20180417133802.19774-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

The "generic" implementation of of_node_to_nid is only used by
arm64 and only in built-in code, so remove its export. Any
device with a struct device should be able to use dev_to_node()
instead. Also, exporting of_node_to_nid doesn't actually work if
we build a module on an arch that doesn't select OF_NUMA nor provide its
own of_node_to_nid implementation.

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/of_numa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index f9d5480a4ae5..27d9b4bba535 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -177,7 +177,6 @@ int of_node_to_nid(struct device_node *device)
 
 	return NUMA_NO_NODE;
 }
-EXPORT_SYMBOL(of_node_to_nid);
 
 int __init of_numa_init(void)
 {
-- 
2.14.1
