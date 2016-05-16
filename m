From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 16/20] ARM: sun5i: a13-olinuxino: Enable VGA bridge
Date: Mon, 16 May 2016 14:47:16 +0200
Message-ID: <1463402840-17062-17-git-send-email-maxime.ripard@free-electrons.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Now that we have support for the VGA bridges using our DRM driver, enable
the display engine for the Olimex A13-Olinuxino.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun5i-a13-olinuxino.dts | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
index b3c234c65ea1..b3298d231258 100644
--- a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
+++ b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
@@ -72,6 +72,27 @@
 			default-state = "on";
 		};
 	};
+
+	bridge {
+		compatible = "dumb-vga-bridge";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			vga_input: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tcon0_out_vga>;
+			};
+		};
+	};
+};
+
+&be0 {
+	status = "okay";
 };
 
 &ehci0 {
@@ -211,6 +232,19 @@
 	status = "okay";
 };
 
+&tcon0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_rgb666_pins>;
+	status = "okay";
+};
+
+&tcon0_out {
+	tcon0_out_vga: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&vga_input>;
+	};
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins_b>;
-- 
2.8.2

