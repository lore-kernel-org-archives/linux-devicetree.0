From: Anson.Huang@nxp.com
Subject: [PATCH 0/4] Add support for i.MX8MM thermal sensor driver
Date: Thu,  4 Jul 2019 17:13:09 +0800
Message-ID: <20190704091313.9516-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, leonard.crestez@nxp.com, daniel.baluta@nxp.com, ping.bai@nxp.com, olof@lixom.net, maxime.ripard@bootlin.com, jagan@amarulasolutions.com, bjorn.andersson@linaro.org, dinguyen@kernel.org, enric.balletbo@collabora.com, marcin.juszkiewicz@linaro.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

i.MX8MM has a thermal monitor unit (TMU) inside, it ONLY has one sensor
for CPU, add support for temperature reading for CPU, cpu cooling is
also added.

This patch series is based on below i.MX SCU thermal patch series:
https://patchwork.kernel.org/patch/11000821/

Anson Huang (4):
  dt-bindings: thermal: imx8mm-thermal: Add binding doc for i.MX8MM
  thermal: imx8mm: Add support for i.MX8MM thermal monitoring unit
  arm64: defconfig: Enable CONFIG_IMX8MM_THERMAL as module
  arm64: dts: imx8mm: Add thermal zone support

 .../devicetree/bindings/thermal/imx8mm-thermal.txt |  15 +++
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  43 +++++++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/thermal/Kconfig                            |  10 ++
 drivers/thermal/Makefile                           |   1 +
 drivers/thermal/imx8mm_thermal.c                   | 134 +++++++++++++++++++++
 6 files changed, 204 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/imx8mm-thermal.txt
 create mode 100644 drivers/thermal/imx8mm_thermal.c

-- 
2.7.4
