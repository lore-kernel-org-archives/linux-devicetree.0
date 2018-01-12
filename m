From: Mark Brown <broonie@kernel.org>
Subject: Applied "mfd: syscon: Add hardware spinlock support" to the regmap tree
Date: Fri, 12 Jan 2018 20:01:46 +0000
Message-ID: <E1ea5WM-0008W2-8v@debutante>
References: <a878ad35d9f38c58d34dac0b331dca029b61a9b8.1514180039.git.baolin.wang@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a878ad35d9f38c58d34dac0b331dca029b61a9b8.1514180039.git.baolin.wang@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>, Mark Brown <broonie@kernel.org>lee.jones@linaro.org, arnd@arndb.de, robh+dt@kernel.org, mark.rutland@arm.combroonie@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, baolin.wang@linaro.orglinux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The patch

   mfd: syscon: Add hardware spinlock support

has been applied to the regmap tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

>From 3bafc09e779710abaa7b836fe3bbeeeab7754c2b Mon Sep 17 00:00:00 2001
From: Baolin Wang <baolin.wang@linaro.org>
Date: Mon, 25 Dec 2017 14:37:10 +0800
Subject: [PATCH] mfd: syscon: Add hardware spinlock support

Some system control registers need hardware spinlock to synchronize
between the multiple subsystems, so we should add hardware spinlock
support for syscon.

Signed-off-by: Baolin Wang <baolin.wang@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/devicetree/bindings/mfd/syscon.txt |  8 ++++++++
 drivers/mfd/syscon.c                             | 19 +++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.txt b/Documentation/devicetree/bindings/mfd/syscon.txt
index 8b92d4576c42..25d9e9c2fd53 100644
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
index b93fe4c4957a..7eaa40bc703f 100644
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
2.15.1
