From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 1/3] dt-bindings: imx-ocotp: Add i.MX8MQ compatible
Date: Mon, 11 Feb 2019 17:50:09 +0100
Message-ID: <20190211165011.5114-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>, linux-imx@nxp.com, kernel@pengutronix.de, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

Add compatible for i.MX8MQ and add both i.MX7D/S and i.M8MQ
to the description.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 Documentation/devicetree/bindings/nvmem/imx-ocotp.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
index 792bc5fafeb9..bb8fb8fc6217 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.txt
@@ -1,7 +1,8 @@
 Freescale i.MX6 On-Chip OTP Controller (OCOTP) device tree bindings
 
 This binding represents the on-chip eFuse OTP controller found on
-i.MX6Q/D, i.MX6DL/S, i.MX6SL, i.MX6SX, i.MX6UL and i.MX6SLL SoCs.
+i.MX6Q/D, i.MX6DL/S, i.MX6SL, i.MX6SX, i.MX6UL, i.MX6SLL, i.MX7D/S
+and i.MX8MQ SoCs.
 
 Required properties:
 - compatible: should be one of
@@ -11,6 +12,7 @@ Required properties:
 	"fsl,imx6ul-ocotp" (i.MX6UL),
 	"fsl,imx7d-ocotp" (i.MX7D/S),
 	"fsl,imx6sll-ocotp" (i.MX6SLL),
+	"fsl,imx8mq-ocotp" (i.MX8MQ),
 	followed by "syscon".
 - #address-cells : Should be 1
 - #size-cells : Should be 1
-- 
2.20.1
