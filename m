From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] ARM: dts: wheat: add DU support
Date: Fri, 02 Sep 2016 00:29:48 +0300
Message-ID: <15676050.WJW1jK1n2R@wasted.cogentembedded.com>
References: <34968644.DhifNderY8@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <34968644.DhifNderY8@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Define  the  Wheat board dependent  part of the DU device node.
Add the device nodes for the Analog Devices ADV7513 HDMI transmitters
connected to DU0/1.  Add the necessary subnodes to interconnect DU with
HDMI transmitters/connectors.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'renesas-devel-20160901-v4.8-rc4' of Simon Horman's
'renesas.git' repo plus the Wheat CAN and SDHI patches posted earlier...
The path depends on the 2 DRM patches just posted in order to work correctly!

 arch/arm/boot/dts/r8a7792-wheat.dts |  126 ++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

Index: renesas/arch/arm/boot/dts/r8a7792-wheat.dts
===================================================================
--- renesas.orig/arch/arm/boot/dts/r8a7792-wheat.dts
+++ renesas/arch/arm/boot/dts/r8a7792-wheat.dts
@@ -66,6 +66,34 @@
 		gpio = <&gpio11 12 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	hdmi-out0 {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con0: endpoint {
+				remote-endpoint = <&adv7513_0_out>;
+			};
+		};
+	};
+
+	hdmi-out1 {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con1: endpoint {
+				remote-endpoint = <&adv7513_1_out>;
+			};
+		};
+	};
+
+	osc2_clk: osc2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <74250000>;
+	};
 };
 
 &extal_clk {
@@ -103,6 +131,16 @@
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
 	};
+
+	du0_pins: du0 {
+		groups = "du0_rgb888", "du0_sync", "du0_disp";
+		function = "du0";
+	};
+
+	du1_pins: du1 {
+		groups = "du1_rgb666", "du1_sync", "du1_disp";
+		function = "du1";
+	};
 };
 
 &scif0 {
@@ -134,3 +172,91 @@
 	cd-gpios = <&gpio11 11 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
+
+&i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	hdmi@3d {
+		compatible = "adi,adv7513";
+		reg = <0x3d>;
+
+		adi,input-depth = <8>;
+		adi,input-colorspace = "rgb";
+		adi,input-clock = "1x";
+		adi,input-style = <1>;
+		adi,input-justification = "evenly";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7513_0_in: endpoint {
+					remote-endpoint = <&du_out_rgb0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7513_0_out: endpoint {
+					remote-endpoint = <&hdmi_con0>;
+				};
+			};
+		};
+	};
+
+	hdmi@39 {
+		compatible = "adi,adv7513";
+		reg = <0x39>;
+
+		adi,input-depth = <8>;
+		adi,input-colorspace = "rgb";
+		adi,input-clock = "1x";
+		adi,input-style = <1>;
+		adi,input-justification = "evenly";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7513_1_in: endpoint {
+					remote-endpoint = <&du_out_rgb1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7513_1_out: endpoint {
+					remote-endpoint = <&hdmi_con1>;
+				};
+			};
+		};
+	};
+};
+
+&du {
+	pinctrl-0 = <&du0_pins &du1_pins>;
+	pinctrl-names = "default";
+
+	clocks = <&mstp7_clks R8A7792_CLK_DU0>, <&mstp7_clks R8A7792_CLK_DU1>,
+		 <&osc2_clk>;
+	clock-names = "du.0", "du.1", "dclkin.0";
+	status = "okay";
+
+	ports {
+		port@0 {
+			endpoint {
+				remote-endpoint = <&adv7513_0_in>;
+			};
+		};
+		port@1 {
+			endpoint {
+				remote-endpoint = <&adv7513_1_in>;
+			};
+		};
+	};
+};
