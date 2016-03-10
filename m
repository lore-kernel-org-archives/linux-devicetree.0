From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
	<niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 00/30] ARM: dts: r8a779[0-4]: Reference both DMA controllers
Date: Thu, 10 Mar 2016 12:35:52 +0100
Message-ID: <1457609782-24108-1-git-send-email-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, magnus.damm@gmail.com, geert@linux-m68k.org, laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
List-Id: devicetree@vger.kernel.org

Hi,

R-Car Gen2 have two DMA controllers, which are equivalent. However DMA
slaves were tied only to a single DMA controller in .dtsi. This series
add references to to both DMA controllers for all nodes that previously
only referenced one of them. It also adds dma references to the SDHI
nodes for r8a7794 which according to the datasheet should work but I
have not access to HW to verify.

Tested on Koelsch (r8a7791) by altering the compatible value of either
dmac0 or dmac1 and verifying that the DMA slaves pick the DMA controlle=
r
that is instantiated.

Niklas S=C3=B6derlund (30):
  ARM: dts: r8a7790: Reference both DMA controllers in SCIFA nodes
  ARM: dts: r8a7790: Reference both DMA controllers in SCIFB nodes
  ARM: dts: r8a7790: Reference both DMA controllers in HSCIF nodes
  ARM: dts: r8a7790: Reference both DMA controllers in SCIF nodes
  ARM: dts: r8a7790: Reference both DMA controllers in MSIOF nodes
  ARM: dts: r8a7790: Reference both DMA controllers in QSPI node
  ARM: dts: r8a7790: Reference both DMA controllers in IIC nodes
  ARM: dts: r8a7790: Reference both DMA controllers in SDHI nodes
  ARM: dts: r8a7790: Reference both DMA controllers in MMCIF nodes
  ARM: dts: r8a7791: Reference both DMA controllers in SCIFA nodes
  ARM: dts: r8a7791: Reference both DMA controllers in SCIFB nodes
  ARM: dts: r8a7791: Reference both DMA controllers in HSCIF nodes
  ARM: dts: r8a7791: Reference both DMA controllers in SCIF nodes
  ARM: dts: r8a7791: Reference both DMA controllers in MSIOF nodes
  ARM: dts: r8a7791: Reference both DMA controllers in QSPI node
  ARM: dts: r8a7791: Reference both DMA controllers in IIC nodes
  ARM: dts: r8a7791: Reference both DMA controllers in SDHI nodes
  ARM: dts: r8a7791: Reference both DMA controllers in MMCIF node
  ARM: dts: r8a7793: Reference both DMA controllers in SCIFA nodes
  ARM: dts: r8a7793: Reference both DMA controllers in SCIFB nodes
  ARM: dts: r8a7793: Reference both DMA controllers in HSCIF nodes
  ARM: dts: r8a7793: Reference both DMA controllers in SCIF nodes
  ARM: dts: r8a7793: Reference both DMA controllers in QSPI node
  ARM: dts: r8a7794: Reference both DMA controllers in SCIFA nodes
  ARM: dts: r8a7794: Reference both DMA controllers in SCIFB nodes
  ARM: dts: r8a7794: Reference both DMA controllers in HSCIF nodes
  ARM: dts: r8a7794: Reference both DMA controllers in SCIF nodes
  ARM: dts: r8a7794: Reference both DMA controllers in QSPI node
  ARM: dts: r8a7794: Reference both DMA controllers in SDHI nodes
  ARM: dts: r8a7794: Reference both DMA controllers in QSPI node

 arch/arm/boot/dts/r8a7790.dtsi | 125 +++++++++++++++++++++------------=
--
 arch/arm/boot/dts/r8a7791.dtsi | 145 ++++++++++++++++++++++++---------=
--------
 arch/arm/boot/dts/r8a7793.dtsi |  95 ++++++++++++++++-----------
 arch/arm/boot/dts/r8a7794.dtsi | 109 +++++++++++++++++++------------
 4 files changed, 288 insertions(+), 186 deletions(-)

--
2.7.2
