From: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 2/2] media: et8ek8: Add documentation
Date: Sat, 11 Jun 2016 14:14:40 +0300
Message-ID: <1465643680-21866-3-git-send-email-ivo.g.dimitrov.75@gmail.com>
References: <1465643680-21866-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1465643680-21866-1-git-send-email-ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sakari.ailus-X3B1VOXEql0@public.gmane.org
Cc: sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pali.rohar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add DT bindings description

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../bindings/media/i2c/toshiba,et8ek8.txt          | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
new file mode 100644
index 0000000..997d268
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/toshiba,et8ek8.txt
@@ -0,0 +1,50 @@
+Toshiba et8ek8 5MP sensor
+
+Toshiba et8ek8 5MP sensor is an image sensor found in Nokia N900 device
+
+More detailed documentation can be found in
+Documentation/devicetree/bindings/media/video-interfaces.txt .
+
+
+Mandatory properties
+--------------------
+
+- compatible: "toshiba,et8ek8"
+- reg: I2C address (0x3e, or an alternative address)
+- vana-supply: Analogue voltage supply (VANA), 2.8 volts
+- clocks: External clock to the sensor
+- clock-frequency: Frequency of the external clock to the sensor
+- reset-gpios: XSHUTDOWN GPIO
+
+
+Endpoint node mandatory properties
+----------------------------------
+
+- remote-endpoint: A phandle to the bus receiver's endpoint node.
+
+Endpoint node optional properties
+----------------------------------
+
+- clock-lanes: <0>
+- data-lanes: <1..n>
+
+Example
+-------
+
+&i2c3 {
+	clock-frequency = <400000>;
+
+	cam1: camera@3e {
+		compatible = "toshiba,et8ek8";
+		reg = <0x3e>;
+		vana-supply = <&vaux4>;
+		clocks = <&isp 0>;
+		clock-frequency = <9600000>;
+		reset-gpio = <&gpio4 6 GPIO_ACTIVE_HIGH>; /* 102 */
+		port {
+			csi_cam1: endpoint {
+				remote-endpoint = <&csi_out1>;
+			};
+		};
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
