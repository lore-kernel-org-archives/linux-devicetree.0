From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v5] mfd: syscon: Add hardware spinlock support
Date: Thu, 30 Nov 2017 17:10:57 +0800
Message-ID: <9bd0bfdaf4e869e6216a0ef032b52cd28b33ab16.1512032962.git.baolin.wang@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Some system control registers need hardware spinlock to synchronize
between the multiple subsystems, so we should add hardware spinlock
support for syscon.

Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes since v4:
 - Add one exapmle to show how to add hwlock.
 - Fix the coding style issue.

Changes since v3:
 - Add error handling for of_hwspin_lock_get_id()

Changes since v2:
 - Add acked tag from Rob.

Changes since v1:
 - Remove timeout configuration.
 - Modify the binding file to add hwlocks.
---
 Documentation/devicetree/bindings/mfd/syscon.txt |    8 ++++++++
 drivers/mfd/syscon.c                             |   21 +++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
index 8b92d45..25d9e9c 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.txt
+++ b/Documentation/devicetree/bindings/mfd/syscon.txt
@@ -16,9 +16,17 @@ Required properties:
 Optional property:
 - reg-io-width: the size (in bytes) of the IO accesses that should be
   performed on the device.
+- hwlocks: reference to a phandle of a hardware spinlock provider node.
 
 Examples:
 gpr: iomuxc-gpr@20e0000 {
 	compatible = "fsl,imx6q-iomuxc-gpr", "syscon";
 	reg = <0x020e0000 0x38>;
+	hwlocks = <&hwlock1 1>;
+};
+
+hwlock1: hwspinlock@40500000 {
+	...
+	reg = <0x40500000 0x1000>;
+	#hwlock-cells = <1>;
 };
diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index b93fe4c..5b67dbc 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/hwspinlock.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/list.h>
@@ -87,6 +88,26 @@ static struct syscon *of_syscon_register(struct device_node *np)
 	if (ret)
 		reg_io_width = 4;
 
+	ret = of_hwspin_lock_get_id(np, 0);
+	if (ret > 0) {
+		syscon_config.hwlock_id = ret;
+		syscon_config.hwlock_mode = HWLOCK_IRQSTATE;
+	} else {
+		switch (ret) {
+		case -ENOENT:
+			/* Ignore missing hwlock, it's optional. */
+			break;
+		case 0:
+			ret = -EINVAL;
+			/* fall-through */
+		default:
+			pr_err("Failed to retrieve valid hwlock: %d\n", ret);
+			/* fall-through */
+		case -EPROBE_DEFER:
+			goto err_regmap;
+		}
+	}
+
 	syscon_config.reg_stride = reg_io_width;
 	syscon_config.val_bits = reg_io_width * 8;
 	syscon_config.max_register = resource_size(&res) - reg_io_width;
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
