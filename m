From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] MIPS: BMIPS: dts: add uart device nodes to bcm7xxx platforms
Date: Fri,  8 May 2015 21:59:18 +0900
Message-ID: <1431089958-2626-3-git-send-email-jaedon.shin@gmail.com>
References: <1431089958-2626-1-git-send-email-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431089958-2626-1-git-send-email-jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add two uart device nodes known as the uart1 and uart2 for the bcm7xxx
platforms.

Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/bcm7346.dtsi      | 26 ++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7358.dtsi      | 26 ++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7360.dtsi      | 26 ++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7362.dtsi      | 26 ++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm97358svmb.dts  |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm97360svmb.dts  |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm97362svmb.dts  |  8 ++++++++
 8 files changed, 136 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
index 1f30728a3177..d817bb46b934 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
@@ -24,6 +24,8 @@
 
 	aliases {
 		uart0 = &uart0;
+		uart1 = &uart1;
+		uart2 = &uart2;
 	};
 
 	cpu_intc: cpu_intc {
@@ -118,6 +120,30 @@
 			status = "disabled";
 		};
 
+		uart1: serial@406940 {
+			compatible = "ns16550a";
+			reg = <0x406940 0x20>;
+			reg-io-width = <0x4>;
+			reg-shift = <0x2>;
+			native-endian;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <65>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+
+		uart2: serial@406980 {
+			compatible = "ns16550a";
+			reg = <0x406980 0x20>;
+			reg-io-width = <0x4>;
+			reg-shift = <0x2>;
+			native-endian;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <66>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+
 		enet0: ethernet@430000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7358.dtsi b/arch/mips/boot/dts/brcm/bcm7358.dtsi
index 2c2aa9368f76..277a90adc1a7 100644
--- a/arch/mips/boot/dts/brcm/bcm7358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7358.dtsi
@@ -18,6 +18,8 @@
 
 	aliases {
 		uart0 = &uart0;
+		uart1 = &uart1;
+		uart2 = &uart2;
 	};
 
 	cpu_intc: cpu_intc {
@@ -112,6 +114,30 @@
 			status = "disabled";
 		};
 
+		uart1: serial@406840 {
+			compatible = "ns16550a";
+			reg = <0x406840 0x20>;
+			reg-io-width = <0x4>;
+			reg-shift = <0x2>;
+			native-endian;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <62>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+
+		uart2: serial@406880 {
+			compatible = "ns16550a";
+			reg = <0x406880 0x20>;
+			reg-io-width = <0x4>;
+			reg-shift = <0x2>;
+			native-endian;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <63>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+
 		enet0: ethernet@430000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index f23b0aed276f..9e1e571ba346 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -18,6 +18,8 @@
 
 	aliases {
 		uart0 = &uart0;
+		uart1 = &uart1;
+		uart2 = &uart2;
 	};
 
 	cpu_intc: cpu_intc {
@@ -112,6 +114,30 @@
 			status = "disabled";
 		};
 
+		uart1: serial@406840 {
+			compatible = "ns16550a";
+			reg = <0x406840 0x20>;
+			reg-io-width = <0x4>;
+			reg-shift = <0x2>;
+			native-endian;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <62>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+
+		uart2: serial@406880 {
+			compatible = "ns16550a";
+			reg = <0x406880 0x20>;
+			reg-io-width = <0x4>;
+			reg-shift = <0x2>;
+			native-endian;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <63>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+
 		enet0: ethernet@430000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
index da99db665bbc..6e65db86fc61 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -24,6 +24,8 @@
 
 	aliases {
 		uart0 = &uart0;
+		uart1 = &uart1;
+		uart2 = &uart2;
 	};
 
 	cpu_intc: cpu_intc {
@@ -118,6 +120,30 @@
 			status = "disabled";
 		};
 
+		uart1: serial@406840 {
+			compatible = "ns16550a";
+			reg = <0x406840 0x20>;
+			reg-io-width = <0x4>;
+			reg-shift = <0x2>;
+			native-endian;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <62>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+
+		uart2: serial@406880 {
+			compatible = "ns16550a";
+			reg = <0x406880 0x20>;
+			reg-io-width = <0x4>;
+			reg-shift = <0x2>;
+			native-endian;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <63>;
+			clocks = <&uart_clk>;
+			status = "disabled";
+		};
+
 		enet0: ethernet@430000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
index 70f196d89d26..3fe0445b9d37 100644
--- a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
@@ -21,6 +21,14 @@
 	status = "okay";
 };
 
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97358svmb.dts b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
index d18e6d947739..a8dc01e30313 100644
--- a/arch/mips/boot/dts/brcm/bcm97358svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
@@ -21,6 +21,14 @@
 	status = "okay";
 };
 
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97360svmb.dts b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
index 4fe515500102..eee8b0e32681 100644
--- a/arch/mips/boot/dts/brcm/bcm97360svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
@@ -21,6 +21,14 @@
 	status = "okay";
 };
 
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97362svmb.dts b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
index ab8b01fa7dcf..dd408413e922 100644
--- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
@@ -21,6 +21,14 @@
 	status = "okay";
 };
 
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
-- 
2.4.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
