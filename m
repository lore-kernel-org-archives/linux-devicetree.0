From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add support for imx6ul-pico-nymph
Date: Tue,  9 Apr 2019 22:00:12 -0300
Message-ID: <20190410010013.17259-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <festevam@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

Add support for TechNexion's imx6ul-pico-nymph board.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 944687df45b8..f19ca45a9333 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -124,6 +124,7 @@ properties:
           - enum:
               - fsl,imx6ul-14x14-evk      # i.MX6 UltraLite 14x14 EVK Board
               - technexion,imx6ul-pico-dwarf # i.MX6 UltraLite Pico Dwarf Board
+              - technexion,imx6ul-pico-nymph # i.MX6 UltraLite Pico Nymph Board
           - const: fsl,imx6ul
 
       - description: i.MX6ULL based Boards
-- 
2.21.0
