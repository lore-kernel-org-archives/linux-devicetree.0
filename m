From: Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH 5/9] iio: mma8452: add devicetree documentation
Date: Sat,  4 Jul 2015 15:55:06 +0200
Message-ID: <1436018110-3903-6-git-send-email-martink@posteo.de>
References: <1436018110-3903-1-git-send-email-martink@posteo.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436018110-3903-1-git-send-email-martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org, roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Kepplinger <martink-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org>, Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Martin Kepplinger <martin.kepplinger-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
Signed-off-by: Christoph Muellner <christoph.muellner-SN7IsUiht6C/RdPyistoZJqQE7yCjDx5@public.gmane.org>
---
 .../devicetree/bindings/iio/accel/mma8452.txt       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/mma8452.txt

diff --git a/Documentation/devicetree/bindings/iio/accel/mma8452.txt b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
new file mode 100644
index 0000000..8d98e05
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/accel/mma8452.txt
@@ -0,0 +1,21 @@
+Freescale MMA8452Q, MMA8453Q, MMA8652FC or MMA8653FC triaxial accelerometer
+
+Required properties:
+
+  - compatible: should be "fsl,mma8653", "fsl,mma8652", "fsl,mma8453" or
+    "fsl,mma8452" respectively.
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
