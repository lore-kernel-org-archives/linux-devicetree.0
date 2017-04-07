From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 1/2] mfd: arizona: Add GPIO maintain state flag
Date: Fri, 7 Apr 2017 13:38:44 +0100
Message-ID: <1491568725-14882-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org, lee.jones@linaro.org
Cc: gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

The Arizona devices only maintain the state of output GPIOs whilst the
CODEC is active, this can cause issues if the CODEC suspends whilst
something is relying on the state of one of its GPIOs. However, in
many systems the CODEC GPIOs are used for audio related features
and thus the state of the GPIOs is unimportant whilst the CODEC is
suspended. Often keeping the CODEC resumed in such a system would
incur a power impact that is unacceptable.

Add a flag through the second cell of the GPIO specifier in device
tree, to allow the user to select whether a GPIO being configured as
an output should keep the CODEC resumed.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 Documentation/devicetree/bindings/mfd/arizona.txt | 5 ++++-
 include/dt-bindings/mfd/arizona.h                 | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index 8f2e282..6af0d82 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -30,7 +30,10 @@ Required properties:
 
   - gpio-controller : Indicates this device is a GPIO controller.
   - #gpio-cells : Must be 2. The first cell is the pin number and the
-    second cell is used to specify optional parameters (currently unused).
+    second cell is used to specify optional parameters, the following flags
+    are supported:
+      "ARIZONA_GP_MAINTAIN" the output of the GPIO must be maintained, this
+      prevents the CODEC going into low power mode.
 
   - AVDD-supply, DBVDD1-supply, CPVDD-supply : Power supplies for the device,
     as covered in Documentation/devicetree/bindings/regulator/regulator.txt
diff --git a/include/dt-bindings/mfd/arizona.h b/include/dt-bindings/mfd/arizona.h
index dedf46f..68f3782 100644
--- a/include/dt-bindings/mfd/arizona.h
+++ b/include/dt-bindings/mfd/arizona.h
@@ -77,6 +77,9 @@
 #define ARIZONA_GP_INPUT               (ARIZONA_GP_FN_GPIO | \
 					ARIZONA_GPN_DIR)
 
+/* Flags for the GPIO driver properties */
+#define ARIZONA_GP_MAINTAIN 0x80000000
+
 #define ARIZONA_32KZ_MCLK1 1
 #define ARIZONA_32KZ_MCLK2 2
 #define ARIZONA_32KZ_NONE  3
-- 
2.1.4

