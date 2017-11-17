From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 3/3] MIPS: BMIPS: Add Broadcom STB watchdog nodes
Date: Fri, 17 Nov 2017 11:19:44 +0900
Message-ID: <20171117021944.894-4-jaedon.shin@gmail.com>
References: <20171117021944.894-1-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117021944.894-1-jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds watchdog device nodes to BCM7xxx MIPS based SoCs.

Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/bcm7125.dtsi      | 7 +++++++
 arch/mips/boot/dts/brcm/bcm7346.dtsi      | 7 +++++++
 arch/mips/boot/dts/brcm/bcm7358.dtsi      | 7 +++++++
 arch/mips/boot/dts/brcm/bcm7360.dtsi      | 7 +++++++
 arch/mips/boot/dts/brcm/bcm7362.dtsi      | 7 +++++++
 arch/mips/boot/dts/brcm/bcm7420.dtsi      | 7 +++++++
 arch/mips/boot/dts/brcm/bcm7425.dtsi      | 7 +++++++
 arch/mips/boot/dts/brcm/bcm7435.dtsi      | 7 +++++++
 arch/mips/boot/dts/brcm/bcm97125cbmb.dts  | 4 ++++
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts | 4 ++++
 arch/mips/boot/dts/brcm/bcm97358svmb.dts  | 4 ++++
 arch/mips/boot/dts/brcm/bcm97360svmb.dts  | 4 ++++
 arch/mips/boot/dts/brcm/bcm97362svmb.dts  | 4 ++++
 arch/mips/boot/dts/brcm/bcm97420c.dts     | 4 ++++
 arch/mips/boot/dts/brcm/bcm97425svmb.dts  | 4 ++++
 arch/mips/boot/dts/brcm/bcm97435svmb.dts  | 4 ++++
 16 files changed, 88 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm7125.dtsi b/arch/mips/boot/dts/brcm/bcm7125.dtsi
index 2f9ef565e5d0..5bf77b6fcceb 100644
--- a/arch/mips/boot/dts/brcm/bcm7125.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7125.dtsi
@@ -198,6 +198,13 @@
 			status = "disabled";
 		};
 
+		watchdog: watchdog@4067e8 {
+			clocks = <&upg_clk>;
+			compatible = "brcm,bcm7038-wdt";
+			reg = <0x4067e8 0x14>;
+			status = "disabled";
+		};
+
 		upg_gio: gpio@406700 {
 			compatible = "brcm,brcmstb-gpio";
 			reg = <0x406700 0x80>;
diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
index 228184dedada..2afa0dada575 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
@@ -233,6 +233,13 @@
 			status = "disabled";
 		};
 
+		watchdog: watchdog@4067e8 {
+			clocks = <&upg_clk>;
+			compatible = "brcm,bcm7038-wdt";
+			reg = <0x4067e8 0x14>;
+			status = "disabled";
+		};
+
 		aon_pm_l2_intc: interrupt-controller@408440 {
 			compatible = "brcm,l2-intc";
 			reg = <0x408440 0x30>;
diff --git a/arch/mips/boot/dts/brcm/bcm7358.dtsi b/arch/mips/boot/dts/brcm/bcm7358.dtsi
index 398521c7070f..6375fc77f389 100644
--- a/arch/mips/boot/dts/brcm/bcm7358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7358.dtsi
@@ -217,6 +217,13 @@
 			status = "disabled";
 		};
 
+		watchdog: watchdog@4066a8 {
+			clocks = <&upg_clk>;
+			compatible = "brcm,bcm7038-wdt";
+			reg = <0x4066a8 0x14>;
+			status = "disabled";
+		};
+
 		aon_pm_l2_intc: interrupt-controller@408240 {
 			compatible = "brcm,l2-intc";
 			reg = <0x408240 0x30>;
diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index 28f5a0c1c149..a57cacea91cf 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -209,6 +209,13 @@
 			status = "disabled";
 		};
 
+		watchdog: watchdog@4066a8 {
+			clocks = <&upg_clk>;
+			compatible = "brcm,bcm7038-wdt";
+			reg = <0x4066a8 0x14>;
+			status = "disabled";
+		};
+
 		aon_pm_l2_intc: interrupt-controller@408440 {
 			compatible = "brcm,l2-intc";
 			reg = <0x408440 0x30>;
diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
index ab2dd57571a0..728b9e9f84b8 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -205,6 +205,13 @@
 			status = "disabled";
 		};
 
