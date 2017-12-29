From: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v2 2/4] [media] dt/bindings: Add bindings for OV5695
Date: Fri, 29 Dec 2017 16:08:23 +0800
Message-ID: <1514534905-21393-2-git-send-email-zhengsq@rock-chips.com>
References: <1514534905-21393-1-git-send-email-zhengsq@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1514534905-21393-1-git-send-email-zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ddl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding documentation for the OV5695 sensor.

Signed-off-by: Shunqian Zheng <zhengsq-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---
 .../devicetree/bindings/media/i2c/ov5695.txt       | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5695.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5695.txt b/Documentation/devicetree/bindings/media/i2c/ov5695.txt
new file mode 100644
index 0000000..8d87dbc
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov5695.txt
@@ -0,0 +1,38 @@
+* Omnivision OV5695 MIPI CSI-2 sensor
+
+Required Properties:
+- compatible: should be "ovti,ov5695"
+- clocks: reference to the 24M xvclk input clock.
+- clock-names: should be "xvclk".
+- dovdd-supply: Digital I/O voltage supply, 1.8 volts
+- avdd-supply: Analog voltage supply, 2.8 volts
+- dvdd-supply: Digital core voltage supply, 1.2 volts
+- reset-gpios: Low active reset gpio
+
+The device node must contain one 'port' child node for its digital output
+video port, in accordance with the video interface bindings defined in
+Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+Example:
+&i2c1: camera-sensor@36 {
+	compatible = "ovti,ov5695";
+	reg = <0x36>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&clk_24m_cam>;
+
+	clocks = <&cru SCLK_TESTCLKOUT1>;
+	clock-names = "xvclk";
+
+	avdd-supply = <&pp2800_cam>;
+	dvdd-supply = <&pp1250_cam>;
+	dovdd-supply = <&pp1800>;
+
+	reset-gpios = <&gpio2 5 GPIO_ACTIVE_LOW>;
+
+	port {
+		wcam_out: endpoint {
+			remote-endpoint = <&mipi_in_wcam>;
+			data-lanes = <1 2>;
+		};
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
