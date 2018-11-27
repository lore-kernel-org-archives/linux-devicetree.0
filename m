Return-Path: <SRS0=lXjp=OG=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 00/22] Add more support to RZ/G1N
Date: Tue, 27 Nov 2018 11:56:13 +0000
Message-Id: <1543319795-48325-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add support for some more interfaces to
RZ/G1N SoC (SCIF/HSCIF, I2C, IIC, SDHI, MMC, USBHost, USB Function,
 rwdt, Audio, Display, CAN and CMT ....).

This patch series tested against renesas-dev.
it depends on the the below patch series.

https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=46273

Biju Das (22):
  ARM: dts: r8a7744: Add [H]SCIF{A|B} support
  ARM: dts: r8a7744: Add I2C and IIC support
  ARM: dts: r8a7744: Add SDHI nodes
  ARM: dts: r8a7744: Add MMC node
  ARM: dts: r8a7744-iwg20m: Add eMMC support
  ARM: dts: r8a7744-iwg20m: Enable SDHI10 controller
  ARM: dts: r8a7744: USB 2.0 host support
  ARM: dts: r8a7744: Add USB-DMAC and HSUSB device nodes
  ARM: dts: r8a7744: Add RWDT node
  ARM: dts: r8a7744: Add audio support
  ARM: dts: r8a7744: Add DU support
  ARM: dts: r8a7744-iwg20d-q7-dbcm-ca: Add device tree for camera DB
  ARM: dts: r8a7744: Add CAN support
  ARM: dts: r8a7744: Add IRQC support
  ARM: dts: r8a7744: Add thermal device to DT
  ARM: dts: r8a7744: Add CMT SoC specific support
  ARM: dts: iwg20d-q7-common: Move cmt/rwdt node out of RZ/G1M SOM
  ARM: dts: r8a7744: Add QSPI support
  ARM: dts: r8a7744-iwg20m: Add SPI NOR support
  ARM: dts: r8a7744: Add MSIOF[012] support
  ARM: dts: r8a7744: Add xhci support
  ARM: dts: r8a7744: Add PCIe Controller device node

 arch/arm/boot/dts/Makefile                      |    1 +
 arch/arm/boot/dts/iwg20d-q7-common.dtsi         |    9 +
 arch/arm/boot/dts/r8a7743-iwg20m.dtsi           |    9 -
 arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dts |   17 +
 arch/arm/boot/dts/r8a7744-iwg20m.dtsi           |   59 ++
 arch/arm/boot/dts/r8a7744.dtsi                  | 1052 ++++++++++++++++++++++-
 6 files changed, 1114 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7744-iwg20d-q7-dbcm-ca.dts

-- 
2.7.4
