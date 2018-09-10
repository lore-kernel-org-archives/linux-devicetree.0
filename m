From: Alex Gonzalez <alex.gonzalez@digi.com>
Subject: [PATCH v3] ARM: dts: imx6ul: Add DTS for ConnectCore 6UL SBC Pro
Date: Mon, 10 Sep 2018 11:37:51 +0200
Message-ID: <1536572272-18590-1-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alex.gonzalez@digi.com
List-Id: devicetree@vger.kernel.org

This patch adds a device tree for the ConnectCore 6UL SBC Pro board, based on
the ConnectCore 6UL SOM.

Changes since v2 [2]:

* Removed redundant clocks from pwm nodes
* Use real iomux pad values
* Spelling change in regulator-usb-otg1 node name

Changes since v1 [1]:

* Removed unused pinctrl nodes
* Replace undocumented vendor BSP node by using GPIO hogs
* Formatting changes:
        * Change node names to use dashes instead of underscores

[1] https://lore.kernel.org/lkml/1534936719-13770-2-git-send-email-alex.gonzalez@digi.com/
[2] https://lore.kernel.org/lkml/1536074909-8654-1-git-send-email-alex.gonzalez@digi.com/

Alex Gonzalez (1):
  ARM: dts: imx6ul: Add DTS for ConnectCore 6UL SBC Pro

 arch/arm/boot/dts/Makefile                  |   1 +
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts | 390 ++++++++++++++++++++++++++++
 2 files changed, 391 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
