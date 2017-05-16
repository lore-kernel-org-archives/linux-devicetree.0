From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Subject: [PATCH 3/3] mfd: arizona: Update GPIO binding for newly supported flag
Date: Tue, 16 May 2017 16:31:54 +0100
Message-ID: <1494948714-15203-3-git-send-email-ckeepax@opensource.wolfsonmicro.com>
References: <1494948714-15203-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1494948714-15203-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, gnurou@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, patches@opensource.wolfsonmicro.com
List-Id: devicetree@vger.kernel.org

Update the device tree binding to show that the new GPIO_SLEEP flags are
now supported in the flags field of the GPIO binding for Arizona
devices.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
---
 Documentation/devicetree/bindings/mfd/arizona.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index 8f2e282..1729133 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -30,7 +30,10 @@ Required properties:
 
   - gpio-controller : Indicates this device is a GPIO controller.
   - #gpio-cells : Must be 2. The first cell is the pin number and the
-    second cell is used to specify optional parameters (currently unused).
+    second cell is used to specify optional parameters, the following flags
+    are supported:
+      "GPIO_SLEEP_MAY_LOOSE_OUTPUT" the output of this GPIO does not need to
+      be maintained whilst the CODEC is in low power mode.
 
   - AVDD-supply, DBVDD1-supply, CPVDD-supply : Power supplies for the device,
     as covered in Documentation/devicetree/bindings/regulator/regulator.txt
-- 
2.1.4

