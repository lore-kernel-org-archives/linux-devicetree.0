From: <hongbo.zhang@freescale.com>
Subject: [PATCH V2 0/2] DMA: Freescale: Add support for 8-channel DMA engine
Date: Fri, 5 Jul 2013 14:27:04 +0800
Message-ID: <1373005626-20726-1-git-send-email-hongbo.zhang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com, djbw@fb.com, leoli@freescale.com, scottwood@freescale.com, linuxppc-dev@lists.ozlabs.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, vakul@freescale.com, Hongbo Zhang <hongbo.zhang@freescale.com>
List-Id: devicetree@vger.kernel.org

From: Hongbo Zhang <hongbo.zhang@freescale.com>

Hi Vinod, Dan, Leo and Scott, please have a look at these V2 patches.

Freescale QorIQ T4 and B4 introduce new 8-channel DMA engines, this patch set
adds support this DMA engine.

V1->v2 changes:
- removed the codes handling the register dgsr1, since it isn't used corrently
- renamed the DMA DT compatible to "fsl,elo3-dma"
- renamed the new dts files to "elo3-dma-<n>.dtsi"


Hongbo Zhang (2):
  DMA: Freescale: Add new 8-channel DMA engine device tree nodes
  DMA: Freescale: update driver to support 8-channel DMA engine

 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi   |   90 +++++++++++++++++++++++++++
 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi   |   90 +++++++++++++++++++++++++++
 arch/powerpc/boot/dts/fsl/t4240si-post.dtsi |    4 +-
 drivers/dma/fsldma.c                        |    5 +-
 drivers/dma/fsldma.h                        |    2 +-
 5 files changed, 187 insertions(+), 4 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-0.dtsi
 create mode 100644 arch/powerpc/boot/dts/fsl/elo3-dma-1.dtsi

-- 
1.7.9.5
