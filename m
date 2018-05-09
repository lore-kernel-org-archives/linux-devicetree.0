From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [RESEND PATCH v5] mfd: arizona: Update DT doc to support more standard reset binding
Date: Wed, 9 May 2018 11:23:48 +0100
Message-ID: <20180509102348.20953-1-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, linus.walleij@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, patches@opensource.cirrus.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
---
 Documentation/devicetree/bindings/mfd/arizona.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/arizona.txt b/Documentation/devicetree/bindings/mfd/arizona.txt
index bdd017686ea5..a014afb07902 100644
--- a/Documentation/devicetree/bindings/mfd/arizona.txt
+++ b/Documentation/devicetree/bindings/mfd/arizona.txt
@@ -50,7 +50,7 @@ Required properties:
 
 Optional properties:
 
-  - wlf,reset : GPIO specifier for the GPIO controlling /RESET
+  - reset-gpios : GPIO specifier for the GPIO controlling /RESET
 
   - clocks: Should reference the clocks supplied on MCLK1 and MCLK2
   - clock-names: Should contains two strings:
@@ -70,6 +70,10 @@ Optional properties:
     Documentation/devicetree/bindings/regulator/regulator.txt
     (wm5102, wm5110, wm8280, wm8997, wm8998, wm1814)
 
+Deprecated properties:
+
+  - wlf,reset : GPIO specifier for the GPIO controlling /RESET
+
 Also see child specific device properties:
   Regulator - ../regulator/arizona-regulator.txt
   Extcon    - ../extcon/extcon-arizona.txt
-- 
2.11.0
