From: Alex Gonzalez <alex.gonzalez@digi.com>
Subject: [PATCH v2 0/2] Add support for the ConnectCore 6UL SOM and SBC Express
Date: Thu, 12 Jul 2018 10:20:34 +0200
Message-ID: <1531383636-3406-1-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alex.gonzalez@digi.com
List-Id: devicetree@vger.kernel.org

This patchset adds a device tree include for the ConnectCore 6UL
System-On-Module and a device tree for the ConnectCore 6UL SBC Express board
that includes it.

Not all the SOM hardware is supported in this initial patchset, specifically
the 802.11 WiFi and BT chipset and the extended functionality provided by
the on module NXP Kinetis KL03 are not supported.

The SOM is based on NXP's i.MX6UL SoC, and the patchset is tested against
v4.18-rc4.

More information about the hardware can be found at:

ConnectCore 6UL SOM:
https://www.digi.com/products/embedded-systems/system-on-modules/connectcore-for-i-mx6ul

ConnectCore 6UL SBC Express board:
https://www.digi.com/products/embedded-systems/single-board-computers/connectcore-for-i-mx6ul-sbc-express

Changes since v1 [1]:

* Remove not needed DT properties
* Formatting changes:
        * Re-order nodes alphabetically
        * Add empty lines between properties and child nodes
        * Use generic node names

[1] https://lore.kernel.org/lkml/1529393534-7827-1-git-send-email-alex.gonzalez@digi.com/

Alex Gonzalez (2):
  ARM: dts: imx6ul: Add DTS for ConnectCore 6UL System-On-Module (SOM)
  ARM: dts: imx6ul: Add DTS for ConnectCore 6UL SBC Express

 arch/arm/boot/dts/Makefile                      |   1 +
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcexpress.dts | 200 +++++++++++++++++++++++
 arch/arm/boot/dts/imx6ul-ccimx6ulsom.dtsi       | 202 ++++++++++++++++++++++++
 3 files changed, 403 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ul-ccimx6ulsbcexpress.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-ccimx6ulsom.dtsi
