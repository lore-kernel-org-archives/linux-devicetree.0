From: Rob Herring <robh@kernel.org>
Subject: [PATCH 03/11] of: address: Report of_dma_get_range() errors meaningfully
Date: Thu, 26 Sep 2019 19:24:47 -0500
Message-ID: <20190927002455.13169-4-robh@kernel.org>
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

If we failed to translate a DMA address, at least show the offending
address rather than the uninitialised contents of the destination
argument.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 8e354d12fb04..53d2656c2269 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -955,8 +955,8 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 	dmaaddr = of_read_number(ranges, naddr);
 	*paddr = of_translate_dma_address(np, ranges);
 	if (*paddr == OF_BAD_ADDR) {
-		pr_err("translation of DMA address(%pad) to CPU address failed node(%pOF)\n",
-		       dma_addr, np);
+		pr_err("translation of DMA address(%llx) to CPU address failed node(%pOF)\n",
+		       dmaaddr, np);
 		ret = -EINVAL;
 		goto out;
 	}
-- 
2.20.1
