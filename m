From: fugang.duan@nxp.com
Subject: [PATCH nvmem v2 2/2] dt-bindings: fsl: scu: add new compatible string for ocotp
Date: Wed,  7 Aug 2019 12:03:20 +0800
Message-ID: <20190807040320.1760-3-fugang.duan@nxp.com>
References: <20190807040320.1760-1-fugang.duan@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807040320.1760-1-fugang.duan@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org
Cc: robh@kernel.org, mark.rutland@arm.com, s.hauer@pengutronix.de, shawnguo@kernel.org, fugang.duan@nxp.com, kernel@pengutronix.de, gregkh@linuxfoundation.org, festevam@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Fugang Duan <fugang.duan@nxp.com>

Add new compatible string "fsl,imx8qm-scu-ocotp" into binding
doc  for i.MX8 SCU OCOTP driver.

Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
---
 Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index a575e42..c149fad 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -136,7 +136,9 @@ Required properties:
 OCOTP bindings based on SCU Message Protocol
 ------------------------------------------------------------
 Required properties:
-- compatible:		Should be "fsl,imx8qxp-scu-ocotp"
+- compatible:		Should be one of:
+			"fsl,imx8qm-scu-ocotp",
+			"fsl,imx8qxp-scu-ocotp".
 - #address-cells:	Must be 1. Contains byte index
 - #size-cells:		Must be 1. Contains byte length
 
-- 
2.7.4
