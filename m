From: Frank Wang <frank.wang@rock-chips.com>
Subject: [PATCH v3 0/2] Add a new Rockchip usb2 phy driver
Date: Mon,  6 Jun 2016 17:20:02 +0800
Message-ID: <1465204804-31161-1-git-send-email-frank.wang@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, dianders@chromium.org, linux@roeck-us.net, groeck@chromium.org, jwerner@chromium.org, kishon@ti.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-rockchip@lists.infradead.org, xzy.xu@rock-chips.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, william.wu@rock-chips.com, frank.wang@rock-chips.com
List-Id: devicetree@vger.kernel.org

The newer SoCs (rk3366, rk3399) of Rock-chip take a different usb-phy
IP block than rk3288 and before, and most of phy-related registers are
also different from the past, so a new phy driver is required necessarily.

These series patches add phy-rockchip-inno-usb2.c and the corresponding
documentation.

Changes in v3:
 - Supplemented some hardware-description into the devicetree bindings.
 - Resolved the mapping defect between fixed value in driver and the property
   in devicetree.
 - Code cleanup.

Changes in v2:
 - Specified more hardware-description into the devicetree bindings.
 - Optimized some process of driver.

Frank Wang (2):
  Documentation: bindings: add DT documentation for Rockchip USB2PHY
  phy: rockchip-inno-usb2: add a new driver for Rockchip usb2phy

 .../bindings/phy/phy-rockchip-inno-usb2.txt        |   60 ++
 drivers/phy/Kconfig                                |    7 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/phy-rockchip-inno-usb2.c               |  630 ++++++++++++++++++++
 4 files changed, 698 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.txt
 create mode 100644 drivers/phy/phy-rockchip-inno-usb2.c

-- 
1.7.9.5
