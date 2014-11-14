From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH V2 0/2] dmaengine: Support for IMG MDC
Date: Fri, 14 Nov 2014 13:59:41 -0800
Message-ID: <1416002384-3525-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Damien Horsley <Damien.Horsley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series adds support for the IMG Multi-threaded DMA Controller (MDC)
which is found on IMG SoCs.  Currently this driver only supports the
variant found on the MIPS-based Pistachio SoC.

The MDC supports slave and memory-to-memory transfers on up to 32 channels.
Requests from channels are handled by MDC threads.  Thread assignments are
per-channel and are specified in the device-tree.

Tested on a platform based on the Pistachio SoC with additional patches.
Support for Pistachio will be submitted later.  Slave DMA was tested
with the recently submitted IMG SPFI driver [1] and memory-to-memory
DMA was tested with the dmatest module.

Based on Vinod's slave-dma/next + Maxime's device_control and slave caps
cleanup series [2].

Changes from v1:
 - addressed Arnd's review comments
 - rebased on Maxime's dmaengine cleanups

[1] https://lkml.org/lkml/2014/11/12/763
[2] https://lkml.org/lkml/2014/10/28/1067

Andrew Bresticker (2):
  dmaengine: Add binding document for IMG MDC
  dmaengine: Add driver for IMG MDC

 .../devicetree/bindings/dma/img-mdc-dma.txt        |  57 ++
 drivers/dma/Kconfig                                |   9 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/img-mdc-dma.c                          | 973 +++++++++++++++++++++
 4 files changed, 1040 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/img-mdc-dma.txt
 create mode 100644 drivers/dma/img-mdc-dma.c

-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
