From: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] MIPS: BMIPS: Add Broadcom STB power management nodes
Date: Fri, 17 Nov 2017 11:19:42 +0900
Message-ID: <20171117021944.894-2-jaedon.shin@gmail.com>
References: <20171117021944.894-1-jaedon.shin@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171117021944.894-1-jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, James Hogan <james.hogan-8NJIiSa5LzA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds power management nodes to BCM7xxx MIPS based SoCs.

Signed-off-by: Jaedon Shin <jaedon.shin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/mips/boot/dts/brcm/bcm7346.dtsi | 45 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7360.dtsi | 45 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7362.dtsi | 45 ++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7425.dtsi | 72 ++++++++++++++++++++++++++++++++++++
 arch/mips/boot/dts/brcm/bcm7435.dtsi | 72 ++++++++++++++++++++++++++++++++++++
 5 files changed, 279 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm7346.dtsi b/arch/mips/boot/dts/brcm/bcm7346.dtsi
index 02e426fe6013..8aa5b72d652d 100644
--- a/arch/mips/boot/dts/brcm/bcm7346.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7346.dtsi
@@ -243,6 +243,17 @@
 			brcm,irq-can-wake;
 		};
 
+		aon_ctrl: syscon@408000 {
+			compatible = "brcm,brcmstb-aon-ctrl";
+			reg = <0x408000 0x100>, <0x408200 0x200>;
+			reg-names = "aon-ctrl", "aon-sram";
+		};
+
+		timers: timer@4067c0 {
+			compatible = "brcm,brcmstb-timers";
+			reg = <0x4067c0 0x40>;
+		};
+
 		upg_gio: gpio@406700 {
 			compatible = "brcm,brcmstb-gpio";
 			reg = <0x406700 0x60>;
@@ -484,4 +495,38 @@
 			status = "disabled";
 		};
 	};
+
+	memory_controllers {
+		compatible = "simple-bus";
+		ranges = <0x0 0x103b0000 0xa000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		memory-controller@0 {
+			compatible = "brcm,brcmstb-memc", "simple-bus";
+			ranges = <0x0 0x0 0xa000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			memc-arb@1000 {
+				compatible = "brcm,brcmstb-memc-arb";
+				reg = <0x1000 0x248>;
+			};
+
+			memc-ddr@2000 {
+				compatible = "brcm,brcmstb-memc-ddr";
+				reg = <0x2000 0x300>;
+			};
+
+			ddr-phy@6000 {
+				compatible = "brcm,brcmstb-ddr-phy";
+				reg = <0x6000 0xc8>;
+			};
+
+			shimphy@8000 {
+				compatible = "brcm,brcmstb-ddr-shimphy";
+				reg = <0x8000 0x13c>;
+			};
+		};
+	};
 };
diff --git a/arch/mips/boot/dts/brcm/bcm7360.dtsi b/arch/mips/boot/dts/brcm/bcm7360.dtsi
index 4b87ebec407a..f68285c2dff0 100644
--- a/arch/mips/boot/dts/brcm/bcm7360.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7360.dtsi
@@ -219,6 +219,17 @@
 			brcm,irq-can-wake;
 		};
 
+		aon_ctrl: syscon@408000 {
+			compatible = "brcm,brcmstb-aon-ctrl";
+			reg = <0x408000 0x100>, <0x408200 0x200>;
+			reg-names = "aon-ctrl", "aon-sram";
+		};
+
+		timers: timer@406680 {
+			compatible = "brcm,brcmstb-timers";
+			reg = <0x406680 0x40>;
+		};
+
 		upg_gio: gpio@406500 {
 			compatible = "brcm,brcmstb-gpio";
 			reg = <0x406500 0xa0>;
@@ -403,4 +414,38 @@
 			status = "disabled";
 		};
 	};
