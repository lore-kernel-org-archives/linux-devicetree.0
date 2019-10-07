From: Roger Quadros <rogerq@ti.com>
Subject: [PATCH 1/2] dt-bindings: usb: Add binding for the TI wrapper for Cadence USB3 controller
Date: Mon, 7 Oct 2019 14:41:41 +0300
Message-ID: <20191007114142.5182-2-rogerq@ti.com>
References: <20191007114142.5182-1-rogerq@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007114142.5182-1-rogerq@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: felipe.balbi@linux.intel.com
Cc: gregkh@linuxfoundation.org, pawell@cadence.com, nsekhar@ti.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Roger Quadros <rogerq@ti.com>
List-Id: devicetree@vger.kernel.org

TI platforms have a wrapper module around the Cadence USB3
controller. Add binding information for that.

Signed-off-by: Roger Quadros <rogerq@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 .../devicetree/bindings/usb/cdns-usb3-ti.txt  | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/cdns-usb3-ti.txt

diff --git a/Documentation/devicetree/bindings/usb/cdns-usb3-ti.txt b/Documentation/devicetree/bindings/usb/cdns-usb3-ti.txt
new file mode 100644
index 000000000000..12c7c903e6da
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/cdns-usb3-ti.txt
@@ -0,0 +1,59 @@
+Binding for the TI specific wrapper for the Cadence USBSS-DRD controller
+
+Required properties:
+  - compatible: Should contain "ti,j721e-usb"
+  - reg: Physical base address and size of the wrappers register area.
+  - power-domains: Should contain a phandle to a PM domain provider node
+                   and an args specifier containing the USB device id
+                   value. This property is as per the binding documentation:
+                   Documentation/devicetree/bindings/soc/ti/sci-pm-domain.txt
+  - clocks: Clock phandles to usb2_refclk and lpm_clk
+  - clock-names: Should contain "usb2_refclk" and "lpm_clk"
+
+Optional properties:
+ - ti,usb2-only: If present, it restricts the controller to USB2.0 mode of
+		 operation. Must be present if USB3 PHY is not available
+		 for USB.
+ - ti,modestrap-host: Set controller modestrap to HOST mode.
+ - ti,modestrap-peripheral: Set controller modestrap to PERIPHERAL mode.
+ - ti,vbus-divider: Should be present if USB VBUS line is connected to the
+		 VBUS pin of the SoC via a 1/3 voltage divider.
+
+Sub-nodes:
+The USB2 PHY and the Cadence USB3 controller should be the sub-nodes.
+
+Example:
+
+	ti_usb0: cdns_usb@4104000 {
+		compatible = "ti,j721e-usb";
+		reg = <0x00 0x4104000 0x00 0x100>;
+		power-domains = <&k3_pds 288 TI_SCI_PD_EXCLUSIVE>;
+		clocks = <&k3_clks 288 15>, <&k3_clks 288 3>;
+		clock-names = "usb2_refclk", "lpm_clk";
+		assigned-clocks = <&k3_clks 288 15>;	/* USB2_REFCLK */
+		assigned-clock-parents = <&k3_clks 288 16>; /* HFOSC0 */
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		phy@4108000 {
+			compatible = "ti,j721e-usb2-phy";
+			reg = <0x00 0x4108000 0x00 0x400>;
+		};
+
+		usb0: usb@6000000 {
+			compatible = "cdns,usb3-1.0.1";
+			reg = <0x00 0x6000000 0x00 0x10000>,
+			      <0x00 0x6010000 0x00 0x10000>,
+			      <0x00 0x6020000 0x00 0x10000>;
+			reg-names = "otg", "xhci", "dev";
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,	/* irq.0 */
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,	/* irq.6 */
+				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;	/* otgirq.0 */
+			interrupt-names = "host",
+					  "peripheral",
+					  "otg";
+			maximum-speed = "super-speed";
+			dr_mode = "otg";
+		};
+	};
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
