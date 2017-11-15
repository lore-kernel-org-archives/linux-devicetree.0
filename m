From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: [PATCH] of/pci: Fix theoretical NULL dereference
Date: Wed, 15 Nov 2017 12:50:06 +0000
Message-ID: <f367c825b5e9f8eb9fee3607bbcc16222f10bd72.1510749974.git.robin.murphy@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In the (relatively mechanical) process of adapting the RID-mapping code
to put the resulting ID in an output argument rather than the funtion
return value, we ended up with the debug print using the argument
pointer rather than the local value, which potentially defeats the
earlier NULL check.

Fixes: 987068fcbdb7: "of/irq: Break out msi-map lookup (again)"
Reported-by: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
---
 drivers/of/of_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/of_pci.c b/drivers/of/of_pci.c
index e9ec931f5b9a..a7b1cb6c2f65 100644
--- a/drivers/of/of_pci.c
+++ b/drivers/of/of_pci.c
@@ -374,7 +374,7 @@ int of_pci_map_rid(struct device_node *np, u32 rid,
 
 		pr_debug("%pOF: %s, using mask %08x, rid-base: %08x, out-base: %08x, length: %08x, rid: %08x -> %08x\n",
 			np, map_name, map_mask, rid_base, out_base,
-			rid_len, rid, *id_out);
+			rid_len, rid, masked_rid - rid_base + out_base);
 		return 0;
 	}
 
-- 
2.13.4.dirty

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
