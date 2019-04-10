Return-Path: <SRS0=uE6T=SM=bp.renesas.com=biju.das@kernel.org>
From: Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH V5 00/13] Add USB2.0 support
Date: Wed, 10 Apr 2019 15:48:37 +0100
Message-Id: <1554907730-14792-1-git-send-email-biju.das@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Biju Das <biju.das@bp.renesas.com>, Kishon Vijay Abraham I <kishon@ti.com>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This series adds USB 2.0 support for the RZ/G1C SoC. RZ/G1C
SoC is similar to R-Car Gen2 SoC, but there are some differences

- It has a shared pll reset register for hsusb0/hsusb1 and this register 
  reside in hsusb0 block.

- Each USB host needs to deassert the pll reset of hsusb block apart from
  initializing interrupt enable,OVC detection timer and suspend/resume timer
  register.

To address the above scenarios, created a ehci-r8a77470 host controller
driver.

This patchset is based on linux_next next-20190410 branch.
V4-->V5
   * Incoporated Shimoda-san's review comment
     (https://patchwork.kernel.org/patch/10879893/)
V3-->V4
  * Incoporated Kishon and Shimoda-san's review comment
    (https://patchwork.kernel.org/patch/10883265/)
  * Added missing rcar-gen3-phy-usb2 phy in ohci1 node.

V2-->V3
 * Incorporated Alan's review comment for dropping ehci-r8a77470 host driver
 * Incorporated shimoda-san's comments.
   Ref: https://patchwork.kernel.org/patch/10879899/

V1-->V2
 * Incorporated Rob's review comment
   Ref: https://patchwork.kernel.org/patch/10655853/
 * Incorporated Shimoda-San's review comment
   Ref: https://patchwork.kernel.org/patch/10655855/
 * Created ehci-r8a77470 host driver.

Biju Das (13):
  dt-bindings: phy: rcar-gen2: Add r8a77470 support
  phy: renesas: phy-rcar-gen2: Add support for r8a77470
  dt-bindings: rcar-gen3-phy-usb2: Add r8a77470 support
  phy: rcar-gen3-usb2: Add support for r8a77470
  ARM: shmobile: Enable PHY_RCAR_GEN3_USB2 in shmobile_defconfig
  dt-bindings: usb: renesas_usbhs: Add support for r8a77470
  ARM: shmobile: Enable USB [EO]HCI HCD PLATFORM support in
    shmobile_defconfig
  ARM: dts: r8a77470: Add USB PHY DT support
  ARM: dts: iwg23s-sbc: Enable USB Phy[01]
  ARM: dts: r8a77470: Add USB2.0 Host (EHCI/OHCI) device
  ARM: dts: iwg23s-sbc: Enable USB USB2.0 Host
  ARM: dts: r8a77470: Add HSUSB device nodes
  ARM: dts: iwg23s-sbc: Enable HS-USB

 .../devicetree/bindings/phy/rcar-gen2-phy.txt      |  57 ++++++++-
 .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |   6 +-
 .../devicetree/bindings/usb/renesas_usbhs.txt      |   1 +
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          |  44 +++++++
 arch/arm/boot/dts/r8a77470.dtsi                    | 141 +++++++++++++++++++++
 arch/arm/configs/shmobile_defconfig                |   3 +
 drivers/phy/renesas/Kconfig                        |   2 +-
 drivers/phy/renesas/phy-rcar-gen2.c                | 130 +++++++++++++++++--
 drivers/phy/renesas/phy-rcar-gen3-usb2.c           |  39 +++++-
 9 files changed, 398 insertions(+), 25 deletions(-)

-- 
2.7.4
