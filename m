From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v8 0/3] Add support for the Purism Librem5 devkit
Date: Wed,  1 May 2019 16:57:16 -0600
Message-ID: <20190501225719.3257-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, "Angus Ainslie (Purism)" <angus@akkea.ca>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Librem5 devkit is based on the imx8mq from NXP. This is a default
devicetree to boot the board to a command prompt.

Changes since v7:

More regulators always on for USB.
Add vbus regulator.
Drop vbat regulator.
Replace legacy "gpio-key,wakeup" with "wakeup-source".
Add vbus-supply to get rid of warning
imx8mq-usb-phy 382f0040.usb-phy: 382f0040.usb-phy supply vbus not found, using dummy regulator

Changes since v6:

Dropped unused regulators.
Fix regulator phandles case.
Dropped extra whitespace.

Changes since v5:

Added reviewed-by tags.
Moved USB port links to USB controller node.

Changes since v4:

Compiled against linux-next next-20190415.
Added imx8mq to the arm yaml file.
Re-arrange regulator nodes to drop undefined supplies.
Additional ordering for aesthetics.
Split some long lines.
Added lots of blank lines.
Moved pinctl muxes to where they are used.
Cleaned out reg defintions from regulator nodes.

Changes since v3:

Freshly sorted and pressed nodes.
Change the backlight to an interpolated scale.
Dropped i2c2.
Dropped devkit version number to match debian MR.

Changes since v2:

Fixed incorrect phy-supply for the fsl-fec.
Dropped unused regulator property.
Fixup Makefile for linux-next.

Changes since v1:

Dropped config file.
Updated the board compatible label.
Changed node names to follow naming conventions.
Added a more complete regulator hierachy.
Removed unused nodes.
Removed unknown devices.
Fixed comment style.
Dropped undocumented properties.

Angus Ainslie (Purism) (3):
  arm64: dts: fsl: librem5: Add a device tree for the Librem5 devkit
  dt-bindings: Add an entry for Purism SPC
  dt-bindings: arm: fsl: Add the imx8mq boards

 .../devicetree/bindings/arm/fsl.yaml          |   7 +
 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx8mq-librem5-devkit.dts   | 823 ++++++++++++++++++
 4 files changed, 832 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts

-- 
2.17.1
