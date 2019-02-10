From: Robert Eshleman <bobbyeshleman@gmail.com>
Subject: [PATCH 3/3] dt-bindings: iio: light: Add ap3216c
Date: Sun, 10 Feb 2019 12:39:47 -0800
Message-ID: <f689aae31740bac50a4993ee51d837a93691e6f1.1549828313.git.bobbyeshleman@gmail.com>
References: <89716a4433cd83aea5f4200359b184b0ee2cc8bd.1549828313.git.bobbyeshleman@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <89716a4433cd83aea5f4200359b184b0ee2cc8bd.1549828313.git.bobbyeshleman@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: bobbyeshleman@gmail.com
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Adds device tree bindings for the ap3216c ambient light and proximity
sensor.

Signed-off-by: Robert Eshleman <bobbyeshleman@gmail.com>
---
 .../devicetree/bindings/iio/light/ap3216c.txt | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ap3216c.txt

diff --git a/Documentation/devicetree/bindings/iio/light/ap3216c.txt b/Documentation/devicetree/bindings/iio/light/ap3216c.txt
new file mode 100644
index 000000000000..c5ae80c79dd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/light/ap3216c.txt
@@ -0,0 +1,22 @@
+* AP3216C Ambient Light and Proximity Sensor
+
+Required properties:
+  - compatible: should be "liteon,ap3216c"
+  - reg: the I2C address of the sensor (default is <0x1e>)
+
+Optional properties:
+  - interrupts: interrupt mapping for GPIO IRQ. Should be configured with
+    IRQ_TYPE_EDGE_FALLING.
+
+Refer to interrupt-controller/interrupts.txt for generic interrupt client
+node bindings.
+
+Example:
+
+light-sensor@1e {
+	compatible = "liteon,ap3216c";
+	reg = <0x1e>;
+
+	interrupt-parent = <&gpio1>;
+	interrupts = <17 IRQ_TYPE_EDGE_FALLING>;
+};
-- 
2.20.1
