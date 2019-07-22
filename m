From: andradanciu1997 <andradanciu1997@gmail.com>
Subject: [PATCH v6 0/2] Add basic support for pico-pi-imx8m
Date: Mon, 22 Jul 2019 13:27:28 +0300
Message-ID: <20190722102730.15763-1-andradanciu1997@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com, Michal.Vokac@ysoft.com, ping.bai@nxp.com, u.kleine-koenig@pengutronix.de, leoyang.li@nxp.com, aisheng.dong@nxp.com, l.stach@pengutronix.de, pankaj.bansal@nxp.com, angus@akkea.ca, pramod.kumar_1@nxp.com, bhaskar.upadhaya@nxp.com, vabhav.sharma@nxp.com, andradanciu1997@gmail.com, richard.hu@technexion.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add support for TechNexion PICO-PI-IMX8M based on patches from Richard Hu
Datasheet is at: https://s3.us-east-2.amazonaws.com/technexion/datasheets/picopiimx8m.pdf

Changes since v5:
 - removed comment /* PMIC BD71837 PMIC_nINT GPIO1_IO12 */
 - added "Reviewed-by" tags

Changes since v4:
 - removed #address-cells and  #size-cells from regulators node

Changes since v3:
 - renamed pico-pi-8m.dts to imx8mq-pico-pi.dts
 - moved iomuxc node as the last one
 - removed pinctrl-assert-gpios property from fec1 node
 - removed at803x,led-act-blind-workaround, at803x,eee-disabled
   properties from mdio node
 - added pinctrl-names = "default" to i2c1 node
 - changed bd71837 pmic support properties according to
   Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.txt
 - removed A53_0 node

Changes since v2:
 - changed PICO-PI-8M bord compatible from wand,imx8mq-pico-pi to
   technexion,pico-pi-imx8m
 - removed bootargs property
 - removed regulators node and put fixed regulator directly under root node
 - changed node name from usb_otg_vbus to regulator-usb-otg-vbus
 - removed pinctrl-names property from iomuxc node
 - removed wand-pi-8m container node
 - sorted pinctrl nodes alphabetically
 - removed tusb320_irqgrp, tusb320_irqgrp nodes because there is no upstream
   driver
 - changed properties' order in usb_dwc3_1 node

Changes since v1:
 - renamed wandboard-pi-8m.dts to pico-pi-8m.dts
 - removed pinctrl_csi1, pinctrl_wifi_ctrl
 - used generic name for pmic
 - removed gpo node
 - delete regulator-virtuals node
 - remove always-on property from buck1-8 and ldo3-7
 - remove pmic-buck-uses-i2c-dvs property for buck1-4

Andra Danciu (1):
  dt-bindings: arm: fsl: Add the pico-pi-imx8m board

Richard Hu (1):
  arm64: dts: fsl: pico-pi: Add a device tree for the PICO-PI-IMX8M

 Documentation/devicetree/bindings/arm/fsl.yaml   |   1 +
 arch/arm64/boot/dts/freescale/Makefile           |   1 +
 arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts | 413 +++++++++++++++++++++++
 3 files changed, 415 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mq-pico-pi.dts

-- 
2.11.0
