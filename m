From: Rob Herring <robh@kernel.org>
Subject: [PATCH 2/3] of: fix sparse warning in of_pci_range_parser_one
Date: Thu,  4 May 2017 13:00:34 -0500
Message-ID: <20170504180035.12834-2-robh@kernel.org>
References: <20170504180035.12834-1-robh@kernel.org>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20170504180035.12834-1-robh@kernel.org>
Sender: stable-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org

sparse gives the following warning for 'pci_space':

../drivers/of/address.c:266:26: warning: incorrect type in assignment (different base types)
../drivers/of/address.c:266:26:    expected unsigned int [unsigned] [usertype] pci_space
../drivers/of/address.c:266:26:    got restricted __be32 const [usertype] <noident>

It appears that pci_space is only ever accessed on powerpc, so the endian
swap is often not needed.

Cc: stable@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/address.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 02b2903fe9d2..72914cdfce2a 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -263,7 +263,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	if (!parser->range || parser->range + parser->np > parser->end)
 		return NULL;
 
-	range->pci_space = parser->range[0];
+	range->pci_space = be32_to_cpup(parser->range);
 	range->flags = of_bus_pci_get_flags(parser->range);
 	range->pci_addr = of_read_number(parser->range + 1, ns);
 	range->cpu_addr = of_translate_address(parser->node,
-- 
2.11.0
