From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 06/11] ARM: dts: imx7: Move nodes which have no reg property out of bus
Date: Wed, 29 Nov 2017 16:54:39 -0200
Message-ID: <1511981684-13433-6-git-send-email-festevam@gmail.com>
References: <1511981684-13433-1-git-send-email-festevam@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511981684-13433-1-git-send-email-festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

Move usbphynop1, usbphynop2, usbhypnop3, replicator and timer and nodes
from soc node to root node.

The nodes that have been moved do not have any register properties and thus
shouldn't be placed on the bus.

This fixes the following build warnings with W=1:

arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (simple_bus_reg): Node /soc/replicator missing or empty reg/ranges property
arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (simple_bus_reg): Node /soc/aips-bus@30800000/usbphynop1 missing or empty reg/ranges property
arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (simple_bus_reg): Node /soc/aips-bus@30800000/usbphynop3 missing or empty reg/ranges property
arch/arm/boot/dts/imx7d-cl-som-imx7.dtb: Warning (simple_bus_reg): Node /soc/aips-bus@30800000/usbphynop2 missing or empty reg/ranges property

Based on a patch from Simon Horman for r8a7795.dtsi.

Signed-off-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
Changes since v1:
- None

 arch/arm/boot/dts/imx7d.dtsi |  14 ++---
 arch/arm/boot/dts/imx7s.dtsi | 120 +++++++++++++++++++++----------------------
 2 files changed, 67 insertions(+), 67 deletions(-)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index 7878257..9d92725 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -63,6 +63,13 @@
 		};
 	};
 
+	usbphynop2: usbphynop2 {
+		compatible = "usb-nop-xceiv";
+		clocks = <&clks IMX7D_USB_PHY2_CLK>;
+		clock-names = "main_clk";
+		#phy-cells = <0>;
+	};
+
 	soc {
 		etm@3007d000 {
 			compatible = "arm,coresight-etm3x", "arm,primecell";
@@ -105,13 +112,6 @@
 		reg = <0x30b20200 0x200>;
 	};
 
-	usbphynop2: usbphynop2 {
-		compatible = "usb-nop-xceiv";
-		clocks = <&clks IMX7D_USB_PHY2_CLK>;
-		clock-names = "main_clk";
-		#phy-cells = <0>;
-	};
-
 	fec2: ethernet@30bf0000 {
 		compatible = "fsl,imx7d-fec", "fsl,imx6sx-fec";
 		reg = <0x30bf0000 0x10000>;
diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index e718fd2..81467ac 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -116,6 +116,66 @@
 		clock-output-names = "osc";
 	};
 
+	usbphynop1: usbphynop1 {
+		compatible = "usb-nop-xceiv";
+		clocks = <&clks IMX7D_USB_PHY1_CLK>;
+		clock-names = "main_clk";
+		#phy-cells = <0>;
+	};
+
+	usbphynop3: usbphynop3 {
+		compatible = "usb-nop-xceiv";
+		clocks = <&clks IMX7D_USB_HSIC_ROOT_CLK>;
+		clock-names = "main_clk";
+		#phy-cells = <0>;
+	};
+
+
+	replicator {
+		/*
+		 * non-configurable replicators don't show up on the
+		 * AMBA bus.  As such no need to add "arm,primecell"
+		 */
+		compatible = "arm,coresight-replicator";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+				/* replicator output ports */
+			port@0 {
+				reg = <0>;
+				replicator_out_port0: endpoint {
+					remote-endpoint = <&tpiu_in_port>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				replicator_out_port1: endpoint {
+					remote-endpoint = <&etr_in_port>;
+				};
+			};
+
+			/* replicator input port */
+			port@2 {
+				reg = <0>;
+				replicator_in_port0: endpoint {
+					slave-mode;
+					remote-endpoint = <&etf_out_port>;
+				};
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -260,43 +320,6 @@
 			};
 		};
 
-		replicator {
-			/*
-			 * non-configurable replicators don't show up on the
-			 * AMBA bus.  As such no need to add "arm,primecell"
-			 */
-			compatible = "arm,coresight-replicator";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				/* replicator output ports */
-				port@0 {
-					reg = <0>;
-					replicator_out_port0: endpoint {
-						remote-endpoint = <&tpiu_in_port>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-					replicator_out_port1: endpoint {
-						remote-endpoint = <&etr_in_port>;
-					};
-				};
-
-				/* replicator input port */
-				port@2 {
-					reg = <0>;
-					replicator_in_port0: endpoint {
-						slave-mode;
-						remote-endpoint = <&etf_out_port>;
-					};
-				};
-			};
-		};
-
 		intc: interrupt-controller@31001000 {
 			compatible = "arm,cortex-a7-gic";
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -309,15 +332,6 @@
 			      <0x31006000 0x2000>;
 		};
 
-		timer {
-			compatible = "arm,armv7-timer";
-			interrupt-parent = <&intc>;
-			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-				     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-				     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
-		};
-
 		aips1: aips-bus@30000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
@@ -945,20 +959,6 @@
 				reg = <0x30b30200 0x200>;
 			};
 
-			usbphynop1: usbphynop1 {
-				compatible = "usb-nop-xceiv";
-				clocks = <&clks IMX7D_USB_PHY1_CLK>;
-				clock-names = "main_clk";
-				#phy-cells = <0>;
-			};
-
-			usbphynop3: usbphynop3 {
-				compatible = "usb-nop-xceiv";
-				clocks = <&clks IMX7D_USB_HSIC_ROOT_CLK>;
-				clock-names = "main_clk";
-				#phy-cells = <0>;
-			};
-
 			usdhc1: usdhc@30b40000 {
 				compatible = "fsl,imx7d-usdhc", "fsl,imx6sl-usdhc";
 				reg = <0x30b40000 0x10000>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
