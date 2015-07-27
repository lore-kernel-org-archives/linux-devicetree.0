From: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCHv2 5/8] iio: mma8452: add devicetree binding document
Date: Mon, 27 Jul 2015 16:59:56 +0200
Message-ID: <1438009196-28766-1-git-send-email-martink@posteo.de>
References: <20150727142005.GA10821@leverpostej>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150727142005.GA10821@leverpostej>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org, roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org, Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As we support more chips now, add a binding document and remove it from
i2c trivial-devices.txt list.

The binding document is further extended in a later patch of this series.

Signed-off-by: Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Signed-off-by: Christoph Muellner <christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
---
builds a nice list of supported compatible strings.

thanks!


 .../devicetree/bindings/i2c/trivial-devices.txt    |  1 -
 .../devicetree/bindings/iio/accel/mma8452.txt      | 24 ++++++++++++++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/mma8452.txt

diff --git a/Documentation/devicetree/bindings/i2c/trivial-devices.txt b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
index 00f8652..094238a 100644
--- a/Documentation/devicetree/bindings/i2c/trivial-devices.txt
+++ b/Documentation/devicetree/bindings/i2c/trivial-devices.txt
@@ -54,7 +54,6 @@ epson,rx8581		I2C-BUS INTERFACE REAL TIME CLOCK MODULE
 fsl,mag3110		MAG3110: Xtrinsic High Accuracy, 3D Magnetometer
 fsl,mc13892		MC13892: Power Management Integrated Circuit (PMIC) for i.MX35/51
 fsl,mma8450		MMA8450Q: Xtrinsic Low-power, 3-axis Xtrinsic Accelerometer
-fsl,mma8452		MMA8452Q: 3-axis 12-bit / 8-bit Digital Accelerometer
 fsl,mpr121		MPR121: Proximity Capacitive Touch Sensor Controller
 fsl,sgtl5000		SGTL5000: Ultra Low-Power Audio Codec
 gmt,g751		G751: Digital Temperature Sensor and Thermal Watchdog with Two-Wire Interface
diff --git a/Documentation/devicetree/bindings/iio/accel/mma8452.txt b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
new file mode 100644
index 0000000..57feb16
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
@@ -0,0 +1,24 @@
+Freescale MMA8452Q, MMA8453Q, MMA8652FC or MMA8653FC triaxial accelerometer
+
+Required properties:
+
+  - compatible: should contain one of
+    * "fsl,mma8653"
+    * "fsl,mma8652"
+    * "fsl,mma8453"
+    * "fsl,mma8452"
+  - reg: the I2C address of the chip
+
+Optional properties:
+
+  - interrupt-parent: should be the phandle for the interrupt controller
+  - interrupts: interrupt mapping for GPIO IRQ
+
+Example:
+
+	mma8653fc@1d {
+		compatible = "fsl,mma8653";
+		reg = <0x1d>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <5 0>;
+	};
-- 
2.1.4
