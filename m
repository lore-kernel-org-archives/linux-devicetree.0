From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] MIPS: BMIPS: Add support watchdog device nodes
Date: Tue, 27 Dec 2016 10:57:23 +0900
Message-ID: <20161227015723.578-1-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
index bbd00f65ce39..6a1ca7f2ee0f 100644
--- a/arch/mips/boot/dts/brcm/bcm7125.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7125.dtsi
@@ -197,6 +197,13 @@
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
index 4bbcc95f1c15..3fb9f18f0698 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
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
diff --git a/arch/mips/boot/dts/brcm/bcm7358.dtsi b/arch/mips/boot/dts/brcm/bcm7358.dtsi
index 3e42535c8d29..ab3d25396b10 100644
--- a/arch/mips/boot/dts/brcm/bcm7358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7358.dtsi
@@ -216,6 +216,13 @@
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
index 112a5571c596..31668e85d6c6 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -208,6 +208,13 @@
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
index 34abfb0b07e7..0f4b6adbbe6b 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -204,6 +204,13 @@
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
index b143723c674e..11a5bc46d42f 100644
--- a/arch/mips/boot/dts/brcm/bcm7420.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7420.dtsi
@@ -213,6 +213,13 @@
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
index 2488d2f61f60..c9167f01a42d 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -231,6 +231,13 @@
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
index 19fa259b968b..b337b8b7c3dd 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -246,6 +246,13 @@
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
index 5c24eacd72dd..6521407c8d45 100644
--- a/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97125cbmb.dts
@@ -49,6 +49,10 @@
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
index e67eaf30de3d..df5f20c8f8aa 100644
--- a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
@@ -58,6 +58,10 @@
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
index ee4607fae47a..d9d99e2e5866 100644
--- a/arch/mips/boot/dts/brcm/bcm97358svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
@@ -54,6 +54,10 @@
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
index bed821b03013..4eb6e67ce2fd 100644
--- a/arch/mips/boot/dts/brcm/bcm97360svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
@@ -49,6 +49,10 @@
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
index 68fd823868e0..e78ab86b7212 100644
--- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
@@ -46,6 +46,10 @@
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
index e66271af055e..b5c4811a5e2d 100644
--- a/arch/mips/boot/dts/brcm/bcm97420c.dts
+++ b/arch/mips/boot/dts/brcm/bcm97420c.dts
@@ -59,6 +59,10 @@
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
index f95ba1bf3e58..7b49c9f59839 100644
--- a/arch/mips/boot/dts/brcm/bcm97425svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
@@ -60,6 +60,10 @@
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
index fb37b7111bf4..03c4703e61f4 100644
--- a/arch/mips/boot/dts/brcm/bcm97435svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
@@ -60,6 +60,10 @@
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
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
