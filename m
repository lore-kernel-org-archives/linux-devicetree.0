From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: fsl: Add support for ZII VF610 SPB4
Date: Mon, 25 Mar 2019 11:22:42 -0700
Message-ID: <20190325182243.16788-2-andrew.smirnov@gmail.com>
References: <20190325182243.16788-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190325182243.16788-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for ZII VF610 SPB4.

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
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 431ca87aa600..fb0a37bf16b8 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -185,6 +185,7 @@ properties:
               - zii,vf610scu4-aib  # ZII VF610 SCU4 AIB
               - zii,vf610dtu       # ZII VF610 SSMB DTU Board
               - zii,vf610spu3      # ZII VF610 SSMB SPU3 Board
+              - zii,vf610spb4      # ZII VF610 SPB4 Board
           - const: zii,vf610dev
           - const: fsl,vf610
 
-- 
2.20.1
