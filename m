From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add compatible string for Kobo Clara HD
Date: Thu, 10 Oct 2019 21:23:55 +0200
Message-ID: <20191010192357.27884-2-andreas@kemnade.info>
References: <20191010192357.27884-1-andreas@kemnade.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191010192357.27884-1-andreas@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, manivannan.sadhasivam@linaro.org, andrew.smirnov@gmail.com, marex@denx.de, angus@akkea.ca, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, j.neuschaefer@gmx.net, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Marco Felsch <m.felsch@pengutronix.de>
Cc: Andreas Kemnade <andreas@kemnade.info>
List-Id: devicetree@vger.kernel.org

This adds a compatible string for the Kobo Clara HD eBook reader.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2: reordered, was 2/3
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7294ac36f4c0b..afa3bfeca0c08 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -148,6 +148,7 @@ properties:
         items:
           - enum:
               - fsl,imx6sll-evk
+              - kobo,clarahd
           - const: fsl,imx6sll
 
       - description: i.MX6SX based Boards
-- 
2.20.1
