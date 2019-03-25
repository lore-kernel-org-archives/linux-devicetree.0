From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: Add supported ZII VF610 boards to DT schema
Date: Mon, 25 Mar 2019 11:22:41 -0700
Message-ID: <20190325182243.16788-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add already supported ZII VF610 boards to DT schema.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Chris Healy <cphealy@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7e2cd6ad26bd..431ca87aa600 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -176,6 +176,18 @@ properties:
               - fsl,vf610
               - fsl,vf610m4
 
+      - description: ZII's VF610 based Boards
+        items:
+          - enum:
+              - zii,vf610cfu1      # ZII VF610 CFU1 Board
+              - zii,vf610dev-c     # ZII VF610 Development Board, Rev C
+              - zii,vf610dev-b     # ZII VF610 Development Board, Rev B
+              - zii,vf610scu4-aib  # ZII VF610 SCU4 AIB
+              - zii,vf610dtu       # ZII VF610 SSMB DTU Board
+              - zii,vf610spu3      # ZII VF610 SSMB SPU3 Board
+          - const: zii,vf610dev
+          - const: fsl,vf610
+
       - description: LS1012A based Boards
         items:
           - enum:
-- 
2.20.1
