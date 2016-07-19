From: Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH v8 0/3] Add a new Rockchip usb2 phy driver
Date: Tue, 19 Jul 2016 15:23:41 +0800
Message-ID: <1468913024-23813-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, dianders@chromium.org, linux@roeck-us.net, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com, daniel.meng@rock-chips.com, frank.wang@rock-chips.com
List-Id: devicetree@vger.kernel.org

The newer SoCs (rk3366, rk3399) of Rock-chip take a different usb-phy
IP block than rk3288 and before, and most of phy-related registers are
also different from the past, so a new phy driver is required necessarily.

These series patches add phy-rockchip-inno-usb2.c and the corresponding
dt-bindings.

Changes in v8:
 - Added support for rk3399 SoC.
 - Prepare input clock of phy at probe time.
 - Improved sm_work function to handle phy-port state more clearly.

Changes in v7:
 - Renamed functions *usb2phy_resume/*usb2phy_suspend to *usb2phy_power_on/usb2phy_power_off.

Changes in v6:
 - Changed '_' to '-' for otg-id and otg-bvalid property in devicetree bindings.
 - Fixed the output clock would be disabled more than once while phy-port was going to suspend.
 - Improved the driver to avoid the currently empty otg-port would cause null-pointer dereferences.

Changes in v5:
 - Added 'reg' property both in devicetree bindings and driver to match the different phy-blocks.

Changes in v4:
 - Used 'phy-supply' instead of 'vbus_*-supply'.

Changes in v3:
 - Supplemented some hardware-description into the devicetree bindings.
 - Resolved the mapping defect between fixed value in driver and the property
   in devicetree.
 - Code cleanup.

Changes in v2:
 - Specified more hardware-description into the devicetree bindings.
 - Optimized some process of driver.

Frank Wang (3):
  Documentation: bindings: add DT documentation for Rockchip USB2PHY
  phy: rockchip-inno-usb2: add a new driver for Rockchip usb2phy
  arm64: dts: rockchip: add usb2-phy support for rk3399

 .../bindings/phy/phy-rockchip-inno-usb2.txt        |   64 ++
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |   19 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |   47 +-
 drivers/phy/Kconfig                                |    7 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/phy-rockchip-inno-usb2.c               |  707 ++++++++++++++++++++
 6 files changed, 844 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
 create mode 100644 drivers/phy/phy-rockchip-inno-usb2.c

-- 
1.7.9.5
