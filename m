From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 8/8] [RFC] arm64: dts: renesas: Migrate M3ULCB to r8j7796-2x1g.dtsi
Date: Wed, 19 Apr 2017 11:15:51 +0200
Message-ID: <1492593351-13835-9-git-send-email-geert+renesas@glider.be>
References: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1492593351-13835-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

The Renesas R-Car Starter Kit Pro (M3ULCB) development board is equipped
with an r8j7796 SiP with 2 GiB of RAM.

Hence migrate from r8a7796.dtsi to r8j7796-2x1g.dtsi.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Questions:
  - Should this file be renamed to r8j7796-m3ulcb.dts?
---
 arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
index c2a4549d3738f81c..533d03662e98982b 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dts
@@ -10,13 +10,13 @@
  */
 
 /dts-v1/;
-#include "r8a7796.dtsi"
+#include "r8j7796-2x1g.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 
 / {
-	model = "Renesas M3ULCB board based on r8a7796";
-	compatible = "renesas,m3ulcb", "renesas,r8a7796";
+	model = "Renesas M3ULCB board based on r8j7796";
+	compatible = "renesas,m3ulcb", "renesas,r8j7796", "renesas,r8a7796";
 
 	aliases {
 		serial0 = &scif2;
@@ -27,17 +27,6 @@
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0x0 0x48000000 0x0 0x38000000>;
-	};
-
-	memory@600000000 {
-		device_type = "memory";
-		reg = <0x6 0x00000000 0x0 0x40000000>;
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
-- 
2.7.4
