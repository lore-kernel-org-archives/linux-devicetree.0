Return-Path: <user@phabricator.rosia>
From: Nicolae Rosia <nicolae.rosia@gmail.com>
Subject: [PATCH] Documentation: bindings: fix twl-rtc documentation
Date: Mon, 31 Oct 2016 22:43:46 +0200
Message-Id: <1477946626-24076-1-git-send-email-nicolae.rosia@gmail.com>
To: devicetree@vger.kernel.org
Cc: rtc-linux@googlegroups.com, linux-omap@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Nicolae Rosia <nicolae.rosia@gmail.com>
List-ID: <devicetree@vger.kernel.org>

Add interrupts documentation
Fix example and formatting

Signed-off-by: Nicolae Rosia <nicolae.rosia@gmail.com>
---
 Documentation/devicetree/bindings/rtc/twl-rtc.txt | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/rtc/twl-rtc.txt b/Documentation/devicetree/bindings/rtc/twl-rtc.txt
index 596e0c9..8f9a94f 100644
--- a/Documentation/devicetree/bindings/rtc/twl-rtc.txt
+++ b/Documentation/devicetree/bindings/rtc/twl-rtc.txt
@@ -1,12 +1,11 @@
-* TI twl RTC
-
-The TWL family (twl4030/6030) contains a RTC.
+* Texas Instruments TWL4030/6030 RTC
 
 Required properties:
-- compatible : Should be twl4030-rtc
-
-Examples:
-
-rtc@0 {
-    compatible = "ti,twl4030-rtc";
-};
+- compatible : Should be "ti,twl4030-rtc"
+- interrupts : Should be the interrupt number.
+
+Example:
+	rtc {
+		compatible = "ti,twl4030-rtc";
+		interrupts = <11>;
+	};
-- 
2.5.5
