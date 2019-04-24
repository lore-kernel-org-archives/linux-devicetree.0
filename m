From: "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH v7 3/3] dt-bindings: arm: fsl: Add the imx8mq boards
Date: Wed, 24 Apr 2019 16:17:11 -0700
Message-ID: <20190424231711.14156-4-angus@akkea.ca>
References: <20190424231711.14156-1-angus@akkea.ca>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190424231711.14156-1-angus@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: angus@akkea.ca
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, =?UTF-8?q?Vok=C3=A1=C4=8D=20Michal?= <Michal.Vokac@ysoft.com>, Aisheng Dong <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m.felsch@pengutronix.de
List-Id: devicetree@vger.kernel.org

Add an entry for imx8mq based boards

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 06762fe57227..ecf63a123950 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -175,6 +175,13 @@ properties:
               - fsl,imx8mm-evk            # i.MX8MM EVK Board
           - const: fsl,imx8mm
 
+      - description: i.MX8MQ based Boards
+        items:
+          - enum:
+              - fsl,imx8mq-evk            # i.MX8MQ EVK Board
+              - purism,librem5-devkit     # Purism Librem5 devkit
+          - const: fsl,imx8mq
+
       - description: i.MX8QXP based Boards
         items:
           - enum:
-- 
2.17.1
