From: Rob Herring <robh@kernel.org>
Subject: [PATCH 11/11] of/address: Fix of_pci_range_parser_one translation of DMA addresses
Date: Thu, 26 Sep 2019 19:24:55 -0500
Message-ID: <20190927002455.13169-12-robh@kernel.org>
References: <20190927002455.13169-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190927002455.13169-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Robin Murphy <robin.murphy@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>
List-Id: devicetree@vger.kernel.org

of_pci_range_parser_one() has a bug when parsing dma-ranges. When it
translates the parent address (aka cpu address in the code), 'ranges' is
always being used. This happens to work because most users are just 1:1
translation.

Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c       | 15 ++++++++++++---
 include/linux/of_address.h |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 5b835d332709..54011a355b81 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -243,6 +243,7 @@ static int parser_init(struct of_pci_range_parser *parser,
 	parser->node = node;
 	parser->pna = of_n_addr_cells(node);
 	parser->np = parser->pna + na + ns;
+	parser->dma = !strcmp(name, "dma-ranges");
 
 	parser->range = of_get_property(node, name, &rlen);
 	if (parser->range == NULL)
@@ -281,7 +282,11 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	range->pci_space = be32_to_cpup(parser->range);
 	range->flags = of_bus_pci_get_flags(parser->range);
 	range->pci_addr = of_read_number(parser->range + 1, ns);
-	range->cpu_addr = of_translate_address(parser->node,
+	if (parser->dma)
+		range->cpu_addr = of_translate_dma_address(parser->node,
+				parser->range + na);
+	else
+		range->cpu_addr = of_translate_address(parser->node,
 				parser->range + na);
 	range->size = of_read_number(parser->range + parser->pna + na, ns);
 
@@ -294,8 +299,12 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 
 		flags = of_bus_pci_get_flags(parser->range);
 		pci_addr = of_read_number(parser->range + 1, ns);
-		cpu_addr = of_translate_address(parser->node,
-				parser->range + na);
+		if (parser->dma)
+			cpu_addr = of_translate_dma_address(parser->node,
+					parser->range + na);
+		else
+			cpu_addr = of_translate_address(parser->node,
+					parser->range + na);
 		size = of_read_number(parser->range + parser->pna + na, ns);
 
 		if (flags != range->flags)
diff --git a/include/linux/of_address.h b/include/linux/of_address.h
index ddda3936039c..eac7ab109df4 100644
--- a/include/linux/of_address.h
+++ b/include/linux/of_address.h
@@ -12,6 +12,7 @@ struct of_pci_range_parser {
 	const __be32 *end;
 	int np;
 	int pna;
+	bool dma;
 };
 
 struct of_pci_range {
-- 
2.20.1
