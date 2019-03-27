From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add support for ZII i.MX7 RPU2 board
Date: Tue, 26 Mar 2019 23:41:49 -0700
Message-ID: <20190327064150.31549-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for ZII i.MX7 RPU2 board.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index fb0a37bf16b8..18ffe3bfecf7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -141,6 +141,7 @@ properties:
         items:
           - enum:
               - fsl,imx7d-sdb             # i.MX7 SabreSD Board
+              - zii,imx7d-rpu2            # ZII RPU2 Board
           - const: fsl,imx7d
 
       - description:
-- 
2.20.1
