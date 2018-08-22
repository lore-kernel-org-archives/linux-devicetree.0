From: Alex Gonzalez <alex.gonzalez@digi.com>
Subject: [PATCH] Add support for the ConnectCore 6UL SBC Pro
Date: Wed, 22 Aug 2018 13:18:38 +0200
Message-ID: <1534936719-13770-1-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alex.gonzalez@digi.com
List-Id: devicetree@vger.kernel.org

This patch adds a device tree for the ConnectCore 6UL SBC Pro board

The ConnectCore 6UL SBC Pro includes the ConnectCore 6UL System-On-Module.

More information about the hardware can be found at:
https://www.digi.com/products/embedded-systems/single-board-computers/connectcore-for-i-mx6ul-sbc-pro

Alex Gonzalez (1):
  ARM: dts: imx6ul: Add DTS for ConnectCore 6UL SBC Pro

 arch/arm/boot/dts/Makefile                  |   1 +
 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts | 466 ++++++++++++++++++++++++++++
 2 files changed, 467 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
