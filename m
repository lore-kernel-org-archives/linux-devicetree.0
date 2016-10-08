From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/2] Documentation: dt: iio: humidity: add hts221 sensor device binding
Date: Sat,  8 Oct 2016 09:45:52 +0200
Message-ID: <1475912752-6444-3-git-send-email-lorenzo.bianconi@st.com>
References: <1475912752-6444-1-git-send-email-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475912752-6444-1-git-send-email-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
---
 .../devicetree/bindings/iio/humidity/hts221.txt       | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/humidity/hts221.txt

diff --git a/Documentation/devicetree/bindings/iio/humidity/hts221.txt b/Documentation/devicetree/bindings/iio/humidity/hts221.txt
new file mode 100644
index 0000000..46a152c
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/humidity/hts221.txt
@@ -0,0 +1,19 @@
+* HTS221 STM humidity + temperature sensor
+
+Required properties:
+- compatible: should be "st,hts221"
+- reg: i2c address of the sensor / spi cs line
+
+Optional properties:
+- interrupts: interrupt mapping for GPIO IRQ. It should be configured with
+	      flags IRQ_TYPE_LEVEL_HIGH or IRQ_TYPE_EDGE_RISING
+- interrupt-parent: should be the phandle for the interrupt controller
+
+Example:
+
+hts221@5f {
+	compatible = "st,hts221";
+	reg = <0x5f>;
+	interrupt-parent = <&gpio0>;
+	interrupts = <0 IRQ_TYPE_EDGE_RISING>;
+};
-- 
2.7.4
