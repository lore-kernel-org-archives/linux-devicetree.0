From: Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3 2/2] iio: light: opt3001: Add device tree binding documentation
Date: Thu, 2 Jul 2015 17:27:59 -0500
Message-ID: <1435876079-26287-3-git-send-email-dannenberg@ti.com>
References: <1435876079-26287-1-git-send-email-dannenberg@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435876079-26287-1-git-send-email-dannenberg-l0cyMroinI0@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas Dannenberg <dannenberg-l0cyMroinI0@public.gmane.org>
---
 .../devicetree/bindings/iio/light/opt3001.txt          | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/opt3001.txt

diff --git a/Documentation/devicetree/bindings/iio/light/opt3001.txt b/Documentation/devicetree/bindings/iio/light/opt3001.txt
new file mode 100644
index 0000000..d5f0765
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/opt3001.txt
@@ -0,0 +1,18 @@
+* Texas Instruments OPT3001 Ambient Light Sensor
+
+http://www.ti.com/product/opt3001
+
+Required properties:
+  - compatible: should be "ti,opt3001"
+  - reg: the I2C address of the sensor
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
1.9.1
