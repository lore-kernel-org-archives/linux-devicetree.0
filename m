From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [v4 5/5] MIPS: BMIPS: Use interrupt-controller node name
Date: Fri, 19 Aug 2016 11:52:30 +0900
Message-ID: <20160819025230.31882-6-jaedon.shin@gmail.com>
References: <20160819025230.31882-1-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819025230.31882-1-jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Changes node names of the interrupt-controller device nodes to
interrupt-controller instead of label strings.

Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/bcm7125.dtsi |  8 ++++----
 arch/mips/boot/dts/brcm/bcm7346.dtsi | 10 +++++-----
 arch/mips/boot/dts/brcm/bcm7358.dtsi | 10 +++++-----
 arch/mips/boot/dts/brcm/bcm7360.dtsi | 10 +++++-----
 arch/mips/boot/dts/brcm/bcm7362.dtsi | 10 +++++-----
 arch/mips/boot/dts/brcm/bcm7420.dtsi |  8 ++++----
 arch/mips/boot/dts/brcm/bcm7425.dtsi | 10 +++++-----
 arch/mips/boot/dts/brcm/bcm7435.dtsi | 10 +++++-----
 8 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm7125.dtsi b/arch/mips/boot/dts/brcm/bcm7125.dtsi
index 746ed06c85de..bbd00f65ce39 100644
--- a/arch/mips/boot/dts/brcm/bcm7125.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7125.dtsi
@@ -26,7 +26,7 @@
 		uart0 = &uart0;
 	};
 
