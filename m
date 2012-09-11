From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH Resend] dt: Fix incorrect reference in gpio-led documentation
Date: Tue, 11 Sep 2012 08:51:23 +0530
Message-ID: <1347333683-17879-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Cc: devicetree-discuss@lists.ozlabs.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, sachin.kamat@linaro.org
List-Id: devicetree@vger.kernel.org

Path to gpio.txt (dt) document was broken.

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 Documentation/devicetree/bindings/gpio/led.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/led.txt b/Documentation/devicetree/bindings/gpio/led.txt
index 9bb308a..edc83c1 100644
--- a/Documentation/devicetree/bindings/gpio/led.txt
+++ b/Documentation/devicetree/bindings/gpio/led.txt
@@ -8,7 +8,7 @@ node's name represents the name of the corresponding LED.
 
 LED sub-node properties:
 - gpios :  Should specify the LED's GPIO, see "gpios property" in
-  Documentation/devicetree/gpio.txt.  Active low LEDs should be
+  Documentation/devicetree/bindings/gpio/gpio.txt.  Active low LEDs should be
   indicated using flags in the GPIO specifier.
 - label :  (optional) The label for this LED.  If omitted, the label is
   taken from the node name (excluding the unit address).
-- 
1.7.4.1
