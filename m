From: Anson.Huang@nxp.com
Subject: [PATCH 1/2] dt-bindings: imx-ocotp: Add i.MX8MN compatible
Date: Thu, 11 Jul 2019 10:37:13 +0800
Message-ID: <20190711023714.16000-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Add compatible for i.MX8MN and add i.MX8MM/i.MX8MN to the description.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
index 96ffd06..904dadf 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
@@ -2,7 +2,7 @@ Freescale i.MX6 On-Chip OTP Controller (OCOTP) device tree bindings
 
 This binding represents the on-chip eFuse OTP controller found on
 i.MX6Q/D, i.MX6DL/S, i.MX6SL, i.MX6SX, i.MX6UL, i.MX6ULL/ULZ, i.MX6SLL,
-i.MX7D/S, i.MX7ULP and i.MX8MQ SoCs.
+i.MX7D/S, i.MX7ULP, i.MX8MQ, i.MX8MM and i.MX8MN SoCs.
 
 Required properties:
 - compatible: should be one of
@@ -16,6 +16,7 @@ Required properties:
 	"fsl,imx7ulp-ocotp" (i.MX7ULP),
 	"fsl,imx8mq-ocotp" (i.MX8MQ),
 	"fsl,imx8mm-ocotp" (i.MX8MM),
+	"fsl,imx8mn-ocotp" (i.MX8MN),
 	followed by "syscon".
 - #address-cells : Should be 1
 - #size-cells : Should be 1
-- 
2.7.4
