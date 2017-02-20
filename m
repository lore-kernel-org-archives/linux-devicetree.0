From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 1/2] extcon: cros-ec: Add extcon-cros-ec driver to support display out.
Date: Mon, 20 Feb 2017 16:18:53 +0100
Message-ID: <20170220151854.22859-2-enric.balletbo@collabora.com>
References: <20170220151854.22859-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170220151854.22859-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Benson Leung <bleung@chromium.org>
List-Id: devicetree@vger.kernel.org

From: Benson Leung <bleung@chromium.org>

This is the driver for the USB Type C cable detection mechanism
built into the ChromeOS Embedded Controller on systems that
have USB Type-C ports.

At present, this allows for the presence of display out, but in
future, it may also be used to notify host and device type cables
and the presence of power.

Signed-off-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 drivers/extcon/Kconfig               |   7 +
 drivers/extcon/Makefile              |   1 +
 drivers/extcon/extcon-cros_ec.c      | 480 +++++++++++++++++++++++++++++++++++
 include/linux/mfd/cros_ec_commands.h |  75 ++++++
 4 files changed, 563 insertions(+)
 create mode 100644 drivers/extcon/extcon-cros_ec.c

diff --git a/drivers/extcon/Kconfig b/drivers/extcon/Kconfig
index 96bbae5..d2863ee 100644
--- a/drivers/extcon/Kconfig
+++ b/drivers/extcon/Kconfig
@@ -35,6 +35,13 @@ config EXTCON_AXP288
 	  Say Y here to enable support for USB peripheral detection
 	  and USB MUX switching by X-Power AXP288 PMIC.
 
+config EXTCON_CROS_EC
+	tristate "ChromeOS EC extcon support"
+	depends on MFD_CROS_EC
+	help
+	  Say Y here to enable USB Type C cable detection extcon support when
+	  using Chrome OS EC based USB Type-C ports.
+
 config EXTCON_GPIO
 	tristate "GPIO extcon support"
 	depends on GPIOLIB || COMPILE_TEST
diff --git a/drivers/extcon/Makefile b/drivers/extcon/Makefile
index 237ac3f..1c9d155 100644
--- a/drivers/extcon/Makefile
+++ b/drivers/extcon/Makefile
@@ -7,6 +7,7 @@ extcon-core-objs		+= extcon.o devres.o
 obj-$(CONFIG_EXTCON_ADC_JACK)	+= extcon-adc-jack.o
 obj-$(CONFIG_EXTCON_ARIZONA)	+= extcon-arizona.o
 obj-$(CONFIG_EXTCON_AXP288)	+= extcon-axp288.o
+obj-$(CONFIG_EXTCON_CROS_EC)	+= extcon-cros_ec.o
 obj-$(CONFIG_EXTCON_GPIO)	+= extcon-gpio.o
 obj-$(CONFIG_EXTCON_INTEL_INT3496) += extcon-intel-int3496.o
 obj-$(CONFIG_EXTCON_MAX14577)	+= extcon-max14577.o
