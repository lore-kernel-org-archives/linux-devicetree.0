From: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RESEND v2 12/12] arm64: allwinner: a64: enable
 LCD-related hardware for TERES-I
Date: Sun,  3 Feb 2019 10:55:01 -0800
Message-ID: <20190203185501.8958-13-anarsoul@gmail.com>
References: <20190203185501.8958-1-anarsoul@gmail.com>
Reply-To: anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDV3B667TUHBBNHS3TRAKGQE5RMRIEQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190203185501.8958-1-anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Archit Taneja <architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

TERES-I has an ANX6345 bridge connected to the RGB666 LCD output and
eDP panel input. The bridge is controlled via I2C that's connected to
I2C0 bus.

Enable all this hardware in device tree.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Signed-off-by: Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../boot/dts/allwinner/sun50i-a64-teres-i.dts | 71 +++++++++++++++++--
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
index c455b24dd079..6c4090f59bed 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-teres-i.dts
@@ -56,6 +56,17 @@
 		};
 	};
 
+	edp_panel: edp-panel {
+		compatible = "panel-edp", "simple-panel";
+
+		port {
+			panel_in_edp: endpoint {
+				remote-endpoint = <&anx6345_out_panel>;
+			};
+		};
+	};
+
+
 	reg_usb1_vbus: usb1-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb1-vbus";
@@ -72,20 +83,58 @@
 	};
 };
 
+&de {
+	status = "okay";
+};
+
 &ehci1 {
 	status = "okay";
 };
 
 
-/* The ANX6345 eDP-bridge is on i2c0. There is no linux (mainline)
- * driver for this chip at the moment, the bootloader initializes it.
- * However it can be accessed with the i2c-dev driver from user space.
- */
 &i2c0 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
 	status = "okay";
+
+	anx6345: anx6345@38 {
+		compatible = "analogix,anx6345";
+		reg = <0x38>;
+		reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* PD24 */
+		dvdd25-supply = <&reg_dldo2>;
+		dvdd12-supply = <&reg_dldo3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			anx6345_in: port@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				anx6345_in_tcon0: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&tcon0_out_anx6345>;
+				};
+			};
+
+			anx6345_out: port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+				anx6345_out_panel: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&panel_in_edp>;
+				};
+			};
+		};
+	};
+};
+
+&mixer0 {
+	status = "okay";
 };
 
 &mmc0 {
@@ -258,6 +307,20 @@
 	vcc-hdmi-supply = <&reg_dldo1>;
 };
 
+&tcon0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_rgb666_pins>;
+
+	status = "okay";
+};
+
+&tcon0_out {
+	tcon0_out_anx6345: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&anx6345_in_tcon0>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.20.1