+
+	memory_controllers {
+		compatible = "simple-bus";
+		ranges = <0x0 0x103b0000 0xa000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		memory-controller@0 {
+			compatible = "brcm,brcmstb-memc", "simple-bus";
+			ranges = <0x0 0x0 0xa000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			memc-arb@1000 {
+				compatible = "brcm,brcmstb-memc-arb";
+				reg = <0x1000 0x248>;
+			};
+
+			memc-ddr@2000 {
+				compatible = "brcm,brcmstb-memc-ddr";
+				reg = <0x2000 0x300>;
+			};
+
+			ddr-phy@6000 {
+				compatible = "brcm,brcmstb-ddr-phy";
+				reg = <0x6000 0xc8>;
+			};
+
+			shimphy@8000 {
+				compatible = "brcm,brcmstb-ddr-shimphy";
+				reg = <0x8000 0x13c>;
+			};
+		};
+	};
 };
diff --git a/arch/mips/boot/dts/brcm/bcm7362.dtsi b/arch/mips/boot/dts/brcm/bcm7362.dtsi
index ca657df34b6d..a4bfa5f2b006 100644
--- a/arch/mips/boot/dts/brcm/bcm7362.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7362.dtsi
@@ -215,6 +215,17 @@
 			brcm,irq-can-wake;
 		};
 
+		aon_ctrl: syscon@408000 {
+			compatible = "brcm,brcmstb-aon-ctrl";
+			reg = <0x408000 0x100>, <0x408200 0x200>;
+			reg-names = "aon-ctrl", "aon-sram";
+		};
+
+		timers: timer@406680 {
+			compatible = "brcm,brcmstb-timers";
+			reg = <0x406680 0x40>;
+		};
+
 		upg_gio: gpio@406500 {
 			compatible = "brcm,brcmstb-gpio";
 			reg = <0x406500 0xa0>;
@@ -399,4 +410,38 @@
 			status = "disabled";
 		};
 	};
+
+	memory_controllers {
+		compatible = "simple-bus";
+		ranges = <0x0 0x103b0000 0xa000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		memory-controller@0 {
+			compatible = "brcm,brcmstb-memc", "simple-bus";
+			ranges = <0x0 0x0 0xa000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			memc-arb@1000 {
+				compatible = "brcm,brcmstb-memc-arb";
+				reg = <0x1000 0x248>;
+			};
+
+			memc-ddr@2000 {
+				compatible = "brcm,brcmstb-memc-ddr";
+				reg = <0x2000 0x300>;
+			};
+
+			ddr-phy@6000 {
+				compatible = "brcm,brcmstb-ddr-phy";
+				reg = <0x6000 0xc8>;
+			};
+
+			shimphy@8000 {
+				compatible = "brcm,brcmstb-ddr-shimphy";
+				reg = <0x8000 0x13c>;
+			};
+		};
+	};
 };
diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index e4fb9b6e6dce..6cb535235efa 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -242,6 +242,17 @@
 			brcm,irq-can-wake;
 		};
 
+		aon_ctrl: syscon@408000 {
+			compatible = "brcm,brcmstb-aon-ctrl";
+			reg = <0x408000 0x100>, <0x408200 0x200>;
+			reg-names = "aon-ctrl", "aon-sram";
+		};
+
+		timers: timer@4067c0 {
+			compatible = "brcm,brcmstb-timers";
+			reg = <0x4067c0 0x40>;
+		};
+
 		upg_gio: gpio@406700 {
 			compatible = "brcm,brcmstb-gpio";
 			reg = <0x406700 0x80>;
@@ -495,4 +506,65 @@
 			status = "disabled";
 		};
 	};
