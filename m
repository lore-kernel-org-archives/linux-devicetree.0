From: Song Qiang <songqiang1304521@gmail.com>
Subject: [PATCH v4 2/3] iio: magnetometer: Add DT support for PNI RM3100
Date: Fri, 12 Oct 2018 15:35:35 +0800
Message-ID: <20181012073536.20339-3-songqiang1304521@gmail.com>
References: <20181002143812.3661-1-songqiang1304521@gmail.com>
 <20181012073536.20339-1-songqiang1304521@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181012073536.20339-1-songqiang1304521@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, robh+dt@kernel.org, mark.rutland@arm.com, preid@electromag.com.au, himanshujha199640@gmail.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Song Qiang <songqiang1304521@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Song Qiang <songqiang1304521@gmail.com>
---
 .../bindings/iio/magnetometer/pni,rm3100.txt  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/pni,rm3100.txt

diff --git a/Documentation/devicetree/bindings/iio/magnetometer/pni,rm3100.txt b/Documentation/devicetree/bindings/iio/magnetometer/pni,rm3100.txt
new file mode 100644
index 000000000000..497c932e9e39
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/magnetometer/pni,rm3100.txt
@@ -0,0 +1,20 @@
+* PNI RM3100 3-axis magnetometer sensor
+
+Required properties:
+
+- compatible : should be "pni,rm3100"
+- reg : the I2C address or SPI chip select number of the sensor.
+
+Optional properties:
+
+- interrupts: data ready (DRDY) from the chip.
+  The interrupts can be triggered on level high.
+
+Example:
+
+rm3100: rm3100@20 {
+	compatible = "pni,rm3100";
+	reg = <0x20>;
+	interrupt-parent = <&gpio0>;
+	interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
2.17.1
