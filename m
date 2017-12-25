From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v7 2/2] mfd: syscon: Add hardware spinlock support
Date: Mon, 25 Dec 2017 14:37:10 +0800
Message-ID: <a878ad35d9f38c58d34dac0b331dca029b61a9b8.1514180039.git.baolin.wang@linaro.org>
References: <29fa88f883dae4c1f8a3acb2656cbd7c5a539d40.1514180039.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <29fa88f883dae4c1f8a3acb2656cbd7c5a539d40.1514180039.git.baolin.wang@linaro.org>
In-Reply-To: <29fa88f883dae4c1f8a3acb2656cbd7c5a539d40.1514180039.git.baolin.wang@linaro.org>
References: <29fa88f883dae4c1f8a3acb2656cbd7c5a539d40.1514180039.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com, broonie@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

Some system control registers need hardware spinlock to synchronize
between the multiple subsystems, so we should add hardware spinlock
support for syscon.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v6:
 - Treat hwlock id 0 as valid for regmap.

Changes since v5:
 - Fix the case that hwspinlock is not enabled.

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
 drivers/mfd/syscon.c                             |   19 +++++++++++++++++++
 2 files changed, 27 insertions(+)

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
index b93fe4c..7eaa40b 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -13,6 +13,7 @@
  */
 
 #include <linux/err.h>
+#include <linux/hwspinlock.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/list.h>
@@ -87,6 +88,24 @@ static struct syscon *of_syscon_register(struct device_node *np)
 	if (ret)
 		reg_io_width = 4;
 
+	ret = of_hwspin_lock_get_id(np, 0);
+	if (ret > 0 || (IS_ENABLED(CONFIG_HWSPINLOCK) && ret == 0)) {
+		syscon_config.use_hwlock = true;
+		syscon_config.hwlock_id = ret;
+		syscon_config.hwlock_mode = HWLOCK_IRQSTATE;
+	} else if (ret < 0) {
+		switch (ret) {
+		case -ENOENT:
+			/* Ignore missing hwlock, it's optional. */
+			break;
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
