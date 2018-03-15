From: Harald Geyer <harald@ccbib.org>
Subject: [PATCHv2 2/5] arm64: dts: allwinner: a64: Add watchdog
Date: Thu, 15 Mar 2018 16:25:07 +0000
Message-ID: <20180315162510.11669-3-harald@ccbib.org>
References: <20180315162510.11669-1-harald@ccbib.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180315162510.11669-1-harald@ccbib.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>, info@olimex.com, Harald Geyer <harald@ccbib.org>
List-Id: devicetree@vger.kernel.org

Add a watchdog node for the A64, automatically enabled on all boards.
Since the device is compatible with an existing driver, we only reserve
a new compatible string to be used together with the fall back.
Tested on Olimex Teres-I.

Signed-off-by: Harald Geyer <harald@ccbib.org>
---
changes since v1:
 * add and use a specific compatible string

 Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt | 6 ++++--
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi            | 7 +++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
index 62dd5baad70e..04fc368d828f 100644
--- a/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/sunxi-wdt.txt
@@ -2,8 +2,10 @@ Allwinner SoCs Watchdog timer
 
 Required properties:
 
-- compatible : should be either "allwinner,sun4i-a10-wdt" or
-               "allwinner,sun6i-a31-wdt"
+- compatible : should be one of
+	"allwinner,sun4i-a10-wdt"
+	"allwinner,sun6i-a31-wdt"
+	"allwinner,sun50i-a64-wdt","allwinner,sun6i-a31-wdt"
 - reg : Specifies base physical address and size of the registers.
 
 Example:
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 64e452a758fa..8401e7f887ff 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -665,5 +665,12 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
+		wdt0: watchdog@1c20ca0 {
+			compatible = "allwinner,sun50i-a64-wdt",
+				     "allwinner,sun6i-a31-wdt";
+			reg = <0x01c20ca0 0x20>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
-- 
2.11.0
