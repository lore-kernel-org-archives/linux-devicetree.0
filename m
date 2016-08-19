From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [v4 1/5] MIPS: BMIPS: Add support PWM device nodes
Date: Fri, 19 Aug 2016 11:52:26 +0900
Message-ID: <20160819025230.31882-2-jaedon.shin@gmail.com>
References: <20160819025230.31882-1-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819025230.31882-1-jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds PWM device nodes to BCM7xxx MIPS based SoCs.

Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/bcm7125.dtsi      | 14 ++++++++++++++
 arch/mips/boot/dts/brcm/bcm7346.dtsi      | 22 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7358.dtsi      | 22 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7360.dtsi      | 14 ++++++++++++++
 arch/mips/boot/dts/brcm/bcm7362.dtsi      | 14 ++++++++++++++
 arch/mips/boot/dts/brcm/bcm7420.dtsi      | 22 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7425.dtsi      | 22 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7435.dtsi      | 22 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm97125cbmb.dts  |  4 ++++
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm97358svmb.dts  |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm97360svmb.dts  |  4 ++++
 arch/mips/boot/dts/brcm/bcm97362svmb.dts  |  4 ++++
 arch/mips/boot/dts/brcm/bcm97420c.dts     |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm97425svmb.dts  |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm97435svmb.dts  |  8 ++++++++
 16 files changed, 204 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm7125.dtsi b/arch/mips/boot/dts/brcm/bcm7125.dtsi
index 550e1d9e3ee0..97191f6bca28 100644
--- a/arch/mips/boot/dts/brcm/bcm7125.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7125.dtsi
@@ -40,6 +40,12 @@
 			#clock-cells = <0>;
 			clock-frequency = <81000000>;
 		};
+
+		upg_clk: upg_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <27000000>;
+		};
 	};
 
 	rdb {
@@ -183,6 +189,14 @@
 		      status = "disabled";
 		};
 
+		pwma: pwm@406580 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406580 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
 		ehci0: usb@488300 {
 			compatible = "brcm,bcm7125-ehci", "generic-ehci";
 			reg = <0x488300 0x100>;
diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
index ec959061d52e..eb7b19a32e3e 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
@@ -40,6 +40,12 @@
 			#clock-cells = <0>;
 			clock-frequency = <81000000>;
 		};
+
+		upg_clk: upg_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <27000000>;
+		};
 	};
 
 	rdb {
@@ -210,6 +216,22 @@
 		      status = "disabled";
 		};
 
+		pwma: pwm@406580 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406580 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
+		pwmb: pwm@406800 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406800 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
 		enet0: ethernet@430000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7358.dtsi b/arch/mips/boot/dts/brcm/bcm7358.dtsi
index ca57fb5eb122..b2276b1e12d4 100644
--- a/arch/mips/boot/dts/brcm/bcm7358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7358.dtsi
@@ -34,6 +34,12 @@
 			#clock-cells = <0>;
 			clock-frequency = <81000000>;
 		};
+
+		upg_clk: upg_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <27000000>;
+		};
 	};
 
 	rdb {
@@ -194,6 +200,22 @@
 		      status = "disabled";
 		};
 
+		pwma: pwm@406400 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406400 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
+		pwmb: pwm@406700 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406700 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
 		enet0: ethernet@430000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index 1c0c3d438c7a..e414af1e14ff 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -34,6 +34,12 @@
 			#clock-cells = <0>;
 			clock-frequency = <81000000>;
 		};
+
+		upg_clk: upg_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <27000000>;
+		};
 	};
 
 	rdb {
@@ -194,6 +200,14 @@
 		      status = "disabled";
 		};
 
+		pwma: pwm@406400 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406400 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
 		enet0: ethernet@430000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
index 6b4713add4b8..3bd1c0111d43 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -40,6 +40,12 @@
 			#clock-cells = <0>;
 			clock-frequency = <81000000>;
 		};
+
+		upg_clk: upg_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <27000000>;
+		};
 	};
 
 	rdb {
@@ -190,6 +196,14 @@
 		      status = "disabled";
 		};
 
+		pwma: pwm@406400 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406400 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
 		enet0: ethernet@430000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7420.dtsi b/arch/mips/boot/dts/brcm/bcm7420.dtsi
