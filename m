From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 7/8] [RFC] arm64: dts: renesas: Migrate H3ULCB to r8j7795-4x1g.dtsi
Date: Wed, 19 Apr 2017 11:15:50 +0200
Message-ID: <1492593351-13835-8-git-send-email-geert+renesas@glider.be>
References: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The Renesas R-Car Starter Kit Premier (H3ULCB) development board is
equipped with an r8j7795 SiP with 4 GiB of RAM.

Hence migrate from r8a7795.dtsi to r8j7795-4x1g.dtsi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Questions:
  - Should this file be renamed to r8j7795-h3ulcb.dts?
---
 arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts | 27 +++-----------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
index 3574965e074718d8..fe7eca39490eb1a2 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-h3ulcb.dts
@@ -10,13 +10,13 @@
  */
 
 /dts-v1/;
-#include "r8a7795.dtsi"
+#include "r8j7795-4x1g.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 
 / {
-	model = "Renesas H3ULCB board based on r8a7795";
-	compatible = "renesas,h3ulcb", "renesas,r8a7795";
+	model = "Renesas H3ULCB board based on r8j7795";
+	compatible = "renesas,h3ulcb", "renesas,r8j7795", "renesas,r8a7795";
 
 	aliases {
 		serial0 = &scif2;
@@ -27,27 +27,6 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0x0 0x48000000 0x0 0x38000000>;
-	};
-
-	memory@500000000 {
-		device_type = "memory";
-		reg = <0x5 0x00000000 0x0 0x40000000>;
-	};
-
-	memory@600000000 {
-		device_type = "memory";
-		reg = <0x6 0x00000000 0x0 0x40000000>;
-	};
-
-	memory@700000000 {
-		device_type = "memory";
-		reg = <0x7 0x00000000 0x0 0x40000000>;
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
-- 
2.7.4
