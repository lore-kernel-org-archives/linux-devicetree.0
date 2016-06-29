From: Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>
Subject: [PATCH RESEND v2] mfd: sm501: Add device property
Date: Thu, 30 Jun 2016 01:56:59 +0900
Message-ID: <1467219419-22901-1-git-send-email-ysato@users.sourceforge.jp>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yoshinori Sato <ysato-Rn4VEauK+AKRv+LV9MX5uooqe+aC9MnS@public.gmane.org>
---
 Documentation/devicetree/bindings/mfd/sm501.txt | 45 +++++++++++++++++++++++++
 drivers/mfd/sm501.c                             |  9 +++++
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/sm501.txt

diff --git a/Documentation/devicetree/bindings/mfd/sm501.txt b/Documentation/devicetree/bindings/mfd/sm501.txt
new file mode 100644
index 0000000..9290094
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/sm501.txt
@@ -0,0 +1,45 @@
+* SM SM501
+
+The SM SM501 is a LCD controller, with proper hardware, it can also
+drive DVI monitors.
+
+Required properties:
+- compatible : should be "smi,sm501".
+- reg : contain two entries:
+    - First entry: System Configuration register
+    - Second entry: IO space (Display Controller register)
+- interrupts : SMI interrupt to the cpu should be described here.
+- interrupt-parent : the phandle for the interrupt controller that
+  services interrupts for this device.
+
+Optional properties:
+- mode : select a video mode:
+    <xres>x<yres>[-<bpp>][@<refresh>]
+- edid : verbatim EDID data block describing attached display.
+  Data from the detailed timing descriptor will be used to
+  program the display controller.
+- little-endian: available on big endian systems, to
+  set different foreign endian.
+- big-endian: available on little endian systems, to
+  set different foreign endian.
+- smi,devices: function block enable bitmap.
+	bit0: USB host
+	bit1: USB slave
+	bit2: SSP Ch0
+	bit3: SSP Ch1
+	bit4: UART Ch0
+	bit5: UART Ch1
+	bit6: Accelerator
+	bit7: AC97
+	bit8: I2S
+	bit9: GPIO
+
+Example for MPC5200:
+	display@1,0 {
+		compatible = "smi,sm501";
+		reg = <1 0x00000000 0x00800000
+		       1 0x03e00000 0x00200000>;
+		interrupts = <1 1 3>;
+		mode = "640x480-32@60";
+		edid = [edid-data];
+	};
diff --git a/drivers/mfd/sm501.c b/drivers/mfd/sm501.c
index 65cd0d2..e2e3f9b 100644
--- a/drivers/mfd/sm501.c
+++ b/drivers/mfd/sm501.c
@@ -21,6 +21,7 @@
 #include <linux/pci.h>
 #include <linux/i2c-gpio.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 
 #include <linux/sm501.h>
 #include <linux/sm501-regs.h>
@@ -1377,6 +1378,8 @@ static int sm501_plat_probe(struct platform_device *dev)
 {
 	struct sm501_devdata *sm;
 	int ret;
+	struct sm501_platdata private_platdata;
+	struct sm501_initdata private_initdata;
 
 	sm = kzalloc(sizeof(struct sm501_devdata), GFP_KERNEL);
 	if (sm == NULL) {
@@ -1388,6 +1391,12 @@ static int sm501_plat_probe(struct platform_device *dev)
 	sm->dev = &dev->dev;
 	sm->pdev_id = dev->id;
 	sm->platdata = dev_get_platdata(&dev->dev);
+	if (!sm->platdata) {
+		of_property_read_u32(dev->dev.of_node, "smi,devices",
+				     (u32 *)&private_initdata.devices);
+		private_platdata.init = &private_initdata;
+		sm->platdata = &private_platdata;
+	}
 
 	ret = platform_get_irq(dev, 0);
 	if (ret < 0) {
-- 
2.7.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