diff --git a/drivers/extcon/extcon-cros_ec.c b/drivers/extcon/extcon-cros_ec.c
new file mode 100644
index 0000000..e8b9f58
--- /dev/null
+++ b/drivers/extcon/extcon-cros_ec.c
@@ -0,0 +1,480 @@
+/**
+ * drivers/extcon/extcon-cros_ec - ChromeOS Embedded Controller extcon
+ *
+ * Copyright (C) 2017 Google, Inc
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ */
+
+#include <linux/extcon.h>
+#include <linux/kernel.h>
+#include <linux/kobject.h>
+#include <linux/mfd/cros_ec.h>
+#include <linux/mfd/cros_ec_commands.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/sched.h>
+
+struct cros_ec_extcon_info {
+	struct device *dev;
+	struct extcon_dev *edev;
+
+	int port_id;
+
+	struct cros_ec_device *ec;
+
+	struct notifier_block notifier;
+
+	bool dp; /* DisplayPort enabled */
+	bool mux; /* SuperSpeed (usb3) enabled */
+	unsigned int power_type;
+};
+
+static const unsigned int usb_type_c_cable[] = {
+	EXTCON_USB,
+	EXTCON_USB_HOST,
+	EXTCON_DISP_DP,
+	EXTCON_NONE,
+};
+
+/**
+ * cros_ec_pd_command() - Send a command to the EC.
+ * @info: pointer to struct cros_ec_extcon_info
+ * @command: EC command
+ * @version: EC command version
+ * @outdata: EC command output data
+ * @outsize: Size of outdata
+ * @indata: EC command input data
+ * @insize: Size of indata
+ *
+ * Return: 0 on success, <0 on failure.
+ */
+static int cros_ec_pd_command(struct cros_ec_extcon_info *info,
+			      unsigned int command,
+			      unsigned int version,
+			      void *outdata,
+			      unsigned int outsize,
+			      void *indata,
+			      unsigned int insize)
+{
+	struct cros_ec_command *msg;
+	int ret;
+
+	msg = kzalloc(sizeof(*msg) + max(outsize, insize), GFP_KERNEL);
+
+	msg->version = version;
+	msg->command = command;
+	msg->outsize = outsize;
+	msg->insize = insize;
+
+	if (outsize)
+		memcpy(msg->data, outdata, outsize);
+
+	ret = cros_ec_cmd_xfer_status(info->ec, msg);
+	if (ret >= 0 && insize)
+		memcpy(indata, msg->data, insize);
+
+	kfree(msg);
+	return ret;
+}
+
+/**
+ * cros_ec_usb_get_power_type() - Get power type info about PD device attached
+ * to given port.
+ * @info: pointer to struct cros_ec_extcon_info
+ *
+ * Return: power type on success, <0 on failure.
+ */
+static int cros_ec_usb_get_power_type(struct cros_ec_extcon_info *info)
+{
+	struct ec_params_usb_pd_power_info req;
+	struct ec_response_usb_pd_power_info resp;
+	int ret;
+
+	req.port = info->port_id;
+	ret = cros_ec_pd_command(info, EC_CMD_USB_PD_POWER_INFO, 0,
+				 &req, sizeof(req), &resp, sizeof(resp));
+	if (ret < 0)
+		return ret;
+
+	return resp.type;
+}
+
+/**
+ * cros_ec_usb_get_pd_mux_state() - Get PD mux state for given port.
+ * @info: pointer to struct cros_ec_extcon_info
+ *
+ * Return: PD mux state on success, <0 on failure.
+ */
+static int cros_ec_usb_get_pd_mux_state(struct cros_ec_extcon_info *info)
+{
+	struct ec_params_usb_pd_mux_info req;
+	struct ec_response_usb_pd_mux_info resp;
+	int ret;
+
+	req.port = info->port_id;
+	ret = cros_ec_pd_command(info, EC_CMD_USB_PD_MUX_INFO, 0,
+				 &req, sizeof(req),
+				 &resp, sizeof(resp));
+	if (ret < 0)
+		return ret;
+
+	return resp.flags;
+}
+
+/**
+ * cros_ec_usb_get_role() - Get role info about possible PD device attached to a
+ * given port.
+ * @info: pointer to struct cros_ec_extcon_info
+ * @polarity: pointer to cable polarity (return value)
+ *
+ * Return: role info on success, -ENOTCONN if no cable is connected, <0 on
+ * failure.
+ */
+static int cros_ec_usb_get_role(struct cros_ec_extcon_info *info,
+				bool *polarity)
+{
+	struct ec_params_usb_pd_control pd_control;
+	struct ec_response_usb_pd_control_v1 resp;
+	int ret;
+
+	pd_control.port = info->port_id;
+	pd_control.role = USB_PD_CTRL_ROLE_NO_CHANGE;
+	pd_control.mux = USB_PD_CTRL_MUX_NO_CHANGE;
+	ret = cros_ec_pd_command(info, EC_CMD_USB_PD_CONTROL, 1,
+				 &pd_control, sizeof(pd_control),
+				 &resp, sizeof(resp));
+	if (ret < 0)
+		return ret;
+
+	if (!(resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED))
+		return -ENOTCONN;
+
+	*polarity = resp.polarity;
+
+	return resp.role;
+}
+
+/**
+ * cros_ec_pd_get_num_ports() - Get number of EC charge ports.
+ * @info: pointer to struct cros_ec_extcon_info
+ *
+ * Return: number of ports on success, <0 on failure.
+ */
+static int cros_ec_pd_get_num_ports(struct cros_ec_extcon_info *info)
+{
+	struct ec_response_usb_pd_ports resp;
+	int ret;
+
+	ret = cros_ec_pd_command(info, EC_CMD_USB_PD_PORTS,
+				 0, NULL, 0, &resp, sizeof(resp));
+	if (ret < 0)
+		return ret;
+
+	return resp.num_ports;
+}
+
+static const char *cros_ec_usb_power_type_string(unsigned int type)
+{
+	switch (type) {
+	case USB_CHG_TYPE_NONE:
+		return "USB_CHG_TYPE_NONE";
+	case USB_CHG_TYPE_PD:
+		return "USB_CHG_TYPE_PD";
+	case USB_CHG_TYPE_PROPRIETARY:
+		return "USB_CHG_TYPE_PROPRIETARY";
+	case USB_CHG_TYPE_C:
+		return "USB_CHG_TYPE_C";
+	case USB_CHG_TYPE_BC12_DCP:
+		return "USB_CHG_TYPE_BC12_DCP";
+	case USB_CHG_TYPE_BC12_CDP:
+		return "USB_CHG_TYPE_BC12_CDP";
+	case USB_CHG_TYPE_BC12_SDP:
+		return "USB_CHG_TYPE_BC12_SDP";
+	case USB_CHG_TYPE_OTHER:
+		return "USB_CHG_TYPE_OTHER";
+	case USB_CHG_TYPE_VBUS:
+		return "USB_CHG_TYPE_VBUS";
+	case USB_CHG_TYPE_UNKNOWN:
+		return "USB_CHG_TYPE_UNKNOWN";
+	default:
+		return "USB_CHG_TYPE_UNKNOWN";
+	}
+}
+
+static int extcon_cros_ec_detect_cable(struct cros_ec_extcon_info *info,
+				       bool force)
+{
+	struct device *dev = info->dev;
+	int role, power_type;
+	bool polarity, dp, mux, hpd;
+
+	power_type = cros_ec_usb_get_power_type(info);
+	if (power_type < 0) {
+		dev_err(dev, "failed getting power type err = %d\n",
+			power_type);
+		return power_type;
+	}
+
+	role = cros_ec_usb_get_role(info, &polarity);
+	if (role < 0) {
+		if (role != -ENOTCONN) {
+			dev_err(dev, "failed getting role err = %d\n", role);
+			return role;
+		}
+		polarity = false;
+		dp = false;
+		mux = false;
+		hpd = false;
+		dev_dbg(dev, "disconnected\n");
+	} else {
+		int pd_mux_state;
+
+		pd_mux_state = cros_ec_usb_get_pd_mux_state(info);
+		if (pd_mux_state < 0)
+			pd_mux_state = USB_PD_MUX_USB_ENABLED;
+
+		dp = pd_mux_state & USB_PD_MUX_DP_ENABLED;
+		mux = pd_mux_state & USB_PD_MUX_USB_ENABLED;
+		hpd = pd_mux_state & USB_PD_MUX_HPD_IRQ;
+	}
+
+	if (force || info->dp != dp ||
+	    info->mux != mux || info->power_type != power_type) {
+		bool host_connected = false, device_connected = false;
+
+		dev_dbg(dev, "Type/Role switch! type = %s\n",
+			cros_ec_usb_power_type_string(power_type));
+
+		info->dp = dp;
+		info->mux = mux;
+		info->power_type = power_type;
+
+		extcon_set_state(info->edev, EXTCON_USB, device_connected);
+		extcon_set_state(info->edev, EXTCON_USB_HOST, host_connected);
+		extcon_set_state(info->edev, EXTCON_DISP_DP, dp);
+		extcon_set_property(info->edev, EXTCON_USB,
+				    EXTCON_PROP_USB_TYPEC_POLARITY,
+				    (union extcon_property_value)(int)polarity);
+		extcon_set_property(info->edev, EXTCON_USB_HOST,
+				    EXTCON_PROP_USB_TYPEC_POLARITY,
+				    (union extcon_property_value)(int)polarity);
+		extcon_set_property(info->edev, EXTCON_DISP_DP,
+				    EXTCON_PROP_USB_TYPEC_POLARITY,
+				    (union extcon_property_value)(int)polarity);
+		extcon_set_property(info->edev, EXTCON_USB,
+				    EXTCON_PROP_USB_SS,
+				    (union extcon_property_value)(int)mux);
+		extcon_set_property(info->edev, EXTCON_USB_HOST,
+				    EXTCON_PROP_USB_SS,
+				    (union extcon_property_value)(int)mux);
+		extcon_set_property(info->edev, EXTCON_DISP_DP,
+				    EXTCON_PROP_USB_SS,
+				    (union extcon_property_value)(int)mux);
+
+		extcon_set_property(info->edev, EXTCON_DISP_DP,
+				    EXTCON_PROP_DISP_HPD,
+				    (union extcon_property_value)(int)hpd);
+
+		extcon_sync(info->edev, EXTCON_USB);
+		extcon_sync(info->edev, EXTCON_USB_HOST);
+		extcon_sync(info->edev, EXTCON_DISP_DP);
+
+	} else if (hpd) {
+		extcon_set_property(info->edev, EXTCON_DISP_DP,
+				    EXTCON_PROP_DISP_HPD,
+				    (union extcon_property_value)(int)hpd);
+		extcon_sync(info->edev, EXTCON_DISP_DP);
+	}
+
+	return 0;
+}
+
+static int extcon_cros_ec_event(struct notifier_block *nb,
+				unsigned long queued_during_suspend,
+				void *_notify)
+{
+	struct cros_ec_extcon_info *info;
+	struct cros_ec_device *ec;
+	u32 host_event;
+
+	info = container_of(nb, struct cros_ec_extcon_info, notifier);
+	ec = info->ec;
+
+	host_event = cros_ec_get_host_event(ec);
+	if (host_event & (EC_HOST_EVENT_MASK(EC_HOST_EVENT_PD_MCU) |
+			  EC_HOST_EVENT_MASK(EC_HOST_EVENT_USB_MUX))) {
+		extcon_cros_ec_detect_cable(info, false);
+		return NOTIFY_OK;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static int extcon_cros_ec_probe(struct platform_device *pdev)
+{
+	struct cros_ec_extcon_info *info;
+	struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	int numports, ret;
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->dev = dev;
+	info->ec = ec;
+
+	if (np) {
+		u32 port;
+
+		ret = of_property_read_u32(np, "google,usb-port-id", &port);
+		if (ret < 0) {
+			dev_err(dev, "Missing google,usb-port-id property\n");
+			return ret;
+		}
+		info->port_id = port;
+	} else {
+		info->port_id = pdev->id;
+	}
+
+	numports = cros_ec_pd_get_num_ports(info);
+	if (numports < 0) {
+		dev_err(dev, "failed getting number of ports! ret = %d\n",
+			numports);
+		return numports;
+	}
+
+	if (info->port_id >= numports) {
+		dev_err(dev, "This system only supports %d ports\n", numports);
+		return -ENODEV;
+	}
+
+	info->edev = devm_extcon_dev_allocate(dev, usb_type_c_cable);
+	if (IS_ERR(info->edev)) {
+		dev_err(dev, "failed to allocate extcon device\n");
+		return -ENOMEM;
+	}
+
+	ret = devm_extcon_dev_register(dev, info->edev);
+	if (ret < 0) {
+		dev_err(dev, "failed to register extcon device\n");
+		return ret;
+	}
+
+	extcon_set_property_capability(info->edev, EXTCON_USB,
+				       EXTCON_PROP_USB_VBUS);
+	extcon_set_property_capability(info->edev, EXTCON_USB_HOST,
+				       EXTCON_PROP_USB_VBUS);
+	extcon_set_property_capability(info->edev, EXTCON_USB,
+				       EXTCON_PROP_USB_TYPEC_POLARITY);
+	extcon_set_property_capability(info->edev, EXTCON_USB_HOST,
+				       EXTCON_PROP_USB_TYPEC_POLARITY);
+	extcon_set_property_capability(info->edev, EXTCON_DISP_DP,
+				       EXTCON_PROP_USB_TYPEC_POLARITY);
+	extcon_set_property_capability(info->edev, EXTCON_USB,
+				       EXTCON_PROP_USB_SS);
+	extcon_set_property_capability(info->edev, EXTCON_USB_HOST,
+				       EXTCON_PROP_USB_SS);
+	extcon_set_property_capability(info->edev, EXTCON_DISP_DP,
+				       EXTCON_PROP_USB_SS);
+	extcon_set_property_capability(info->edev, EXTCON_DISP_DP,
+				       EXTCON_PROP_DISP_HPD);
+
+	platform_set_drvdata(pdev, info);
+
+	/* Get PD events from the EC */
+	info->notifier.notifier_call = extcon_cros_ec_event;
+	ret = blocking_notifier_chain_register(&info->ec->event_notifier,
+					       &info->notifier);
+	if (ret < 0) {
+		dev_err(dev, "failed to register notifier\n");
+		return ret;
+	}
+
+	/* Perform initial detection */
+	ret = extcon_cros_ec_detect_cable(info, true);
+	if (ret < 0) {
+		dev_err(dev, "failed to detect initial cable state\n");
+		goto unregister_notifier;
+	}
+
+	return 0;
+
+unregister_notifier:
+	blocking_notifier_chain_unregister(&info->ec->event_notifier,
+					   &info->notifier);
+	return ret;
+}
+
+static int extcon_cros_ec_remove(struct platform_device *pdev)
+{
+	struct cros_ec_extcon_info *info = platform_get_drvdata(pdev);
+
+	blocking_notifier_chain_unregister(&info->ec->event_notifier,
+					   &info->notifier);
+
+	return 0;
+}
+
+#ifdef CONFIG_PM_SLEEP
+static int extcon_cros_ec_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int extcon_cros_ec_resume(struct device *dev)
+{
+	int ret;
+	struct cros_ec_extcon_info *info = dev_get_drvdata(dev);
+
+	ret = extcon_cros_ec_detect_cable(info, true);
+	if (ret < 0)
+		dev_err(dev, "failed to detect cable state on resume\n");
+
+	return 0;
+}
+
+static const struct dev_pm_ops extcon_cros_ec_dev_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(extcon_cros_ec_suspend, extcon_cros_ec_resume)
+};
+
+#define DEV_PM_OPS	(&extcon_cros_ec_dev_pm_ops)
+#else
+#define DEV_PM_OPS	NULL
+#endif /* CONFIG_PM_SLEEP */
+
+#ifdef CONFIG_OF
+static const struct of_device_id extcon_cros_ec_of_match[] = {
+	{ .compatible = "google,extcon-cros-ec" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, extcon_cros_ec_of_match);
+#endif /* CONFIG_OF */
+
+static struct platform_driver extcon_cros_ec_driver = {
+	.driver = {
+		.name  = "extcon-cros-ec",
+		.of_match_table = of_match_ptr(extcon_cros_ec_of_match),
+		.pm = DEV_PM_OPS,
+	},
+	.remove  = extcon_cros_ec_remove,
+	.probe   = extcon_cros_ec_probe,
+};
+
+module_platform_driver(extcon_cros_ec_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("ChromeOS Embedded Controller extcon driver");
diff --git a/include/linux/mfd/cros_ec_commands.h b/include/linux/mfd/cros_ec_commands.h
index 255d14a..3ca9953 100644
--- a/include/linux/mfd/cros_ec_commands.h
+++ b/include/linux/mfd/cros_ec_commands.h
@@ -285,10 +285,15 @@ enum host_event_code {
 	EC_HOST_EVENT_HANG_DETECT = 20,
 	/* Hang detect logic detected a hang and warm rebooted the AP */
 	EC_HOST_EVENT_HANG_REBOOT = 21,
+	/* PD MCU triggering host event */
+	EC_HOST_EVENT_PD_MCU = 22,
 
 	/* EC RTC event occurred */
 	EC_HOST_EVENT_RTC = 26,
 
+	/* EC desires to change state of host-controlled USB mux */
+	EC_HOST_EVENT_USB_MUX = 28,
+
 	/*
 	 * The high bit of the event mask is not used as a host event code.  If
 	 * it reads back as set, then the entire event mask should be
@@ -2873,6 +2878,76 @@ struct ec_params_usb_pd_control {
 	uint8_t mux;
 } __packed;
 
+#define PD_CTRL_RESP_ENABLED_COMMS      (1 << 0) /* Communication enabled */
+#define PD_CTRL_RESP_ENABLED_CONNECTED  (1 << 1) /* Device connected */
+#define PD_CTRL_RESP_ENABLED_PD_CAPABLE (1 << 2) /* Partner is PD capable */
+
+struct ec_response_usb_pd_control_v1 {
+	uint8_t enabled;
+	uint8_t role;
+	uint8_t polarity;
+	char state[32];
+} __packed;
+
+#define EC_CMD_USB_PD_PORTS 0x102
+
+struct ec_response_usb_pd_ports {
+	uint8_t num_ports;
+} __packed;
+
+#define EC_CMD_USB_PD_POWER_INFO 0x103
+
+#define PD_POWER_CHARGING_PORT 0xff
+struct ec_params_usb_pd_power_info {
+	uint8_t port;
+} __packed;
+
+enum usb_chg_type {
+	USB_CHG_TYPE_NONE,
+	USB_CHG_TYPE_PD,
+	USB_CHG_TYPE_C,
+	USB_CHG_TYPE_PROPRIETARY,
+	USB_CHG_TYPE_BC12_DCP,
+	USB_CHG_TYPE_BC12_CDP,
+	USB_CHG_TYPE_BC12_SDP,
+	USB_CHG_TYPE_OTHER,
+	USB_CHG_TYPE_VBUS,
+	USB_CHG_TYPE_UNKNOWN,
+};
+
+struct usb_chg_measures {
+	uint16_t voltage_max;
+	uint16_t voltage_now;
+	uint16_t current_max;
+	uint16_t current_lim;
+} __packed;
+
+struct ec_response_usb_pd_power_info {
+	uint8_t role;
+	uint8_t type;
+	uint8_t dualrole;
+	uint8_t reserved1;
+	struct usb_chg_measures meas;
+	uint32_t max_power;
+} __packed;
+
+/* Get info about USB-C SS muxes */
+#define EC_CMD_USB_PD_MUX_INFO 0x11a
+
+struct ec_params_usb_pd_mux_info {
+	uint8_t port; /* USB-C port number */
+} __packed;
+
+/* Flags representing mux state */
+#define USB_PD_MUX_USB_ENABLED       (1 << 0)
+#define USB_PD_MUX_DP_ENABLED        (1 << 1)
+#define USB_PD_MUX_POLARITY_INVERTED (1 << 2)
+#define USB_PD_MUX_HPD_IRQ           (1 << 3)
+
+struct ec_response_usb_pd_mux_info {
+	uint8_t flags; /* USB_PD_MUX_*-encoded USB mux state */
+} __packed;
+
 /*****************************************************************************/
 /*
  * Passthru commands
-- 
2.9.3
