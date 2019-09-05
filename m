From: jamestai.sky@gmail.com
Subject: [PATCH] dt-bindings: cpu: Add a support cpu type for cortex-a55
Date: Thu,  5 Sep 2019 16:14:35 +0800
Message-ID: <20190905081435.1492-1-james.tai@realtek.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sugaya Taichi <sugaya.taichi@socionext.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Olof Johansson <olof@lixom.net>, CY_Huang <cy.huang@realtek.com>, Phinex Hung <phinex@realtek.com>, "james.tai" <james.tai@realtek.com>
List-Id: devicetree@vger.kernel.org

From: "james.tai" <james.tai@realtek.com>

Add arm cpu type cortex-a55.

Signed-off-by: james.tai <james.tai@realtek.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index aa40b074b864..1fc7c8effd25 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -124,6 +124,7 @@ properties:
       - arm,cortex-a15
       - arm,cortex-a17
       - arm,cortex-a53
+      - arm,cortex-a55
       - arm,cortex-a57
       - arm,cortex-a72
       - arm,cortex-a73
-- 
2.17.1
