From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [v4 4/5] MIPS: BMIPS: Add support NAND device nodes
Date: Fri, 19 Aug 2016 11:52:29 +0900
Message-ID: <20160819025230.31882-5-jaedon.shin@gmail.com>
References: <20160819025230.31882-1-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819025230.31882-1-jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds NAND device nodes to BCM7xxx MIPS based SoCs.

Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/bcm7346.dtsi               | 20 +++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7358.dtsi               | 20 +++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7360.dtsi               | 20 +++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7362.dtsi               | 20 +++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7425.dtsi               | 20 +++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7435.dtsi               | 20 +++++++++++++++++
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts          |  5 +++++
 arch/mips/boot/dts/brcm/bcm97358svmb.dts           |  5 +++++
 arch/mips/boot/dts/brcm/bcm97362svmb.dts           |  5 +++++
 arch/mips/boot/dts/brcm/bcm97425svmb.dts           |  5 +++++
 arch/mips/boot/dts/brcm/bcm97435svmb.dts           |  5 +++++
 .../boot/dts/brcm/bcm97xxx-nand-cs1-bch24.dtsi     | 25 ++++++++++++++++++++++
 .../mips/boot/dts/brcm/bcm97xxx-nand-cs1-bch4.dtsi | 25 ++++++++++++++++++++++
 13 files changed, 195 insertions(+)
 create mode 100644 arch/mips/boot/dts/brcm/bcm97xxx-nand-cs1-bch24.dtsi
 create mode 100644 arch/mips/boot/dts/brcm/bcm97xxx-nand-cs1-bch4.dtsi

diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
index 0da4f8a3744b..72d9cffa8927 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
@@ -372,6 +372,26 @@
 			status = "disabled";
 		};
 
+		hif_l2_intc: interrupt-controller@411000 {
+			compatible = "brcm,l2-intc";
+			reg = <0x411000 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <30>;
+		};
+
+		nand: nand@412800 {
+			compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg-names = "nand";
+			reg = <0x412800 0x400>;
+			interrupt-parent = <&hif_l2_intc>;
+			interrupts = <24>;
+			status = "disabled";
+		};
+
 		sata: sata@181000 {
 			compatible = "brcm,bcm7425-ahci", "brcm,sata3-ahci";
 			reg-names = "ahci", "top-ctrl";
diff --git a/arch/mips/boot/dts/brcm/bcm7358.dtsi b/arch/mips/boot/dts/brcm/bcm7358.dtsi
index aec1b2e7e2ab..7f78bfab164b 100644
--- a/arch/mips/boot/dts/brcm/bcm7358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7358.dtsi
@@ -298,5 +298,25 @@
 			interrupts = <66>;
 			status = "disabled";
 		};
+
+		hif_l2_intc: interrupt-controller@411000 {
+			compatible = "brcm,l2-intc";
+			reg = <0x411000 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <30>;
+		};
+
+		nand: nand@412800 {
+			compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg-names = "nand";
+			reg = <0x412800 0x400>;
+			interrupt-parent = <&hif_l2_intc>;
+			interrupts = <24>;
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index 9f72d3490427..64b9fd90941d 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -291,6 +291,26 @@
 			status = "disabled";
 		};
 
+		hif_l2_intc: interrupt-controller@411000 {
+			compatible = "brcm,l2-intc";
+			reg = <0x411000 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <30>;
+		};
+
+		nand: nand@412800 {
+			compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg-names = "nand";
+			reg = <0x412800 0x400>;
+			interrupt-parent = <&hif_l2_intc>;
+			interrupts = <24>;
+			status = "disabled";
+		};
+
 		sata: sata@181000 {
 			compatible = "brcm,bcm7425-ahci", "brcm,sata3-ahci";
 			reg-names = "ahci", "top-ctrl";
diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
index ff734f45df92..784d58725227 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -287,6 +287,26 @@
 			status = "disabled";
 		};
 
+		hif_l2_intc: interrupt-controller@411000 {
+			compatible = "brcm,l2-intc";
+			reg = <0x411000 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <30>;
+		};
+
+		nand: nand@412800 {
+			compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg-names = "nand";
+			reg = <0x412800 0x400>;
+			interrupt-parent = <&hif_l2_intc>;
+			interrupts = <24>;
+			status = "disabled";
+		};
+
 		sata: sata@181000 {
 			compatible = "brcm,bcm7425-ahci", "brcm,sata3-ahci";
 			reg-names = "ahci", "top-ctrl";
diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 1c8d3b4033a0..7124c9822479 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -371,6 +371,26 @@
 			status = "disabled";
 		};
 
+		hif_l2_intc: interrupt-controller@41a000 {
+			compatible = "brcm,l2-intc";
+			reg = <0x41a000 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <24>;
+		};
+
+		nand: nand@41b800 {
+			compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg-names = "nand";
+			reg = <0x41b800 0x400>;
+			interrupt-parent = <&hif_l2_intc>;
+			interrupts = <24>;
+			status = "disabled";
+		};
+
 		sata: sata@181000 {
 			compatible = "brcm,bcm7425-ahci", "brcm,sata3-ahci";
 			reg-names = "ahci", "top-ctrl";
diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index 2b28d91762ef..a3648964be3a 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -386,6 +386,26 @@
 			status = "disabled";
 		};
 
