From: yibin.gong@nxp.com
Subject: [PATCH v3 0/8] add edma2 for i.mx7ulp
Date: Wed, 29 May 2019 17:08:40 +0800
Message-ID: <20190529090848.34350-1-yibin.gong@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, mark.rutland@arm.com, vkoul@kernel.org, dan.j.williams@intel.com
Cc: linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

From: Robin Gong <yibin.gong@nxp.com>

  This patch set add new version of edma for i.mx7ulp, the main changes
are as belows:
  1. only one dmamux.
  2. another clock dma_clk except dmamux clk.
  3. 16 independent interrupts instead of only one interrupt for
     all channels.
  For the first change, need modify fsl-edma-common.c and mcf-edma,
so create the first two patches to prepare without any function impact.
  For the third change, need request single irq for every channel with
the legacy handler. But actually 2 dma channels share one interrupt(16
channel interrupts, but 32 channels.),ch0/ch16,ch1/ch17... For now, just
simply request irq without IRQF_SHARED flag, since 16 channels are enough
on i.mx7ulp whose M4 domain own some peripherals.

change from v1:
  1. check .data of 'of_device_id' in probe instead of compatible name. 

change from v2:
  1. move the difference between edma and edma2 into driver data so that
     no need version checking in fsl-edma.c.

Robin Gong (8):
  dmaengine: fsl-edma: add dmamux_nr for next version
  dmaengine: mcf-edma: update to 'dmamux_nr'
  dmaengine: fsl-edma-common: move dmamux register to another single
    function
  dmaengine: fsl-edma-common: version check for v2 instead
  dmaengine: fsl-edma: add drvdata for vf610
  dt-bindings: dma: fsl-edma: add new i.mx7ulp-edma
  dmaengine: fsl-edma: add i.mx7ulp edma2 version support
  ARM: dts: imx7ulp: add edma device node

 Documentation/devicetree/bindings/dma/fsl-edma.txt |  44 +++++++-
 arch/arm/boot/dts/imx7ulp.dtsi                     |  28 ++++++
 drivers/dma/fsl-edma-common.c                      |  74 +++++++++-----
 drivers/dma/fsl-edma-common.h                      |  13 +++
 drivers/dma/fsl-edma.c                             | 112 ++++++++++++++++++---
 drivers/dma/mcf-edma.c                             |   1 +
 6 files changed, 230 insertions(+), 42 deletions(-)

-- 
2.7.4