index 0586bf662571..27c3d45556b9 100644
--- a/arch/mips/boot/dts/brcm/bcm7420.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7420.dtsi
@@ -40,6 +40,12 @@
 			#clock-cells = <0>;
 			clock-frequency = <81000000>;
 		};
+
+		upg_clk: upg_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <27000000>;
+		};
 	};
 
 	rdb {
@@ -191,6 +197,22 @@
 		      status = "disabled";
 		};
 
+		pwma: pwm@406580 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406580 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
+		pwmb: pwm@406880 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406880 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
 		enet0: ethernet@468000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index c1c15edaf829..9ab65d64e948 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -40,6 +40,12 @@
 			#clock-cells = <0>;
 			clock-frequency = <81000000>;
 		};
+
+		upg_clk: upg_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <27000000>;
+		};
 	};
 
 	rdb {
@@ -209,6 +215,22 @@
 		      status = "disabled";
 		};
 
+		pwma: pwm@406580 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406580 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
+		pwmb: pwm@406800 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406800 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
 		enet0: ethernet@b80000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index a874d3a0e2ee..7801169416e7 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -52,6 +52,12 @@
 			#clock-cells = <0>;
 			clock-frequency = <81000000>;
 		};
+
+		upg_clk: upg_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <27000000>;
+		};
 	};
 
 	rdb {
@@ -224,6 +230,22 @@
 		      status = "disabled";
 		};
 
+		pwma: pwm@406580 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406580 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
+		pwmb: pwm@406800 {
+			compatible = "brcm,bcm7038-pwm";
+			reg = <0x406800 0x28>;
+			#pwm-cells = <2>;
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
+
 		enet0: ethernet@b80000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm97125cbmb.dts b/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
index f2449d147c6d..5c24eacd72dd 100644
--- a/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
@@ -45,6 +45,10 @@
 	status = "okay";
 };
 
+&pwma {
+	status = "okay";
+};
+
 /* FIXME: USB is wonky; disable it for now */
 &ehci0 {
 	status = "disabled";
diff --git a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
index d3d28816a027..2c55ab094a29 100644
--- a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
@@ -49,6 +49,14 @@
 	status = "okay";
 };
 
+&pwma {
+	status = "okay";
+};
+
+&pwmb {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97358svmb.dts b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
index 02ce6b429dc4..757fe9d5f4df 100644
--- a/arch/mips/boot/dts/brcm/bcm97358svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
@@ -45,6 +45,14 @@
 	status = "okay";
 };
 
+&pwma {
+	status = "okay";
+};
+
+&pwmb {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97360svmb.dts b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
index 73124be9548a..496e6ed9fae3 100644
--- a/arch/mips/boot/dts/brcm/bcm97360svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
@@ -45,6 +45,10 @@
 	status = "okay";
 };
 
+&pwma {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97362svmb.dts b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
index 3cfcaebe7f79..b880c018f3d8 100644
--- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
@@ -41,6 +41,10 @@
 	status = "okay";
 };
 
+&pwma {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97420c.dts b/arch/mips/boot/dts/brcm/bcm97420c.dts
index 600d57abee05..e66271af055e 100644
--- a/arch/mips/boot/dts/brcm/bcm97420c.dts
+++ b/arch/mips/boot/dts/brcm/bcm97420c.dts
@@ -51,6 +51,14 @@
 	status = "okay";
 };
 
+&pwma {
+	status = "okay";
+};
+
+&pwmb {
+	status = "okay";
+};
+
 /* FIXME: MAC driver comes up but cannot attach to PHY */
 &enet0 {
 	status = "disabled";
diff --git a/arch/mips/boot/dts/brcm/bcm97425svmb.dts b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
index 119c714805cb..f091e91b11c5 100644
--- a/arch/mips/boot/dts/brcm/bcm97425svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
@@ -51,6 +51,14 @@
 	status = "okay";
 };
 
+&pwma {
+	status = "okay";
+};
+
+&pwmb {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97435svmb.dts b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
index 43e3ba27f07b..9db84f2a6664 100644
--- a/arch/mips/boot/dts/brcm/bcm97435svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
@@ -51,6 +51,14 @@
 	status = "okay";
 };
 
+&pwma {
+	status = "okay";
+};
+
+&pwmb {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
