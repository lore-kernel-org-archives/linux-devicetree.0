From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [v4 2/5] MIPS: BMIPS: Add support GPIO device nodes
Date: Fri, 19 Aug 2016 11:52:27 +0900
Message-ID: <20160819025230.31882-3-jaedon.shin@gmail.com>
References: <20160819025230.31882-1-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819025230.31882-1-jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, MIPS Mailing List <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds GPIO device nodes to BCM7xxx MIPS based SoCs.

Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/bcm7125.dtsi | 12 ++++++++++++
 arch/mips/boot/dts/brcm/bcm7346.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7358.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7360.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7362.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7420.dtsi | 12 ++++++++++++
 arch/mips/boot/dts/brcm/bcm7425.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7435.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 8 files changed, 246 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm7125.dtsi b/arch/mips/boot/dts/brcm/bcm7125.dtsi
index 97191f6bca28..746ed06c85de 100644
--- a/arch/mips/boot/dts/brcm/bcm7125.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7125.dtsi
@@ -197,6 +197,18 @@
 			status = "disabled";
 		};
 
+		upg_gio: gpio@406700 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x406700 0x80>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_irq0_intc>;
+			interrupts = <6>;
+			brcm,gpio-bank-widths = <32 32 32 18>;
+		};
+
 		ehci0: usb@488300 {
 			compatible = "brcm,bcm7125-ehci", "generic-ehci";
 			reg = <0x488300 0x100>;
diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
index eb7b19a32e3e..0105e4e5130b 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
@@ -232,6 +232,43 @@
 			status = "disabled";
 		};
 
+		aon_pm_l2_intc: interrupt-controller@408440 {
+			compatible = "brcm,l2-intc";
+			reg = <0x408440 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <53>;
+			brcm,irq-can-wake;
+		};
+
+		upg_gio: gpio@406700 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x406700 0x60>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_irq0_intc>;
+			interrupts = <6>;
+			brcm,gpio-bank-widths = <32 32 16>;
+		};
+
+		upg_gio_aon: gpio@408c00 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x408c00 0x60>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_aon_irq0_intc>;
+			interrupts = <6>;
+			interrupts-extended = <&upg_aon_irq0_intc 6>,
+					      <&aon_pm_l2_intc 5>;
+			wakeup-source;
+			brcm,gpio-bank-widths = <27 32 2>;
+		};
+
 		enet0: ethernet@430000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7358.dtsi b/arch/mips/boot/dts/brcm/bcm7358.dtsi
index b2276b1e12d4..aec1b2e7e2ab 100644
--- a/arch/mips/boot/dts/brcm/bcm7358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7358.dtsi
@@ -216,6 +216,43 @@
 			status = "disabled";
 		};
 
+		aon_pm_l2_intc: interrupt-controller@408240 {
+			compatible = "brcm,l2-intc";
+			reg = <0x408240 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <50>;
+			brcm,irq-can-wake;
+		};
+
+		upg_gio: gpio@406500 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x406500 0xa0>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_irq0_intc>;
+			interrupts = <6>;
+			brcm,gpio-bank-widths = <32 32 32 29 4>;
+		};
+
+		upg_gio_aon: gpio@408c00 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x408c00 0x60>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_aon_irq0_intc>;
+			interrupts = <6>;
+			interrupts-extended = <&upg_aon_irq0_intc 6>,
+					      <&aon_pm_l2_intc 5>;
+			wakeup-source;
+			brcm,gpio-bank-widths = <21 32 2>;
+		};
+
 		enet0: ethernet@430000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index e414af1e14ff..f0f63cb2bd2b 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -208,6 +208,43 @@
 			status = "disabled";
 		};
 
+		aon_pm_l2_intc: interrupt-controller@408440 {
+			compatible = "brcm,l2-intc";
+			reg = <0x408440 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <50>;
+			brcm,irq-can-wake;
+		};
+
+		upg_gio: gpio@406500 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x406500 0xa0>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_irq0_intc>;
+			interrupts = <6>;
+			brcm,gpio-bank-widths = <32 32 32 29 4>;
+		};
+
+		upg_gio_aon: gpio@408c00 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x408c00 0x60>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_aon_irq0_intc>;
+			interrupts = <6>;
+			interrupts-extended = <&upg_aon_irq0_intc 6>,
+					      <&aon_pm_l2_intc 5>;
+			wakeup-source;
+			brcm,gpio-bank-widths = <21 32 2>;
+		};
+
 		enet0: ethernet@430000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
