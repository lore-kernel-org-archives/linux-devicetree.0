From: Ben Hutchings <ben.hutchings@codethink.co.uk>
Subject: [PATCH v2] x86: dts: ce4100: Use defined compatible string for
 PCF8575 chip
Date: Wed, 16 Mar 2016 16:51:20 +0000
Message-ID: <1458147080.20441.1.camel@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Jiang Liu <jiang.liu@linux.intel.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The binding definition for the PCF857x GPIO expanders doesn't mention
a "ti,pcf8575" compatible string.  This is apparently because TI is
only a second source - there is no functional difference between
PCF8575 chips manufactured by TI and NXP, and the same board might be
populated with either depending on availability.

This is not a problem in practice because the I2C core uses
of_modalias_node() before matching drivers and this strips the
manufacturer name.

Signed-off-by: Ben Hutchings <ben.hutchings@codethink.co.uk>
---
v2: Correct the claim that this is a practical problem.

 Documentation/devicetree/bindings/i2c/i2c-pxa-pci-ce4100.txt | 4 ++--
 arch/x86/platform/ce4100/falconfalls.dts                     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-pxa-pci-ce4100.txt b/Documentation/devicetree/bindings/i2c/i2c-pxa-pci-ce4100.txt
index 569b16248514..1ff6f8487a2d 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-pxa-pci-ce4100.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-pxa-pci-ce4100.txt
@@ -71,7 +71,7 @@ This is an example which is used on FalconFalls:
 			/* This I2C controller has one gpio controller */
 			gpio@26 {
 				#gpio-cells = <2>;
-				compatible = "ti,pcf8575";
+				compatible = "nxp,pcf8575";
 				reg = <0x26>;
 				gpio-controller;
 			};
@@ -85,7 +85,7 @@ This is an example which is used on FalconFalls:
 
 			gpio@26 {
 				#gpio-cells = <2>;
-				compatible = "ti,pcf8575";
+				compatible = "nxp,pcf8575";
 				reg = <0x26>;
 				gpio-controller;
 			};
diff --git a/arch/x86/platform/ce4100/falconfalls.dts b/arch/x86/platform/ce4100/falconfalls.dts
index ce874f872cc6..4958e0045c34 100644
--- a/arch/x86/platform/ce4100/falconfalls.dts
+++ b/arch/x86/platform/ce4100/falconfalls.dts
@@ -252,7 +252,7 @@
 
 						gpio@26 {
 							#gpio-cells = <2>;
-							compatible = "ti,pcf8575";
+							compatible = "nxp,pcf8575";
 							reg = <0x26>;
 							gpio-controller;
 						};
@@ -266,7 +266,7 @@
 
 						gpio@26 {
 							#gpio-cells = <2>;
-							compatible = "ti,pcf8575";
+							compatible = "nxp,pcf8575";
 							reg = <0x26>;
 							gpio-controller;
 						};


-- 
Ben Hutchings
Software Developer, Codethink Ltd.
