From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH_V2 0/3] dma: dt: Add DMA driver for jz4780
Date: Tue, 24 Feb 2015 18:08:14 +0000
Message-ID: <1424801297-18354-1-git-send-email-Zubair.Kakakhel@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alex-oucj9GSTHrKwpo/f3jThPQ@public.gmane.org, Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Here we have three patches that add a DMA driver for the Ingenic JZ4780 SoC.

JZ4780 support is still in-flight.

See http://patchwork.linux-mips.org/bundle/paulburton/ci20-v3.20/

These are based on 4.0-rc1.

Apart from the channel numbers, jz4740 and jz4780 are quite different.
jz4780 has many more features in hardware.

Hence, we are unable to use the jz4740-dma driver.

V1->V2 changes
Updates for dmaengine api changes.
Add residue support.
Details in the patch commit message

ZubairLK


Alex Smith (2):
  dt-bindings: dma: Add binding for jz4780-dma
  dma: jz4780: add driver for the Ingenic JZ4780 DMA controller

Zubair Lutfullah Kakakhel (1):
  MAINTAINERS: Add Ingenic JZ4780 DMA driver maintainer entry

 .../devicetree/bindings/dma/jz4780-dma.txt         |  61 ++
 MAINTAINERS                                        |   5 +
 drivers/dma/Kconfig                                |  10 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/dma-jz4780.c                           | 877 +++++++++++++++++++++
 include/dt-bindings/dma/jz4780-dma.h               |  49 ++
 6 files changed, 1003 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/jz4780-dma.txt
 create mode 100644 drivers/dma/dma-jz4780.c
 create mode 100644 include/dt-bindings/dma/jz4780-dma.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
