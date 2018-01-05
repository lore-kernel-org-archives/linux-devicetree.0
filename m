From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 09/10] drm: xlnx: ZynqMP DP subsystem DRM KMS driver
Date: Thu, 4 Jan 2018 18:05:58 -0800
Message-ID: <1515117959-18068-10-git-send-email-hyun.kwon@xilinx.com>
References: <1515117959-18068-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515117959-18068-1-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a wrapper around the ZynqMP Display and DisplayPort drivers.

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/drm/xlnx/Kconfig        |  11 +++
 drivers/gpu/drm/xlnx/Makefile       |   3 +
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 141 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |  19 +++++
 4 files changed, 174 insertions(+)
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dpsub.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dpsub.h

diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index 19fd7cd..7c5529c 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -10,3 +10,14 @@ config DRM_XLNX
 	  display pipeline using Xilinx IPs in FPGA. This module
 	  provides the kernel mode setting functionalities
 	  for Xilinx display drivers.
+
+config DRM_ZYNQMP_DPSUB
+	tristate "ZynqMP DP Subsystem Driver"
+	depends on ARCH_ZYNQMP && OF && DRM_XLNX && COMMON_CLK
+	select DMA_ENGINE
+	select GENERIC_PHY
+	help
+	  DRM KMS driver for ZynqMP DP Subsystem controller. Choose
+	  this option if you have a Xilinx ZynqMP SoC with DisplayPort
+	  subsystem. The driver provides the kernel mode setting
+	  functionlaities for ZynqMP DP subsystem.
diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
index c60a281..064a05a 100644
--- a/drivers/gpu/drm/xlnx/Makefile
+++ b/drivers/gpu/drm/xlnx/Makefile
@@ -1,2 +1,5 @@
 xlnx_drm-objs += xlnx_crtc.o xlnx_drv.o xlnx_fb.o xlnx_gem.o
 obj-$(CONFIG_DRM_XLNX) += xlnx_drm.o
+
+zynqmp-dpsub-objs += zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o
+obj-$(CONFIG_DRM_ZYNQMP_DPSUB) += zynqmp-dpsub.o
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
new file mode 100644
index 0000000..ccca798
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -0,0 +1,141 @@
+/*
+ * ZynqMP DP Subsystem Driver
+ *
+ *  Copyright (C) 2017 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#include <linux/component.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#include "zynqmp_disp.h"
+#include "zynqmp_dp.h"
+#include "zynqmp_dpsub.h"
+
+static int
+zynqmp_dpsub_bind(struct device *dev, struct device *master, void *data)
+{
+	int ret;
+
+	ret = zynqmp_disp_bind(dev, master, data);
+	if (ret)
+		return ret;
+
+	/* zynqmp_disp should bind first, so zynqmp_dp encoder can find crtc */
+	ret = zynqmp_dp_bind(dev, master, data);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void
+zynqmp_dpsub_unbind(struct device *dev, struct device *master, void *data)
+{
+	zynqmp_dp_unbind(dev, master, data);
+	zynqmp_disp_unbind(dev, master, data);
+}
+
+static const struct component_ops zynqmp_dpsub_component_ops = {
+	.bind	= zynqmp_dpsub_bind,
+	.unbind	= zynqmp_dpsub_unbind,
+};
+
+static int zynqmp_dpsub_probe(struct platform_device *pdev)
+{
+	struct zynqmp_dpsub *dpsub;
+	int ret;
+
+	dpsub = devm_kzalloc(&pdev->dev, sizeof(*dpsub), GFP_KERNEL);
+	if (!dpsub)
+		return -ENOMEM;
+
+	/* Sub-driver will access dpsub from drvdata */
+	platform_set_drvdata(pdev, dpsub);
+	pm_runtime_enable(&pdev->dev);
+
+	/*
+	 * DP should be probed first so that the zynqmp_disp can set the output
+	 * format accordingly.
+	 */
+	ret = zynqmp_dp_probe(pdev);
+	if (ret)
+		goto err_pm;
+
+	ret = zynqmp_disp_probe(pdev);
+	if (ret)
+		goto err_dp;
+
+	ret = component_add(&pdev->dev, &zynqmp_dpsub_component_ops);
+	if (ret)
+		goto err_disp;
+
+	/* Populate the sound child nodes */
+	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to populate child nodes\n");
+		goto err_component;
+	}
+
+	dev_info(&pdev->dev, "ZynqMP DisplayPort Subsystem driver probed");
+
+	return 0;
+
+err_component:
+	component_del(&pdev->dev, &zynqmp_dpsub_component_ops);
+err_disp:
+	zynqmp_disp_remove(pdev);
+err_dp:
+	zynqmp_dp_remove(pdev);
+err_pm:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
+}
+
+static int zynqmp_dpsub_remove(struct platform_device *pdev)
+{
+	int err, ret = 0;
+
+	of_platform_depopulate(&pdev->dev);
+	component_del(&pdev->dev, &zynqmp_dpsub_component_ops);
+
+	err = zynqmp_disp_remove(pdev);
+	if (err)
+		ret = -EIO;
+
+	err = zynqmp_dp_remove(pdev);
+	if (err)
+		ret = -EIO;
+
+	pm_runtime_disable(&pdev->dev);
+
+	return err;
+}
+
+static const struct of_device_id zynqmp_dpsub_of_match[] = {
+	{ .compatible = "xlnx,zynqmp-dpsub-1.7", },
+	{ /* end of table */ },
+};
+MODULE_DEVICE_TABLE(of, zynqmp_dpsub_of_match);
+
+static struct platform_driver zynqmp_dpsub_driver = {
+	.probe			= zynqmp_dpsub_probe,
+	.remove			= zynqmp_dpsub_remove,
+	.driver			= {
+		.owner		= THIS_MODULE,
+		.name		= "zynqmp-display",
+		.of_match_table	= zynqmp_dpsub_of_match,
+	},
+};
+
+module_platform_driver(zynqmp_dpsub_driver);
+
+MODULE_AUTHOR("Xilinx, Inc.");
+MODULE_DESCRIPTION("ZynqMP DP Subsystem Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
new file mode 100644
index 0000000..df5713a
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -0,0 +1,19 @@
+/*
+ * ZynqMP DPSUB Subsystem Driver
+ *
+ *  Copyright (C) 2017 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+
+#ifndef _ZYNQMP_DPSUB_H_
+#define _ZYNQMP_DPSUB_H_
+
+struct zynqmp_dpsub {
+	struct zynqmp_dp *dp;
+	struct zynqmp_disp *disp;
+};
+
+#endif /* _ZYNQMP_DPSUB_H_ */
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
