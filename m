From: Sagar Dharia <sdharia@codeaurora.org>
Subject: [PATCH V3 1/6] SLIMbus: Device management on SLIMbus
Date: Mon,  3 Aug 2015 00:59:45 -0600
Message-ID: <1438585190-11894-2-git-send-email-sdharia@codeaurora.org>
References: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438585190-11894-1-git-send-email-sdharia@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, bp@suse.de, poeschel@lemonage.de, sdharia@codeaurora.org, treding@nvidia.com, broonie@kernel.org, gong.chen@linux.intel.com, andreas.noever@gmail.com, alan@linux.intel.com, mathieu.poirier@linaro.org, daniel@ffwll.ch, oded.gabbay@amd.com, jkosina@suse.cz, sharon.dvir1@mail.huji.ac.il, joe@perches.com, davem@davemloft.net, james.hogan@imgtec.com, michael.opdenacker@free-electrons.com, daniel.thompson@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kheitke@audience.com, mlocke@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

SLIMbus (Serial Low Power Interchip Media Bus) is a specification
developed by MIPI (Mobile Industry Processor Interface) alliance.
SLIMbus is a 2-wire implementation, which is used to communicate with
peripheral components like audio-codec.
SLIMbus uses Time-Division-Multiplexing to accommodate multiple data
channels, and control channel. Control channel has messages to do
device-enumeration, messages to send/receive control-data to/from
slimbus devices, messages for port/channel management, and messages to
do bandwidth allocation.
The framework supports multiple instances of the bus (1 controller per
bus), and multiple slave devices per controller.

This patch does device enumeration, logical address assignment,
informing device when the device reports present/absent etc.
Reporting present may need the driver to do the needful (e.g. turning
on voltage regulators powering the device). So probe is called
if the device is added to board-info list for a controller.
Additionally device is probed when it reports present if that device
doesn't need any such steps mentioned above.

Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
---
 Documentation/slimbus/summary   | 109 ++++++
 drivers/Kconfig                 |   2 +
 drivers/Makefile                |   1 +
 drivers/slimbus/Kconfig         |  11 +
 drivers/slimbus/Makefile        |   4 +
 drivers/slimbus/slim-core.c     | 734 ++++++++++++++++++++++++++++++++++++++++
 include/linux/mod_devicetable.h |  13 +
 include/linux/slimbus.h         | 389 +++++++++++++++++++++
 8 files changed, 1263 insertions(+)
 create mode 100644 Documentation/slimbus/summary
 create mode 100644 drivers/slimbus/Kconfig
 create mode 100644 drivers/slimbus/Makefile
 create mode 100644 drivers/slimbus/slim-core.c
 create mode 100644 include/linux/slimbus.h

diff --git a/Documentation/slimbus/summary b/Documentation/slimbus/summary
new file mode 100644
index 0000000..73d86e9
--- /dev/null
+++ b/Documentation/slimbus/summary
@@ -0,0 +1,109 @@
+Overview of Linux kernel SLIMbus support
+========================================
+
+What is SLIMbus?
+----------------
+SLIMbus (Serial Low Power Interchip Media Bus) is a specification developed by
+MIPI (Mobile Industry Processor Interface) alliance. The bus uses master/slave
+configuration, and is a 2-wire multi-drop implementation (clock, and data).
+
+Currently, SLIMbus is used to interface between application processors of SoCs
+(System-on-Chip) and peripheral components (typically codec).SLIMbus uses
+Time-Division-Multiplexing to accommodate multiple data channels, and
+a control channel.
+
+The control channel is used for various control functions such as bus
+management, configuration and status updates.These messages can be unicast (e.g.
+reading/writing device specific values), or multicast (e.g. data channel
+reconfiguration sequence is a broadcast message announced to all devices)
+
+A data channel is used for data-transfer between 2 Slimbus devices. Data
+channel uses dedicated ports on the device.
+
+Hardware description:
+---------------------
+Slimbus specification has different types of device classifications based on
+their capabilities.
+A manager device is responsible for enumeration, configuration, and dynamic
+channel allocation. Every bus has 1 active manager.
+
+A generic device is a device providing application functionality (e.g. codec).
+
+Framer device is responsible for clocking the bus, and transmitting frame-sync
+and framing information on the bus.
+
+Each SLIMbus component has an interface device for monitoring physical layer.
+
+Typically each SoC contains SLIMbus component having 1 manager, 1 framer device,
+1 generic device (for data channel support), and 1 interface device.
+External peripheral SLIMbus component usually has 1 generic device (for
+functionality/data channel support), and an associated interface device.
+The generic device's registers are mapped as 'value elements' so that they can
+be written/read using Slimbus control channel exchanging control/status type of
+information.
+In case there are multiple framer devices on the same bus, manager device is
+responsible to select the active-framer for clocking the bus.
+
+Per specification, Slimbus uses "clock gears" to do power management based on
+current frequency and bandwidth requirements. There are 10 clock gears and each
+gear changes the Slimbus frequency to be twice its previous gear.
+
+Each device has a 6-byte enumeration-address and the manager assigns every
+device with a 1-byte logical address after the devices report presence on the
+bus.
+
+Software description:
+---------------------
+There are 2 types of SLIMbus drivers:
+
+slim_controller represents a 'controller' for SLIMbus. This driver should
+implement duties needed by the SoC (manager device, associated
+interface device for monitoring the layers and reporting errors, default
+framer device).
+
+slim_device represents the 'generic device/component' for SLIMbus, and a
+slim_driver should implement driver for that slim_device.
+
+Device notifications to the driver:
+-----------------------------------
+Since SLIMbus devices have mechanisms for reporting their presence, the
+framework allows drivers to bind when corresponding devices report their
+presence on the bus.
+However, it is possible that the driver needs to be probed
+first so that it can enable corresponding SLIMbus devie (e.g. power it up and/or
+take it out of reset). To support that behavior, the framework allows drivers
+to probe first as well  (e.g. using standard DeviceTree compatbility field).
+This creates the necessity for the driver to know when the device is functional
+(i.e. reported present). device_up callback is used for that reason when the
+device reports present and is assigned a logical address by the contoller.
+
+Similarly, SLIMbus devices 'report absent' when they go down. A 'device_down'
+callback notifies the driver when the device reports absent and its logical
+address assignment is invalidated by the controller.
+
+Another notification "boot_device" is used to notify the slim_driver when
+controller resets the bus. This notification allows the driver to take necessary
+steps to boot the device so that it's functional after the bus has been reset.
+
+Clock-pause:
+------------
+SLIMbus mandates that a reconfiguration sequence (known as clock-pause) be
+broadcast to all active devices on the bus before the bus can enter low-power
+mode. Controller uses this sequence when it decides to enter low-power mode so
+that corresponding clocks and/or power-rails can be turned off to save power.
+Clock-pause is exited by waking up framer device (if controller driver initiates
+exiting low power mode), or by toggling the data line (if a slave device wants
+to initiate it).
+
+Messaging APIs:
+---------------
+The framework supports APIs to exchange control-information with a SLIMbus
+device. APIs can be synchronous or asynchronous.
+From controller's perspective, multiple buffers can be queued to/from
+hardware for sending/receiving data using slim_ctrl_buf circular buffer.
+The header file <linux/slimbus.h> has more documentation about messaging APIs.
+
+-----------------------------------------------------------------
+<Sections will be added to this document when port/channel bandwidth management
+support, multi-xfer APIs are added to the framework>
+------------------------------------------------------------------
diff --git a/drivers/Kconfig b/drivers/Kconfig
index c0cc96b..e39c969 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -182,4 +182,6 @@ source "drivers/thunderbolt/Kconfig"
 
 source "drivers/android/Kconfig"
 
