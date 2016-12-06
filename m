From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v4 1/2] ARM: dts: da850-lcdk: add the dumb-vga-dac node
Date: Tue,  6 Dec 2016 14:13:45 +0100
Message-ID: <1481030026-7329-2-git-send-email-bgolaszewski@baylibre.com>
References: <1481030026-7329-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1481030026-7329-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Sekhar Nori <nsekhar@ti.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, linux-drm <dri-devel@lists.freedesktop.org>, linux-devicetree <devicetree@vger.kernel.org>, Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add the dumb-vga-dac node to the board DT together with corresponding
ports and vga connector. This allows to retrieve the edid info from
the display automatically.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm/boot/dts/da850-lcdk.dts | 69 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm/boot/dts/da850-lcdk.dts b/arch/arm/boot/dts/da850-lcdk.dts
index afcb482..ca437c1 100644
--- a/arch/arm/boot/dts/da850-lcdk.dts
+++ b/arch/arm/boot/dts/da850-lcdk.dts
@@ -51,6 +51,51 @@
 			system-clock-frequency = <24576000>;
 		};
 	};
+
+	vga-bridge {
+		compatible = "dumb-vga-dac";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+
+				vga_bridge_in: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&display_out_vga>;
+				};
+			};
+
+			port@1 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <1>;
+
+				vga_bridge_out: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&vga_con_in>;
+				};
+			};
+		};
+	};
+
+	vga {
+		compatible = "vga-connector";
+
+		ddc-i2c-bus = <&i2c0>;
+
+		port {
+			vga_con_in: endpoint {
+				remote-endpoint = <&vga_bridge_out>;
+			};
+		};
+	};
 };
 
 &pmx_core {
@@ -236,3 +281,27 @@
 &memctrl {
 	status = "okay";
 };
+
+&display {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_pins>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		display_out: port@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+	};
+};
+
+&display_out {
+	display_out_vga: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&vga_bridge_in>;
+	};
+};
-- 
2.9.3
