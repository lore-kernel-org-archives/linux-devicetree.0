From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH] drivers/amba: add reset control to primecell probe
Date: Thu,  1 Aug 2019 13:43:46 -0500
Message-ID: <20190801184346.7015-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: dinguyen@kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, keescook@chromium.org, anton@enomsg.org, ccross@android.com, tony.luck@intel.com, Dinh Nguyen <dinh.nguyen@intel.com>
List-Id: devicetree@vger.kernel.org

From: Dinh Nguyen <dinh.nguyen@intel.com>

The primecell controller on some SoCs, i.e. SoCFPGA, is held in reset by
default. Until recently, the DMA controller was brought out of reset by the
bootloader(i.e. U-Boot). But a recent change in U-Boot, the peripherals that
are not used are held in reset and are left to Linux to bring them out of
reset.

Add a mechanism for getting the reset property and de-assert the primecell
module from reset if found. This is a not a hard fail if the reset property
is not present in the device tree node, so the driver will continue to probe.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/of/platform.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 7801e25e6895..d8945705313d 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -21,6 +21,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 
 const struct of_device_id of_default_bus_match_table[] = {
 	{ .compatible = "simple-bus", },
@@ -229,6 +230,7 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
 	struct amba_device *dev;
 	const void *prop;
 	int i, ret;
+	struct reset_control *rstc;
 
 	pr_debug("Creating amba device %pOF\n", node);
 
@@ -270,6 +272,18 @@ static struct amba_device *of_amba_device_create(struct device_node *node,
 		goto err_free;
 	}
 
+	/*
+	 * reset control of the primecell block is optional
+	 * and will not fail if the reset property is not found.
+	 */
+	rstc = of_reset_control_get_exclusive(node, "dma");
+	if (!IS_ERR(rstc)) {
+		reset_control_deassert(rstc);
+		reset_control_put(rstc);
+	} else {
+		pr_debug("amba: reset control not found\n");
+	}
+
 	ret = amba_device_add(dev, &iomem_resource);
 	if (ret) {
 		pr_err("amba_device_add() failed (%d) for %pOF\n",
-- 
2.20.0
