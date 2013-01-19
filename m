From: Cong Ding <dinggnu@gmail.com>
Subject: [PATCH] of: dma.c: fix memory leakage
Date: Sat, 19 Jan 2013 14:06:44 +0100
Message-ID: <1358600805-20193-1-git-send-email-dinggnu@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Cong Ding <dinggnu@gmail.com>
List-Id: devicetree@vger.kernel.org

The memory allocated to ofdma might be a leakage when error occurs.

Signed-off-by: Cong Ding <dinggnu@gmail.com>
---
 drivers/of/dma.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/dma.c b/drivers/of/dma.c
index 59631b2..583e50e3 100644
--- a/drivers/of/dma.c
+++ b/drivers/of/dma.c
@@ -107,6 +107,7 @@ int of_dma_controller_register(struct device_node *np,
 	if (!nbcells) {
 		pr_err("%s: #dma-cells property is missing or invalid\n",
 		       __func__);
+		kfree(ofdma);
 		return -EINVAL;
 	}
 
-- 
1.7.10.4
