From: Baolin Wang <baolin.wang@linaro.org>
Subject: [PATCH v2 2/2] mfd: syscon: Add hardware spinlock support
Date: Wed,  1 Nov 2017 10:11:56 +0800
Message-ID: <8bb857ed54569196d646084a9817a8a1985e2029.1509501110.git.baolin.wang@linaro.org>
References: <00b91de822135699da81f70c4d2b8fecbc113ab1.1509501110.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <00b91de822135699da81f70c4d2b8fecbc113ab1.1509501110.git.baolin.wang@linaro.org>
In-Reply-To: <00b91de822135699da81f70c4d2b8fecbc113ab1.1509501110.git.baolin.wang@linaro.org>
References: <00b91de822135699da81f70c4d2b8fecbc113ab1.1509501110.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, gregkh@linuxfoundation.org, lee.jones@linaro.org, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, baolin.wang@linaro.org
List-Id: devicetree@vger.kernel.org

Some system control registers need hardware spinlock to synchronize
between the multiple subsystems, so we should add hardware spinlock
support for syscon.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
---
Changes since v1:
 - Remove timeout configuration.
 - Modify the binding file to add hwlocks.
---
 Documentation/devicetree/bindings/mfd/syscon.txt |    1 +
 drivers/mfd/syscon.c                             |    7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
index 408f768..3120fdf 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.txt
+++ b/Documentation/devicetree/bindings/mfd/syscon.txt
@@ -16,6 +16,7 @@ Required properties:
 Optional property:
 - reg-io-width: the size (in bytes) of the IO accesses that should be
   performed on the device.
+- hwlocks: reference to a phandle of a hardware spinlock provider node.
 
 Examples:
 gpr: iomuxc-gpr@020e0000 {
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
1.7.9.5
