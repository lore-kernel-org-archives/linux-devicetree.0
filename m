From: Rob Herring <robh@kernel.org>
Subject: [PATCH 8/8] dt-bindings: merge ina209 binding into ina2xx binding
Date: Thu,  1 Oct 2015 17:12:34 -0500
Message-ID: <1443737554-10352-9-git-send-email-robh@kernel.org>
References: <1443737554-10352-1-git-send-email-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1443737554-10352-1-git-send-email-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
List-Id: devicetree@vger.kernel.org

The ina209 binding only differs from other ina2xx bindings in the
compatible string, so add it to the common binding and remove the ina209
binding file.

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
---
 Documentation/devicetree/bindings/hwmon/ina209.txt | 18 ------------------
 Documentation/devicetree/bindings/hwmon/ina2xx.txt |  1 +
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/ina209.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ina209.txt b/Documentation/devicetree/bindings/hwmon/ina209.txt
deleted file mode 100644
index 9dd2bee..0000000
--- a/Documentation/devicetree/bindings/hwmon/ina209.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-ina209 properties
-
-Required properties:
-- compatible: Must be "ti,ina209"
-- reg: I2C address
-
-Optional properties:
-
-- shunt-resistor
-	Shunt resistor value in micro-Ohm
-
-Example:
-
-temp-sensor@4c {
-	compatible = "ti,ina209";
-	reg = <0x4c>;
-	shunt-resistor = <5000>;
-};
diff --git a/Documentation/devicetree/bindings/hwmon/ina2xx.txt b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
index a2ad85d..9bcd5e8 100644
--- a/Documentation/devicetree/bindings/hwmon/ina2xx.txt
+++ b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
@@ -2,6 +2,7 @@ ina2xx properties
 
 Required properties:
 - compatible: Must be one of the following:
+	- "ti,ina209" for ina209
 	- "ti,ina219" for ina219
 	- "ti,ina220" for ina220
 	- "ti,ina226" for ina226
-- 
2.1.4
