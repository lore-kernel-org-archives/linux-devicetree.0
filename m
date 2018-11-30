Return-Path: <SRS0=X76U=OJ=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 00/21] Add support for iWave G20D-Q7 board based on RZ/G1N
Date: Fri, 30 Nov 2018 15:54:11 +0000
Message-Id: <1543593251-15322-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add support for iWave G20D-Q7 board based on RZ/G1N.

This patch series is tested against renesas-dev

V1-->V2
    * r8a7744: Initial SoC device tree: Fixed pfc register size, GIC_CPU_MASK_SIMPLE in gic/timer nodes
    * r8a7744: Add SMP support: Fixed GIC_CPU_MASK_SIMPLE in gic/timer nodes
    * r8a7744: Add I2C and IIC support: Dropped i2c aliases, removed generic compatible from iic3.
    * r8a7744-iwg20m: Enable SDHI0 controller: Fixed subject line
    * r8a7744: Add RWDT node: Moved rwdt node just before gpio.

Biju Das (21):
  ARM: dts: r8a7744-iwg20m: Add iWave RZ/G1N Qseven SOM
  ARM: dts: r8a7744: Initial SoC device tree
  ARM: dts: r8a7744-iwg20d-q7: Add support for iWave G20D-Q7 board based
    on RZ/G1N
  ARM: dts: r8a7744: Add SYS-DMAC support
  ARM: dts: r8a7744: Add GPIO support
  ARM: dts: r8a7744: Add Ethernet AVB support
  ARM: dts: r8a7744: Add SMP support
  ARM: dts: r8a7744: Add [H]SCIF{A|B} support
  ARM: dts: r8a7744: Add I2C and IIC support
  ARM: dts: r8a7744: Add SDHI nodes
  ARM: dts: r8a7744: Add MMC node
  ARM: dts: r8a7744-iwg20m: Add eMMC support
  ARM: dts: r8a7744-iwg20m: Enable SDHI0 controller
  ARM: dts: r8a7744: USB 2.0 host support
  ARM: dts: r8a7744: Add USB-DMAC and HSUSB device nodes
  ARM: dts: r8a7744: Add RWDT node
  ARM: dts: r8a7744: Add audio support
  ARM: dts: r8a7744: Add CAN support
  ARM: dts: r8a7744: Add IRQC support
  ARM: dts: r8a7744: Add thermal device to DT
  ARM: dts: r8a7744: Add CMT SoC specific support

 arch/arm/boot/dts/Makefile              |    1 +
 arch/arm/boot/dts/r8a7744-iwg20d-q7.dts |   15 +
 arch/arm/boot/dts/r8a7744-iwg20m.dtsi   |   64 ++
 arch/arm/boot/dts/r8a7744.dtsi          | 1431 +++++++++++++++++++++++++++++++
 4 files changed, 1511 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7744-iwg20d-q7.dts
 create mode 100644 arch/arm/boot/dts/r8a7744-iwg20m.dtsi
 create mode 100644 arch/arm/boot/dts/r8a7744.dtsi

-- 
2.7.4
