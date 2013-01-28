From: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2] drm/i2c: Add driver for PTN3460 LVDS/DP bridge
Date: Mon, 28 Jan 2013 16:43:28 -0500
Message-ID: <1359409408-28473-1-git-send-email-seanpaul@chromium.org>
References: <87bocdtzcb.fsf@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <87bocdtzcb.fsf-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the driver for the PTN3460 LVDS/DP bridge chip.

The driver allows the EDID emulation to be selected from device tree,
along with specifying the GPIOs driving powerdown and reset pins.

The chip has a bug in it such that when the powerdown and reset pins
are toggled, the hotplug line blips before the bridge is completely
ready. This forces us to wait for the maximum specified setup time
(90ms) before interacting with the chip via i2c or doing DP training, as
opposed to watching the hotplug line. This limitation means that we need
to synchronize the bridge driver with the DP driver via the
ptn3460_wait_until_ready function.

Signed-off-by: Sean Paul <seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Thanks for the review, Jani. I've updated the patch to use gpio_is_valid().

 .../devicetree/bindings/drm/i2c/ptn3460.txt        |   27 ++
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/i2c/Kconfig                        |    6 +
 drivers/gpu/drm/i2c/Makefile                       |    2 +
 drivers/gpu/drm/i2c/ptn3460.c                      |  283 ++++++++++++++++++++
 include/drm/i2c/ptn3460.h                          |   19 ++
 6 files changed, 339 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/drm/i2c/ptn3460.txt
 create mode 100644 drivers/gpu/drm/i2c/Kconfig
 create mode 100644 drivers/gpu/drm/i2c/ptn3460.c
 create mode 100644 include/drm/i2c/ptn3460.h

diff --git a/Documentation/devicetree/bindings/drm/i2c/ptn3460.txt b/Documentation/devicetree/bindings/drm/i2c/ptn3460.txt
new file mode 100644
index 0000000..c1cd329
--- /dev/null
+++ b/Documentation/devicetree/bindings/drm/i2c/ptn3460.txt
@@ -0,0 +1,27 @@
+ptn3460-bridge bindings
+
+Required properties:
+	- compatible: "nxp,ptn3460"
+	- reg: i2c address of the bridge
+	- powerdown-gpio: OF device-tree gpio specification
+	- reset-gpio: OF device-tree gpio specification
+	- edid-emulation: The EDID emulation entry to use
+		+-------+------------+------------------+
+		| Value | Resolution | Description      |
+		|   0   |  1024x768  | NXP Generic      |
+		|   1   |  1920x1080 | NXP Generic      |
+		|   2   |  1920x1080 | NXP Generic      |
+		|   3   |  1600x900  | Samsung LTM200KT |
+		|   4   |  1920x1080 | Samsung LTM230HT |
+		|   5   |  1366x768  | NXP Generic      |
+		|   6   |  1600x900  | ChiMei M215HGE   |
+		+-------+------------+------------------+
+
+Example:
+	ptn3460-bridge@20 {
+		compatible = "nxp,ptn3460";
+		reg = <0x20>;
+		powerdown-gpio = <&gpy2 5 1 0 0>;
+		reset-gpio = <&gpx1 5 1 0 0>;
+		edid-emulation = <5>;
+	};
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 983201b..45006a8 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -212,3 +212,5 @@ source "drivers/gpu/drm/cirrus/Kconfig"
 source "drivers/gpu/drm/shmobile/Kconfig"
 
 source "drivers/gpu/drm/tegra/Kconfig"
+
+source "drivers/gpu/drm/i2c/Kconfig"
diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
new file mode 100644
index 0000000..a015f61
--- /dev/null
+++ b/drivers/gpu/drm/i2c/Kconfig
@@ -0,0 +1,6 @@
+config DRM_PTN3460
+	tristate "PTN3460 DP/LVDS bridge"
+	depends on DRM && I2C
+	---help---
+	  Adds the driver for the NXP PTN3460 DP/LVDS bridge chip.
+
diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/Makefile
index 9286256..392904c 100644
--- a/drivers/gpu/drm/i2c/Makefile
+++ b/drivers/gpu/drm/i2c/Makefile
@@ -3,5 +3,7 @@ ccflags-y := -Iinclude/drm
 ch7006-y := ch7006_drv.o ch7006_mode.o
 obj-$(CONFIG_DRM_I2C_CH7006) += ch7006.o
 
+obj-$(CONFIG_DRM_PTN3460) += ptn3460.o
+
 sil164-y := sil164_drv.o
 obj-$(CONFIG_DRM_I2C_SIL164) += sil164.o
