From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH] arm64: dts: allwinner: pine64: Prepare optional UART nodes with pinctrl
Date: Tue, 18 Apr 2017 21:25:38 +0200
Message-ID: <20170418192538.24174-1-afaerber@suse.de>
References: <20170418053458.phcbp4da3vatejpg@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170418053458.phcbp4da3vatejpg@lukather>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Pine64 exposes all A64 UARTs, not just UART0.

Since the pins can be used as GPIO, don't enable the new UART nodes by
default, but prepare the pinctrl settings to aid in activating them via
overlays, i.e., overriding the status property of &uartX nodes.

For UART4 (Euler) the safer route of not including RTS/CTS pins is chosen,
whereas for UART1 (Bluetooth) they are included.

Add the corresponding pinctrl nodes where missing.

Suggested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Andreas Färber <afaerber@suse.de>
---
 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 29 ++++++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      | 15 +++++++++++
 2 files changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
index db6c0f36999e..260fb12ac3fc 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pine64.dts
@@ -99,12 +99,41 @@
 	status = "okay";
 };
 
+/* On Exp and Euler connectors */
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_a>;
 	status = "okay";
 };
 
+/* On Wifi/BT connector, with RTS/CTS */
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	status = "disabled";
+};
+
+/* On Pi-2 connector */
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "disabled";
+};
+
+/* On Euler connector */
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	status = "disabled";
+};
+
+/* On Euler connector, RTS/CTS optional */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins>;
+	status = "disabled";
+};
+
 &usb_otg {
 	dr_mode = "host";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 133810df06b9..c172c62447e8 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -292,6 +292,21 @@
 				pins = "PB0", "PB1";
 				function = "uart2";
 			};
+
+			uart3_pins: uart3-pins {
+				pins = "PD0", "PD1";
+				function = "uart3";
+			};
+
+			uart4_pins: uart4-pins {
+				pins = "PD2", "PD3";
+				function = "uart4";
+			};
+
+			uart4_rts_cts_pins: uart4-rts-cts-pins {
+				pins = "PD4", "PD5";
+				function = "uart4";
+			};
 		};
 
 		uart0: serial@1c28000 {
-- 
2.10.2
