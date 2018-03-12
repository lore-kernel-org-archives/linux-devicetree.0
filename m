From: Harald Geyer <harald@ccbib.org>
Subject: [PATCH 1/5] arm64: dts: allwinner: a64: Add i2c0 pins
Date: Mon, 12 Mar 2018 16:10:46 +0000
Message-ID: <20180312161050.7647-2-harald@ccbib.org>
References: <20180312161050.7647-1-harald@ccbib.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180312161050.7647-1-harald@ccbib.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Icenowy Zheng <icenowy@aosc.io>, info@olimex.com, Harald Geyer <harald@ccbib.org>
List-Id: devicetree@vger.kernel.org

Add the proper pin group node to reference in board files.

Signed-off-by: Harald Geyer <harald@ccbib.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 1b6dc31e7d91..64e452a758fa 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -309,6 +309,11 @@
 			interrupt-controller;
 			#interrupt-cells = <3>;
 
+			i2c0_pins: i2c0_pins {
+				pins = "PH0", "PH1";
+				function = "i2c0";
+			};
+
 			i2c1_pins: i2c1_pins {
 				pins = "PH2", "PH3";
 				function = "i2c1";
-- 
2.11.0
