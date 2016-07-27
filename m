From: Steve Twiss <stwiss.opensource@diasemi.com>
Subject: [PATCH V2] documentation: da9052: Update regulator bindings names to
 match DA9052/53 driver expectations
Date: Wed, 27 Jul 2016 16:04:15 +0100
Message-ID: <20160727150638.8A2703FB13@swsrvapps-01.diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: DEVICETREE <devicetree@vger.kernel.org>, DTKERNEL <dt@kernel.org>, LINUXKERNEL <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Rob Herring <robh@kernel.org>, Support Opensource <support.opensource@diasemi.com>, Ying-Chun Liu <paul.liu@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Steve Twiss <stwiss.opensource@diasemi.com>

Buck and LDO binding name changes.

The binding names for the regulators have been changed to match the current
expectation from existing device tree source files.

This fix rectifies the disparity between what currently exists in some
.dts[i] board files and what is listed in this binding document. This
change re-aligns those differences and also brings the binding document
in-line with the expectations of the product datasheet from Dialog
Semiconductor.

Bucks and LDOs now follow the expected notation:
{ buck1, buck2, buck3, buck4 }
{ ldo1, ldo2, ldo3, ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10 }

Signed-off-by: Steve Twiss <stwiss.opensource@diasemi.com>
Acked-by: Rob Herring <robh@kernel.org>

---
This patch applies against linux-next and v4.7

Patch History
-------------
in V2: update to remove "Hi" from the beginning of the commit message;
       added Acked-by Rob Herring;

Hi Mark,

Several device tree source files use a regulator naming scheme different to
that found in the binding text document. Since those have been used
already, I would like ensure to the binding document follows those existing
DT file naming conventions.

Please refer to the files containing da9052/53 references:
 - ./arch/arm/boot/dts/imx53-voipac-dmm-668.dtsi
 - ./arch/arm/boot/dts/imx53-qsb.dts

Those board files use the naming convention:
 { buck1, buck2, buck3, buck4 }
 { ldo1, ldo2, ldo3, ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10 }

Instead of the existing suggestion in the device tree binding file:
 { buck0, buck1, buck2, buck3 }
 { ldo4, ldo5, ldo6, ldo7, ldo8, ldo9, ldo10, ldo11, ldo12, ldo13 }

The binding file regulator names (as it stands) does not reflect any
real-world uses I can find. This change would bring it in-line with
currect expectations from existing DTS files and make it similar enough to
the product datasheets to be "less confusing" than it currently is.

Regards,
Steve
 
See reference:
https://lkml.org/lkml/2016/7/25/197


 .../devicetree/bindings/mfd/da9052-i2c.txt         | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/da9052-i2c.txt b/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
index 1857f4a..9554292 100644
--- a/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
+++ b/Documentation/devicetree/bindings/mfd/da9052-i2c.txt
@@ -8,10 +8,13 @@ Sub-nodes:
 - regulators : Contain the regulator nodes. The DA9052/53 regulators are
   bound using their names as listed below:
 
-    buck0     : regulator BUCK0
-    buck1     : regulator BUCK1
-    buck2     : regulator BUCK2
-    buck3     : regulator BUCK3
+    buck1     : regulator BUCK CORE
+    buck2     : regulator BUCK PRO
+    buck3     : regulator BUCK MEM
+    buck4     : regulator BUCK PERI
+    ldo1      : regulator LDO1
+    ldo2      : regulator LDO2
+    ldo3      : regulator LDO3
     ldo4      : regulator LDO4
     ldo5      : regulator LDO5
     ldo6      : regulator LDO6
@@ -19,9 +22,6 @@ Sub-nodes:
     ldo8      : regulator LDO8
     ldo9      : regulator LDO9
     ldo10     : regulator LDO10
-    ldo11     : regulator LDO11
-    ldo12     : regulator LDO12
-    ldo13     : regulator LDO13
 
   The bindings details of individual regulator device can be found in:
   Documentation/devicetree/bindings/regulator/regulator.txt
@@ -36,22 +36,22 @@ i2c@63fc8000 { /* I2C1 */
 		reg = <0x48>;
 
 		regulators {
-			buck0 {
+			buck1 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <2075000>;
 			};
 
-			buck1 {
+			buck2 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <2075000>;
 			};
 
-			buck2 {
+			buck3 {
 				regulator-min-microvolt = <925000>;
 				regulator-max-microvolt = <2500000>;
 			};
 
-			buck3 {
+			buck4 {
 				regulator-min-microvolt = <925000>;
 				regulator-max-microvolt = <2500000>;
 			};
-- 
end-of-patch for PATCH V2
