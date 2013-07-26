Return-Path: <devicetree-owner@vger.kernel.org>
Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]:53530
	"EHLO co1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1758481Ab3GZK1e (ORCPT
	<rfc822;devicetree@vger.kernel.org>);
	Fri, 26 Jul 2013 06:27:34 -0400
From: <hongbo.zhang@freescale.com>
Subject: [PATCH v6 0/3] DMA: Freescale: Add support for 8-channel DMA engine
Date: Fri, 26 Jul 2013 18:27:13 +0800
Message-ID: <1374834436-7149-1-git-send-email-hongbo.zhang@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
To: vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, scottwood@freescale.com, linuxppc-dev@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Hongbo Zhang <hongbo.zhang@freescale.com>
List-ID: <devicetree@vger.kernel.org>

From: Hongbo Zhang <hongbo.zhang@freescale.com>

Hi Vinod, Dan, Scott and Leo, please have a look at these V6 patches.

Freescale QorIQ T4 and B4 introduce new 8-channel DMA engines, this patch set
adds support this DMA engine.

V5->V6 changes:
- minor updates of descriptions in binding document and Kconfig
- remove [4/4], that should be another patch in future

V4->V5 changes:
- update description in the dt binding document, to make it more resonable
- add new patch [4/4] to eliminate a compiling warning which already exists
  for a long time

V3->V4 changes:
- introduce new patch [1/3] to revise the legacy dma binding document
- and then add new paragraph to describe new dt node binding in [2/3]
- rebase to latest kernel v3.11-rc1

V2->V3 changes:
- edit Documentation/devicetree/bindings/powerpc/fsl/dma.txt
- edit text string in Kconfig and the driver files, using "elo series" to
  mention all the current "elo*"

V1->V2 changes:
- removed the codes handling the register dgsr1, since it isn't used currently
- renamed the DMA DT compatible to "fsl,elo3-dma"
- renamed the new dts files to "elo3-dma-<n>.dtsi"

Hongbo Zhang (3):
  DMA: Freescale: revise device tree binding document
  DMA: Freescale: Add new 8-channel DMA engine device tree nodes
  DMA: Freescale: update driver to support 8-channel DMA engine

 .../devicetree/bindings/powerpc/fsl/dma.txt        |  118 +++++++++++++++-----
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi           |    4 +-
 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi          |   81 ++++++++++++++
 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi          |   81 ++++++++++++++
 arch/powerpc/boot/dts/fsl/t4240si-post.dtsi        |    4 +-
 drivers/dma/Kconfig                                |    9 +-
 drivers/dma/fsldma.c                               |    9 +-
 drivers/dma/fsldma.h                               |    2 +-
 8 files changed, 268 insertions(+), 40 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
 create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi

-- 
1.7.9.5



