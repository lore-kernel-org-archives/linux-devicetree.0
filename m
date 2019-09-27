From: Rob Herring <robh@kernel.org>
Subject: [PATCH 07/11] of: address: Follow DMA parent for "dma-coherent"
Date: Thu, 26 Sep 2019 19:24:51 -0500
Message-ID: <20190927002455.13169-8-robh@kernel.org>
References: <20190927002455.13169-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927002455.13169-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Robin Murphy <robin.murphy@arm.com>

Much like for address translation, when checking for DMA coherence we
should be sure to walk up the DMA hierarchy, rather than the MMIO one,
now that we can accommodate them being different.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index e9188c82fdae..3fd34f7ad772 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -999,7 +999,7 @@ bool of_dma_is_coherent(struct device_node *np)
 			of_node_put(node);
 			return true;
 		}
-		node = of_get_next_parent(node);
+		node = of_get_next_dma_parent(node);
 	}
 	of_node_put(node);
 	return false;
-- 
2.20.1
