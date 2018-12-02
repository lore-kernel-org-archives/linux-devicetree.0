From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/5] Improvements for i.MX6UL PICO SoM and its baseboards
Date: Sun,  2 Dec 2018 19:18:04 -0200
Message-ID: <20181202211809.11621-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Otavio Salvador <otavio@ossystems.com.br>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This patchset rework the imx6ul-pico SoM, its Hobbit baseboard
and add the Pi baseboard support as well.


Fabio Estevam (5):
  ARM: dts: imx6ul-pico-hobbit: Switch to SPDX identifier
  ARM: dts: imx6ul-pico-hobbit: Move SoM related part to
    imx6ul-pico.dtsi
  ARM: dts: imx6ul-pico-hobbit: Make the child led nodes standard
  ARM: dts: imx6ul-pico-hobbit: Extend peripherals support
  ARM: dts: imx6ul-pico: Add the imx6ul-pico-pi variant

 arch/arm/boot/dts/Makefile               |   1 +
 arch/arm/boot/dts/imx6ul-pico-hobbit.dts | 535 ++---------------------
 arch/arm/boot/dts/imx6ul-pico-pi.dts     |  97 ++++
 arch/arm/boot/dts/imx6ul-pico.dtsi       | 461 +++++++++++++++++++
 4 files changed, 601 insertions(+), 493 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx6ul-pico-pi.dts
 create mode 100644 arch/arm/boot/dts/imx6ul-pico.dtsi

-- 
2.19.2
