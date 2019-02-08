From: Johan Hovold <johan@kernel.org>
Subject: [PATCH] dt-bindings: regulator: update fixed-regulator example
Date: Fri,  8 Feb 2019 15:04:25 +0100
Message-ID: <20190208140425.12917-1-johan@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
List-Id: devicetree@vger.kernel.org

Fixed regulators do not have associated bus addresses and are typically
placed directly under the root node where their names must still be
unique despite not having a unit address.

Fix the malformed example node which had a unit address but no "reg"
property by dropping the unit address.

Also, try to make the example more useful by using the recommended
generic node name "regulator", but with a suffix reflecting the
regulator name in order to make it unique.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 .../devicetree/bindings/regulator/fixed-regulator.yaml        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
index a7607b0baab7..d289c2f7455a 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml
@@ -52,9 +52,9 @@ required:
 
 examples:
   - |
-    abc: fixedregulator@0 {
+    reg_1v8: regulator-1v8 {
       compatible = "regulator-fixed";
-      regulator-name = "fixed-supply";
+      regulator-name = "1v8";
       regulator-min-microvolt = <1800000>;
       regulator-max-microvolt = <1800000>;
       gpio = <&gpio1 16 0>;
-- 
2.20.1