+source "drivers/slimbus/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index 46d2554..37c1c88 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -74,6 +74,7 @@ obj-$(CONFIG_TARGET_CORE)	+= target/
 obj-$(CONFIG_MTD)		+= mtd/
 obj-$(CONFIG_SPI)		+= spi/
 obj-$(CONFIG_SPMI)		+= spmi/
+obj-$(CONFIG_SLIMBUS)		+= slimbus/
 obj-y				+= hsi/
 obj-y				+= net/
 obj-$(CONFIG_ATM)		+= atm/
diff --git a/drivers/slimbus/Kconfig b/drivers/slimbus/Kconfig
new file mode 100644
index 0000000..f0b118a
--- /dev/null
+++ b/drivers/slimbus/Kconfig
@@ -0,0 +1,11 @@
+#
+# SLIMBUS driver configuration
+#
+menuconfig SLIMBUS
+	tristate "Slimbus support"
+	help
+	  Slimbus is standard interface between System-on-Chip and audio codec,
+	  and other peripheral components in typical embedded systems.
+
+	  If unsure, choose N.
+
diff --git a/drivers/slimbus/Makefile b/drivers/slimbus/Makefile
new file mode 100644
index 0000000..aa9c147
--- /dev/null
+++ b/drivers/slimbus/Makefile
@@ -0,0 +1,4 @@
+#
+# Makefile for kernel slimbus framework.
+#
+obj-$(CONFIG_SLIMBUS)			+= slim-core.o
diff --git a/drivers/slimbus/slim-core.c b/drivers/slimbus/slim-core.c
new file mode 100644
index 0000000..ee80c1b
--- /dev/null
+++ b/drivers/slimbus/slim-core.c
@@ -0,0 +1,734 @@
+/* Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/errno.h>
+#include <linux/slab.h>
+#include <linux/init.h>
+#include <linux/completion.h>
+#include <linux/idr.h>
+#include <linux/pm_runtime.h>
+#include <linux/slimbus.h>
+
+static DEFINE_MUTEX(slim_lock);
+static DEFINE_IDR(ctrl_idr);
+static struct device_type slim_dev_type;
+static struct device_type slim_ctrl_type;
+
+static bool slim_eaddr_equal(struct slim_eaddr *a, struct slim_eaddr *b)
+{
+	return (a->manf_id == b->manf_id &&
+		a->prod_code == b->prod_code &&
+		a->dev_index == b->dev_index &&
+		a->instance == b->instance);
+}
+
+static const struct slim_device_id *
+slim_match(const struct slim_device_id *id, const struct slim_device *slim_dev)
+{
+	while (id->manf_id != 0 || id->prod_code != 0) {
+		if (id->manf_id == slim_dev->e_addr.manf_id &&
+		    id->prod_code == slim_dev->e_addr.prod_code &&
+		    id->dev_index == slim_dev->e_addr.dev_index)
+			return id;
+		id++;
+	}
+	return NULL;
+}
+
+static int slim_device_match(struct device *dev, struct device_driver *driver)
+{
+	struct slim_device *slim_dev;
+	struct slim_driver *drv = to_slim_driver(driver);
+
+	if (dev->type != &slim_dev_type)
+		return 0;
+
+	slim_dev = to_slim_device(dev);
+	if (drv->id_table)
+		return slim_match(drv->id_table, slim_dev) != NULL;
+	return 0;
+}
+
+struct sb_report_wd {
+	struct work_struct wd;
+	struct slim_device *sb;
+	bool report;
+};
+
+static void slim_report(struct work_struct *work)
+{
+	struct slim_driver *sbdrv;
+	struct sb_report_wd *sbw = container_of(work, struct sb_report_wd, wd);
+	struct slim_device *sbdev = sbw->sb;
+
+	mutex_lock(&sbdev->report_lock);
+	if (!sbdev->dev.driver)
+		goto report_exit;
+	/* check if device-up or down needs to be called */
+	if ((!sbdev->reported && !sbdev->notified) ||
+	    (sbdev->reported && sbdev->notified))
+		goto report_exit;
+
+	sbdrv = to_slim_driver(sbdev->dev.driver);
+	/**
+	 * address no longer valid, means device reported absent, whereas
+	 * address valid, means device reported present
+	 */
+	if (sbdev->notified && !sbdev->reported) {
+		sbdev->notified = false;
+		if (sbdrv->device_down)
+			sbdrv->device_down(sbdev);
+	} else if (!sbdev->notified && sbdev->reported) {
+		sbdev->notified = true;
+		if (sbdrv->device_up)
+			sbdrv->device_up(sbdev);
+	}
+report_exit:
+	mutex_unlock(&sbdev->report_lock);
+	kfree(sbw);
+}
+
+static void schedule_slim_report(struct slim_controller *ctrl,
+				 struct slim_device *sb, bool report)
+{
+	struct sb_report_wd *sbw;
+
+	dev_dbg(&ctrl->dev, "report:%d for slave:0x%x:0x%x:0x%x", report,
+		sb->e_addr.manf_id, sb->e_addr.prod_code, sb->e_addr.dev_index);
+
+	sbw = kmalloc(sizeof(*sbw), GFP_KERNEL);
+	if (!sbw)
+		return;
+
+	INIT_WORK(&sbw->wd, slim_report);
+	sbw->sb = sb;
+	sbw->report = report;
+	if (!queue_work(ctrl->wq, &sbw->wd))
+		kfree(sbw);
+}
+
+static int slim_device_probe(struct device *dev)
+{
+	struct slim_device	*slim_dev;
+	struct slim_driver	*driver;
+	struct slim_controller	*ctrl;
+	int status = 0;
+
+	if (dev->type != &slim_dev_type)
+		return -ENXIO;
+
+	slim_dev = to_slim_device(dev);
+	driver = to_slim_driver(dev->driver);
+	if (!driver->id_table)
+		return -ENODEV;
+
+	slim_dev->driver = driver;
+
+	if (driver->probe)
+		status = driver->probe(slim_dev);
+	if (status) {
+		slim_dev->driver = NULL;
+	} else if (driver->device_up) {
+		ctrl = slim_dev->ctrl;
+		schedule_slim_report(ctrl, slim_dev, true);
+	}
+	return status;
+}
+
+static int slim_device_remove(struct device *dev)
+{
+	struct slim_device *slim_dev;
+	struct slim_driver *driver;
+	int status = 0;
+
+	if (dev->type != &slim_dev_type)
+		return -ENXIO;
+
+	slim_dev = to_slim_device(dev);
+	if (!dev->driver)
+		return 0;
+
+	driver = to_slim_driver(dev->driver);
+	if (driver->remove)
+		status = driver->remove(slim_dev);
+
+	mutex_lock(&slim_dev->report_lock);
+	slim_dev->notified = false;
+	if (status == 0)
+		slim_dev->driver = NULL;
+	mutex_unlock(&slim_dev->report_lock);
+	return status;
+}
+
+struct bus_type slimbus_type = {
+	.name		= "slimbus",
+	.match		= slim_device_match,
+	.probe		= slim_device_probe,
+	.remove		= slim_device_remove,
+};
+EXPORT_SYMBOL_GPL(slimbus_type);
+
+/**
+ * slim_driver_register: Client driver registration with slimbus
+ * @drv:Client driver to be associated with client-device.
+ * This API will register the client driver with the slimbus
+ * It is called from the driver's module-init function.
+ */
+int slim_driver_register(struct slim_driver *drv)
+{
+	drv->driver.bus = &slimbus_type;
+
+	return driver_register(&drv->driver);
+}
+EXPORT_SYMBOL_GPL(slim_driver_register);
+
+/**
+ * slim_driver_unregister: Undo effect of slim_driver_register
+ * @drv: Client driver to be unregistered
+ */
+void slim_driver_unregister(struct slim_driver *drv)
+{
+	if (drv)
+		driver_unregister(&drv->driver);
+}
+
+static void slim_ctrl_release(struct device *dev)
+{
+	struct slim_controller *ctrl = to_slim_controller(dev);
+
+	complete(&ctrl->dev_released);
+}
+
+#define slim_ctrl_attr_gr NULL
+
+static struct device_type slim_ctrl_type = {
+	.groups		= slim_ctrl_attr_gr,
+	.release	= slim_ctrl_release,
+};
+
+static struct slim_controller *slim_ctrl_get(struct slim_controller *ctrl)
+{
+	if (!ctrl || !get_device(&ctrl->dev))
+		return NULL;
+
+	return ctrl;
+}
+
+static void slim_ctrl_put(struct slim_controller *ctrl)
+{
+	if (ctrl)
+		put_device(&ctrl->dev);
+}
+
+static void slim_dev_release(struct device *dev)
+{
+	struct slim_device *sbdev = to_slim_device(dev);
+
+	slim_ctrl_put(sbdev->ctrl);
+}
+
+#define slim_device_attr_gr NULL
+#define slim_device_uevent NULL
+
+static struct device_type slim_dev_type = {
+	.groups		= slim_device_attr_gr,
+	.uevent		= slim_device_uevent,
+	.release	= slim_dev_release,
+};
+
+/**
+ * slim_add_device: Add a new device without register board info.
+ * @ctrl: Controller to which this device is to be added to.
+ * Called when device doesn't have an explicit client-driver to be probed, or
+ * the client-driver is a module installed dynamically.
+ */
+int slim_add_device(struct slim_controller *ctrl, struct slim_device *sbdev)
+{
+	sbdev->dev.bus = &slimbus_type;
+	sbdev->dev.parent = ctrl->dev.parent;
+	sbdev->dev.type = &slim_dev_type;
+	sbdev->dev.driver = NULL;
+	sbdev->ctrl = ctrl;
+	slim_ctrl_get(ctrl);
+	if (!sbdev->name) {
+		sbdev->name = kasprintf(GFP_KERNEL, "0x%x:0x%x:0x%x:0x%x",
+					sbdev->e_addr.manf_id,
+					sbdev->e_addr.prod_code,
+					sbdev->e_addr.dev_index,
+					sbdev->e_addr.instance);
+		if (!sbdev->name)
+			return -ENOMEM;
+	}
+	dev_dbg(&ctrl->dev, "adding device:%s\n", sbdev->name);
+	dev_set_name(&sbdev->dev, "%s", sbdev->name);
+	mutex_lock(&ctrl->m_ctrl);
+	list_add_tail(&sbdev->dev_list, &ctrl->devs);
+	mutex_unlock(&ctrl->m_ctrl);
+	mutex_init(&sbdev->report_lock);
+	/* probe slave on this controller */
+	return device_register(&sbdev->dev);
+}
+EXPORT_SYMBOL_GPL(slim_add_device);
+
+struct sbi_boardinfo {
+	struct list_head	list;
+	struct slim_boardinfo	board_info;
+};
+
+static LIST_HEAD(board_list);
+static LIST_HEAD(slim_ctrl_list);
+static DEFINE_MUTEX(board_lock);
+
+/* If controller is not present, only add to boards list */
+static void slim_match_ctrl_to_boardinfo(struct slim_controller *ctrl,
+					 struct slim_boardinfo *bi)
+{
+	int ret;
+
+	if (ctrl->nr != bi->bus_num)
+		return;
+
+	ret = slim_add_device(ctrl, bi->slim_slave);
+	if (ret != 0)
+		dev_err(ctrl->dev.parent, "can't create new device %s, ret:%d\n",
+			bi->slim_slave->name, ret);
+}
+
+/**
+ * slim_register_board_info: Board-initialization routine.
+ * @info: List of all devices on all controllers present on the board.
+ * @n: number of entries.
+ * API enumerates respective devices on corresponding controller.
+ * Called from board-init function.
+ */
+int slim_register_board_info(struct slim_boardinfo const *info, unsigned n)
+{
+	struct sbi_boardinfo *bi;
+	int i;
+
+	bi = kcalloc(n, sizeof(*bi), GFP_KERNEL);
+	if (!bi)
+		return -ENOMEM;
+
+	for (i = 0; i < n; i++, bi++, info++) {
+		struct slim_controller *ctrl;
+
+		memcpy(&bi->board_info, info, sizeof(*info));
+		mutex_lock(&board_lock);
+		list_add_tail(&bi->list, &board_list);
+		list_for_each_entry(ctrl, &slim_ctrl_list, list)
+			slim_match_ctrl_to_boardinfo(ctrl, &bi->board_info);
+		mutex_unlock(&board_lock);
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(slim_register_board_info);
+
+static void slim_ctrl_add_boarddevs(struct slim_controller *ctrl)
+{
+	struct sbi_boardinfo *bi;
+
+	mutex_lock(&board_lock);
+	list_add_tail(&ctrl->list, &slim_ctrl_list);
+	list_for_each_entry(bi, &board_list, list)
+		slim_match_ctrl_to_boardinfo(ctrl, &bi->board_info);
+	mutex_unlock(&board_lock);
+}
+
+/**
+ * slim_register_controller: Controller bring-up and registration.
+ * @ctrl: Controller to be registered.
+ * A controller is registered with the framework using this API.
+ * If devices on a controller were registered before controller,
+ * this will make sure that they get probed when controller is up
+ */
+int slim_register_controller(struct slim_controller *ctrl)
+{
+	int id, ret = 0;
+
+	mutex_lock(&slim_lock);
+	id = idr_alloc(&ctrl_idr, ctrl, ctrl->nr, -1, GFP_KERNEL);
+	mutex_unlock(&slim_lock);
+
+	if (id < 0)
+		return id;
+
+	ctrl->nr = id;
+
+	/* Can't register until after driver model init */
+	if (WARN_ON(!slimbus_type.p)) {
+		ret = -EAGAIN;
+		goto out_list;
+	}
+
+	dev_set_name(&ctrl->dev, "sb-%d", ctrl->nr);
+	ctrl->dev.bus = &slimbus_type;
+	ctrl->dev.type = &slim_ctrl_type;
+	ctrl->num_dev = 0;
+	if (!ctrl->min_cg)
+		ctrl->min_cg = SLIM_MIN_CLK_GEAR;
+	if (!ctrl->max_cg)
+		ctrl->max_cg = SLIM_MAX_CLK_GEAR;
+	mutex_init(&ctrl->m_ctrl);
+	ret = device_register(&ctrl->dev);
+	if (ret)
+		goto out_list;
+
+	dev_dbg(&ctrl->dev, "Bus [%s] registered:dev:%p\n",
+		ctrl->name, &ctrl->dev);
+
+	INIT_LIST_HEAD(&ctrl->devs);
+	ctrl->wq = create_singlethread_workqueue(dev_name(&ctrl->dev));
+	if (!ctrl->wq)
+		goto err_workq_failed;
+
+	slim_ctrl_add_boarddevs(ctrl);
+	return 0;
+
+err_workq_failed:
+	device_unregister(&ctrl->dev);
+out_list:
+	mutex_lock(&slim_lock);
+	idr_remove(&ctrl_idr, ctrl->nr);
+	mutex_unlock(&slim_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(slim_register_controller);
+
+/* slim_remove_device: Remove the effect of slim_add_device() */
+void slim_remove_device(struct slim_device *sbdev)
+{
+	struct slim_controller *ctrl = sbdev->ctrl;
+
+	mutex_lock(&ctrl->m_ctrl);
+	list_del_init(&sbdev->dev_list);
+	mutex_unlock(&ctrl->m_ctrl);
+	device_unregister(&sbdev->dev);
+}
+EXPORT_SYMBOL_GPL(slim_remove_device);
+
+static void slim_ctrl_remove_device(struct slim_controller *ctrl,
+				    struct slim_boardinfo *bi)
+{
+	if (ctrl->nr == bi->bus_num)
+		slim_remove_device(bi->slim_slave);
+}
+
+/**
+ * slim_del_controller: Controller tear-down.
+ * @ctrl: Controller to tear-down.
+ */
+int slim_del_controller(struct slim_controller *ctrl)
+{
+	struct slim_controller *found;
+	struct sbi_boardinfo *bi;
+
+	/* First make sure that this bus was added */
+	mutex_lock(&slim_lock);
+	found = idr_find(&ctrl_idr, ctrl->nr);
+	mutex_unlock(&slim_lock);
+	if (found != ctrl)
+		return -EINVAL;
+
+	/* Remove all clients */
+	mutex_lock(&board_lock);
+	list_for_each_entry(bi, &board_list, list)
+		slim_ctrl_remove_device(ctrl, &bi->board_info);
+	mutex_unlock(&board_lock);
+
+	init_completion(&ctrl->dev_released);
+	device_unregister(&ctrl->dev);
+
+	wait_for_completion(&ctrl->dev_released);
+	list_del(&ctrl->list);
+	destroy_workqueue(ctrl->wq);
+	/* free bus id */
+	mutex_lock(&slim_lock);
+	idr_remove(&ctrl_idr, ctrl->nr);
+	mutex_unlock(&slim_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(slim_del_controller);
+
+/**
+ * slim_report_absent: Controller calls this function when a device
+ *	reports absent, OR when the device cannot be communicated with
+ * @sbdev: Device that cannot be reached, or sent report absent
+ */
+void slim_report_absent(struct slim_device *sbdev)
+{
+	struct slim_controller *ctrl;
+	int i;
+
+	if (!sbdev)
+		return;
+	ctrl = sbdev->ctrl;
+	if (!ctrl)
+		return;
+	/* invalidate logical addresses */
+	mutex_lock(&ctrl->m_ctrl);
+	for (i = 0; i < ctrl->num_dev; i++) {
+		if (sbdev->laddr == ctrl->addrt[i].laddr)
+			ctrl->addrt[i].valid = false;
+	}
+	mutex_unlock(&ctrl->m_ctrl);
+	mutex_lock(&sbdev->report_lock);
+	sbdev->reported = false;
+	schedule_slim_report(ctrl, sbdev, false);
+	mutex_unlock(&sbdev->report_lock);
+}
+EXPORT_SYMBOL_GPL(slim_report_absent);
+
+/**
+ * slim_framer_booted: This function is called by controller after the active
+ * framer has booted (using Bus Reset sequence, or after it has shutdown and has
+ * come back up).
+ * @ctrl: Controller associated with this framer
+ * Components, devices on the bus may be in undefined state,
+ * and this function triggers their drivers to do the needful
+ * to bring them back in Reset state so that they can acquire sync, report
+ * present and be operational again.
+ */
+void slim_framer_booted(struct slim_controller *ctrl)
+{
+	struct slim_device *sbdev;
+	struct list_head *pos, *next;
+
+	if (!ctrl)
+		return;
+	mutex_lock(&ctrl->m_ctrl);
+	list_for_each_safe(pos, next, &ctrl->devs) {
+		struct slim_driver *sbdrv;
+
+		sbdev = list_entry(pos, struct slim_device, dev_list);
+		mutex_unlock(&ctrl->m_ctrl);
+		if (sbdev && sbdev->dev.driver) {
+			sbdrv = to_slim_driver(sbdev->dev.driver);
+			if (sbdrv->boot_device)
+				sbdrv->boot_device(sbdev);
+		}
+		mutex_lock(&ctrl->m_ctrl);
+	}
+	mutex_unlock(&ctrl->m_ctrl);
+}
+EXPORT_SYMBOL_GPL(slim_framer_booted);
+
+/**
+ * slim_query_device: Query and get handle to a device.
+ * @ctrl: Controller on which this device will be added/queried
+ * @e_addr: Enumeration address of the device to be queried
+ * Returns pointer to a device if it has already reported. Creates a new
+ * device and returns pointer to it if the device has not yet enumerated.
+ */
+struct slim_device *slim_query_device(struct slim_controller *ctrl,
+				      struct slim_eaddr *e_addr)
+{
+	struct slim_device *slim = NULL;
+	struct sbi_boardinfo *bi;
+
+	/* Check if the device is already present */
+	mutex_lock(&board_lock);
+	list_for_each_entry(bi, &board_list, list) {
+		if (bi->board_info.bus_num != ctrl->nr)
+			continue;
+		if (slim_eaddr_equal(&bi->board_info.slim_slave->e_addr,
+				     e_addr)) {
+			slim = bi->board_info.slim_slave;
+			break;
+		}
+	}
+	mutex_unlock(&board_lock);
+	if (slim)
+		return slim;
+
+	mutex_lock(&ctrl->m_ctrl);
+	list_for_each_entry(slim, &ctrl->devs, dev_list) {
+		if (slim_eaddr_equal(&slim->e_addr, e_addr)) {
+			mutex_unlock(&ctrl->m_ctrl);
+			return slim;
+		}
+	}
+	mutex_unlock(&ctrl->m_ctrl);
+
+	slim = kzalloc(sizeof(struct slim_device), GFP_KERNEL);
+	if (IS_ERR(slim))
+		return NULL;
+	slim->e_addr = *e_addr;
+	if (slim_add_device(ctrl, slim) != 0) {
+		kfree(slim);
+		return NULL;
+	}
+	return slim;
+}
+EXPORT_SYMBOL_GPL(slim_query_device);
+
+static int ctrl_getaddr_entry(struct slim_controller *ctrl,
+			      struct slim_eaddr *eaddr, u8 *entry)
+{
+	int i;
+
+	for (i = 0; i < ctrl->num_dev; i++) {
+		if (ctrl->addrt[i].valid &&
+		    slim_eaddr_equal(&ctrl->addrt[i].eaddr, eaddr)) {
+			*entry = i;
+			return 0;
+		}
+	}
+	return -ENXIO;
+}
+
+/**
+ * slim_assign_laddr: Assign logical address to a device enumerated.
+ * @ctrl: Controller with which device is enumerated.
+ * @e_addr: Enumeration address of the device.
+ * @laddr: Return logical address (if valid flag is false)
+ * @valid: true if laddr holds a valid address that controller wants to
+ *	set for this enumeration address. Otherwise framework sets index into
+ *	address table as logical address.
+ * Called by controller in response to REPORT_PRESENT. Framework will assign
+ * a logical address to this enumeration address.
+ * Function returns -EXFULL to indicate that all logical addresses are already
+ * taken.
+ */
+int slim_assign_laddr(struct slim_controller *ctrl, struct slim_eaddr *e_addr,
+		      u8 *laddr, bool valid)
+{
+	int ret;
+	u8 i = 0;
+	bool exists = false;
+	struct slim_device *slim;
+	struct slim_addrt *temp;
+
+	mutex_lock(&ctrl->m_ctrl);
+	/* already assigned */
+	if (ctrl_getaddr_entry(ctrl, e_addr, &i) == 0) {
+		*laddr = ctrl->addrt[i].laddr;
+		exists = true;
+	} else {
+		if (ctrl->num_dev >= (SLIM_LA_MANAGER - 1)) {
+			ret = -EXFULL;
+			goto ret_assigned_laddr;
+		}
+		for (i = 0; i < ctrl->num_dev; i++) {
+			if (ctrl->addrt[i].valid == false)
+				break;
+		}
+		if (i == ctrl->num_dev) {
+			temp = krealloc(ctrl->addrt,
+					(ctrl->num_dev + 1) *
+					sizeof(struct slim_addrt),
+					GFP_KERNEL);
+			if (!temp) {
+				ret = -ENOMEM;
+				goto ret_assigned_laddr;
+			}
+			ctrl->addrt = temp;
+			ctrl->num_dev++;
+		}
+		ctrl->addrt[i].eaddr = *e_addr;
+		ctrl->addrt[i].valid = true;
+		/* Preferred address is index into table */
+		if (!valid)
+			*laddr = i;
+	}
+
+	ret = ctrl->set_laddr(ctrl, &ctrl->addrt[i].eaddr, *laddr);
+	if (ret) {
+		ctrl->addrt[i].valid = false;
+		goto ret_assigned_laddr;
+	}
+	ctrl->addrt[i].laddr = *laddr;
+
+ret_assigned_laddr:
+	mutex_unlock(&ctrl->m_ctrl);
+	if (exists || ret)
+		return ret;
+
+	pr_info("setting slimbus l-addr:%x, ea:%x,%x,%x,%x\n",
+		*laddr, e_addr->manf_id, e_addr->prod_code,
+		e_addr->dev_index, e_addr->instance);
+	/**
+	 * Add this device to list of devices on this controller if it's
+	 * not already present
+	 */
+	slim = slim_query_device(ctrl, e_addr);
+	if (!slim) {
+		ret = -ENOMEM;
+	} else {
+		struct slim_driver *sbdrv;
+
+		slim->laddr = *laddr;
+		mutex_lock(&slim->report_lock);
+		slim->reported = true;
+		if (slim->dev.driver) {
+			sbdrv = to_slim_driver(slim->dev.driver);
+			if (sbdrv->device_up)
+				schedule_slim_report(ctrl, slim, true);
+		}
+		mutex_unlock(&slim->report_lock);
+	}
+	return ret;
+}
+EXPORT_SYMBOL_GPL(slim_assign_laddr);
+
+/**
+ * slim_get_logical_addr: Return the logical address of a slimbus device.
+ * @sb: client handle requesting the adddress.
+ * @e_addr: Enumeration address of the device.
+ * @laddr: output buffer to store the address
+ * context: can sleep
+ * -EINVAL is returned in case of invalid parameters, and -ENXIO is returned if
+ *  the device with this enumeration address is not found.
+ */
+int slim_get_logical_addr(struct slim_device *sb, struct slim_eaddr *e_addr,
+			  u8 *laddr)
+{
+	int ret;
+	u8 entry;
+	struct slim_controller *ctrl = sb->ctrl;
+
+	if (!ctrl || !laddr || !e_addr)
+		return -EINVAL;
+
+	mutex_lock(&ctrl->m_ctrl);
+	ret = ctrl_getaddr_entry(ctrl, e_addr, &entry);
+	if (!ret)
+		*laddr = ctrl->addrt[entry].laddr;
+	mutex_unlock(&ctrl->m_ctrl);
+
+	if (ret == -ENXIO && ctrl->get_laddr) {
+		ret = ctrl->get_laddr(ctrl, e_addr, laddr);
+		if (!ret)
+			ret = slim_assign_laddr(ctrl, e_addr, laddr, true);
+	}
+	return ret;
+}
+EXPORT_SYMBOL_GPL(slim_get_logical_addr);
+
+static void __exit slimbus_exit(void)
+{
+	bus_unregister(&slimbus_type);
+}
+
+static int __init slimbus_init(void)
+{
+	return bus_register(&slimbus_type);
+}
+postcore_initcall(slimbus_init);
+module_exit(slimbus_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_VERSION("0.1");
+MODULE_DESCRIPTION("Slimbus module");
+MODULE_ALIAS("platform:slimbus");
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 3bfd567..94abc09 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -427,6 +427,19 @@ struct spi_device_id {
 	kernel_ulong_t driver_data;	/* Data private to the driver */
 };
 
+/* SLIMbus */
+
+#define SLIMBUS_NAME_SIZE	32
+#define SLIMBUS_MODULE_PREFIX	"slim:"
+
+struct slim_device_id {
+	__u16 manf_id, prod_code;
+	__u8 dev_index, instance;
+
+	/* Data private to the driver */
+	kernel_ulong_t driver_data;
+};
+
 #define SPMI_NAME_SIZE	32
 #define SPMI_MODULE_PREFIX "spmi:"
 
diff --git a/include/linux/slimbus.h b/include/linux/slimbus.h
new file mode 100644
index 0000000..ca587ec
--- /dev/null
+++ b/include/linux/slimbus.h
@@ -0,0 +1,389 @@
+/* Copyright (c) 2011-2015, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#ifndef _LINUX_SLIMBUS_H
+#define _LINUX_SLIMBUS_H
+#include <linux/module.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/mod_devicetable.h>
+
+/**
+ * Interfaces between SLIMbus manager drivers, SLIMbus client drivers, and
+ * SLIMbus infrastructure.
+ */
+
+extern struct bus_type slimbus_type;
+
+/* Standard values per SLIMbus spec needed by controllers and devices */
+#define SLIM_CL_PER_SUPERFRAME		6144
+#define SLIM_CL_PER_SUPERFRAME_DIV8	(SLIM_CL_PER_SUPERFRAME >> 3)
+#define SLIM_MAX_CLK_GEAR		10
+#define SLIM_MIN_CLK_GEAR		1
+#define SLIM_CL_PER_SL			4
+#define SLIM_SL_PER_SUPERFRAME		(SLIM_CL_PER_SUPERFRAME >> 2)
+#define SLIM_FRM_SLOTS_PER_SUPERFRAME	16
+#define SLIM_GDE_SLOTS_PER_SUPERFRAME	2
+
+struct slim_controller;
+struct slim_device;
+
+/**
+ * struct slim_eaddr: Enumeration address for a slimbus device
+ * @manf_id: Manufacturer Id for the device
+ * @prod_code: Product code
+ * @dev_index: Device index
+ * @instance: Instance value
+ */
+struct slim_eaddr {
+	u16 manf_id;
+	u16 prod_code;
+	u8 dev_index;
+	u8 instance;
+};
+
+/**
+ * struct slim_framer - Represents Slimbus framer.
+ * Every controller may have multiple framers. There is 1 active framer device
+ * responsible for clocking the bus.
+ * Manager is responsible for framer hand-over.
+ * @dev: Driver model representation of the device.
+ * @e_addr: Enumeration address of the framer.
+ * @rootfreq: Root Frequency at which the framer can run. This is maximum
+ *	frequency ('clock gear 10') at which the bus can operate.
+ * @superfreq: Superframes per root frequency. Every frame is 6144 bits.
+ */
+struct slim_framer {
+	struct device		dev;
+	struct slim_eaddr	e_addr;
+	int			rootfreq;
+	int			superfreq;
+};
+
+#define to_slim_framer(d) container_of(d, struct slim_framer, dev)
+
+/**
+ * struct slim_addrt: slimbus address used internally by the slimbus framework.
+ * @valid: If the device is present. Valid is set to false when device reports
+ *	absent.
+ * @eaddr: Enumeration address
+ * @laddr: It is possible that controller will set a predefined logical address
+ *	rather than the one assigned by framework. (i.e. logical address may
+ *	not be same as index into this table). This entry will store the
+ *	logical address value for this enumeration address.
+ */
+struct slim_addrt {
+	bool			valid;
+	struct slim_eaddr	eaddr;
+	u8			laddr;
+};
+
+/* SLIMbus message types. Related to interpretation of message code. */
+#define SLIM_MSG_MT_CORE			0x0
+#define SLIM_MSG_MT_DEST_REFERRED_CLASS		0x1
+#define SLIM_MSG_MT_DEST_REFERRED_USER		0x2
+#define SLIM_MSG_MT_SRC_REFERRED_CLASS		0x5
+#define SLIM_MSG_MT_SRC_REFERRED_USER		0x6
+
+/* SLIMbus core type Message Codes. */
+/* Device management messages used by this framework */
+#define SLIM_MSG_MC_REPORT_PRESENT               0x1
+#define SLIM_MSG_MC_ASSIGN_LOGICAL_ADDRESS       0x2
+#define SLIM_MSG_MC_REPORT_ABSENT                0xF
+
+/* Destination type Values */
+#define SLIM_MSG_DEST_LOGICALADDR	0
+#define SLIM_MSG_DEST_ENUMADDR		1
+#define	SLIM_MSG_DEST_BROADCAST		3
+
+/**
+ * struct slim_controller: Controls every instance of SLIMbus
+ *				(similar to 'master' on SPI)
+ *	'Manager device' is responsible for  device management, bandwidth
+ *	allocation, channel setup, and port associations per channel.
+ *	Device management means Logical address assignment/removal based on
+ *	enumeration (report-present, report-absent) if a device.
+ *	Bandwidth allocation is done dynamically by the manager based on active
+ *	channels on the bus, message-bandwidth requests made by slimbus devices.
+ *	Based on current bandwidth usage, manager chooses a frequency to run
+ *	the bus at (in steps of 'clock-gear', 1 through 10, each clock gear
+ *	representing twice the frequency than the previous gear).
+ *	Manager is also responsible for entering (and exiting) low-power-mode
+ *	(known as 'clock pause').
+ *	Manager can do handover of framer if there are multiple framers on the
+ *	bus and a certain usecase warrants using certain framer to avoid keeping
+ *	previous framer being powered-on.
+ *
+ *	Controller here performs duties of the manager device, and 'interface
+ *	device'. Interface device is responsible for monitoring the bus and
+ *	reporting information such as loss-of-synchronization, data
+ *	slot-collision.
+ * @dev: Device interface to this driver
+ * @nr: Board-specific number identifier for this controller/bus
+ * @list: Link with other slimbus controllers
+ * @name: Name for this controller
+ * @min_cg: Minimum clock gear supported by this controller (default value: 1)
+ * @max_cg: Maximum clock gear supported by this controller (default value: 10)
+ * @clkgear: Current clock gear in which this bus is running
+ * @a_framer: Active framer which is clocking the bus managed by this controller
+ * @m_ctrl: Mutex protecting controller data structures
+ * @addrt: Logical address table
+ * @num_dev: Number of active slimbus slaves on this bus
+ * @devs: List of devices on this controller
+ * @wq: Workqueue per controller used to notify devices when they report present
+ * @dev_released: completion used to signal when sysfs has released this
+ *	controller so that it can be deleted during shutdown
+ * @xfer_msg: Transfer a message on this controller (this can be a broadcast
+ *	control/status message like data channel setup, or a unicast message
+ *	like value element read/write.
+ * @set_laddr: Setup logical address at laddr for the slave with elemental
+ *	address e_addr. Drivers implementing controller will be expected to
+ *	send unicast message to this device with its logical address.
+ * @get_laddr: It is possible that controller needs to set fixed logical
+ *	address table and get_laddr can be used in that case so that controller
+ *	can do this assignment.
+ */
+struct slim_controller {
+	struct device		dev;
+	unsigned int		nr;
+	struct list_head	list;
+	char			name[SLIMBUS_NAME_SIZE];
+	int			min_cg;
+	int			max_cg;
+	int			clkgear;
+	struct slim_framer	*a_framer;
+	struct mutex		m_ctrl;
+	struct slim_addrt	*addrt;
+	u8			num_dev;
+	struct list_head	devs;
+	struct workqueue_struct *wq;
+	struct completion	dev_released;
+	int			(*set_laddr)(struct slim_controller *ctrl,
+					     struct slim_eaddr *ea, u8 laddr);
+	int			(*get_laddr)(struct slim_controller *ctrl,
+					     struct slim_eaddr *ea, u8 *laddr);
+};
+
+#define to_slim_controller(d) container_of(d, struct slim_controller, dev)
+
+/**
+ * struct slim_driver: Slimbus 'generic device' (slave) device driver
+ *				(similar to 'spi_device' on SPI)
+ * @probe: Binds this driver to a slimbus device.
+ * @remove: Unbinds this driver from the slimbus device.
+ * @shutdown: Standard shutdown callback used during powerdown/halt.
+ * @suspend: Standard suspend callback used during system suspend
+ * @resume: Standard resume callback used during system resume
+ * @device_up: This callback is called when the device reports present and
+ *		gets a logical address assigned to it
+ * @device_down: This callback is called when device reports absent, or the
+ *		bus goes down. Device will report present when bus is up and
+ *		device_up callback will be called again when that happens
+ * @boot_device: This callback is called after framer is booted.
+ *		Driver should do the needful to boot the device,
+ *		so that device acquires sync and be operational.
+ * @driver: Slimbus device drivers should initialize name and owner field of
+ *	this structure
+ * @id_table: List of slimbus devices supported by this driver
+ */
+struct slim_driver {
+	int				(*probe)(struct slim_device *sl);
+	int				(*remove)(struct slim_device *sl);
+	void				(*shutdown)(struct slim_device *sl);
+	int				(*suspend)(struct slim_device *sl,
+						   pm_message_t pmesg);
+	int				(*resume)(struct slim_device *sl);
+	int				(*device_up)(struct slim_device *sl);
+	int				(*device_down)(struct slim_device *sl);
+	int				(*boot_device)(struct slim_device *sl);
+
+	struct device_driver		driver;
+	const struct slim_device_id	*id_table;
+};
+
+#define to_slim_driver(d) container_of(d, struct slim_driver, driver)
+
+/**
+ * Client/device handle (struct slim_device):
+ * ------------------------------------------
+ *  This is the client/device handle returned when a slimbus
+ *  device is registered with a controller. This structure can be provided
+ *  during register_board_info, or can be allocated using slim_add_device API.
+ *  Pointer to this structure is used by client-driver as a handle.
+ *  @dev: Driver model representation of the device.
+ *  @name: Name of driver to use with this device.
+ *  @e_addr: Enumeration address of this device.
+ *  @driver: Device's driver. Pointer to access routines.
+ *  @ctrl: Slimbus controller managing the bus hosting this device.
+ *  @laddr: 1-byte Logical address of this device.
+ *  @reported: Flag to indicate whether this device reported present. The flag
+ *	is set when device reports present, and is reset when it reports
+ *	absent. This flag alongwith notified flag below is used to call
+ *	device_up, or device_down callbacks for driver of this device.
+ *  @notified: Flag to indicate whether this device has been notified. The
+ *	device may report present multiple times, but should be notified only
+ *	first time it has reported present.
+ *  @report_lock: Lock to protect reporting and notification for this device
+ *  @dev_list: List of devices on a controller
+ */
+struct slim_device {
+	struct device		dev;
+	char		*name;
+	struct slim_eaddr	e_addr;
+	struct slim_driver	*driver;
+	struct slim_controller	*ctrl;
+	u8			laddr;
+	bool			reported;
+	bool			notified;
+	struct mutex		report_lock;
+	struct list_head	dev_list;
+};
+
+#define to_slim_device(d) container_of(d, struct slim_device, dev)
+
+/**
+ * struct slim_boardinfo: Declare board info for Slimbus device bringup.
+ * @bus_num: Controller number (bus) on which this device will sit.
+ * @slim_slave: Device to be registered with slimbus.
+ */
+struct slim_boardinfo {
+	int			bus_num;
+	struct slim_device	*slim_slave;
+};
+
+/* Manager's logical address is set to 0xFF per spec */
+#define SLIM_LA_MANAGER 0xFF
+/**
+ * slim_get_logical_addr: Return the logical address of a slimbus device.
+ * @sb: client handle requesting the adddress.
+ * @e_addr: Enumeration address of the device.
+ * @laddr: output buffer to store the address
+ * context: can sleep
+ * -EINVAL is returned in case of invalid parameters.
+ * -ENXIO is returned if the device with this elemental address is not found.
+ */
+
+int slim_get_logical_addr(struct slim_device *sb,
+				 struct slim_eaddr *e_addr, u8 *laddr);
+
+/**
+ * slim_driver_register: Client driver registration with slimbus
+ * @drv:Client driver to be associated with client-device.
+ * This API will register the client driver with the slimbus
+ * It is called from the driver's module-init function.
+ */
+int slim_driver_register(struct slim_driver *drv);
+
+/**
+ * slim_driver_unregister: Undo effects of slim_driver_register
+ * @drv: Client driver to be unregistered
+ */
+void slim_driver_unregister(struct slim_driver *drv);
+
+/**
+ * slim_del_controller: Controller tear-down.
+ * @ctrl: Controller to be torn-down.
+ */
+int slim_del_controller(struct slim_controller *ctrl);
+
+/**
+ * slim_add_device: Add a new device without register board info.
+ * @ctrl: Controller to which this device is to be added to.
+ * sbdev: slim_device to be added
+ * Called when device doesn't have an explicit client-driver to be probed, or
+ * the client-driver is a module installed dynamically.
+ */
+int slim_add_device(struct slim_controller *ctrl, struct slim_device *sbdev);
+
+/* slim_remove_device: Remove the effect of slim_add_device() */
+void slim_remove_device(struct slim_device *sbdev);
+
+/**
+ * slim_assign_laddr: Assign logical address to a device enumerated.
+ * @ctrl: Controller with which device is enumerated.
+ * @e_addr: Enumeration address of the device.
+ * @laddr: Return logical address (if valid flag is false)
+ * @valid: true if laddr holds a valid address that controller wants to
+ *	set for this enumeration address. Otherwise framework sets index into
+ *	address table as logical address.
+ * Called by controller in response to REPORT_PRESENT. Framework will assign
+ * a logical address to this enumeration address.
+ * Function returns -EXFULL to indicate that all logical addresses are already
+ * taken.
+ */
+int slim_assign_laddr(struct slim_controller *ctrl,
+		      struct slim_eaddr *e_addr, u8 *laddr, bool valid);
+
+/**
+ * slim_report_absent: Controller calls this function when a device
+ *	reports absent, OR when the device cannot be communicated with
+ * @sbdev: Device that cannot be reached, or that sent report absent
+ */
+void slim_report_absent(struct slim_device *sbdev);
+
+/**
+ * slim_framer_booted: This function is called by controller after the active
+ * framer has booted (using Bus Reset sequence, or after it has shutdown and has
+ * come back up). Components, devices on the bus may be in undefined state,
+ * and this function triggers their drivers to do the needful
+ * to bring them back in Reset state so that they can acquire sync, report
+ * present and be operational again.
+ */
+void slim_framer_booted(struct slim_controller *ctrl);
+
+/**
+ * slim_register_controller: Controller bring-up and registration.
+ * @ctrl: Controller to be registered.
+ * A controller is registered with the framework using this API.
+ * If devices on a controller were registered before controller,
+ * this will make sure that they get probed when controller is up
+ */
+int slim_register_controller(struct slim_controller *ctrl);
+
+/**
+ * slim_register_board_info: Board-initialization routine.
+ * @info: List of all devices on all controllers present on the board.
+ * @n: number of entries.
+ * API enumerates respective devices on corresponding controller.
+ * Called from board-init function.
+ */
+#ifdef CONFIG_SLIMBUS
+int slim_register_board_info(struct slim_boardinfo const *info, unsigned n);
+#else
+static inline int slim_register_board_info(struct slim_boardinfo const *info,
+					   unsigned n)
+{
+	return 0;
+}
+#endif
+
+static inline void *slim_get_ctrldata(const struct slim_controller *dev)
+{
+	return dev_get_drvdata(&dev->dev);
+}
+
+static inline void slim_set_ctrldata(struct slim_controller *dev, void *data)
+{
+	dev_set_drvdata(&dev->dev, data);
+}
+
+static inline void *slim_get_devicedata(const struct slim_device *dev)
+{
+	return dev_get_drvdata(&dev->dev);
+}
+
+static inline void slim_set_clientdata(struct slim_device *dev, void *data)
+{
+	dev_set_drvdata(&dev->dev, data);
+}
+
+#endif /* _LINUX_SLIMBUS_H */
-- 
1.8.2.1
