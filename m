From: Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] iio: light: opt3001: Add device tree binding documentation
Date: Fri, 29 Jan 2016 13:03:00 -0600
Message-ID: <1454094180-2688-1-git-send-email-dannenberg@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Alexander Koch <mail-y2PnNNZjvYd4VEKF+Mn3m16hYfS7NtTn@public.gmane.org>, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnuzQB+pC5nmwQ@public.gmane.org, mhornung.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, fengguang.wu-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/iio/light/opt3001.txt      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/opt3001.txt

diff --git a/Documentation/devicetree/bindings/iio/light/opt3001.txt b/Documentation/devicetree/bindings/iio/light/opt3001.txt
new file mode 100644
index 0000000..55b9cb3
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/opt3001.txt
@@ -0,0 +1,26 @@
+* Texas Instruments OPT3001 Ambient Light Sensor
+
+The driver supports interrupt-driven and interrupt-less operation, depending
+on whether an interrupt property has been populated into the DT. Note that
+the optional generation of IIO events on rising/falling light threshold changes
+requires the use of interrupts. Without interrupts, only the simple reading
+of the current light value is supported through the IIO API.
+
+http://www.ti.com/product/opt3001
+
+Required properties:
+  - compatible: should be "ti,opt3001"
+  - reg: the I2C address of the sensor
+  
+Optional properties:
+  - interrupt-parent: should be the phandle for the interrupt controller
+  - interrupts: interrupt mapping for GPIO IRQ (configure for falling edge)
+
+Example:
+
+opt3001@44 {
+	compatible = "ti,opt3001";
+	reg = <0x44>;
+	interrupt-parent = <&gpio1>;
+	interrupts = <28 IRQ_TYPE_EDGE_FALLING>;
+};
-- 
2.6.4