+		hif_l2_intc: interrupt-controller@41b000 {
+			compatible = "brcm,l2-intc";
+			reg = <0x41b000 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <24>;
+		};
+
+		nand: nand@41c800 {
+			compatible = "brcm,brcmnand-v6.2", "brcm,brcmnand";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg-names = "nand", "flash-dma";
+			reg = <0x41c800 0x600>, <0x41d000 0x100>;
+			interrupt-parent = <&hif_l2_intc>;
+			interrupts = <24>, <4>;
+			status = "disabled";
+		};
+
 		sata: sata@181000 {
 			compatible = "brcm,bcm7425-ahci", "brcm,sata3-ahci";
 			reg-names = "ahci", "top-ctrl";
diff --git a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
index 27c9f127a7ca..e67eaf30de3d 100644
--- a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
@@ -1,6 +1,7 @@
 /dts-v1/;
 
 /include/ "bcm7346.dtsi"
+/include/ "bcm97xxx-nand-cs1-bch24.dtsi"
 
 / {
 	compatible = "brcm,bcm97346dbsmb", "brcm,bcm7346";
@@ -93,6 +94,10 @@
 	status = "okay";
 };
 
+&nand {
+	status = "okay";
+};
+
 &sata {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97358svmb.dts b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
index 757fe9d5f4df..ee4607fae47a 100644
--- a/arch/mips/boot/dts/brcm/bcm97358svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
@@ -1,6 +1,7 @@
 /dts-v1/;
 
 /include/ "bcm7358.dtsi"
+/include/ "bcm97xxx-nand-cs1-bch4.dtsi"
 
 / {
 	compatible = "brcm,bcm97358svmb", "brcm,bcm7358";
@@ -64,3 +65,7 @@
 &ohci0 {
 	status = "okay";
 };
+
+&nand {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/brcm/bcm97362svmb.dts b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
index 1b9bc4b2d9ae..68fd823868e0 100644
--- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
@@ -1,6 +1,7 @@
 /dts-v1/;
 
 /include/ "bcm7362.dtsi"
+/include/ "bcm97xxx-nand-cs1-bch4.dtsi"
 
 / {
 	compatible = "brcm,bcm97362svmb", "brcm,bcm7362";
@@ -57,6 +58,10 @@
 	status = "okay";
 };
 
+&nand {
+	status = "okay";
+};
+
 &sata {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97425svmb.dts b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
index 1c6b74daef56..f95ba1bf3e58 100644
--- a/arch/mips/boot/dts/brcm/bcm97425svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
@@ -1,6 +1,7 @@
 /dts-v1/;
 
 /include/ "bcm7425.dtsi"
+/include/ "bcm97xxx-nand-cs1-bch24.dtsi"
 
 / {
 	compatible = "brcm,bcm97425svmb", "brcm,bcm7425";
@@ -95,6 +96,10 @@
 	status = "okay";
 };
 
+&nand {
+	status = "okay";
+};
+
 &sdhci0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97435svmb.dts b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
index 64bb1988dbc8..fb37b7111bf4 100644
--- a/arch/mips/boot/dts/brcm/bcm97435svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
@@ -1,6 +1,7 @@
 /dts-v1/;
 
 /include/ "bcm7435.dtsi"
+/include/ "bcm97xxx-nand-cs1-bch24.dtsi"
 
 / {
 	compatible = "brcm,bcm97435svmb", "brcm,bcm7435";
@@ -95,6 +96,10 @@
 	status = "okay";
 };
 
+&nand {
+	status = "okay";
+};
+
 &sata {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97xxx-nand-cs1-bch24.dtsi b/arch/mips/boot/dts/brcm/bcm97xxx-nand-cs1-bch24.dtsi
new file mode 100644
index 000000000000..3c24f97de922
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm97xxx-nand-cs1-bch24.dtsi
@@ -0,0 +1,25 @@
+&nand {
+	nandcs@1 {
+		compatible = "brcm,nandcs";
+		reg = <1>;
+		nand-on-flash-bbt;
+
+		nand-ecc-strength = <24>;
+		nand-ecc-step-size = <1024>;
+		brcm,nand-oob-sector-size = <27>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			flash1.rootfs@0 {
+				reg = <0x0 0x10000000>;
+			};
+
+			flash1.kernel@10000000 {
+				reg = <0x10000000 0x400000>;
+			};
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/brcm/bcm97xxx-nand-cs1-bch4.dtsi b/arch/mips/boot/dts/brcm/bcm97xxx-nand-cs1-bch4.dtsi
new file mode 100644
index 000000000000..cb531816ef4c
--- /dev/null
+++ b/arch/mips/boot/dts/brcm/bcm97xxx-nand-cs1-bch4.dtsi
@@ -0,0 +1,25 @@
+&nand {
+	nandcs@1 {
+		compatible = "brcm,nandcs";
+		reg = <1>;
+		nand-on-flash-bbt;
+
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+		brcm,nand-oob-sector-size = <16>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			flash1.rootfs@0 {
+				reg = <0x0 0x10000000>;
+			};
+
+			flash1.kernel@10000000 {
+				reg = <0x10000000 0x400000>;
+			};
+		};
+	};
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
