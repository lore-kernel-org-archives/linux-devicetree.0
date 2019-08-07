From: fugang.duan@nxp.com
Subject: [PATCH nvmem v2 0/2] nvmem: imx: add i.MX8QM platform support
Date: Wed,  7 Aug 2019 12:03:18 +0800
Message-ID: <20190807040320.1760-1-fugang.duan@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, shawnguo@kernel.org, fugang.duan@nxp.com, kernel@pengutronix.de, gregkh@linuxfoundation.org, festevam@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Fugang Duan <fugang.duan@nxp.com>

The patch set is to add i.MX8QM platform support for i.MX8 SCU
OCOTP driver due to i.MX8QM efuse table has some difference with
i.MX8QXP platform.

V2:
- Add dt-bindings for the new compatible string support.

Fugang Duan (2):
  nvmem: imx: add i.MX8QM platform support
  dt-bindings: fsl: scu: add new compatible string for ocotp

 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 4 +++-
 drivers/nvmem/imx-ocotp-scu.c                               | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

-- 
2.7.4
