From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] dt-bindings: iio: light: add UVIS25 device bindings
Date: Wed, 25 Oct 2017 20:16:09 +0200
Message-ID: <20171025181609.3803-3-lorenzo.bianconi@st.com>
References: <20171025181609.3803-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171025181609.3803-1-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/iio/light/st_uvis25.txt    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/st_uvis25.txt

diff --git a/Documentation/devicetree/bindings/iio/light/st_uvis25.txt b/Documentation/devicetree/bindings/iio/light/st_uvis25.txt
new file mode 100644
index 000000000000..3041207e3f3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/st_uvis25.txt
@@ -0,0 +1,23 @@
+* ST UVIS25 uv sensor
+
+Required properties:
+- compatible: should be "st,uvis25"
+- reg: i2c address of the sensor / spi cs line
+
+Optional properties:
+- interrupt-parent: should be the phandle for the interrupt controller
+- interrupts: interrupt mapping for IRQ. It should be configured with
+  flags IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_EDGE_RISING, IRQ_TYPE_LEVEL_LOW or
+  IRQ_TYPE_EDGE_FALLING.
+
+  Refer to interrupt-controller/interrupts.txt for generic interrupt
+  client node bindings.
+
+Example:
+
+uvis25@47 {
+	compatible = "st,uvis25";
+	reg = <0x47>;
+	interrupt-parent = <&gpio0>;
+	interrupts = <0 IRQ_TYPE_EDGE_RISING>;
+};
-- 
2.14.2
