From: Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: [PATCH] fixed-regulator: dt-bindings: Fixed building error for compatible property
Date: Thu, 19 Sep 2019 12:09:04 +0530
Message-ID: <1568875145-2864-1-git-send-email-pragnesh.patel@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lgirdwood@gmail.com, broonie@kernel.org
Cc: Pragnesh Patel <pragnesh.patel@sifive.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Compatible property is not of type 'string', so remove const:
from it.

Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
---
 Documentation/devicetree/bindings/regulator/fixed-regulator.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
index a78150c..f324169 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
@@ -30,8 +30,8 @@ if:
 properties:
   compatible:
     enum:
-      - const: regulator-fixed
-      - const: regulator-fixed-clock
+      - regulator-fixed
+      - regulator-fixed-clock
 
   regulator-name: true
 
-- 
2.7.4
