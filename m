From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH] of: remove unused pci_space variable from address.c
Date: Wed, 12 Jul 2017 17:59:06 +0800
Message-ID: <1499853546-82626-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It was never used and could be removed, otherwise
we could see a warning:

drivers/of/address.c: In function 'of_pci_range_parser_one':
drivers/of/address.c:277:14: warning: variable 'pci_space' set but not
used [-Wunused-but-set-variable]

Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

 drivers/of/address.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 580bbf6..395eedb 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -274,10 +274,9 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 
 	/* Now consume following elements while they are contiguous */
 	while (parser->range + parser->np <= parser->end) {
-		u32 flags, pci_space;
+		u32 flags;
 		u64 pci_addr, cpu_addr, size;
 
-		pci_space = be32_to_cpup(parser->range);
 		flags = of_bus_pci_get_flags(parser->range);
 		pci_addr = of_read_number(parser->range + 1, ns);
 		cpu_addr = of_translate_address(parser->node,
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
