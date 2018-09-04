From: Alex Gonzalez <alex.gonzalez@digi.com>
Subject: [PATCH v2] ARM: dts: imx6ul: Add DTS for ConnectCore 6UL SBC Pro
Date: Tue, 4 Sep 2018 17:28:28 +0200
Message-ID: <1536074909-8654-1-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alex.gonzalez@digi.com
List-Id: devicetree@vger.kernel.org

This patch adds a device tree for the ConnectCore 6UL SBC Pro board, based
on the ConnectCore 6UL SOM.

Changes since v1 [1]:

* Removed unused pinctrl nodes
* Replace undocumented vendor BSP node by using GPIO hogs
* Formatting changes:
        * Change node names to use dashes instead of underscores

[1] https://lore.kernel.org/lkml/1534936719-13770-2-git-send-email-alex.gonzalez@digi.com/

Alex Gonzalez (1):
  ARM: dts: imx6ul: Add DTS for ConnectCore 6UL SBC Pro

 arch/arm/boot/dts/Makefile                  |   1 +
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts | 394 ++++++++++++++++++++++++++++
 2 files changed, 395 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
