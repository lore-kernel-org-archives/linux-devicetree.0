From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 0/9] Improvements for i.MX7D PICO SoM and its baseboards
Date: Sun,  2 Dec 2018 19:25:11 -0200
Message-ID: <20181202212520.16650-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Otavio Salvador <otavio@ossystems.com.br>, Fabio Estevam <fabio.estevam@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Mark Rutland <mark.rutland@arm.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

This patchset rework the imx7d-pico SoM, its Pi baseboard
and add the Hobbit baseboard support as well.


Fabio Estevam (8):
  ARM: dts: imx7d-pico: Do not harcode the memory size
  ARM: dts: imx7d-pico: Switch to SPDX identifier
  ARM: dts: imx7d-pico-pi: Move SoM related part to imx7d-pico.dtsi
  ARM: dts: imx7d-pico: Pass the USBOTG1_PWR pinctrl
  ARM: dts: imx7d-pico: Pass the Ethernet PHY reset GPIO
  ARM: dts: imx7d-pico: Extend peripherals support
  ARM: dts: imx7d-pico-pi: Extend peripherals support
  ARM: dts: imx7d-pico: Add the imx7d-pico-hobbit variant

Otavio Salvador (1):
  ARM: dts: imx7d-pico: Improve WiFi regulator name

 arch/arm/boot/dts/Makefile              |   1 +
 arch/arm/boot/dts/imx7d-pico-hobbit.dts | 105 +++++++
 arch/arm/boot/dts/imx7d-pico-pi.dts     | 180 +++---------
 arch/arm/boot/dts/imx7d-pico.dtsi       | 355 ++++++++++++++++++++----
 4 files changed, 457 insertions(+), 184 deletions(-)
 create mode 100644 arch/arm/boot/dts/imx7d-pico-hobbit.dts

-- 
2.19.2
