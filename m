From: John Stultz <john.stultz@linaro.org>
Subject: [RFC][PATCH 1/3] of: overlay_mgr: Add overlay manager driver
Date: Mon,  9 Oct 2017 22:34:18 -0700
Message-ID: <1507613660-27236-2-git-send-email-john.stultz@linaro.org>
References: <1507613660-27236-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507613660-27236-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: Dmitry Shmidt <dimitrysh@google.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, devicetree@vger.kernel.org, John Stultz <john.stultz@linaro.org>
List-Id: devicetree@vger.kernel.org

From: Dmitry Shmidt <dimitrysh@google.com>

This patch adds a driver to manage applying pre-defined DT
overlay fragments at bootup.

The pre-defined DT fragments are specified via the main
overlay_mng entry which includes all the possible HW config setups.

Then kernel command line option is used to choose between them.

These entries are specified on kernel boot arguments as follows:
   overlay_mgr.overlay_dt_entry=hardware_cfg_0

Example DT entry:
    overlay_mgr {
        compatible = "linux,overlay_manager";
        hardware_cfg_0 {
            overlay@0 {
                    fragment@0 {
                            __overlay__ {
                            };
                    };
            };
            overlay@1 {
                    fragment@0 {
                            __overlay__ {
                            };
                    };
            };
        };
    };

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: Dmitry Shmidt <dimitrysh@google.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dmitry Shmidt <dimitrysh@google.com>
[jstultz: Reworded commit message]
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 .../devicetree/bindings/of/overlay_mgr.txt         | 32 ++++++++
 drivers/of/Kconfig                                 | 10 +++
 drivers/of/Makefile                                |  1 +
 drivers/of/overlay_mgr.c                           | 90 ++++++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/of/overlay_mgr.txt
 create mode 100644 drivers/of/overlay_mgr.c

diff --git a/Documentation/devicetree/bindings/of/overlay_mgr.txt b/Documentation/devicetree/bindings/of/overlay_mgr.txt
new file mode 100644
index 0000000..5f3ce4c
--- /dev/null
+++ b/Documentation/devicetree/bindings/of/overlay_mgr.txt
@@ -0,0 +1,32 @@
+overlay_mgr
+
+Required properties:
+- compatible: "linux,overlay_manager";
+
+Optional properties:
+- starts from the word "hardware": hardware_cfg_0
+
+These properties can be chosen from kernel command line:
+overlay_mgr.overlay_dt_entry=hardware_cfg_0
+DT contains main overlay_mng entry with all possible
+HW config setups. And then kernel command line option
+will allow to choose between them.
+
+Example:
+    overlay_mgr {
+        compatible = "linux,overlay_manager";
+        hardware_cfg_0 {
+            overlay@0 {
+                    fragment@0 {
+                            __overlay__ {
+                            };
+                    };
+            };
+            overlay@1 {
+                    fragment@0 {
+                            __overlay__ {
+                            };
+                    };
+            };
+        };
+    };
diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index ba7b034..5132e41 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -112,4 +112,14 @@ config OF_OVERLAY
 config OF_NUMA
 	bool
 
+config OF_OVERLAY_MGR
+	bool "Enable Overlay manager"
+	default n
+	depends on OF_OVERLAY
+	help
+	  Enables Overlay manager - it accepts DT entry from command line
+	  overlay_mgr.overlay_dt_entry=<name> and applies all overlays in
+	  it to current DT. It is also possible to apply predefined DT
+	  entry on the fly by writing it to 'current_overlay' sysfs entry.
+
 endif # OF
diff --git a/drivers/of/Makefile b/drivers/of/Makefile
index 97dc01c..e2b8afa 100644
--- a/drivers/of/Makefile
+++ b/drivers/of/Makefile
@@ -14,5 +14,6 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_reserved_mem.o
 obj-$(CONFIG_OF_RESOLVE)  += resolver.o
 obj-$(CONFIG_OF_OVERLAY) += overlay.o
 obj-$(CONFIG_OF_NUMA) += of_numa.o
+obj-$(CONFIG_OF_OVERLAY_MGR) += overlay_mgr.o
 
 obj-$(CONFIG_OF_UNITTEST) += unittest-data/
diff --git a/drivers/of/overlay_mgr.c b/drivers/of/overlay_mgr.c
new file mode 100644
index 0000000..1fdeb0a
--- /dev/null
+++ b/drivers/of/overlay_mgr.c
@@ -0,0 +1,90 @@
+/*
+ * Overlay manager that allows to apply list of overlays from DT entry
+ *
+ * Copyright (C) 2016 Google, Inc.
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
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+static char *of_overlay_dt_entry;
+module_param_named(overlay_dt_entry, of_overlay_dt_entry, charp, 0644);
+
+static int of_overlay_mgr_apply_overlay(struct device_node *onp)
+{
+	int ret;
+
+	ret = of_overlay_create(onp);
+	if (ret < 0) {
+		pr_err("overlay_mgr: fail to create overlay: %d\n", ret);
+		of_node_put(onp);
+		return ret;
+	}
+	pr_info("overlay_mgr: %s overlay applied\n", onp->name);
+	return 0;
+}
+
+static int of_overlay_mgr_apply_dt(struct device *dev, char *dt_entry)
+{
+	struct device_node *enp = dev->of_node;
+	struct device_node *next;
+	struct device_node *prev = NULL;
+
+	if (!enp) {
+		pr_err("overlay_mgr: no dt entry\n");
+		return -ENODEV;
+	}
+
+	enp = of_get_child_by_name(enp, dt_entry);
+	if (!enp) {
+		pr_err("overlay_mgr: dt entry %s not found\n", dt_entry);
+		return -ENODEV;
+	}
+	pr_info("overlay_mgr: apply %s dt entry\n", enp->name);
+	while ((next = of_get_next_available_child(enp, prev)) != NULL) {
+		if (strncmp(next->name, "overlay", 7) == 0)
+			of_overlay_mgr_apply_overlay(next);
+		prev = next;
+	}
+	return 0;
+}
+
+static int of_overlay_mgr_probe(struct platform_device *pdev)
+{
+	if (!of_overlay_dt_entry)
+		return 0;
+	of_overlay_mgr_apply_dt(&pdev->dev, of_overlay_dt_entry);
+	return 0;
+}
+
+static const struct of_device_id of_overlay_mgr_match[] = {
+	{ .compatible = "linux,overlay_manager", },
+	{}
+};
+
+static struct platform_driver of_overlay_mgr_driver = {
+	.probe	= of_overlay_mgr_probe,
+	.driver	= {
+		.name = "overlay_manager",
+		.of_match_table = of_match_ptr(of_overlay_mgr_match),
+	},
+};
+
+static int __init of_overlay_mgr_init(void)
+{
+	return platform_driver_register(&of_overlay_mgr_driver);
+}
+
+postcore_initcall(of_overlay_mgr_init);
-- 
2.7.4
