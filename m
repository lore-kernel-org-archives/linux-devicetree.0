From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH v4 3/3] drivers: soc: xilinx: Add ZynqMP power domain driver
Date: Fri, 1 Feb 2019 14:08:50 -0800
Message-ID: <1549058930-18644-4-git-send-email-jollys@xilinx.com>
References: <1549058930-18644-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1549058930-18644-1-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, andy.gross@linaro.org, shawnguo@kernel.org, geert+renesas@glider.be, bjorn.andersson@linaro.org, sean.wang@mediatek.com, m.szyprowski@samsung.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jolly Shah <jollys@xilinx.com>, Rajan Vaja <rajan.vaja@xilinx.com>
List-Id: devicetree@vger.kernel.org

The zynqmp-genpd driver communicates the usage requirements
for logical power domains / devices to the platform FW.
FW is responsible for choosing appropriate power states,
taking Linux' usage information into account.

Signed-off-by: Rajan Vaja <rajan.vaja@xilinx.com>
Signed-off-by: Jolly Shah <jollys@xilinx.com>
---
 drivers/firmware/xilinx/Kconfig        |   1 +
 drivers/firmware/xilinx/zynqmp.c       |  15 ++
 drivers/soc/xilinx/Kconfig             |   9 +
 drivers/soc/xilinx/Makefile            |   1 +
 drivers/soc/xilinx/zynqmp_pm_domains.c | 321 +++++++++++++++++++++++++++++++++
 5 files changed, 347 insertions(+)
 create mode 100644 drivers/soc/xilinx/zynqmp_pm_domains.c

diff --git a/drivers/firmware/xilinx/Kconfig b/drivers/firmware/xilinx/Kconfig
index 8f44b9c..bd33bbf 100644
--- a/drivers/firmware/xilinx/Kconfig
+++ b/drivers/firmware/xilinx/Kconfig
@@ -6,6 +6,7 @@ menu "Zynq MPSoC Firmware Drivers"
 
 config ZYNQMP_FIRMWARE
 	bool "Enable Xilinx Zynq MPSoC firmware interface"
+	select MFD_CORE
 	help
 	  Firmware interface driver is used by different
 	  drivers to communicate with the firmware for
diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 6660b8c..dab1350 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -14,6 +14,7 @@
 #include <linux/compiler.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/mfd/core.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -23,6 +24,12 @@
 #include <linux/firmware/xlnx-zynqmp.h>
 #include "zynqmp-debug.h"
 
