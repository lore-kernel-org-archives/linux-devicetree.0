From: Jingchang Lu <b35083@freescale.com>
Subject: [PATCHv8 0/2] dma: Add Freescale eDMA engine driver support
Date: Thu, 2 Jan 2014 14:52:22 +0800
Message-ID: <1388645544-5596-1-git-send-email-b35083@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vinod.koul@intel.com
Cc: dan.j.williams@intel.com, shawn.guo@linaro.org, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series add Freescale eDMA engine support.

Jingchang Lu (2):
	ARM: dts: vf610: Add eDMA node
	dma: Add Freescale eDMA engine driver support

 Documentation/devicetree/bindings/dma/fsl-edma.txt |  67 ++++
 arch/arm/boot/dts/vf610.dtsi                       |  31 ++
 drivers/dma/Kconfig                                |  10 +
 drivers/dma/Makefile                               |   1 +
 drivers/dma/fsl-edma.c                             | 939 +++++++++++++++++++++++++++++++++++++++++++++
 include/dt-bindings/dma/vf610-edma.h               | 195 ++++++++++
 6 files changed, 1243 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/fsl-edma.txt
 create mode 100644 drivers/dma/fsl-edma.c
 create mode 100644 include/dt-bindings/dma/vf610-edma.h