+
+	memory_controllers {
+		compatible = "simple-bus";
+		ranges = <0x0 0x103b0000 0x1a000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		memory-controller@0 {
+			compatible = "brcm,brcmstb-memc", "simple-bus";
+			ranges = <0x0 0x0 0xa000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			memc-arb@1000 {
+				compatible = "brcm,brcmstb-memc-arb";
+				reg = <0x1000 0x248>;
+			};
+
+			memc-ddr@2000 {
+				compatible = "brcm,brcmstb-memc-ddr";
+				reg = <0x2000 0x300>;
+			};
+
+			ddr-phy@6000 {
+				compatible = "brcm,brcmstb-ddr-phy";
+				reg = <0x6000 0xc8>;
+			};
+
+			shimphy@8000 {
+				compatible = "brcm,brcmstb-ddr-shimphy";
+				reg = <0x8000 0x13c>;
+			};
+		};
+
+		memory-controller@1 {
+			compatible = "brcm,brcmstb-memc", "simple-bus";
+			ranges = <0x0 0x10000 0xa000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			memc-arb@1000 {
+				compatible = "brcm,brcmstb-memc-arb";
+				reg = <0x1000 0x248>;
+			};
+
+			memc-ddr@2000 {
+				compatible = "brcm,brcmstb-memc-ddr";
+				reg = <0x2000 0x300>;
+			};
+
+			ddr-phy@6000 {
+				compatible = "brcm,brcmstb-ddr-phy";
+				reg = <0x6000 0xc8>;
+			};
+
+			shimphy@8000 {
+				compatible = "brcm,brcmstb-ddr-shimphy";
+				reg = <0x8000 0x13c>;
+			};
+		};
+	};
 };
diff --git a/arch/mips/boot/dts/brcm/bcm7435.dtsi b/arch/mips/boot/dts/brcm/bcm7435.dtsi
index 1484e8990e52..1e0545c7f5b7 100644
--- a/arch/mips/boot/dts/brcm/bcm7435.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7435.dtsi
@@ -257,6 +257,17 @@
 			brcm,irq-can-wake;
 		};
 
+		aon_ctrl: syscon@408000 {
+			compatible = "brcm,brcmstb-aon-ctrl";
+			reg = <0x408000 0x100>, <0x408200 0x200>;
+			reg-names = "aon-ctrl", "aon-sram";
+		};
+
+		timers: timer@4067c0 {
+			compatible = "brcm,brcmstb-timers";
+			reg = <0x4067c0 0x40>;
+		};
+
 		upg_gio: gpio@406700 {
 			compatible = "brcm,brcmstb-gpio";
 			reg = <0x406700 0x80>;
@@ -510,4 +521,65 @@
 			status = "disabled";
 		};
 	};
+
+	memory_controllers {
+		compatible = "simple-bus";
+		ranges = <0x0 0x103b0000 0x1a000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		memory-controller@0 {
+			compatible = "brcm,brcmstb-memc", "simple-bus";
+			ranges = <0x0 0x0 0xa000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			memc-arb@1000 {
+				compatible = "brcm,brcmstb-memc-arb";
+				reg = <0x1000 0x248>;
+			};
+
+			memc-ddr@2000 {
+				compatible = "brcm,brcmstb-memc-ddr";
+				reg = <0x2000 0x300>;
+			};
+
+			ddr-phy@6000 {
+				compatible = "brcm,brcmstb-ddr-phy";
+				reg = <0x6000 0xc8>;
+			};
+
+			shimphy@8000 {
+				compatible = "brcm,brcmstb-ddr-shimphy";
+				reg = <0x8000 0x13c>;
+			};
+		};
+
+		memory-controller@1 {
+			compatible = "brcm,brcmstb-memc", "simple-bus";
+			ranges = <0x0 0x10000 0xa000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			memc-arb@1000 {
+				compatible = "brcm,brcmstb-memc-arb";
+				reg = <0x1000 0x248>;
+			};
+
+			memc-ddr@2000 {
+				compatible = "brcm,brcmstb-memc-ddr";
+				reg = <0x2000 0x300>;
+			};
+
+			ddr-phy@6000 {
+				compatible = "brcm,brcmstb-ddr-phy";
+				reg = <0x6000 0xc8>;
+			};
+
+			shimphy@8000 {
+				compatible = "brcm,brcmstb-ddr-shimphy";
+				reg = <0x8000 0x13c>;
+			};
+		};
+	};
 };
-- 
2.15.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
