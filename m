From: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add support for imx6ul-pico-dwarf
Date: Sun,  7 Apr 2019 16:37:22 -0300
Message-ID: <20190407193723.3351-1-otavio@ossystems.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Fabio Estevam <festevam@gmail.com>, Otavio Salvador <otavio@ossystems.com.br>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Vok=C3=A1=C4=8D=20Michal?= <Michal.Vokac@ysoft.com>, Rob Herring <robh+dt@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Shawn Guo <shawnguo@kernel.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <festevam@gmail.com>

Add support for TechNexion's imx6ul-pico-dwarf board.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 3c7ad36ebd35..944687df45b8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -123,6 +123,7 @@ properties:
         items:
           - enum:
               - fsl,imx6ul-14x14-evk      # i.MX6 UltraLite 14x14 EVK Board
+              - technexion,imx6ul-pico-dwarf # i.MX6 UltraLite Pico Dwarf Board
           - const: fsl,imx6ul
 
       - description: i.MX6ULL based Boards
-- 
2.21.0
