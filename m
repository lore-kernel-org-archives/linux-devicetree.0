From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH_V4 0/3] dma: dt: Add DMA driver for jz4780
Date: Wed, 18 Mar 2015 16:16:34 +0000
Message-ID: <1426695397-54906-1-git-send-email-Zubair.Kakakhel@imgtec.com>
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

These are based on 4.0-rc4.

Apart from the channel numbers, jz4740 and jz4780 are quite different.
The descriptor bit fields are different in a register
There is an extra register for stride in jz4780
jz4780 has more/different features in hardware.

Hence, we are unable to use the jz4740-dma driver.

V3->V4
some minor fixes.
driver would default to 4 byte transfer size in case of unsupported.
now gives error instead

V2->V3 changes
DMA bindings. See patches for details.

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

 .../devicetree/bindings/dma/jz4780-dma.txt         |  56 ++
 MAINTAINERS                                        |   5 +
 drivers/dma/Kconfig                                |  10 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/dma-jz4780.c                           | 877 +++++++++++++++++++++
 include/dt-bindings/dma/jz4780-dma.h               |  49 ++
 6 files changed, 998 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/jz4780-dma.txt
 create mode 100644 drivers/dma/dma-jz4780.c
 create mode 100644 include/dt-bindings/dma/jz4780-dma.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
