From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 03/23] clocksource/drivers/fttmr010: Merge FTTMR010 DT bindings
Date: Wed, 14 Jun 2017 14:39:24 +0200
Message-ID: <1497443984-12371-3-git-send-email-daniel.lezcano@linaro.org>
References: <20170614123800.GH2261@mai>
 <1497443984-12371-1-git-send-email-daniel.lezcano@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497443984-12371-1-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>, Jonas Jensen <jonas.jensen@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Linus Walleij <linus.walleij@linaro.org>

This merges the Moxa and FTTMR010 device tree bindings into the
Faraday binding document to avoid confusion.

The FTTMR010 is the IP block used by these SoCs, in vanilla
or modified variant.

The Aspeed variant is modified such that it is no longer fully
register-compatible with FTTMR010 so for this reason it is not
listed with two compatible strings, instead just one.

Cc: Joel Stanley <joel@jms.id.au>
Tested-by: Jonas Jensen <jonas.jensen@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 .../devicetree/bindings/timer/faraday,fttmr010.txt    |  4 +++-
 .../devicetree/bindings/timer/moxa,moxart-timer.txt   | 19 -------------------
 2 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt b/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
index b73ca6c..6e18bd6 100644
--- a/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
+++ b/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
@@ -7,7 +7,9 @@ Required properties:
 
 - compatible : Must be one of
   "faraday,fttmr010"
-  "cortina,gemini-timer"
+  "cortina,gemini-timer", "faraday,fttmr010"
+  "moxa,moxart-timer", "faraday,fttmr010"
+  "aspeed,ast2400-timer"
 - reg : Should contain registers location and length
 - interrupts : Should contain the three timer interrupts usually with
   flags for falling edge
diff --git a/Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt b/Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt
deleted file mode 100644
index e207c11..0000000
--- a/Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-MOXA ART timer
-
-Required properties:
-
-- compatible : Must be one of:
- 	- "moxa,moxart-timer"
- 	- "aspeed,ast2400-timer"
-- reg : Should contain registers location and length
-- interrupts : Should contain the timer interrupt number
-- clocks : Should contain phandle for the clock that drives the counter
-
-Example:
-
-	timer: timer@98400000 {
-		compatible = "moxa,moxart-timer";
-		reg = <0x98400000 0x42>;
-		interrupts = <19 1>;
-		clocks = <&coreclk>;
-	};
-- 
2.7.4
