From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v4] mfd: syscon: Add hardware spinlock support
Date: Thu, 30 Nov 2017 10:38:30 +0800
Message-ID: <2344ec4123c8b0985e54e03a0fa1bfe8d5e68235.1512009343.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: broonie@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

Some system control registers need hardware spinlock to synchronize
between the multiple subsystems, so we should add hardware spinlock
support for syscon.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v3:
 - Add error handling for of_hwspin_lock_get_id()

Changes since v2:
 - Add acked tag from Rob.

Changes since v1:
 - Remove timeout configuration.
 - Modify the binding file to add hwlocks.
---
 Documentation/devicetree/bindings/mfd/syscon.txt |    1 +
 drivers/mfd/syscon.c                             |   21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

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
index b93fe4c..caf6a25 100644
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
+			/* ignore missing hwlock, it's optional */
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
