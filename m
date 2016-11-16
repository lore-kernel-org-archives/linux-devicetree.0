From: Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] DW DMAC: update device tree
Date: Wed, 16 Nov 2016 16:56:51 +0300
Message-ID: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Eugeniy Paltsev <Eugeniy.Paltsev-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

It wasn't possible to enable some features like
memory-to-memory transfers or multi block transfers via DT.
It is fixed by these patches.

 * Rename is_private to is-private as ordered by DT policy.
 (just for cleanup) The change leaves the support for the 
 old format.

 * Add is-memcpu property, so it is possible to
 enable memory-to-memory transfers support via DT.

 * Add hw-llp property, so it is possible to enable
 hardware multi block transfers support via DT.

 * Update DW DMAC device tree documentation.

Eugeniy Paltsev (4):
  DW DMAC: rename is_private property as ordered by DT policy
  DW DMAC: add is-memcpu property to device tree
  DW DMAC: add hw-llp property to device tree
  Update device tree Synopsys DW DMAC documentation

 Documentation/devicetree/bindings/dma/snps-dma.txt | 10 ++++++++--
 drivers/dma/dw/core.c                              |  2 +-
 drivers/dma/dw/platform.c                          | 10 ++++++++++
 include/linux/platform_data/dma-dw.h               |  4 ++--
 4 files changed, 21 insertions(+), 5 deletions(-)

-- 
2.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
