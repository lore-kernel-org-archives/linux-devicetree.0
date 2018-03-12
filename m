From: Harald Geyer <harald@ccbib.org>
Subject: [PATCH 2/5] arm64: dts: allwinner: a64: Add watchdog
Date: Mon, 12 Mar 2018 16:10:47 +0000
Message-ID: <20180312161050.7647-3-harald@ccbib.org>
References: <20180312161050.7647-1-harald@ccbib.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180312161050.7647-1-harald@ccbib.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>, info@olimex.com, Harald Geyer <harald@ccbib.org>
List-Id: devicetree@vger.kernel.org

Add a watchdog node for the A64, automatically enabled on all boards.
Tested on Olimex Teres I.

Signed-off-by: Harald Geyer <harald@ccbib.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 64e452a758fa..ca1b365bc722 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -665,5 +665,11 @@
 			#address-cells = <1>;
 			#size-cells = <0>;
 		};
+
+		wdt0: watchdog@1c20ca0 {
+			compatible = "allwinner,sun6i-a31-wdt";
+			reg = <0x01c20ca0 0x20>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+		};
 	};
 };
-- 
2.11.0
