From: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
Subject: [PATCH v3 2/2] Embedded USB Debugger (EUD) driver
Date: Thu, 15 Nov 2018 11:32:54 -0800
Message-ID: <1542310374-18474-3-git-send-email-pheragu@codeaurora.org>
References: <1542310374-18474-1-git-send-email-pheragu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542310374-18474-1-git-send-email-pheragu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, ckadabi@codeaurora.org, tsoni@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, rnayak@codeaurora.org, Prakruthi Deepak Heragu <pheragu@codeaurora.org>, Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add support for control peripheral of EUD (Embedded USB Debugger) to
listen to events such as USB attach/detach, charger enable/disable, pet
EUD to indicate software is functional. Reusing the platform device kobj,
sysfs entry 'enable' is created to enable or disable EUD.

Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
---
 drivers/soc/qcom/Kconfig  |  12 ++
 drivers/soc/qcom/Makefile |   1 +
 drivers/soc/qcom/eud.c    | 344 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 357 insertions(+)
 create mode 100644 drivers/soc/qcom/eud.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 5856e79..12669ec 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -136,4 +136,16 @@ config QCOM_APR
           application processor and QDSP6. APR is
           used by audio driver to configure QDSP6
           ASM, ADM and AFE modules.
+
+config QCOM_EUD
+	tristate "QTI Embedded USB Debugger (EUD)"
+	depends on ARCH_QCOM
+	help
+	  The Embedded USB Debugger (EUD) driver is a driver for the
+	  control peripheral which waits on events like USB attach/detach
+	  and charger enable/disable. The control peripheral further helps
+	  support the USB-based debug and trace capabilities.
+	  This module enables support for Qualcomm Technologies, Inc.
+	  Embedded USB Debugger (EUD).
+	  If unsure, say N.
 endmenu
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index 19dcf95..dd4701b 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -15,3 +15,4 @@ obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
 obj-$(CONFIG_QCOM_WCNSS_CTRL) += wcnss_ctrl.o
 obj-$(CONFIG_QCOM_APR) += apr.o