index 3bd1c0111d43..ac42b98e31bb 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -204,6 +204,43 @@
 			status = "disabled";
 		};
 
+		aon_pm_l2_intc: interrupt-controller@408440 {
+			compatible = "brcm,l2-intc";
+			reg = <0x408440 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <50>;
+			brcm,irq-can-wake;
+		};
+
+		upg_gio: gpio@406500 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x406500 0xa0>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_irq0_intc>;
+			interrupts = <6>;
+			brcm,gpio-bank-widths = <32 32 32 29 4>;
+		};
+
+		upg_gio_aon: gpio@408c00 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x408c00 0x60>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_aon_irq0_intc>;
+			interrupts = <6>;
+			interrupts-extended = <&upg_aon_irq0_intc 6>,
+					      <&aon_pm_l2_intc 5>;
+			wakeup-source;
+			brcm,gpio-bank-widths = <21 32 2>;
+		};
+
 		enet0: ethernet@430000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7420.dtsi b/arch/mips/boot/dts/brcm/bcm7420.dtsi
index 27c3d45556b9..0d391d77c780 100644
--- a/arch/mips/boot/dts/brcm/bcm7420.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7420.dtsi
@@ -213,6 +213,18 @@
 			status = "disabled";
 		};
 
+		upg_gio: gpio@406700 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x406700 0x80>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_irq0_intc>;
+			interrupts = <6>;
+			brcm,gpio-bank-widths = <32 32 32 27>;
+		};
+
 		enet0: ethernet@468000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 9ab65d64e948..8b05b98f2a9c 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -231,6 +231,43 @@
 			status = "disabled";
 		};
 
+		aon_pm_l2_intc: interrupt-controller@408440 {
+			compatible = "brcm,l2-intc";
+			reg = <0x408440 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <49>;
+			brcm,irq-can-wake;
+		};
+
+		upg_gio: gpio@406700 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x406700 0x80>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_irq0_intc>;
+			interrupts = <6>;
+			brcm,gpio-bank-widths = <32 32 32 21>;
+		};
+
+		upg_gio_aon: gpio@4094c0 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x4094c0 0x40>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_aon_irq0_intc>;
+			interrupts = <6>;
+			interrupts-extended = <&upg_aon_irq0_intc 6>,
+					      <&aon_pm_l2_intc 5>;
+			wakeup-source;
+			brcm,gpio-bank-widths = <18 4>;
+		};
+
 		enet0: ethernet@b80000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index 7801169416e7..b7bb1024089c 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -246,6 +246,43 @@
 			status = "disabled";
 		};
 
+		aon_pm_l2_intc: interrupt-controller@408440 {
+			compatible = "brcm,l2-intc";
+			reg = <0x408440 0x30>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&periph_intc>;
+			interrupts = <54>;
+			brcm,irq-can-wake;
+		};
+
+		upg_gio: gpio@406700 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x406700 0x80>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_irq0_intc>;
+			interrupts = <6>;
+			brcm,gpio-bank-widths = <32 32 32 21>;
+		};
+
+		upg_gio_aon: gpio@4094c0 {
+			compatible = "brcm,brcmstb-gpio";
+			reg = <0x4094c0 0x40>;
+			#gpio-cells = <2>;
+			#interrupt-cells = <2>;
+			gpio-controller;
+			interrupt-controller;
+			interrupt-parent = <&upg_aon_irq0_intc>;
+			interrupts = <6>;
+			interrupts-extended = <&upg_aon_irq0_intc 6>,
+					      <&aon_pm_l2_intc 5>;
+			wakeup-source;
+			brcm,gpio-bank-widths = <18 4>;
+		};
+
 		enet0: ethernet@b80000 {
 			phy-mode = "internal";
 			phy-handle = <&phy1>;
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
