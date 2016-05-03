From: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 0/2] mtd: nand: omap2: Add EDMA support for NAND DMA prefetch
Date: Tue,  3 May 2016 12:50:04 -0500
Message-ID: <1462297806-11555-1-git-send-email-fcooper@ti.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Franklin S Cooper Jr <fcooper-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset includes the required patches to enable NAND DMA prefetch
support when using the EDMA.

This patchset depends on my previous patchset to enable NAND DMA prefetch
using the SDMA and Roger's GPMC and NAND rework. Both of these patchsets
are apart of Boris' NAND next patch. Therefore, these patches are also
built on top of this branch.

Also the following patches that fixes GPMC's DMA property are required
and pulled into other trees but are not currently apart of the above
branch:
https://patchwork.ozlabs.org/patch/596014/
https://patchwork.ozlabs.org/patch/596012/

Cooper Jr., Franklin (2):
  mtd: nand: omap2: Support parsing dma channel information from DT
  ARM: OMAP2+: Update GPMC and NAND DT binding documentation

 Documentation/devicetree/bindings/memory-controllers/omap-gpmc.txt | 7 ++++++-
 Documentation/devicetree/bindings/mtd/gpmc-nand.txt                | 2 +-
 drivers/mtd/nand/omap2.c                                           | 4 +++-
 3 files changed, 10 insertions(+), 3 deletions(-)

-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