+		watchdog: watchdog@4066a8 {
+			clocks = <&upg_clk>;
+			compatible = "brcm,bcm7038-wdt";
+			reg = <0x4066a8 0x14>;
+			status = "disabled";
+		};
+
 		aon_pm_l2_intc: interrupt-controller@408440 {
 			compatible = "brcm,l2-intc";
 			reg = <0x408440 0x30>;
diff --git a/arch/mips/boot/dts/brcm/bcm7420.dtsi b/arch/mips/boot/dts/brcm/bcm7420.dtsi
index d262e11bc3f9..9540c27f12e7 100644
--- a/arch/mips/boot/dts/brcm/bcm7420.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7420.dtsi
@@ -214,6 +214,13 @@
 			status = "disabled";
 		};
 
+		watchdog: watchdog@4067e8 {
+			clocks = <&upg_clk>;
+			compatible = "brcm,bcm7038-wdt";
+			reg = <0x4067e8 0x14>;
+			status = "disabled";
+		};
+
 		upg_gio: gpio@406700 {
 			compatible = "brcm,brcmstb-gpio";
 			reg = <0x406700 0x80>;
diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 23479f988aa5..410e61ebaf9e 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -232,6 +232,13 @@
 			status = "disabled";
 		};
 
+		watchdog: watchdog@4067e8 {
+			clocks = <&upg_clk>;
+			compatible = "brcm,bcm7038-wdt";
+			reg = <0x4067e8 0x14>;
+			status = "disabled";
+		};
+
 		aon_pm_l2_intc: interrupt-controller@408440 {
 			compatible = "brcm,l2-intc";
 			reg = <0x408440 0x30>;
diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index af75b0123c06..8398b7f68bf4 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -247,6 +247,13 @@
 			status = "disabled";
 		};
 
+		watchdog: watchdog@4067e8 {
+			clocks = <&upg_clk>;
+			compatible = "brcm,bcm7038-wdt";
+			reg = <0x4067e8 0x14>;
+			status = "disabled";
+		};
+
 		aon_pm_l2_intc: interrupt-controller@408440 {
 			compatible = "brcm,l2-intc";
 			reg = <0x408440 0x30>;
diff --git a/arch/mips/boot/dts/brcm/bcm97125cbmb.dts b/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
index 7f59ea2ded6c..79e9769f7e00 100644
--- a/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
@@ -50,6 +50,10 @@
 	status = "okay";
 };
 
+&watchdog {
+	status = "okay";
+};
+
 /* FIXME: USB is wonky; disable it for now */
 &ehci0 {
 	status = "disabled";
diff --git a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
index b50dbb3cbeee..28370ff77eeb 100644
--- a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
@@ -59,6 +59,10 @@
 	status = "okay";
 };
 
+&watchdog {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97358svmb.dts b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
index 2986ce353e57..41c1b510c230 100644
--- a/arch/mips/boot/dts/brcm/bcm97358svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
@@ -55,6 +55,10 @@
 	status = "okay";
 };
 
+&watchdog {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97360svmb.dts b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
index 8d48ae317b8c..9f6c6c9b7ea7 100644
--- a/arch/mips/boot/dts/brcm/bcm97360svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
@@ -50,6 +50,10 @@
 	status = "okay";
 };
 
+&watchdog {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97362svmb.dts b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
index 4a1d0631e9e6..df8b755c390f 100644
--- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
@@ -47,6 +47,10 @@
 	status = "okay";
 };
 
+&watchdog {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97420c.dts b/arch/mips/boot/dts/brcm/bcm97420c.dts
index f96241e94874..086faeaa384a 100644
--- a/arch/mips/boot/dts/brcm/bcm97420c.dts
+++ b/arch/mips/boot/dts/brcm/bcm97420c.dts
@@ -60,6 +60,10 @@
 	status = "okay";
 };
 
+&watchdog {
+	status = "okay";
+};
+
 /* FIXME: MAC driver comes up but cannot attach to PHY */
 &enet0 {
 	status = "disabled";
diff --git a/arch/mips/boot/dts/brcm/bcm97425svmb.dts b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
index 488e12a9e4aa..0ed22217bf3a 100644
--- a/arch/mips/boot/dts/brcm/bcm97425svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
@@ -61,6 +61,10 @@
 	status = "okay";
 };
 
+&watchdog {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
diff --git a/arch/mips/boot/dts/brcm/bcm97435svmb.dts b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
index e14337cc51fd..2c145a883aef 100644
--- a/arch/mips/boot/dts/brcm/bcm97435svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
@@ -61,6 +61,10 @@
 	status = "okay";
 };
 
+&watchdog {
+	status = "okay";
+};
+
 &enet0 {
 	status = "okay";
 };
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
