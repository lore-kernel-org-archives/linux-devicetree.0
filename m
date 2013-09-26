From: <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v11 0/3]  DMA: Freescale: Add support for 8-channel DMA engine
Date: Thu, 26 Sep 2013 17:33:40 +0800
Message-ID: <1380188023-3936-1-git-send-email-hongbo.zhang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Hongbo Zhang <hongbo.zhang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

Hi DMA and DT maintainers, please have a look at these V11 patches.

Freescale QorIQ T4 and B4 introduce new 8-channel DMA engines, this patch set
adds support this DMA engine.

V10->V11 changes:
- add "contains two entries" for reg description in patch [2/3]

V9->V10 changes:
- update binding description text, mainly about the reg property and also Elo3
  DMA controller specification

V8->V9 changes:
- add "Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>" into patch [1/3]
- update reg entry <0x100300 0x4 0x100600 0x4> to two seperate ones
  <0x100300 0x4>, <0x100600 0x4> in patch [2/3]
- and also use "QorIQ Elo3 DMA" to mention previous "QorIQ DMA" in [2/3]

V7->V8 changes:
- change the word "mapping" to "specifier" for reg and interrupts description

V6->V7 changes:
- only remove unnecessary "CHIP-dma" explanations in [1/3]

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

 .../devicetree/bindings/powerpc/fsl/dma.txt        |  138 ++++++++++++++------
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi           |    4 +-
 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi          |   82 ++++++++++++
 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi          |   82 ++++++++++++
 arch/powerpc/boot/dts/fsl/t4240si-post.dtsi        |    4 +-
 drivers/dma/Kconfig                                |    9 +-
 drivers/dma/fsldma.c                               |    9 +-
 drivers/dma/fsldma.h                               |    2 +-
 8 files changed, 281 insertions(+), 49 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
 create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi

-- 
1.7.9.5



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
