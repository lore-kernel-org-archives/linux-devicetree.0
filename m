From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 1/4] mfd: madera: Update DT bindings to add additional CODECs
Date: Thu, 6 Jun 2019 10:00:01 +0100
Message-ID: <20190606090004.12748-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-Id: devicetree@vger.kernel.org

From: Richard Fitzgerald <rf@opensource.cirrus.com>

This adds the cs47l15, cs42l92, cs47l92 and cs47l93 to the list of
compatible strings and updates some properties that need to note
the new CODECs.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v1.

Thanks,
Charles

 Documentation/devicetree/bindings/mfd/madera.txt | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/madera.txt b/Documentation/devicetree/bindings/mfd/madera.txt
index db3266088386a..cad0f28005027 100644
--- a/Documentation/devicetree/bindings/mfd/madera.txt
+++ b/Documentation/devicetree/bindings/mfd/madera.txt
@@ -11,10 +11,14 @@ bindings/sound/madera.txt
 Required properties:
 
   - compatible : One of the following chip-specific strings:
+        "cirrus,cs47l15"
         "cirrus,cs47l35"
         "cirrus,cs47l85"
         "cirrus,cs47l90"
         "cirrus,cs47l91"
+        "cirrus,cs42l92"
+        "cirrus,cs47l92"
+        "cirrus,cs47l93"
         "cirrus,wm1840"
 
   - reg : I2C slave address when connected using I2C, chip select number when
@@ -22,7 +26,7 @@ Required properties:
 
   - DCVDD-supply : Power supply for the device as defined in
     bindings/regulator/regulator.txt
-    Mandatory on CS47L35, CS47L90, CS47L91
+    Mandatory on CS47L15, CS47L35, CS47L90, CS47L91, CS42L92, CS47L92, CS47L93
     Optional on CS47L85, WM1840
 
   - AVDD-supply, DBVDD1-supply, DBVDD2-supply, CPVDD1-supply, CPVDD2-supply :
@@ -35,7 +39,7 @@ Required properties:
     (CS47L85, WM1840)
 
   - SPKVDD-supply : Power supply for the device
-    (CS47L35)
+    (CS47L15, CS47L35)
 
   - interrupt-controller : Indicates that this device is an interrupt controller
 
-- 
2.11.0
