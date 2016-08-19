From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [v4 3/5] MIPS: BMIPS: Add support SDHCI device nodes
Date: Fri, 19 Aug 2016 11:52:28 +0900
Message-ID: <20160819025230.31882-4-jaedon.shin@gmail.com>
References: <20160819025230.31882-1-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819025230.31882-1-jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds SDHCI device nodes to BCM7xxx MIPS based SoCs.

Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/bcm7346.dtsi      |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm7360.dtsi      |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm7362.dtsi      |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm7425.dtsi      | 20 ++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7435.dtsi      | 20 ++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts |  4 ++++
 arch/mips/boot/dts/brcm/bcm97360svmb.dts  |  4 ++++
 arch/mips/boot/dts/brcm/bcm97362svmb.dts  |  4 ++++
 arch/mips/boot/dts/brcm/bcm97425svmb.dts  |  8 ++++++++
 arch/mips/boot/dts/brcm/bcm97435svmb.dts  |  8 ++++++++
 10 files changed, 92 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
index 0105e4e5130b..0da4f8a3744b 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
@@ -411,5 +411,13 @@
 				#phy-cells = <0>;
 			};
 		};
+
+		sdhci0: sdhci@413500 {
+			compatible = "brcm,bcm7425-sdhci";
+			reg = <0x413500 0x100>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <85>;
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index f0f63cb2bd2b..9f72d3490427 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -330,5 +330,13 @@
 				#phy-cells = <0>;
 			};
 		};
+
+		sdhci0: sdhci@410000 {
+			compatible = "brcm,bcm7425-sdhci";
+			reg = <0x410000 0x100>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <82>;
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
index ac42b98e31bb..ff734f45df92 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -326,5 +326,13 @@
 				#phy-cells = <0>;
 			};
 		};
+
+		sdhci0: sdhci@410000 {
+			compatible = "brcm,bcm7425-sdhci";
+			reg = <0x410000 0x100>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <82>;
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 8b05b98f2a9c..1c8d3b4033a0 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -410,5 +410,25 @@
 				#phy-cells = <0>;
 			};
 		};
+
+		sdhci0: sdhci@419000 {
+			compatible = "brcm,bcm7425-sdhci";
+			reg = <0x419000 0x100>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <43>;
+			sd-uhs-sdr50;
+			mmc-hs200-1_8v;
+			status = "disabled";
+		};
+
+		sdhci1: sdhci@419200 {
+			compatible = "brcm,bcm7425-sdhci";
+			reg = <0x419200 0x100>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <44>;
+			sd-uhs-sdr50;
+			mmc-hs200-1_8v;
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index b7bb1024089c..2b28d91762ef 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -425,5 +425,25 @@
 				#phy-cells = <0>;
 			};
 		};
+
+		sdhci0: sdhci@41a000 {
+			compatible = "brcm,bcm7425-sdhci";
+			reg = <0x41a000 0x100>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <47>;
+			sd-uhs-sdr50;
+			mmc-hs200-1_8v;
+			status = "disabled";
+		};
+
+		sdhci1: sdhci@41a200 {
+			compatible = "brcm,bcm7425-sdhci";
+			reg = <0x41a200 0x100>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <48>;
+			sd-uhs-sdr50;
+			mmc-hs200-1_8v;
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
index 2c55ab094a29..27c9f127a7ca 100644
--- a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
@@ -100,3 +100,7 @@
 &sata_phy {
 	status = "okay";
 };
+
+&sdhci0 {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/brcm/bcm97360svmb.dts b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
index 496e6ed9fae3..bed821b03013 100644
--- a/arch/mips/boot/dts/brcm/bcm97360svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
@@ -68,3 +68,7 @@
 &sata_phy {
 	status = "okay";
 };
+
+&sdhci0 {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/brcm/bcm97362svmb.dts b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
index b880c018f3d8..1b9bc4b2d9ae 100644
--- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
@@ -64,3 +64,7 @@
 &sata_phy {
 	status = "okay";
 };
+
+&sdhci0 {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/brcm/bcm97425svmb.dts b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
index f091e91b11c5..1c6b74daef56 100644
--- a/arch/mips/boot/dts/brcm/bcm97425svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
@@ -94,3 +94,11 @@
 &ohci3 {
 	status = "okay";
 };
+
+&sdhci0 {
+	status = "okay";
+};
+
+&sdhci1 {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/brcm/bcm97435svmb.dts b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
index 9db84f2a6664..64bb1988dbc8 100644
--- a/arch/mips/boot/dts/brcm/bcm97435svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
@@ -102,3 +102,11 @@
 &sata_phy {
 	status = "okay";
 };
+
+&sdhci0 {
+	status = "okay";
+};
+
+&sdhci1 {
+	status = "okay";
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
