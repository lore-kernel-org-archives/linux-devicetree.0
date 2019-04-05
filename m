From: Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v5 0/5] Allwinner H6 USB3 support
Date: Sat,  6 Apr 2019 04:57:31 +0800
Message-ID: <20190405205736.55177-1-icenowy@aosc.io>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
List-Id: devicetree@vger.kernel.org

This patchset adds device tree binding and driver support for Allwinner
H6 USB3 PHY. The controller is just a DWC3 controller from Synposys.

Because of the suggest of Rob Herring, this revision uses the USB
connector device tree binding, and enhanced it by adding Vbus supply
property to it.

Icenowy Zheng (5):
  dt-bindings: usb-connector: add Vbus regulator for Type-A/B
  dt-bindings: phy: add binding for Allwinner USB3 PHY
  phy: allwinner: add phy driver for USB3 PHY on Allwinner H6 SoC
  arm64: allwinner: dts: h6: add USB3 device nodes
  arm64: allwinner: dts: h6: enable USB3 port on Pine H64

 .../bindings/connector/usb-connector.txt      |   3 +
 .../bindings/phy/sun50i-usb3-phy.txt          |  28 ++
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  13 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  32 +++
 drivers/phy/allwinner/Kconfig                 |  12 +
 drivers/phy/allwinner/Makefile                |   1 +
 drivers/phy/allwinner/phy-sun50i-usb3.c       | 260 ++++++++++++++++++
 7 files changed, 349 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sun50i-usb3-phy.txt
 create mode 100644 drivers/phy/allwinner/phy-sun50i-usb3.c

-- 
2.18.1
