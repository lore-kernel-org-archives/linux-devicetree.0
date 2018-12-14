Return-Path: <SRS0=0VMp=OX=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 00/17] Add more support for the RZ/G2E
Date: Fri, 14 Dec 2018 09:37:23 +0000
Message-Id: <1544780260-27590-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Dear All,

this series adds more support to the RZ/G2E (a.k.a. r8a774c0)
SoC specific device tree on top of what added from series
(on which this series depends on):
https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg36692.html

Thanks,
Fab

Fabrizio Castro (17):
  arm64: dts: renesas: r8a774c0: Add SDHI nodes
  arm64: dts: renesas: r8a774c0: Add I2C and IIC-DVFS support
  arm64: dts: renesas: r8a774c0: Add IPMMU device nodes
  arm64: dts: renesas: r8a774c0: Add CAN nodes
  arm64: dts: renesas: r8a774c0: Add thermal support
  arm64: dts: renesas: r8a774c0: Add MSIOF nodes
  arm64: dts: renesas: r8a774c0: Add audio support
  arm64: dts: renesas: r8a774c0: Add PWM support
  arm64: dts: renesas: r8a774c0: Add display output support
  arm64: dts: renesas: r8a774c0: Add USB2.0 phy and host device nodes
  arm64: dts: renesas: r8a774c0: Add USB-DMAC and HSUSB device nodes
  arm64: dts: renesas: r8a774c0: Add USB3.0 device nodes
  arm64: dts: renesas: r8a774c0: Connect RZ/G2E SYS-DMAC to IPMMU
  arm64: dts: renesas: r8a774c0: Connect RZ/G2E AVB to IPMMU
  arm64: dts: renesas: r8a774c0: Connect RZ/G2E Audio-DMAC to IPMMU
  arm64: dts: renesas: r8a774c0: Add PCIe device node
  arm64: dts: renesas: r8a774c0: Add VIN and CSI-2 device nodes

 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 1099 +++++++++++++++++++++++++++++
 1 file changed, 1099 insertions(+)

-- 
2.7.4
