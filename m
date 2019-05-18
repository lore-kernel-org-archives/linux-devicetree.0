From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 1/4] dt-bindings: watchdog: add Allwinner H6 watchdog
Date: Sat, 18 May 2019 17:23:52 +0200
Message-ID: <20190518152355.11134-2-peron.clem@gmail.com>
References: <20190518152355.11134-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190518152355.11134-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

Allwinner H6 has a similar watchdog as the A64 which is already
a compatible of the A31.

This commit sort the lines and add the H6 compatible.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../devicetree/bindings/watchdog/sunxi-wdt.txt         | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
index 46055254e8dd..f4810f8ad1c5 100644
--- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
@@ -3,10 +3,12 @@ Allwinner SoCs Watchdog timer
 Required properties:
 
 - compatible : should be one of
-	"allwinner,sun4i-a10-wdt"
-	"allwinner,sun6i-a31-wdt"
-	"allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
-	"allwinner,suniv-f1c100s-wdt", "allwinner,sun4i-a10-wdt"
+	- "allwinner,sun4i-a10-wdt"
+	- "allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
+	- "allwinner,sun50i-h6-wdt","allwinner,sun50i-a64-wdt",
+	  "allwinner,sun6i-a31-wdt"
+	- "allwinner,sun6i-a31-wdt"
+	- "allwinner,suniv-f1c100s-wdt", "allwinner,sun4i-a10-wdt"
 - reg : Specifies base physical address and size of the registers.
 
 Optional properties:
-- 
2.17.1
