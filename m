From: Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH v9 2/2] [media] atmel-isc: DT binding for Image Sensor Controller driver
Date: Thu, 11 Aug 2016 15:06:42 +0800
Message-ID: <1470899202-13933-3-git-send-email-songjun.wu@microchip.com>
References: <1470899202-13933-1-git-send-email-songjun.wu@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1470899202-13933-1-git-send-email-songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

DT binding documentation for ISC driver.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Songjun Wu <songjun.wu-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
---

Changes in v9: None
Changes in v8: None
Changes in v7: None
Changes in v6:
- Add "iscck" and "gck" to clock-names.

Changes in v5:
- Add clock-output-names.

Changes in v4:
- Remove the isc clock nodes.

Changes in v3:
- Remove the 'atmel,sensor-preferred'.
- Modify the isc clock node according to the Rob's remarks.

Changes in v2:
- Remove the unit address of the endpoint.
- Add the unit address to the clock node.
- Avoid using underscores in node names.
- Drop the "0x" in the unit address of the i2c node.
- Modify the description of 'atmel,sensor-preferred'.
- Add the description for the ISC internal clock.

 .../devicetree/bindings/media/atmel-isc.txt        | 65 ++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/atmel-isc.txt

diff --git a/Documentation/devicetree/bindings/media/atmel-isc.txt b/Documentation/devicetree/bindings/media/atmel-isc.txt
new file mode 100644
index 0000000..bbe0e87c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/atmel-isc.txt
@@ -0,0 +1,65 @@
+Atmel Image Sensor Controller (ISC)
+----------------------------------------------
+
+Required properties for ISC:
+- compatible
+	Must be "atmel,sama5d2-isc".
+- reg
+	Physical base address and length of the registers set for the device.
+- interrupts
+	Should contain IRQ line for the ISC.
+- clocks
+	List of clock specifiers, corresponding to entries in
+	the clock-names property;
+	Please refer to clock-bindings.txt.
+- clock-names
+	Required elements: "hclock", "iscck", "gck".
+- #clock-cells
+	Should be 0.
+- clock-output-names
+	Should be "isc-mck".
+- pinctrl-names, pinctrl-0
+	Please refer to pinctrl-bindings.txt.
+
+ISC supports a single port node with parallel bus. It should contain one
+'port' child node with child 'endpoint' node. Please refer to the bindings
+defined in Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+isc: isc@f0008000 {
+	compatible = "atmel,sama5d2-isc";
+	reg = <0xf0008000 0x4000>;
+	interrupts = <46 IRQ_TYPE_LEVEL_HIGH 5>;
+	clocks = <&isc_clk>, <&iscck>, <&isc_gclk>;
+	clock-names = "hclock", "iscck", "gck";
+	#clock-cells = <0>;
+	clock-output-names = "isc-mck";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_isc_base &pinctrl_isc_data_8bit &pinctrl_isc_data_9_10 &pinctrl_isc_data_11_12>;
+
+	port {
+		isc_0: endpoint {
+			remote-endpoint = <&ov7740_0>;
+			hsync-active = <1>;
+			vsync-active = <0>;
+			pclk-sample = <1>;
+		};
+	};
+};
+
+i2c1: i2c@fc028000 {
+	ov7740: camera@21 {
+		compatible = "ovti,ov7740";
+		reg = <0x21>;
+		clocks = <&isc>;
+		clock-names = "xvclk";
+		assigned-clocks = <&isc>;
+		assigned-clock-rates = <24000000>;
+
+		port {
+			ov7740_0: endpoint {
+				remote-endpoint = <&isc_0>;
+			};
+		};
+	};
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
