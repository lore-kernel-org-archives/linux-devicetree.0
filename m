From: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 6/8] drm: xlnx: ZynqMP DP subsystem DRM KMS driver
Date: Fri, 12 Jan 2018 18:03:26 -0800
Message-ID: <1515809008-14518-6-git-send-email-hyun.kwon@xilinx.com>
References: <1515809008-14518-1-git-send-email-hyun.kwon@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515809008-14518-1-git-send-email-hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This is a wrapper around the ZynqMP Display and DisplayPort drivers.

Signed-off-by: Hyun Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
---
- Change the SPDX identifier format
---
---
 drivers/gpu/drm/xlnx/Kconfig        |  11 +++
 drivers/gpu/drm/xlnx/Makefile       |   3 +
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 149 ++++++++++++++++++++++++++++++++=
++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h |  27 +++++++
 4 files changed, 190 insertions(+)
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
+       tristate "ZynqMP DP Subsystem Driver"
+       depends on ARCH_ZYNQMP && OF && DRM_XLNX && COMMON_CLK
+       select DMA_ENGINE
+       select GENERIC_PHY
+       help
+         DRM KMS driver for ZynqMP DP Subsystem controller. Choose
+         this option if you have a Xilinx ZynqMP SoC with DisplayPort
+         subsystem. The driver provides the kernel mode setting
+         functionlaities for ZynqMP DP subsystem.
diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
index c60a281..064a05a 100644
--- a/drivers/gpu/drm/xlnx/Makefile
+++ b/drivers/gpu/drm/xlnx/Makefile
@@ -1,2 +1,5 @@
 xlnx_drm-objs +=3D xlnx_crtc.o xlnx_drv.o xlnx_fb.o xlnx_gem.o
 obj-$(CONFIG_DRM_XLNX) +=3D xlnx_drm.o
+
+zynqmp-dpsub-objs +=3D zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o
+obj-$(CONFIG_DRM_ZYNQMP_DPSUB) +=3D zynqmp-dpsub.o
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zyn=
qmp_dpsub.c
new file mode 100644
index 0000000..517b492
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ZynqMP DP Subsystem Driver
+ *
+ *  Copyright (C) 2017 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
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
+       int ret;
+
+       ret =3D zynqmp_disp_bind(dev, master, data);
+       if (ret)
+               return ret;
+
+       /* zynqmp_disp should bind first, so zynqmp_dp encoder can find crt=
c */
+       ret =3D zynqmp_dp_bind(dev, master, data);
+       if (ret)
+               return ret;
+
+       return 0;
+}
+
+static void
+zynqmp_dpsub_unbind(struct device *dev, struct device *master, void *data)
+{
+       zynqmp_dp_unbind(dev, master, data);
+       zynqmp_disp_unbind(dev, master, data);
+}
+
+static const struct component_ops zynqmp_dpsub_component_ops =3D {
+       .bind   =3D zynqmp_dpsub_bind,
+       .unbind =3D zynqmp_dpsub_unbind,
+};
+
+static int zynqmp_dpsub_probe(struct platform_device *pdev)
+{
+       struct zynqmp_dpsub *dpsub;
+       int ret;
+
+       dpsub =3D devm_kzalloc(&pdev->dev, sizeof(*dpsub), GFP_KERNEL);
+       if (!dpsub)
+               return -ENOMEM;
+
+       /* Sub-driver will access dpsub from drvdata */
+       platform_set_drvdata(pdev, dpsub);
+       pm_runtime_enable(&pdev->dev);
+
+       /*
+        * DP should be probed first so that the zynqmp_disp can set the ou=
tput
+        * format accordingly.
+        */
+       ret =3D zynqmp_dp_probe(pdev);
+       if (ret)
+               goto err_pm;
+
+       ret =3D zynqmp_disp_probe(pdev);
+       if (ret)
+               goto err_dp;
+
+       ret =3D component_add(&pdev->dev, &zynqmp_dpsub_component_ops);
+       if (ret)
+               goto err_disp;
+
+       /* Populate the sound child nodes */
+       ret =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->=
dev);
+       if (ret) {
+               dev_err(&pdev->dev, "failed to populate child nodes\n");
+               goto err_component;
+       }
+
+       dev_info(&pdev->dev, "ZynqMP DisplayPort Subsystem driver probed");
+
+       return 0;
+
+err_component:
+       component_del(&pdev->dev, &zynqmp_dpsub_component_ops);
+err_disp:
+       zynqmp_disp_remove(pdev);
+err_dp:
+       zynqmp_dp_remove(pdev);
+err_pm:
+       pm_runtime_disable(&pdev->dev);
+       return ret;
+}
+
+static int zynqmp_dpsub_remove(struct platform_device *pdev)
+{
+       int err, ret =3D 0;
+
+       of_platform_depopulate(&pdev->dev);
+       component_del(&pdev->dev, &zynqmp_dpsub_component_ops);
+
+       err =3D zynqmp_disp_remove(pdev);
+       if (err)
+               ret =3D -EIO;
+
+       err =3D zynqmp_dp_remove(pdev);
+       if (err)
+               ret =3D -EIO;
+
+       pm_runtime_disable(&pdev->dev);
+
+       return err;
+}
+
+static const struct of_device_id zynqmp_dpsub_of_match[] =3D {
+       { .compatible =3D "xlnx,zynqmp-dpsub-1.7", },
+       { /* end of table */ },
+};
+MODULE_DEVICE_TABLE(of, zynqmp_dpsub_of_match);
+
+static struct platform_driver zynqmp_dpsub_driver =3D {
+       .probe                  =3D zynqmp_dpsub_probe,
+       .remove                 =3D zynqmp_dpsub_remove,
+       .driver                 =3D {
+               .owner          =3D THIS_MODULE,
+               .name           =3D "zynqmp-display",
+               .of_match_table =3D zynqmp_dpsub_of_match,
+       },
+};
+
+module_platform_driver(zynqmp_dpsub_driver);
+
+MODULE_AUTHOR("Xilinx, Inc.");
+MODULE_DESCRIPTION("ZynqMP DP Subsystem Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zyn=
qmp_dpsub.h
new file mode 100644
index 0000000..2c1455f
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ZynqMP DPSUB Subsystem Driver
+ *
+ *  Copyright (C) 2017 - 2018 Xilinx, Inc.
+ *
+ *  Author: Hyun Woo Kwon <hyun.kwon-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _ZYNQMP_DPSUB_H_
+#define _ZYNQMP_DPSUB_H_
+
+struct zynqmp_dpsub {
+       struct zynqmp_dp *dp;
+       struct zynqmp_disp *disp;
+};
+
+#endif /* _ZYNQMP_DPSUB_H_ */
--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
