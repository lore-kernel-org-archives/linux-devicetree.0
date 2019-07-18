From: Andra Danciu <andradanciu1997@gmail.com>
Subject: [PATCH v3 0/2] Add basic support for pico-pi-imx8m
Date: Thu, 18 Jul 2019 15:16:26 +0300
Message-ID: <20190718121628.23991-1-andradanciu1997@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com, u.kleine-koenig@pengutronix.de, aisheng.dong@nxp.com, andradanciu1997@gmail.com, leoyang.li@nxp.com, festevam@gmail.com, sriram.dash@nxp.com, l.stach@pengutronix.de, pankaj.bansal@nxp.com, ping.bai@nxp.com, pramod.kumar_1@nxp.com, bhaskar.upadhaya@nxp.com, richard.hu@technexion.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for TechNexion PICO-PI-IMX8M based on patches from Richard Hu
Datasheet is at: https://s3.us-east-2.amazonaws.com/technexion/datasheets/picopiimx8m.pdf

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

 Documentation/devicetree/bindings/arm/fsl.yaml |   1 +
 arch/arm64/boot/dts/freescale/Makefile         |   1 +
 arch/arm64/boot/dts/freescale/pico-pi-8m.dts   | 417 +++++++++++++++++++++++++
 3 files changed, 419 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/pico-pi-8m.dts

-- 
2.11.0
