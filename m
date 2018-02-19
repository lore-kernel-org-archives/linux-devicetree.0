Return-Path: <SRS0=oNRe=FO=opensource.cirrus.com=ckeepax@kernel.org>
From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 2/2] mfd: arizona: Update DT doc to support more standard reset binding
Date: Mon, 19 Feb 2018 13:30:38 +0000
Message-ID: <20180219133038.21995-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20180219133038.21995-1-ckeepax@opensource.cirrus.com>
References: <20180219133038.21995-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linus.walleij@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Drop vendor prefix from new binding since it is a standard property.

Thanks,
Charles

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
