From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/8] clocksource/drivers/fttmr010: Merge FTTMR010 DT bindings
Date: Wed, 17 May 2017 16:05:36 +0200
Message-ID: <20170517140542.20016-3-linus.walleij@linaro.org>
References: <20170517140542.20016-1-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170517140542.20016-1-linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Janos Laube <janos.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paulius Zaleckas <paulius.zaleckas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Hans Ulli Kroll <ulli.kroll-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This merges the Moxa and FTTMR010 device tree bindings into the
Faraday binding document to avoid confusion.

The FTTMR010 is the IP block used by these SoCs, in vanilla
or modified variant.

The Aspeed variant is modified such that it is no longer fully
register-compatible with FTTMR010 so for this reason it is not
listed with two compatible strings, instead just one.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Cc: Jonas Jensen <jonas.jensen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/timer/faraday,fttmr010.txt    |  4 +++-
 .../devicetree/bindings/timer/moxa,moxart-timer.txt   | 19 -------------------
 2 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt b/Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
index b73ca6cd07f8..6e18bd662ccb 100644
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
index e207c11630af..000000000000
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
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
