Return-Path: <SRS0=qLWK=TP=renesas.com=prvs=4038260dfd=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v4 13/13] ARM: dts: rza2mevb: Add USB Host support
Date: Wed, 15 May 2019 10:20:48 -0500
Message-ID: <20190515152048.42363-14-chris.brandt@renesas.com>
In-Reply-To: <20190515152048.42363-1-chris.brandt@renesas.com>
References: <20190515152048.42363-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

Enable USB Host support for both the Type-C connector on the CPU board
and the Type-A plug on the sub board.

Both boards are also capable of USB Device operation as well after the
appropriate Device Tree modifications.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
 * moved note about JP3
 * added reviewed-by
v2:
 * added blank line between nodes
 * removed 'r7s9210-' from patch title
 * removed 'renesas,uses_usb_x1' property
---
 arch/arm/boot/dts/r7s9210-rza2mevb.dts | 36 ++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
index 7da409170db5..3e1a8d943c17 100644
--- a/arch/arm/boot/dts/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/r7s9210-rza2mevb.dts
@@ -107,6 +107,18 @@
 		pinmux = <RZA2_PINMUX(PORT5, 4, 3)>,	/* SD1_CD */
 			 <RZA2_PINMUX(PORT5, 5, 3)>;	/* SD1_WP */
 	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZA2_PINMUX(PORT5, 2, 3)>,	/* VBUSIN0 */
+			 <RZA2_PINMUX(PORTC, 6, 1)>,	/* VBUSEN0 */
+			 <RZA2_PINMUX(PORTC, 7, 1)>;	/* OVRCUR0 */
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZA2_PINMUX(PORTC, 0, 1)>,	/* VBUSIN1 */
+			 <RZA2_PINMUX(PORTC, 5, 1)>,	/* VBUSEN1 */
+			 <RZA2_PINMUX(PORT7, 5, 5)>;	/* OVRCUR1 */
+	};
 };
 
 /* High resolution System tick timers */
@@ -161,3 +173,27 @@
 	bus-width = <4>;
 	status = "okay";
 };
+
+/* USB-0 as Host */
+&usb2_phy0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb0_pins>;
+	dr_mode = "host";	/* Requires JP3 to be fitted */
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+/* USB-1 as Host */
+&usb2_phy1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_pins>;
+	dr_mode = "host";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
-- 
2.16.1
