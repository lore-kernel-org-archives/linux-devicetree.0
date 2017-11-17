From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/3] MIPS: BMIPS: Add Broadcom STB wake-up timer nodes
Date: Fri, 17 Nov 2017 11:19:43 +0900
Message-ID: <20171117021944.894-3-jaedon.shin@gmail.com>
References: <20171117021944.894-1-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117021944.894-1-jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds wake-up timer device nodes to BCM7xxx MIPS based SoCs.

Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/bcm7346.dtsi      | 10 ++++++++++
 arch/mips/boot/dts/brcm/bcm7358.dtsi      | 10 ++++++++++
 arch/mips/boot/dts/brcm/bcm7360.dtsi      | 10 ++++++++++
 arch/mips/boot/dts/brcm/bcm7362.dtsi      | 10 ++++++++++
 arch/mips/boot/dts/brcm/bcm7425.dtsi      | 10 ++++++++++
 arch/mips/boot/dts/brcm/bcm7435.dtsi      | 10 ++++++++++
 arch/mips/boot/dts/brcm/bcm97346dbsmb.dts |  4 ++++
 arch/mips/boot/dts/brcm/bcm97358svmb.dts  |  4 ++++
 arch/mips/boot/dts/brcm/bcm97360svmb.dts  |  4 ++++
 arch/mips/boot/dts/brcm/bcm97362svmb.dts  |  4 ++++
 arch/mips/boot/dts/brcm/bcm97425svmb.dts  |  4 ++++
 arch/mips/boot/dts/brcm/bcm97435svmb.dts  |  4 ++++
 12 files changed, 84 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
index 8aa5b72d652d..228184dedada 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
@@ -494,6 +494,16 @@
 			interrupt-names = "mspi_done";
 			status = "disabled";
 		};
+
+		waketimer: waketimer@408e80 {
+			compatible = "brcm,brcmstb-waketimer";
+			reg = <0x408e80 0x14>;
+			interrupts = <0x3>;
+			interrupt-parent = <&aon_pm_l2_intc>;
+			interrupt-names = "timer";
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
 	};
 
 	memory_controllers {
diff --git a/arch/mips/boot/dts/brcm/bcm7358.dtsi b/arch/mips/boot/dts/brcm/bcm7358.dtsi
index 1089d6ebc841..398521c7070f 100644
--- a/arch/mips/boot/dts/brcm/bcm7358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7358.dtsi
@@ -362,5 +362,15 @@
 			interrupt-names = "mspi_done";
 			status = "disabled";
 		};
+
+		waketimer: waketimer@408e80 {
+			compatible = "brcm,brcmstb-waketimer";
+			reg = <0x408e80 0x14>;
+			interrupts = <0x3>;
+			interrupt-parent = <&aon_pm_l2_intc>;
+			interrupt-names = "timer";
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
 	};
 };
diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index f68285c2dff0..28f5a0c1c149 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -413,6 +413,16 @@
 			interrupt-names = "mspi_done";
 			status = "disabled";
 		};
+
+		waketimer: waketimer@408e80 {
+			compatible = "brcm,brcmstb-waketimer";
+			reg = <0x408e80 0x14>;
+			interrupts = <0x3>;
+			interrupt-parent = <&aon_pm_l2_intc>;
+			interrupt-names = "timer";
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
 	};
 
 	memory_controllers {
diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
index a4bfa5f2b006..ab2dd57571a0 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -409,6 +409,16 @@
 			interrupt-names = "mspi_done";
 			status = "disabled";
 		};
+
+		waketimer: waketimer@408e80 {
+			compatible = "brcm,brcmstb-waketimer";
+			reg = <0x408e80 0x14>;
+			interrupts = <0x3>;
+			interrupt-parent = <&aon_pm_l2_intc>;
+			interrupt-names = "timer";
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
 	};
 
 	memory_controllers {
diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 6cb535235efa..23479f988aa5 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -505,6 +505,16 @@
 			interrupt-names = "mspi_done";
 			status = "disabled";
 		};
+
+		waketimer: waketimer@409580 {
+			compatible = "brcm,brcmstb-waketimer";
+			reg = <0x409580 0x14>;
+			interrupts = <0x3>;
+			interrupt-parent = <&aon_pm_l2_intc>;
+			interrupt-names = "timer";
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
 	};
 
 	memory_controllers {
diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index 1e0545c7f5b7..af75b0123c06 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -520,6 +520,16 @@
 			interrupt-names = "mspi_done";
 			status = "disabled";
 		};
+
+		waketimer: waketimer@409580 {
+			compatible = "brcm,brcmstb-waketimer";
+			reg = <0x409580 0x14>;
+			interrupts = <0x3>;
+			interrupt-parent = <&aon_pm_l2_intc>;
+			interrupt-names = "timer";
+			clocks = <&upg_clk>;
+			status = "disabled";
+		};
 	};
 
 	memory_controllers {
diff --git a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
index 9e7d5228f2b7..b50dbb3cbeee 100644
--- a/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97346dbsmb.dts
@@ -114,3 +114,7 @@
 &mspi {
 	status = "okay";
 };
+
+&waketimer {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/brcm/bcm97358svmb.dts b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
index 708207a0002d..2986ce353e57 100644
--- a/arch/mips/boot/dts/brcm/bcm97358svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97358svmb.dts
@@ -106,3 +106,7 @@
 &mspi {
 	status = "okay";
 };
+
+&waketimer {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/brcm/bcm97360svmb.dts b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
index 73c6dc9c8c6d..8d48ae317b8c 100644
--- a/arch/mips/boot/dts/brcm/bcm97360svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97360svmb.dts
@@ -109,3 +109,7 @@
 &mspi {
 	status = "okay";
 };
+
+&waketimer {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/brcm/bcm97362svmb.dts b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
index 37bacfdcf9d9..4a1d0631e9e6 100644
--- a/arch/mips/boot/dts/brcm/bcm97362svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97362svmb.dts
@@ -78,3 +78,7 @@
 &mspi {
 	status = "okay";
 };
+
+&waketimer {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/brcm/bcm97425svmb.dts b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
index ce762c7b2e54..488e12a9e4aa 100644
--- a/arch/mips/boot/dts/brcm/bcm97425svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97425svmb.dts
@@ -144,3 +144,7 @@
 &mspi {
 	status = "okay";
 };
+
+&waketimer {
+	status = "okay";
+};
diff --git a/arch/mips/boot/dts/brcm/bcm97435svmb.dts b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
index d4dd31a543fd..e14337cc51fd 100644
--- a/arch/mips/boot/dts/brcm/bcm97435svmb.dts
+++ b/arch/mips/boot/dts/brcm/bcm97435svmb.dts
@@ -120,3 +120,7 @@
 &mspi {
 	status = "okay";
 };
+
+&waketimer {
+	status = "okay";
+};
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