+static const struct mfd_cell firmware_devs[] = {
+	{
+		.name = "zynqmp_power_controller",
+	},
+};
+
 /**
  * zynqmp_pm_ret_code() - Convert PMU-FW error codes to Linux error codes
  * @ret_status:		PMUFW return code
@@ -665,11 +672,19 @@ static int zynqmp_firmware_probe(struct platform_device *pdev)
 
 	zynqmp_pm_api_debugfs_init();
 
+	ret = mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE, firmware_devs,
+			      ARRAY_SIZE(firmware_devs), NULL, 0, NULL);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to add MFD devices %d\n", ret);
+		return ret;
+	}
+
 	return of_platform_populate(dev->of_node, NULL, NULL, dev);
 }
 
 static int zynqmp_firmware_remove(struct platform_device *pdev)
 {
+	mfd_remove_devices(&pdev->dev);
 	zynqmp_pm_api_debugfs_exit();
 
 	return 0;
diff --git a/drivers/soc/xilinx/Kconfig b/drivers/soc/xilinx/Kconfig
index 5025e0e..01e76b5 100644
--- a/drivers/soc/xilinx/Kconfig
+++ b/drivers/soc/xilinx/Kconfig
@@ -28,4 +28,13 @@ config ZYNQMP_POWER
 	  power management callbacks from firmware.
 	  If in doubt, say N.
 
+config ZYNQMP_PM_DOMAINS
+	bool "Enable Zynq MPSoC generic PM domains"
+	default y
+	depends on PM && ARCH_ZYNQMP && ZYNQMP_FIRMWARE
+	select PM_GENERIC_DOMAINS
+	help
+	  Say yes to enable device power management through PM domains
+	  If in doubt, say N.
+
 endmenu
diff --git a/drivers/soc/xilinx/Makefile b/drivers/soc/xilinx/Makefile
index 428b9db..f66bfea 100644
--- a/drivers/soc/xilinx/Makefile
+++ b/drivers/soc/xilinx/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_XILINX_VCU)	+= xlnx_vcu.o
 obj-$(CONFIG_ZYNQMP_POWER)	+= zynqmp_power.o
+obj-$(CONFIG_ZYNQMP_PM_DOMAINS) += zynqmp_pm_domains.o
diff --git a/drivers/soc/xilinx/zynqmp_pm_domains.c b/drivers/soc/xilinx/zynqmp_pm_domains.c
new file mode 100644
index 0000000..354d256
--- /dev/null
+++ b/drivers/soc/xilinx/zynqmp_pm_domains.c
@@ -0,0 +1,321 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ZynqMP Generic PM domain support
+ *
+ *  Copyright (C) 2015-2018 Xilinx, Inc.
+ *
+ *  Davorin Mista <davorin.mista@aggios.com>
+ *  Jolly Shah <jollys@xilinx.com>
+ *  Rajan Vaja <rajan.vaja@xilinx.com>
+ */
+
+#include <linux/err.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/slab.h>
+
+#include <linux/firmware/xlnx-zynqmp.h>
+
+#define ZYNQMP_NUM_DOMAINS		(100)
+/* Flag stating if PM nodes mapped to the PM domain has been requested */
+#define ZYNQMP_PM_DOMAIN_REQUESTED	BIT(0)
+
+/**
+ * struct zynqmp_pm_domain - Wrapper around struct generic_pm_domain
+ * @gpd:		Generic power domain
+ * @node_id:		PM node ID corresponding to device inside PM domain
+ * @flags:		ZynqMP PM domain flags
+ */
+struct zynqmp_pm_domain {
+	struct generic_pm_domain gpd;
+	u32 node_id;
+	u8 flags;
+};
+
+/**
+ * zynqmp_gpd_is_active_wakeup_path() - Check if device is in wakeup source
+ *					path
+ * @dev:	Device to check for wakeup source path
+ * @not_used:	Data member (not required)
+ *
+ * This function is checks device's child hierarchy and checks if any device is
+ * set as wakeup source.
+ *
+ * Return: 1 if device is in wakeup source path else 0
+ */
+static int zynqmp_gpd_is_active_wakeup_path(struct device *dev, void *not_used)
+{
+	int may_wakeup;
+
+	may_wakeup = device_may_wakeup(dev);
+	if (may_wakeup)
+		return may_wakeup;
+
+	return device_for_each_child(dev, NULL,
+			zynqmp_gpd_is_active_wakeup_path);
+}
+
+/**
+ * zynqmp_gpd_power_on() - Power on PM domain
+ * @domain:	Generic PM domain
+ *
+ * This function is called before devices inside a PM domain are resumed, to
+ * power on PM domain.
+ *
+ * Return: 0 on success, error code otherwise
+ */
+static int zynqmp_gpd_power_on(struct generic_pm_domain *domain)
+{
+	int ret;
+	struct zynqmp_pm_domain *pd;
+	const struct zynqmp_eemi_ops *eemi_ops = zynqmp_pm_get_eemi_ops();
+
+	if (!eemi_ops || !eemi_ops->set_requirement)
+		return -ENXIO;
+
+	pd = container_of(domain, struct zynqmp_pm_domain, gpd);
+	ret = eemi_ops->set_requirement(pd->node_id,
+					ZYNQMP_PM_CAPABILITY_ACCESS,
+					ZYNQMP_PM_MAX_QOS,
+					ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+	if (ret) {
+		pr_err("%s() %s set requirement for node %d failed: %d\n",
+		       __func__, domain->name, pd->node_id, ret);
+		return ret;
+	}
+
+	pr_debug("%s() Powered on %s domain\n", __func__, domain->name);
+	return 0;
+}
+
+/**
+ * zynqmp_gpd_power_off() - Power off PM domain
+ * @domain:	Generic PM domain
+ *
+ * This function is called after devices inside a PM domain are suspended, to
+ * power off PM domain.
+ *
+ * Return: 0 on success, error code otherwise
+ */
+static int zynqmp_gpd_power_off(struct generic_pm_domain *domain)
+{
+	int ret;
+	struct pm_domain_data *pdd, *tmp;
+	struct zynqmp_pm_domain *pd;
+	u32 capabilities = 0;
+	bool may_wakeup;
+	const struct zynqmp_eemi_ops *eemi_ops = zynqmp_pm_get_eemi_ops();
+
+	if (!eemi_ops || !eemi_ops->set_requirement)
+		return -ENXIO;
+
+	pd = container_of(domain, struct zynqmp_pm_domain, gpd);
+
+	/* If domain is already released there is nothing to be done */
+	if (!(pd->flags & ZYNQMP_PM_DOMAIN_REQUESTED)) {
+		pr_debug("%s() %s domain is already released\n",
+			 __func__, domain->name);
+		return 0;
+	}
+
+	list_for_each_entry_safe(pdd, tmp, &domain->dev_list, list_node) {
+		/* If device is in wakeup path, set capability to WAKEUP */
+		may_wakeup = zynqmp_gpd_is_active_wakeup_path(pdd->dev, NULL);
+		if (may_wakeup) {
+			dev_dbg(pdd->dev, "device is in wakeup path in %s\n",
+				domain->name);
+			capabilities = ZYNQMP_PM_CAPABILITY_WAKEUP;
+			break;
+		}
+	}
+
+	ret = eemi_ops->set_requirement(pd->node_id, capabilities, 0,
+					ZYNQMP_PM_REQUEST_ACK_NO);
+	/**
+	 * If powering down of any node inside this domain fails,
+	 * report and return the error
+	 */
+	if (ret) {
+		pr_err("%s() %s set requirement for node %d failed: %d\n",
+		       __func__, domain->name, pd->node_id, ret);
+		return ret;
+	}
+
+	pr_debug("%s() Powered off %s domain\n", __func__, domain->name);
+	return 0;
+}
+
+/**
+ * zynqmp_gpd_attach_dev() - Attach device to the PM domain
+ * @domain:	Generic PM domain
+ * @dev:	Device to attach
+ *
+ * Return: 0 on success, error code otherwise
+ */
+static int zynqmp_gpd_attach_dev(struct generic_pm_domain *domain,
+				 struct device *dev)
+{
+	int ret;
+	struct zynqmp_pm_domain *pd;
+	const struct zynqmp_eemi_ops *eemi_ops = zynqmp_pm_get_eemi_ops();
+
+	if (!eemi_ops || !eemi_ops->request_node)
+		return -ENXIO;
+
+	pd = container_of(domain, struct zynqmp_pm_domain, gpd);
+
+	/* If this is not the first device to attach there is nothing to do */
+	if (domain->device_count)
+		return 0;
+
+	ret = eemi_ops->request_node(pd->node_id, 0, 0,
+				     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
+	/* If requesting a node fails print and return the error */
+	if (ret) {
+		pr_err("%s() %s request failed for node %d: %d\n",
+		       __func__, domain->name, pd->node_id, ret);
+		return ret;
+	}
+
+	pd->flags |= ZYNQMP_PM_DOMAIN_REQUESTED;
+
+	pr_debug("%s() %s attached to %s domain\n", __func__,
+		 dev_name(dev), domain->name);
+	return 0;
+}
+
+/**
+ * zynqmp_gpd_detach_dev() - Detach device from the PM domain
+ * @domain:	Generic PM domain
+ * @dev:	Device to detach
+ */
+static void zynqmp_gpd_detach_dev(struct generic_pm_domain *domain,
+				  struct device *dev)
+{
+	int ret;
+	struct zynqmp_pm_domain *pd;
+	const struct zynqmp_eemi_ops *eemi_ops = zynqmp_pm_get_eemi_ops();
+
+	if (!eemi_ops || !eemi_ops->release_node)
+		return;
+
+	pd = container_of(domain, struct zynqmp_pm_domain, gpd);
+
+	/* If this is not the last device to detach there is nothing to do */
+	if (domain->device_count)
+		return;
+
+	ret = eemi_ops->release_node(pd->node_id);
+	/* If releasing a node fails print the error and return */
+	if (ret) {
+		pr_err("%s() %s release failed for node %d: %d\n",
+		       __func__, domain->name, pd->node_id, ret);
+		return;
+	}
+
+	pd->flags &= ~ZYNQMP_PM_DOMAIN_REQUESTED;
+
+	pr_debug("%s() %s detached from %s domain\n", __func__,
+		 dev_name(dev), domain->name);
+}
+
+static struct generic_pm_domain *zynqmp_gpd_xlate
+				(struct of_phandle_args *genpdspec, void *data)
+{
+	struct genpd_onecell_data *genpd_data = data;
+	unsigned int i, idx = genpdspec->args[0];
+	struct zynqmp_pm_domain *pd;
+
+	pd = container_of(genpd_data->domains[0], struct zynqmp_pm_domain, gpd);
+
+	if (genpdspec->args_count != 1)
+		return ERR_PTR(-EINVAL);
+
+	/* Check for existing pm domains */
+	for (i = 0; i < ZYNQMP_NUM_DOMAINS; i++) {
+		if (pd[i].node_id == idx)
+			goto done;
+	}
+
+	/**
+	 * Add index in empty node_id of power domain list as no existing
+	 * power domain found for current index.
+	 */
+	for (i = 0; i < ZYNQMP_NUM_DOMAINS; i++) {
+		if (pd[i].node_id == 0) {
+			pd[i].node_id = idx;
+			break;
+		}
+	}
+
+done:
+	if (!genpd_data->domains[i] || i == ZYNQMP_NUM_DOMAINS)
+		return ERR_PTR(-ENOENT);
+
+	return genpd_data->domains[i];
+}
+
+static int zynqmp_gpd_probe(struct platform_device *pdev)
+{
+	int i;
+	struct genpd_onecell_data *zynqmp_pd_data;
+	struct generic_pm_domain **domains;
+	struct zynqmp_pm_domain *pd;
+	struct device *dev = &pdev->dev;
+
+	pd = devm_kcalloc(dev, ZYNQMP_NUM_DOMAINS, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return -ENOMEM;
+
+	zynqmp_pd_data = devm_kzalloc(dev, sizeof(*zynqmp_pd_data), GFP_KERNEL);
+	if (!zynqmp_pd_data)
+		return -ENOMEM;
+
+	zynqmp_pd_data->xlate = zynqmp_gpd_xlate;
+
+	domains = devm_kcalloc(dev, ZYNQMP_NUM_DOMAINS, sizeof(*domains),
+			       GFP_KERNEL);
+	if (!domains)
+		return -ENOMEM;
+
+	for (i = 0; i < ZYNQMP_NUM_DOMAINS; i++, pd++) {
+		pd->node_id = 0;
+		pd->gpd.name = kasprintf(GFP_KERNEL, "domain%d", i);
+		pd->gpd.power_off = zynqmp_gpd_power_off;
+		pd->gpd.power_on = zynqmp_gpd_power_on;
+		pd->gpd.attach_dev = zynqmp_gpd_attach_dev;
+		pd->gpd.detach_dev = zynqmp_gpd_detach_dev;
+
+		domains[i] = &pd->gpd;
+
+		/* Mark all PM domains as initially powered off */
+		pm_genpd_init(&pd->gpd, NULL, true);
+	}
+
+	zynqmp_pd_data->domains = domains;
+	zynqmp_pd_data->num_domains = ZYNQMP_NUM_DOMAINS;
+	of_genpd_add_provider_onecell(dev->parent->of_node, zynqmp_pd_data);
+
+	return 0;
+}
+
+static int zynqmp_gpd_remove(struct platform_device *pdev)
+{
+	of_genpd_del_provider(pdev->dev.parent->of_node);
+
+	return 0;
+}
+
+static struct platform_driver zynqmp_power_domain_driver = {
+	.driver	= {
+		.name = "zynqmp_power_controller",
+	},
+	.probe = zynqmp_gpd_probe,
+	.remove = zynqmp_gpd_remove,
+};
+module_platform_driver(zynqmp_power_domain_driver);
+
+MODULE_ALIAS("platform:zynqmp_power_controller");
-- 
2.7.4
