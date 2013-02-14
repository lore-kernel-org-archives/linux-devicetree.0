From: Cong Ding <dinggnu@gmail.com>
Subject: [PATCH v2] dma: of-dma.c: fix memory leakage
Date: Thu, 14 Feb 2013 11:16:10 +0100
Message-ID: <20130214101610.GA29017@gmail.com>
References: <1358600805-20193-1-git-send-email-dinggnu@gmail.com>
 <50FC6EB1.4050704@gmail.com>
 <20130122101053.GA2427@gmail.com>
 <20130212174025.GB17659@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20130212174025.GB17659@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The memory allocated to ofdma might be a leakage when error occurs.

Signed-off-by: Cong Ding <dinggnu@gmail.com>
---
 drivers/dma/of-dma.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
index 59631b2..583e50e3 100644
--- a/drivers/dma/of-dma.c
+++ b/drivers/dma/of-dma.c
@@ -107,6 +107,7 @@ int of_dma_controller_register(struct device_node *np,
 	if (!nbcells) {
 		pr_err("%s: #dma-cells property is missing or invalid\n",
 		       __func__);
+		kfree(ofdma);
 		return -EINVAL;
 	}
 
-- 
1.7.9.5
