From: Eric Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH V3 1/4] Documentation: pv88080: Move binding document
Date: Fri, 18 Nov 2016 09:35:46 +0900
Message-ID: <8d6dc516374bf2c1cf0841aa68a888bca33413a0.1479429347.git.eric.jeong@diasemi.com>
References: <cover.1479429347.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1479429347.git.eric.jeong-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: DEVICETREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LINUX-KERNEL <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, LINUX-GPIO <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


From: Eric Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>

The change is to move pv88080 binding document 
from the regulator directory to mfd binding directory
for PV88080 PMIC MFD support.
And, GPIO properties are added.


Signed-off-by: Eric Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>

---
This patch applies against linux-next and next-20161117

Hi,

Change since PATCH V2
 - Added property and description for gpio

Change since PATCH V1
 - Patch separated from PATCH V1

Regards,
Eric Jeong, Dialog Semiconductor Ltd.


 .../bindings/{regulator => mfd}/pv88080.txt        |   16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{regulator => mfd}/pv88080.txt (79%)

diff --git a/Documentation/devicetree/bindings/regulator/pv88080.txt b/Documentation/devicetree/bindings/mfd/pv88080.txt
similarity index 79%
rename from Documentation/devicetree/bindings/regulator/pv88080.txt
rename to Documentation/devicetree/bindings/mfd/pv88080.txt
index e6e4b9c8..7e24f95 100644
--- a/Documentation/devicetree/bindings/regulator/pv88080.txt
+++ b/Documentation/devicetree/bindings/mfd/pv88080.txt
@@ -1,4 +1,4 @@
-* Powerventure Semiconductor PV88080 Voltage Regulator
+* Powerventure Semiconductor PV88080 PMIC
 
 Required properties:
 - compatible: Must be one of the following, depending on the
@@ -16,8 +16,15 @@ Required properties:
   standard binding for regulators; see regulator.txt.
   BUCK1, BUCK2, BUCK3 and HVBUCK.
 
+- gpio-controller: Marks the device node as a GPIO controller.
+- #gpio-cells: Should be 2. See gpio.txt in this directory
+  for a description of the cells format.
+
 Optional properties:
+- ngpios : Number of in-use slots of available slots for GPIO.
+  Maximum is 2.
 - Any optional property defined in regulator.txt
+  and gpio.txt for more information.
 
 Example:
 
@@ -27,6 +34,13 @@ Example:
 		interrupt-parent = <&gpio>;
 		interrupts = <24 24>;
 
+		gpioex {
+			compatible = "pvs,pv88080-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+			ngpios = <2>;
+		};
+
 		regulators {
 			BUCK1 {
 				regulator-name = "buck1";
-- 
end-of-patch for PATCH V3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
