From: Paolo Pisati <paolo.pisati@canonical.com>
Subject: [PATCH] dma: of-dma: check OF pointer property before dereferencing it
Date: Mon, 15 Apr 2013 10:39:53 +0200
Message-ID: <1366015193-6627-2-git-send-email-paolo.pisati@canonical.com>
References: <1366015193-6627-1-git-send-email-paolo.pisati@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1366015193-6627-1-git-send-email-paolo.pisati@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Dan Williams <djbw@fb.com>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Paolo Pisati <paolo.pisati@canonical.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Paolo Pisati <paolo.pisati@canonical.com>
---
 drivers/dma/of-dma.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/of-dma.c b/drivers/dma/of-dma.c
index 69d04d2..9628298 100644
--- a/drivers/dma/of-dma.c
+++ b/drivers/dma/of-dma.c
@@ -91,6 +91,7 @@ int of_dma_controller_register(struct device_node *np,
 				(struct of_phandle_args *, struct of_dma *),
 				void *data)
 {
+	void 	*parent;
 	struct of_dma	*ofdma;
 	int		nbcells;
 
@@ -103,8 +104,10 @@ int of_dma_controller_register(struct device_node *np,
 	if (!ofdma)
 		return -ENOMEM;
 
-	nbcells = be32_to_cpup(of_get_property(np, "#dma-cells", NULL));
-	if (!nbcells) {
+	parent = of_get_property(np, "#dma-cells", NULL);
+	if (parent)
+		nbcells = be32_to_cpup(parent);
+	if (!parent || !nbcells) {
 		pr_err("%s: #dma-cells property is missing or invalid\n",
 		       __func__);
 		kfree(ofdma);
-- 
1.7.10.4
