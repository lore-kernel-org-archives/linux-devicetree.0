From: Ramiro Oliveira <Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/2] Add OV5647 device tree documentation
Date: Fri,  3 Jun 2016 18:36:40 +0100
Message-ID: <4221809485a46dbf12b883a8207784553fd776a3.1464966020.git.roliveir@synopsys.com>
References: <cover.1464966020.git.roliveir@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1464966020.git.roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
In-Reply-To: <cover.1464966020.git.roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
References: <cover.1464966020.git.roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mchehab-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Ramiro.Oliveira-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, CARLOS.PALMINHA-HKixBCOQz3hWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: roliveir <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

Signed-off-by: Ramiro Oliveira <roliveir-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/media/i2c/ov5647.txt          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov5647.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.txt b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
new file mode 100644
index 0000000..5e4aa49
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov5647.txt
@@ -0,0 +1,19 @@
+Omnivision OV5657 raw image sensor
+---------------------------------
+
+OV5657 is a raw image sensor with MIPI CSI-2 and CCP2 image data interfaces
+and CCI (I2C compatible) control bus.
+
+Required properties:
+
+- compatible	: "ov5647";
+- reg		: I2C slave address of the sensor;
+
+The common video interfaces bindings (see video-interfaces.txt) should be
+used to specify link to the image data receiver. The OV5647 device
+node should contain one 'port' child node with an 'endpoint' subnode.
+
+Following properties are valid for the endpoint node:
+
+- data-lanes : (optional) specifies MIPI CSI-2 data lanes as covered in
+  video-interfaces.txt.  The sensor supports only two data lanes.
-- 
2.8.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
