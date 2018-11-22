Return-Path: <SRS0=JPrT=OB=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/7] Add support for iWave G20D-Q7 board based on RZ/G1N
Date: Thu, 22 Nov 2018 09:14:28 +0000
Message-Id: <1542878075-61314-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add support for iWave G20D-Q7 board based on RZ/G1N.

This patch series is tested against renesas-dev

Biju Das (7):
  ARM: dts: r8a7744-iwg20m: Add iWave RZ/G1N Qseven SOM
  ARM: dts: r8a7744: Initial SoC device tree
  ARM: dts: r8a7744-iwg20d-q7: Add support for iWave G20D-Q7 board based
    on RZ/G1N
  ARM: dts: r8a7744: Add SYS-DMAC support
  ARM: dts: r8a7744: Add GPIO support
  ARM: dts: r8a7744: Add Ethernet AVB support
  ARM: dts: r8a7744: Add SMP support

 arch/arm/boot/dts/Makefile              |   1 +
 arch/arm/boot/dts/r8a7744-iwg20d-q7.dts |  15 +
 arch/arm/boot/dts/r8a7744-iwg20m.dtsi   |  31 ++
 arch/arm/boot/dts/r8a7744.dtsi          | 561 ++++++++++++++++++++++++++++++++
 4 files changed, 608 insertions(+)
 create mode 100644 arch/arm/boot/dts/r8a7744-iwg20d-q7.dts
 create mode 100644 arch/arm/boot/dts/r8a7744-iwg20m.dtsi
 create mode 100644 arch/arm/boot/dts/r8a7744.dtsi

-- 
2.7.4
