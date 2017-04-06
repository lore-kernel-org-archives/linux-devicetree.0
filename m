From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH] of: change fixup of dma-ranges size to error
Date: Wed,  5 Apr 2017 23:18:49 -0700
Message-ID: <1491459529-31391-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

of_dma_get_range() has workaround code to fixup a device tree that
incorrectly specified a mask instead of a size for property
dma-ranges.  That device tree was fixed a year ago in v4.6, so
the workaround is no longer needed.  Leave a data validation
check in place, but no longer do the fixup.  Move the check
one level deeper in the call stack so that other possible users
of dma-ranges will also be protected.

The fix to the device tree was in
commit c91cb9123cdd ("dtb: amd: Fix DMA ranges in device tree").

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/address.c | 12 +++++++++++-
 drivers/of/device.c  | 15 ---------------
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 02b2903fe9d2..dae98923968f 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -829,6 +829,7 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 	int len, naddr, nsize, pna;
 	int ret = 0;
 	u64 dmaaddr;
+	u64 tmp_size;
 
 	if (!node)
 		return -EINVAL;
@@ -879,7 +880,16 @@ int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *siz
 	}
 	*dma_addr = dmaaddr;
 
-	*size = of_read_number(ranges + naddr + pna, nsize);
+	tmp_size = of_read_number(ranges + naddr + pna, nsize);
+
+	/* check if mask specified instead of size */
+	if (tmp_size & 1) {
+		pr_debug("invalid dma-range size in node: %s\n", np->full_name);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	*size = tmp_size;
 
 	pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
 		 *dma_addr, *paddr, *size);
diff --git a/drivers/of/device.c b/drivers/of/device.c
index b1e6bebda3f3..09dedd045007 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -110,21 +110,6 @@ void of_dma_configure(struct device *dev, struct device_node *np)
 		size = dev->coherent_dma_mask + 1;
 	} else {
 		offset = PFN_DOWN(paddr - dma_addr);
-
-		/*
-		 * Add a work around to treat the size as mask + 1 in case
-		 * it is defined in DT as a mask.
-		 */
-		if (size & 1) {
-			dev_warn(dev, "Invalid size 0x%llx for dma-range\n",
-				 size);
-			size = size + 1;
-		}
-
-		if (!size) {
-			dev_err(dev, "Adjusted size 0x%llx invalid\n", size);
-			return;
-		}
 		dev_dbg(dev, "dma_pfn_offset(%#08lx)\n", offset);
 	}
 
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