diff --git a/drivers/gpu/drm/i2c/ptn3460.c b/drivers/gpu/drm/i2c/ptn3460.c
new file mode 100644
index 0000000..c2e34dc
--- /dev/null
+++ b/drivers/gpu/drm/i2c/ptn3460.c
@@ -0,0 +1,283 @@
+/*
+ * NXP PTN3460 DP/LVDS bridge driver
+ *
+ * Copyright (C) 2013 Google, Inc.
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
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/pm.h>
+#include <linux/i2c.h>
+#include <linux/gpio.h>
+#include <linux/delay.h>
+
+#include "drmP.h"
+
+#include "i2c/ptn3460.h"
+
+#define PTN3460_EDID_EMULATION_ADDR		0x84
+#define PTN3460_EDID_ENABLE_EMULATION		0
+#define PTN3460_EDID_EMULATION_SELECTION	1
+
+#define PTN3460_READY_BLOCK	0
+#define PTN3460_READY_UNBLOCK	1
+
+struct ptn3460_platform_data {
+	struct device *dev;
+	struct i2c_client *client;
+	u8 addr;
+	int gpio_pd_n;
+	int gpio_rst_n;
+	u32 edid_emulation;
+	struct delayed_work ptn_work;
+};
+
+static atomic_t ptn3460_ready;
+static wait_queue_head_t ptn3460_wait_queue;
+
+static void initialize_wait_queue_once(void)
+{
+	static atomic_t wait_queue_initialized;
+
+	if (!atomic_cmpxchg(&wait_queue_initialized, 0, 1))
+		init_waitqueue_head(&ptn3460_wait_queue);
+}
+
+int ptn3460_wait_until_ready(int timeout_ms)
+{
+	int ret;
+
+	if (!of_find_compatible_node(NULL, NULL, "nxp,ptn3460"))
+		return 0;
+
+	initialize_wait_queue_once();
+
+	ret = wait_event_timeout(ptn3460_wait_queue,
+			atomic_read(&ptn3460_ready) == PTN3460_READY_UNBLOCK,
+			msecs_to_jiffies(timeout_ms));
+	if (!ret) {
+		DRM_ERROR("Wait until ready timed out\n");
+		return -ETIMEDOUT;
+	}
+
+	return 0;
+}
+
+static int ptn3460_write_byte(struct ptn3460_platform_data *pd, char addr,
+		char val)
+{
+	int ret;
+	char buf[2];
+
+	buf[0] = addr;
+	buf[1] = val;
+
+	ret = i2c_master_send(pd->client, buf, ARRAY_SIZE(buf));
+	if (ret <= 0) {
+		DRM_ERROR("Failed to send i2c command, ret=%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ptn3460_init_platform_data_from_dt(struct i2c_client *client)
+{
+	int ret;
+	struct ptn3460_platform_data *pd;
+	struct device *dev = &client->dev;
+
+	dev->platform_data = devm_kzalloc(dev,
+				sizeof(struct ptn3460_platform_data),
+				GFP_KERNEL);
+	if (!dev->platform_data) {
+		DRM_ERROR("Can't allocate platform data\n");
+		return -ENOMEM;
+	}
+	pd = dev->platform_data;
+	pd->dev = dev;
+	pd->client = client;
+
+	/* Fill platform data with device tree data */
+	pd->gpio_pd_n = of_get_named_gpio(dev->of_node, "powerdown-gpio", 0);
+	pd->gpio_rst_n = of_get_named_gpio(dev->of_node, "reset-gpio", 0);
+
+	ret = of_property_read_u32(dev->of_node, "edid-emulation",
+			&pd->edid_emulation);
+	if (ret) {
+		DRM_ERROR("Can't read edid emulation value\n");
+		return ret;
+	}
+
+	return 0;
+
+}
+
+static int ptn3460_select_edid(struct ptn3460_platform_data *pd)
+{
+	int ret;
+	char val;
+
+	val = 1 << PTN3460_EDID_ENABLE_EMULATION |
+		pd->edid_emulation << PTN3460_EDID_EMULATION_SELECTION;
+
+	ret = ptn3460_write_byte(pd, PTN3460_EDID_EMULATION_ADDR, val);
+	if (ret) {
+		DRM_ERROR("Failed to write edid value, ret=%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void ptn3460_work(struct work_struct *work)
+{
+	struct ptn3460_platform_data *pd =
+		container_of(work, struct ptn3460_platform_data, ptn_work.work);
+	int ret;
+
+	if (!pd) {
+		DRM_ERROR("pd is null\n");
+		return;
+	}
+
+	ret = ptn3460_select_edid(pd);
+	if (ret)
+		DRM_ERROR("Select edid failed ret=%d\n", ret);
+
+	atomic_set(&ptn3460_ready, PTN3460_READY_UNBLOCK);
+	wake_up(&ptn3460_wait_queue);
+}
+
+static int ptn3460_power_up(struct ptn3460_platform_data *pd)
+{
+	int ret;
+
+	if (gpio_is_valid(pd->gpio_pd_n))
+		gpio_set_value(pd->gpio_pd_n, 1);
+
+	if (gpio_is_valid(pd->gpio_rst_n)) {
+		gpio_set_value(pd->gpio_rst_n, 0);
+		udelay(10);
+		gpio_set_value(pd->gpio_rst_n, 1);
+	}
+
+	ret = schedule_delayed_work(&pd->ptn_work, msecs_to_jiffies(90));
+	if (ret < 0)
+		DRM_ERROR("Could not schedule work ret=%d\n", ret);
+
+	return 0;
+}
+
+static int ptn3460_power_down(struct ptn3460_platform_data *pd)
+{
+	if (work_pending(&pd->ptn_work.work))
+		flush_work(&pd->ptn_work.work);
+
+	atomic_set(&ptn3460_ready, PTN3460_READY_BLOCK);
+
+	if (gpio_is_valid(pd->gpio_rst_n))
+		gpio_set_value(pd->gpio_rst_n, 1);
+
+	if (gpio_is_valid(pd->gpio_pd_n))
+		gpio_set_value(pd->gpio_pd_n, 0);
+
+	return 0;
+}
+
+int ptn3460_suspend(struct device *dev)
+{
+	return ptn3460_power_down(dev->platform_data);
+}
+
+int ptn3460_resume(struct device *dev)
+{
+	return ptn3460_power_up(dev->platform_data);
+}
+
+int ptn3460_probe(struct i2c_client *client, const struct i2c_device_id *device)
+{
+	struct device *dev = &client->dev;
+	struct ptn3460_platform_data *pd;
+	int ret;
+
+	ret = ptn3460_init_platform_data_from_dt(client);
+	if (ret)
+		return ret;
+	pd = dev->platform_data;
+
+	if (gpio_is_valid(pd->gpio_pd_n)) {
+		ret = gpio_request_one(pd->gpio_pd_n, GPIOF_OUT_INIT_HIGH,
+					"PTN3460_PD_N");
+		if (ret)
+			goto err_pd;
+	}
+	if (gpio_is_valid(pd->gpio_rst_n)) {
+		/*
+		 * Request the reset pin low to avoid the bridge being
+		 * initialized prematurely
+		 */
+		ret = gpio_request_one(pd->gpio_rst_n, GPIOF_OUT_INIT_LOW,
+					"PTN3460_RST_N");
+		if (ret)
+			goto err_pd;
+	}
+
+	initialize_wait_queue_once();
+
+	INIT_DELAYED_WORK(&pd->ptn_work, ptn3460_work);
+
+	ret = ptn3460_power_up(pd);
+	if (ret)
+		goto err_pd;
+
+	return 0;
+
+err_pd:
+	devm_kfree(dev, pd);
+	return ret;
+}
+
+int ptn3460_remove(struct i2c_client *client)
+{
+	struct ptn3460_platform_data *pd = client->dev.platform_data;
+
+	if (!pd)
+		return 0;
+
+	if (work_pending(&pd->ptn_work.work))
+		flush_work(&pd->ptn_work.work);
+
+	devm_kfree(&client->dev, pd);
+	return 0;
+}
+
+static const struct i2c_device_id ptn3460_ids[] = {
+	{ "ptn3460", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(i2c, ptn3460_ids);
+
+static SIMPLE_DEV_PM_OPS(ptn3460_pm_ops, ptn3460_suspend, ptn3460_resume);
+
+static struct i2c_driver ptn3460_driver = {
+	.id_table	= ptn3460_ids,
+	.probe          = ptn3460_probe,
+	.remove         = ptn3460_remove,
+	.driver		= {
+		.name	= "ptn3460",
+		.owner	= THIS_MODULE,
+		.pm	= &ptn3460_pm_ops,
+	},
+};
+module_i2c_driver(ptn3460_driver);
diff --git a/include/drm/i2c/ptn3460.h b/include/drm/i2c/ptn3460.h
new file mode 100644
index 0000000..778b21a
--- /dev/null
+++ b/include/drm/i2c/ptn3460.h
@@ -0,0 +1,19 @@
+/*
+ * Copyright (C) 2013 Google, Inc.
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
+#ifndef _DRM_I2C_PTN3460_H_
+#define _DRM_I2C_PTN3460_H_
+
+int ptn3460_wait_until_ready(int timeout_ms);
+
+#endif
-- 
1.7.7.3
