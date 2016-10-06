From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v6 3/5] ARM: sun5i: a13-olinuxino: Enable VGA bridge
Date: Thu,  6 Oct 2016 09:57:07 +0200
Message-ID: <18a9e5fe32396dd60390d6fa52fd7b0da9f2a72f.1475740611.git-series.maxime.ripard@free-electrons.com>
References: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.2ec28e2292f37131839babc08427ef9f1aece26a.1475740611.git-series.maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

Now that we have support for the VGA bridges using our DRM driver, enable
the display engine for the Olimex A13-Olinuxino.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Acked-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun5i-a13-olinuxino.dts | 54 ++++++++++++++++++++++++-
 1 file changed, 54 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
index b3c234c65ea1..c69e0b0b7b55 100644
--- a/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
+++ b/arch/arm/boot/dts/sun5i-a13-olinuxino.dts
@@ -72,6 +72,47 @@
 			default-state = "on";
 		};
 	};
+
+	bridge {
+		compatible = "simple-vga-dac";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_bridge_in: endpoint {
+					remote-endpoint = <&tcon0_out_vga>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_bridge_out: endpoint {
+					remote-endpoint = <&vga_con_in>;
+				};
+			};
+		};
+	};
+
+	vga {
+		compatible = "vga-connector";
+
+		port {
+			vga_con_in: endpoint {
+				remote-endpoint = <&vga_bridge_out>;
+			};
+		};
+	};
+};
+
+&be0 {
+	status = "okay";
 };
 
 &ehci0 {
@@ -211,6 +252,19 @@
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
+		remote-endpoint = <&vga_bridge_in>;
+	};
+};
+
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins_b>;
-- 
git-series 0.8.10
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