+obj-$(CONFIG_QCOM_EUD) += eud.o
diff --git a/drivers/soc/qcom/eud.c b/drivers/soc/qcom/eud.c
new file mode 100644
index 0000000..bd885d6
--- /dev/null
+++ b/drivers/soc/qcom/eud.c
@@ -0,0 +1,344 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/interrupt.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/extcon.h>
+#include <linux/delay.h>
+#include <linux/sysfs.h>
+#include <linux/io.h>
+#include <linux/bitops.h>
+#include <linux/workqueue.h>
+#include <linux/power_supply.h>
+
+#define EUD_ENABLE_CMD 1
+#define EUD_DISABLE_CMD 0
+
+#define EUD_REG_INT1_EN_MASK	0x0024
+#define EUD_REG_INT_STATUS_1	0x0044
+#define EUD_REG_CTL_OUT_1	0x0074
+#define EUD_REG_VBUS_INT_CLR	0x0080
+#define EUD_REG_CHGR_INT_CLR	0x0084
+#define EUD_REG_CSR_EUD_EN	0x1014
+#define EUD_REG_SW_ATTACH_DET	0x1018
+
+#define EUD_INT_VBUS		BIT(2)
+#define EUD_INT_CHGR		BIT(3)
+#define EUD_INT_SAFE_MODE	BIT(4)
+#define EUD_INT_ALL		(EUD_INT_VBUS|EUD_INT_CHGR|\
+				EUD_INT_SAFE_MODE)
+
+struct eud_chip {
+	struct device			*dev;
+	int				eud_irq;
+	unsigned int			extcon_id;
+	unsigned int			int_status;
+	bool				usb_attach;
+	bool				chgr_enable;
+	void __iomem			*eud_reg_base;
+	struct extcon_dev		*extcon;
+	int				enable;
+	struct work_struct		eud_work;
+};
+
+static const unsigned int eud_extcon_cable[] = {
+	EXTCON_USB,
+	EXTCON_CHG_USB_SDP,
+	EXTCON_NONE,
+};
+
+static int enable_eud(struct eud_chip *priv)
+{
+	struct power_supply *usb_psy = NULL;
+	union power_supply_propval pval = {0};
+	union power_supply_propval tval = {0};
+	int ret;
+
+	usb_psy = power_supply_get_by_name("usb");
+	if (!usb_psy)
+		return -1;
+
+	ret = power_supply_get_property(usb_psy,
+			POWER_SUPPLY_PROP_PRESENT, &pval);
+	if (ret)
+		return ret;
+
+	ret = power_supply_get_property(usb_psy,
+			POWER_SUPPLY_PROP_REAL_TYPE, &tval);
+	if (ret)
+		return ret;
+
+	if (!pval.intval || (tval.intval != POWER_SUPPLY_TYPE_USB &&
+		tval.intval != POWER_SUPPLY_TYPE_USB_CDP))
+		return -1;
+
+	/* write into CSR to enable EUD */
+	writel_relaxed(BIT(0), priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
+	/* Enable vbus, chgr & safe mode warning interrupts */
+	writel_relaxed(EUD_INT_VBUS | EUD_INT_CHGR | EUD_INT_SAFE_MODE,
+			priv->eud_reg_base + EUD_REG_INT1_EN_MASK);
+
+	/* Ensure Register Writes Complete */
+	wmb();
+
+	/*
+	 * Set the default cable state to usb connect and charger
+	 * enable
+	 */
+	ret = extcon_set_state_sync(priv->extcon, EXTCON_USB, true);
+	if (ret)
+		return ret;
+	ret = extcon_set_state_sync(priv->extcon,
+			EXTCON_CHG_USB_SDP, true);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void disable_eud(struct eud_chip *priv)
+{
+	/* write into CSR to disable EUD */
+	writel_relaxed(0, priv->eud_reg_base + EUD_REG_CSR_EUD_EN);
+}
+
+static ssize_t eud_enable_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+
+	return snprintf(buf, sizeof(int), "%d", chip->enable);
+}
+
+static ssize_t eud_enable_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct eud_chip *chip = dev_get_drvdata(dev);
+	int enable = 0;
+	int ret = 0;
+
+	if (sscanf(buf, "%du", &enable) != 1)
+		return -EINVAL;
+
+	if (enable == EUD_ENABLE_CMD)
+		ret = enable_eud(chip);
+	else if (enable == EUD_DISABLE_CMD)
+		disable_eud(chip);
+	if (!ret)
+		chip->enable = enable;
+	return count;
+}
+
+struct device_attribute eud_attribute = {
+	.attr.name = "enable",
+	.attr.mode = 0644,
+	.show = eud_enable_show,
+	.store = eud_enable_store,
+};
+
+static void eud_event_notifier(struct work_struct *eud_work)
+{
+	struct eud_chip *chip = container_of(eud_work, struct eud_chip,
+					eud_work);
+	int ret;
+
+	if (chip->int_status == EUD_INT_VBUS) {
+		ret = extcon_set_state_sync(chip->extcon, chip->extcon_id,
+					chip->usb_attach);
+		if (ret)
+			return;
+	} else if (chip->int_status == EUD_INT_CHGR) {
+		ret = extcon_set_state_sync(chip->extcon, chip->extcon_id,
+					chip->chgr_enable);
+		if (ret)
+			return;
+	}
+}
+
+static void usb_attach_detach(struct eud_chip *chip)
+{
+	u32 reg;
+
+	chip->extcon_id = EXTCON_USB;
+	/* read ctl_out_1[4] to find USB attach or detach event */
+	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
+	if (reg & BIT(4))
+		chip->usb_attach = true;
+	else
+		chip->usb_attach = false;
+
+	schedule_work(&chip->eud_work);
+
+	/* set and clear vbus_int_clr[0] to clear interrupt */
+	writel_relaxed(BIT(0), chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
+	/* Ensure Register Writes Complete */
+	wmb();
+	writel_relaxed(0, chip->eud_reg_base + EUD_REG_VBUS_INT_CLR);
+}
+
+static void chgr_enable_disable(struct eud_chip *chip)
+{
+	u32 reg;
+
+	chip->extcon_id = EXTCON_CHG_USB_SDP;
+	/* read ctl_out_1[6] to find charger enable or disable event */
+	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_CTL_OUT_1);
+	if (reg & BIT(6))
+		chip->chgr_enable = true;
+	else
+		chip->chgr_enable = false;
+
+	schedule_work(&chip->eud_work);
+
+	/* set and clear chgr_int_clr[0] to clear interrupt */
+	writel_relaxed(BIT(0), chip->eud_reg_base + EUD_REG_CHGR_INT_CLR);
+	/* Ensure Register Writes Complete */
+	wmb();
+	writel_relaxed(0, chip->eud_reg_base + EUD_REG_CHGR_INT_CLR);
+}
+
+static void pet_eud(struct eud_chip *chip)
+{
+	u32 reg;
+
+	/* read sw_attach_det[0] to find attach/detach event */
+	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
+	if (reg & BIT(0)) {
+		/* Detach & Attach pet for EUD */
+		writel_relaxed(0, chip->eud_reg_base + EUD_REG_SW_ATTACH_DET);
+		/* Ensure Register Writes Complete */
+		wmb();
+		/* Delay to make sure detach pet is done before attach pet */
+		udelay(100);
+		writel_relaxed(BIT(0), chip->eud_reg_base +
+					EUD_REG_SW_ATTACH_DET);
+		/* Ensure Register Writes Complete */
+		wmb();
+	} else {
+		/* Attach pet for EUD */
+		writel_relaxed(BIT(0), chip->eud_reg_base +
+					EUD_REG_SW_ATTACH_DET);
+		/* Ensure Register Writes Complete */
+		wmb();
+	}
+}
+
+static irqreturn_t handle_eud_irq(int irq, void *data)
+{
+	struct eud_chip *chip = data;
+	u32 reg;
+
+	/* read status register and find out which interrupt triggered */
+	reg = readl_relaxed(chip->eud_reg_base + EUD_REG_INT_STATUS_1);
+	switch (reg & EUD_INT_ALL) {
+	case EUD_INT_VBUS:
+		chip->int_status = EUD_INT_VBUS;
+		usb_attach_detach(chip);
+		break;
+	case EUD_INT_CHGR:
+		chip->int_status = EUD_INT_CHGR;
+		chgr_enable_disable(chip);
+		break;
+	case EUD_INT_SAFE_MODE:
+		pet_eud(chip);
+		break;
+	default:
+		return IRQ_NONE;
+	}
+	return IRQ_HANDLED;
+}
+
+static int msm_eud_probe(struct platform_device *pdev)
+{
+	struct eud_chip *chip;
+	struct resource *res;
+	int ret;
+
+	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->dev = &pdev->dev;
+	platform_set_drvdata(pdev, chip);
+
+	ret = device_create_file(&pdev->dev, &eud_attribute);
+	if (ret)
+		return ret;
+
+	chip->extcon = devm_extcon_dev_allocate(&pdev->dev, eud_extcon_cable);
+	if (IS_ERR(chip->extcon))
+		return PTR_ERR(chip->extcon);
+
+	ret = devm_extcon_dev_register(&pdev->dev, chip->extcon);
+	if (ret)
+		return ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENOMEM;
+
+	chip->eud_reg_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(chip->eud_reg_base))
+		return PTR_ERR(chip->eud_reg_base);
+
+	chip->eud_irq = platform_get_irq(pdev, 0);
+
+	ret = devm_request_irq(&pdev->dev, chip->eud_irq, handle_eud_irq,
+				IRQF_TRIGGER_HIGH, NULL, chip);
+	if (ret)
+		return ret;
+
+	device_init_wakeup(&pdev->dev, true);
+	enable_irq_wake(chip->eud_irq);
+
+	INIT_WORK(&chip->eud_work, eud_event_notifier);
+
+	if (ret)
+		return ret;
+
+	/* Enable EUD */
+	if (chip->enable)
+		enable_eud(chip);
+
+	return 0;
+}
+
+static int msm_eud_remove(struct platform_device *pdev)
+{
+	struct eud_chip *chip = platform_get_drvdata(pdev);
+
+	if (chip->enable)
+		disable_eud(chip);
+	device_remove_file(&pdev->dev, &eud_attribute);
+	device_init_wakeup(&pdev->dev, false);
+	disable_irq_wake(chip->eud_irq);
+
+	return 0;
+}
+
+static const struct of_device_id msm_eud_dt_match[] = {
+	{.compatible = "qcom,msm-eud"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, msm_eud_dt_match);
+
+static struct platform_driver msm_eud_driver = {
+	.probe		= msm_eud_probe,
+	.remove		= msm_eud_remove,
+	.driver		= {
+		.name		= "msm-eud",
+		.of_match_table = msm_eud_dt_match,
+	},
+};
+module_platform_driver(msm_eud_driver);
+
+MODULE_DESCRIPTION("QTI EUD driver");
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
