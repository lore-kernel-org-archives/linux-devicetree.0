From: Akash Gajjar <gajjar04akash@gmail.com>
Subject: [PATCH] arm64: activate spi flash on pine64 LTS board
Date: Sun, 22 Jul 2018 21:16:49 +0530
Message-ID: <1532274409-9921-1-git-send-email-Akash_Gajjar@mentor.com>
References: <Akash_Gajjar@mentor.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <Akash_Gajjar@mentor.com>
Sender: linux-kernel-owner@vger.kernel.org
To: icenowy@aosc.xyz
Cc: Akash Gajjar <Akash_Gajjar@mentor.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This board has a 128M SPI flash. add spi flash support in device tree.

Tested on pine64 LTS.

Signed-off-by: Akash Gajjar <Akash_Gajjar@mentor.com>
---
 .../dts/allwinner/sun50i-a64-sopine-baseboard.dts  | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
index abe179d..d54637d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-sopine-baseboard.dts
@@ -134,6 +134,29 @@
 	regulator-name = "vcc-wifi";
 };
 
+&spi0  {
+	status = "okay";
+
+	m25p80@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "w25q128";
+		reg = <0x0>;
+		linux,modalias = "m25p80", "w25q128";
+		spi-max-frequency = <40000000>;
+
+		uboot@0 {
+			label = "uboot";
+			reg = <0x0 0x100000>;
+		};
+
+		rootfs@0 {
+			label = "rootfs";
+			reg = <0x100000 0x7F00000>;
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
-- 
2.7.4
