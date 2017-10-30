From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: watchdog: renesas-wdt: Add support for the r8a77970 wdt
Date: Mon, 30 Oct 2017 16:43:19 +0100
Message-ID: <1509378199-19388-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@iguana.be>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Document support for the Watchdog Timer (WDT) Controller in the Renesas
R-Car V3M (r8a77970) SoC.  Restore sort order while at it.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/watchdog/renesas-wdt.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt b/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
index bf6d1ca58af7d198..74b2f03c151553f5 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
@@ -4,10 +4,11 @@ Required properties:
 - compatible : Should be "renesas,<soctype>-wdt", and
 	       "renesas,rcar-gen3-wdt" or "renesas,rza-wdt" as fallback.
 	       Examples with soctypes are:
+	         - "renesas,r7s72100-wdt" (RZ/A1)
 	         - "renesas,r8a7795-wdt" (R-Car H3)
 	         - "renesas,r8a7796-wdt" (R-Car M3-W)
+	         - "renesas,r8a77970-wdt" (R-Car V3M)
 	         - "renesas,r8a77995-wdt" (R-Car D3)
-	         - "renesas,r7s72100-wdt" (RZ/A1)
 
   When compatible with the generic version, nodes must list the SoC-specific
   version corresponding to the platform first, followed by the generic
-- 
2.7.4
