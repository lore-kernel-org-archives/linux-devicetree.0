Return-Path: <SRS0=SDjf=NF=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 0/7] Add RZ/G1C USB2.0 Host support
Date: Thu, 25 Oct 2018 14:56:52 +0100
Message-Id: <1540475819-47950-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Kishon Vijay Abraham I <kishon@ti.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This patch series aims to add USB2.0 Host support for RZ/G1C SoC. RZ/G1C
SoC is similar to R-Car Gen2 SoC, but there are some differences

- It has a shared pll reset register for hsusb0/hsusb1 and this register 
  reside in hsusb0 block.

- Each USB host needs to deassert the pll reset of hsusb block apart from
  initializing interrupt enable,OVC detection timer and suspend/resume timer
  register.

To address the above scenarios, add optional usb2.0 host reg and clock
properties.

This patch is tested against phy-next, usb-next and renesas-devel.

References:-
 *) https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg32115.html

Biju Das (7):
  dt-bindings: phy: rcar-gen2: Add r8a77470 support
  phy: renesas: phy-rcar-gen2: Add support for r8a77470
  ARM: dts: r8a77470: Add USB PHY DT support
  ARM: dts: iwg23s-sbc: Enable USB Phy[01]
  ARM: dts: r8a77470: Add USB2.0 Host (EHCI/OHCI) device nodes
  ARM: dts: iwg23s-sbc: Enable USB USB2.0 Host
  ARM: shmobile: Enable USB [EO]HCI HCD PLATFORM support in
    shmobile_defconfig

 .../devicetree/bindings/phy/rcar-gen2-phy.txt      |  64 ++++++-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          |  32 ++++
 arch/arm/boot/dts/r8a77470.dtsi                    |  88 ++++++++++
 arch/arm/configs/shmobile_defconfig                |   2 +
 drivers/phy/renesas/phy-rcar-gen2.c                | 188 ++++++++++++++++++++-
 5 files changed, 361 insertions(+), 13 deletions(-)

-- 
2.7.4
