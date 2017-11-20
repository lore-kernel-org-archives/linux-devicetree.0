From: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3] mfd: syscon: Add hardware spinlock support
Date: Mon, 20 Nov 2017 14:54:16 +0800
Message-ID: <e6b3e6532abf42e6e13919e65d79908cd5e02137.1511159909.git.baolin.wang@linaro.org>
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
Changes since v2:
 - Add acked tag from Rob.

Changes since v1:
 - Remove timeout configuration.
 - Modify the binding file to add hwlocks.

Note: The hwspinlock support in regmap was merged by commit:
(8698b9364710: "regmap: Add hardware spinlock support")
The hwspinlock was changed to a bool by commit:
(d048236dfdfe: "hwspinlock: Change hwspinlock to a bool")
---
 Documentation/devicetree/bindings/mfd/syscon.txt | 1 +
 drivers/mfd/syscon.c                             | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
index 8b92d45..f464cc8 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.txt
+++ b/Documentation/devicetree/bindings/mfd/syscon.txt
@@ -16,6 +16,7 @@ Required properties:
 Optional property:
 - reg-io-width: the size (in bytes) of the IO accesses that should be
   performed on the device.
+- hwlocks: reference to a phandle of a hardware spinlock provider node.
 
 Examples:
 gpr: iomuxc-gpr@20e0000 {
diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index b93fe4c..f1dccce 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/hwspinlock.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/list.h>
@@ -87,6 +88,12 @@ static struct syscon *of_syscon_register(struct device_node *np)
 	if (ret)
 		reg_io_width = 4;
 
+	ret = of_hwspin_lock_get_id(np, 0);
+	if (ret > 0) {
+		syscon_config.hwlock_id = ret;
+		syscon_config.hwlock_mode = HWLOCK_IRQSTATE;
+	}
+
 	syscon_config.reg_stride = reg_io_width;
 	syscon_config.val_bits = reg_io_width * 8;
 	syscon_config.max_register = resource_size(&res) - reg_io_width;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