-	cpu_intc: cpu_intc {
+	cpu_intc: interrupt-controller {
 		#address-cells = <0>;
 		compatible = "mti,cpu-interrupt-controller";
 
@@ -55,7 +55,7 @@
 		compatible = "simple-bus";
 		ranges = <0 0x10000000 0x01000000>;
 
-		periph_intc: periph_intc@441400 {
+		periph_intc: interrupt-controller@441400 {
 			compatible = "brcm,bcm7038-l1-intc";
 			reg = <0x441400 0x30>, <0x441600 0x30>;
 
@@ -66,7 +66,7 @@
 			interrupts = <2>, <3>;
 		};
 
-		sun_l2_intc: sun_l2_intc@401800 {
+		sun_l2_intc: interrupt-controller@401800 {
 			compatible = "brcm,l2-intc";
 			reg = <0x401800 0x30>;
 			interrupt-controller;
@@ -87,7 +87,7 @@
 						     "avd_0", "jtag_0";
 		};
 
-		upg_irq0_intc: upg_irq0_intc@406780 {
+		upg_irq0_intc: interrupt-controller@406780 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x406780 0x8>;
 
diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
index 72d9cffa8927..4bbcc95f1c15 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
@@ -26,7 +26,7 @@
 		uart0 = &uart0;
 	};
 
-	cpu_intc: cpu_intc {
+	cpu_intc: interrupt-controller {
 		#address-cells = <0>;
 		compatible = "mti,cpu-interrupt-controller";
 
@@ -55,7 +55,7 @@
 		compatible = "simple-bus";
 		ranges = <0 0x10000000 0x01000000>;
 
-		periph_intc: periph_intc@411400 {
+		periph_intc: interrupt-controller@411400 {
 			compatible = "brcm,bcm7038-l1-intc";
 			reg = <0x411400 0x30>, <0x411600 0x30>;
 
@@ -66,7 +66,7 @@
 			interrupts = <2>, <3>;
 		};
 
-		sun_l2_intc: sun_l2_intc@403000 {
+		sun_l2_intc: interrupt-controller@403000 {
 			compatible = "brcm,l2-intc";
 			reg = <0x403000 0x30>;
 			interrupt-controller;
@@ -87,7 +87,7 @@
 						     "jtag_0", "svd_0";
 		};
 
-		upg_irq0_intc: upg_irq0_intc@406780 {
+		upg_irq0_intc: interrupt-controller@406780 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x406780 0x8>;
 
@@ -102,7 +102,7 @@
 			interrupt-names = "upg_main", "upg_bsc";
 		};
 
-		upg_aon_irq0_intc: upg_aon_irq0_intc@408b80 {
+		upg_aon_irq0_intc: interrupt-controller@408b80 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x408b80 0x8>;
 
diff --git a/arch/mips/boot/dts/brcm/bcm7358.dtsi b/arch/mips/boot/dts/brcm/bcm7358.dtsi
index 7f78bfab164b..3e42535c8d29 100644
--- a/arch/mips/boot/dts/brcm/bcm7358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7358.dtsi
@@ -20,7 +20,7 @@
 		uart0 = &uart0;
 	};
 
-	cpu_intc: cpu_intc {
+	cpu_intc: interrupt-controller {
 		#address-cells = <0>;
 		compatible = "mti,cpu-interrupt-controller";
 
@@ -49,7 +49,7 @@
 		compatible = "simple-bus";
 		ranges = <0 0x10000000 0x01000000>;
 
-		periph_intc: periph_intc@411400 {
+		periph_intc: interrupt-controller@411400 {
 			compatible = "brcm,bcm7038-l1-intc";
 			reg = <0x411400 0x30>;
 
@@ -60,7 +60,7 @@
 			interrupts = <2>;
 		};
 
-		sun_l2_intc: sun_l2_intc@403000 {
+		sun_l2_intc: interrupt-controller@403000 {
 			compatible = "brcm,l2-intc";
 			reg = <0x403000 0x30>;
 			interrupt-controller;
@@ -81,7 +81,7 @@
 						     "avd_0", "jtag_0";
 		};
 
-		upg_irq0_intc: upg_irq0_intc@406600 {
+		upg_irq0_intc: interrupt-controller@406600 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x406600 0x8>;
 
@@ -96,7 +96,7 @@
 			interrupt-names = "upg_main", "upg_bsc";
 		};
 
-		upg_aon_irq0_intc: upg_aon_irq0_intc@408b80 {
+		upg_aon_irq0_intc: interrupt-controller@408b80 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x408b80 0x8>;
 
diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index 64b9fd90941d..112a5571c596 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -20,7 +20,7 @@
 		uart0 = &uart0;
 	};
 
-	cpu_intc: cpu_intc {
+	cpu_intc: interrupt-controller {
 		#address-cells = <0>;
 		compatible = "mti,cpu-interrupt-controller";
 
@@ -49,7 +49,7 @@
 		compatible = "simple-bus";
 		ranges = <0 0x10000000 0x01000000>;
 
-		periph_intc: periph_intc@411400 {
+		periph_intc: interrupt-controller@411400 {
 			compatible = "brcm,bcm7038-l1-intc";
 			reg = <0x411400 0x30>;
 
@@ -60,7 +60,7 @@
 			interrupts = <2>;
 		};
 
-		sun_l2_intc: sun_l2_intc@403000 {
+		sun_l2_intc: interrupt-controller@403000 {
 			compatible = "brcm,l2-intc";
 			reg = <0x403000 0x30>;
 			interrupt-controller;
@@ -81,7 +81,7 @@
 						     "avd_0", "jtag_0";
 		};
 
-		upg_irq0_intc: upg_irq0_intc@406600 {
+		upg_irq0_intc: interrupt-controller@406600 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x406600 0x8>;
 
@@ -96,7 +96,7 @@
 			interrupt-names = "upg_main", "upg_bsc";
 		};
 
-		upg_aon_irq0_intc: upg_aon_irq0_intc@408b80 {
+		upg_aon_irq0_intc: interrupt-controller@408b80 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x408b80 0x8>;
 
diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
index 784d58725227..34abfb0b07e7 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -26,7 +26,7 @@
 		uart0 = &uart0;
 	};
 
-	cpu_intc: cpu_intc {
+	cpu_intc: interrupt-controller {
 		#address-cells = <0>;
 		compatible = "mti,cpu-interrupt-controller";
 
@@ -55,7 +55,7 @@
 		compatible = "simple-bus";
 		ranges = <0 0x10000000 0x01000000>;
 
-		periph_intc: periph_intc@411400 {
+		periph_intc: interrupt-controller@411400 {
 			compatible = "brcm,bcm7038-l1-intc";
 			reg = <0x411400 0x30>, <0x411600 0x30>;
 
@@ -66,7 +66,7 @@
 			interrupts = <2>, <3>;
 		};
 
-		sun_l2_intc: sun_l2_intc@403000 {
+		sun_l2_intc: interrupt-controller@403000 {
 			compatible = "brcm,l2-intc";
 			reg = <0x403000 0x30>;
 			interrupt-controller;
@@ -87,7 +87,7 @@
 						     "avd_0", "jtag_0";
 		};
 
-		upg_irq0_intc: upg_irq0_intc@406600 {
+		upg_irq0_intc: interrupt-controller@406600 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x406600 0x8>;
 
@@ -102,7 +102,7 @@
 			interrupt-names = "upg_main", "upg_bsc";
 		};
 
-		upg_aon_irq0_intc: upg_aon_irq0_intc@408b80 {
+		upg_aon_irq0_intc: interrupt-controller@408b80 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x408b80 0x8>;
 
diff --git a/arch/mips/boot/dts/brcm/bcm7420.dtsi b/arch/mips/boot/dts/brcm/bcm7420.dtsi
index 0d391d77c780..b143723c674e 100644
--- a/arch/mips/boot/dts/brcm/bcm7420.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7420.dtsi
@@ -26,7 +26,7 @@
 		uart0 = &uart0;
 	};
 
-	cpu_intc: cpu_intc {
+	cpu_intc: interrupt-controller {
 		#address-cells = <0>;
 		compatible = "mti,cpu-interrupt-controller";
 
@@ -55,7 +55,7 @@
 		compatible = "simple-bus";
 		ranges = <0 0x10000000 0x01000000>;
 
-		periph_intc: periph_intc@441400 {
+		periph_intc: interrupt-controller@441400 {
 			compatible = "brcm,bcm7038-l1-intc";
 			reg = <0x441400 0x30>, <0x441600 0x30>;
 
@@ -66,7 +66,7 @@
 			interrupts = <2>, <3>;
 		};
 
-		sun_l2_intc: sun_l2_intc@401800 {
+		sun_l2_intc: interrupt-controller@401800 {
 			compatible = "brcm,l2-intc";
 			reg = <0x401800 0x30>;
 			interrupt-controller;
@@ -88,7 +88,7 @@
 						     "jtag_0";
 		};
 
-		upg_irq0_intc: upg_irq0_intc@406780 {
+		upg_irq0_intc: interrupt-controller@406780 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x406780 0x8>;
 
diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 7124c9822479..2488d2f61f60 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -26,7 +26,7 @@
 		uart0 = &uart0;
 	};
 
-	cpu_intc: cpu_intc {
+	cpu_intc: interrupt-controller {
 		#address-cells = <0>;
 		compatible = "mti,cpu-interrupt-controller";
 
@@ -55,7 +55,7 @@
 		compatible = "simple-bus";
 		ranges = <0 0x10000000 0x01000000>;
 
-		periph_intc: periph_intc@41a400 {
+		periph_intc: interrupt-controller@41a400 {
 			compatible = "brcm,bcm7038-l1-intc";
 			reg = <0x41a400 0x30>, <0x41a600 0x30>;
 
@@ -66,7 +66,7 @@
 			interrupts = <2>, <3>;
 		};
 
-		sun_l2_intc: sun_l2_intc@403000 {
+		sun_l2_intc: interrupt-controller@403000 {
 			compatible = "brcm,l2-intc";
 			reg = <0x403000 0x30>;
 			interrupt-controller;
@@ -89,7 +89,7 @@
 						     "vice_0";
 		};
 
-		upg_irq0_intc: upg_irq0_intc@406780 {
+		upg_irq0_intc: interrupt-controller@406780 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x406780 0x8>;
 
@@ -104,7 +104,7 @@
 			interrupt-names = "upg_main", "upg_bsc";
 		};
 
-		upg_aon_irq0_intc: upg_aon_irq0_intc@409480 {
+		upg_aon_irq0_intc: interrupt-controller@409480 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x409480 0x8>;
 
diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index a3648964be3a..19fa259b968b 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -38,7 +38,7 @@
 		uart0 = &uart0;
 	};
 
-	cpu_intc: cpu_intc {
+	cpu_intc: interrupt-controller {
 		#address-cells = <0>;
 		compatible = "mti,cpu-interrupt-controller";
 
@@ -67,7 +67,7 @@
 		compatible = "simple-bus";
 		ranges = <0 0x10000000 0x01000000>;
 
-		periph_intc: periph_intc@41b500 {
+		periph_intc: interrupt-controller@41b500 {
 			compatible = "brcm,bcm7038-l1-intc";
 			reg = <0x41b500 0x40>, <0x41b600 0x40>,
 				<0x41b700 0x40>, <0x41b800 0x40>;
@@ -79,7 +79,7 @@
 			interrupts = <2>, <3>, <2>, <3>;
 		};
 
-		sun_l2_intc: sun_l2_intc@403000 {
+		sun_l2_intc: interrupt-controller@403000 {
 			compatible = "brcm,l2-intc";
 			reg = <0x403000 0x30>;
 			interrupt-controller;
@@ -104,7 +104,7 @@
 						     "scpu";
 		};
 
-		upg_irq0_intc: upg_irq0_intc@406780 {
+		upg_irq0_intc: interrupt-controller@406780 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x406780 0x8>;
 
@@ -119,7 +119,7 @@
 			interrupt-names = "upg_main", "upg_bsc";
 		};
 
-		upg_aon_irq0_intc: upg_aon_irq0_intc@409480 {
+		upg_aon_irq0_intc: interrupt-controller@409480 {
 			compatible = "brcm,bcm7120-l2-intc";
 			reg = <0x409480 0x8>;
 
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
