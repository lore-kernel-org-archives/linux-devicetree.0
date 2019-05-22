From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 0/2] Add 96Boards Meerkat96 board support
Date: Wed, 22 May 2019 18:45:48 +0530
Message-ID: <20190522131550.9034-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org, festevam@gmail.com
Cc: kernel@pengutronix.de, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, pbrobinson@gmail.com, yossi@novtech.com, nazik@novtech.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Hello,

This patchset adds board support for 96Boards Meerkat96 board from
Novtech. This board is one of the Consumer Edition boards of the 96Boards
family based on i.MX7D SoC. Following are the currently supported
features of the board:
 
* uSD
* WiFi/BT
* USB
    
More information about this board can be found in 96Boards product page:
https://www.96boards.org/product/imx7-96/

Thanks,
Mani

Manivannan Sadhasivam (2):
  dt-bindings: arm: Document 96Boards Meerkat96 devicetree binding
  ARM: dts: Add support for 96Boards Meerkat96 board

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/imx7d-meerkat96.dts         | 396 ++++++++++++++++++
 3 files changed, 398 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx7d-meerkat96.dts

-- 
2.17.1
