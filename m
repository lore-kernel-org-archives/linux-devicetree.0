From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [RFC 1/2] staging: jnx: Add Juniper connector driver
Date: Fri,  7 Oct 2016 18:16:11 +0300
Message-ID: <1475853372-21997-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853372-21997-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475853372-21997-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alon Ronen <aronen-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Debjit Ghosh <dghosh-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Dhruva Diveneni <ddevineni-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Yu-Lin Lu <ylu-3r7Miqu9kMnR7s880joybQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Guenter Roeck <groeck-3r7Miqu9kMnR7s880joybQ@public.gmane.org>

Driver to manage connectors in various Juniper devices.
Currently supports PIC and SIB as well as various RE boards.

Supports and uses device tree overlay as well as LED triggers.
State changes are reported to userspace with sysfs poll events
as well as with udev events.

Signed-off-by: Guenter Roeck <groeck-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Signed-off-by: Georgi Vlaev <gvlaev-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Signed-off-by: Alon Ronen <aronen-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Signed-off-by: Debjit Ghosh <dghosh-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Signed-off-by: Dhruva Diveneni <ddevineni-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
Signed-off-by: Yu-Lin Lu <ylu-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 drivers/staging/jnx/Kconfig         |   15 +
 drivers/staging/jnx/Makefile        |    1 +
 drivers/staging/jnx/jnx-connector.c | 2172 +++++++++++++++++++++++++++++++++++
 3 files changed, 2188 insertions(+)
 create mode 100644 drivers/staging/jnx/jnx-connector.c

diff --git a/drivers/staging/jnx/Kconfig b/drivers/staging/jnx/Kconfig
index b57e93b..4c38fc2 100644
--- a/drivers/staging/jnx/Kconfig
+++ b/drivers/staging/jnx/Kconfig
@@ -19,6 +19,21 @@ config JNX_SYSTEM
 
 	  This driver can not be compiled as a module.
 
+config JNX_CONNECTOR
+	tristate "Juniper Connector Driver"
+	depends on JNX_SYSTEM && OF
+	default m
+	select LEDS_TRIGGERS
+	select OF_OVERLAY
+	help
+	  This driver adds support connectors on various Juniper boards.
+	  PIC and SIB conenctors are currently supported, but the driver
+	  should really work for all connectors with GPIO pins used for
+	  detection and status.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called jnx-connector.
+
 endmenu
 
 config JNX_COMMON_PCI
diff --git a/drivers/staging/jnx/Makefile b/drivers/staging/jnx/Makefile
index 90526b1..c89e701 100644
--- a/drivers/staging/jnx/Makefile
+++ b/drivers/staging/jnx/Makefile
@@ -6,3 +6,4 @@ obj-$(CONFIG_JNX_SYSTEM)	+= jnx-subsys.o jnx-board-core.o
 obj-$(CONFIG_JNX_CHIP_PCI_QUIRKS)+= jnx-chip-pci-quirks.o
 obj-$(CONFIG_JNX_COMMON_PCI)	+= jnx_common_pci.o
 obj-$(CONFIG_JNX_PEX8XXX_I2C)	+= pex8xxx_i2c.o
+obj-$(CONFIG_JNX_CONNECTOR)	+= jnx-connector.o
diff --git a/drivers/staging/jnx/jnx-connector.c b/drivers/staging/jnx/jnx-connector.c
new file mode 100644
index 0000000..1dd48d0
--- /dev/null
+++ b/drivers/staging/jnx/jnx-connector.c
@@ -0,0 +1,2172 @@
+/*
+ * jnx-connector.c
+ *
+ * Connector driver for Juniper devices
+ *
+ * Copyright (C) 2013 Juniper Networks
+ * Author: Guenter Roeck <groeck-3r7Miqu9kMnR7s880joybQ@public.gmane.org>
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
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+#include <linux/gpio.h>
+#include <linux/of_device.h>
+#include <linux/of_gpio.h>
+#include <linux/of_fdt.h>
+#include <linux/of_irq.h>
+#include <linux/err.h>
+#include <linux/notifier.h>
+#include <linux/i2c.h>
+#include <linux/of.h>
+#include <linux/platform_data/at24.h>
+#include <linux/firmware.h>
+#include <linux/leds.h>
+#include <linux/delay.h>
+#include <linux/jnx/jnx-subsys.h>
+#include <linux/jnx/jnx-board-core.h>
+#include <linux/nvmem-consumer.h>
+
+#include "jnx-subsys-private.h"
+
+enum jnx_conn_state { empty, standby, insert_wait, loading0, present,
+		      poweron, power, loading, abort, active,
+		      failed };
+enum jnx_conn_event { invalid_ev, insert_ev, insert_done_ev, remove_ev,
+		      loaded_ev, timeout_ev, enoent_ev, failure_ev,
+		      poweroff_ev, button_ev, poweron_ev,
+		      powergood_ev, powerbad_ev, master_ev, standby_ev };
+
+enum jnx_conn_button_state { idle, pressed, wait_release };
+enum jnx_conn_button_event { button_state_change_ev, button_timeout_ev };
+
+/*
+ * OF defined i2c client register sequence of 5
+ * u32 values: <addr, reg, clr, set, timeout>
+ *
+ * 1. For i2c device @addr(smbus): reg = (reg & ~clr) | set;
+ * 2. Wait <timeout> msec and jump to the next register.
+ */
+struct jnx_i2c_power_seq {
+	u32 *seq;	/* seq := <addr, reg, clr, set, timeout> */
+	int count;	/* count of sequences */
+	int pos;	/* current position */
+};
+
+#define JNX_OV_DEVICES	0
+#define JNX_OV_POWER	1
+#define NUM_OVERLAYS	2
+
+struct jnx_conn_data {
+	struct device *dev;		/* parent (platform) device */
+	const char *name[NUM_OVERLAYS];	/* overlay file names */
+	bool enabled;			/* true if can handle interrupts */
+	bool poweron;			/* true if assumed to be powered on */
+	int ov[NUM_OVERLAYS];		/* overlay IDs */
+	const struct firmware *ovfw[NUM_OVERLAYS]; /* overlay blobs */
+	struct notifier_block nb;
+	const char *sysfs_linkname;	/* FRU symbolic-link name */
+	const char *led_green_name;
+	const char *led_red_name;
+	struct led_trigger *led_green;
+	struct led_trigger *led_red;
+	int attention_button;		/* attention button gpio pin */
+	bool have_attention_button;	/* true if attention button exists */
+	unsigned long attention_button_holdtime;/* button hold time, jiffies */
+	bool attention_ignore;		/* true if handled by user space */
+	int power_enable;		/* power enable gpio pin */
+	bool auto_enable;		/* true if board should auto-enable */
+	struct jnx_i2c_power_seq pon;	/* power-on sequence */
+	struct jnx_i2c_power_seq poff;	/* power-off sequence */
+	struct jnx_i2c_power_seq *pseq;	/* current power sequence */
+	struct i2c_client *client;	/* dummy client */
+	int power_status;		/* power status gpio pin */
+	int reset;			/* reset gpio pin */
+	int presence_detect;		/* presence gpio pin */
+	int status_irq;			/* power status interrupt */
+	int attention_irq;		/* attention button interrupt */
+	int presence_irq;		/* presence gpio interrupt */
+	unsigned long power_enable_timeout;/* power enable timeout, jiffies */
+	unsigned long poweron_reset_delay; /* delay after poweron before
+					    * releasing reset, in jiffies
+					    */
+	unsigned long debounce;	/* presence detect debounce in jiffies */
+	unsigned long activation_timeout;/* activation timeout, in jiffies */
+	u32 gpio_flags;
+	u16 assembly_id;
+	int slot;			/* slot number */
+	int type;			/* card type */
+	bool static_assembly_id;	/* true if assembly_id is static */
+	bool assembly_id_valid;		/* true if assembly_id is valid */
+	int adapter;			/* parent i2c adapter number */
+	struct device_node *i2c_node;	/* pointer to i2c client data */
+	struct workqueue_struct *conn_wq;/* connector workqueue */
+	struct workqueue_struct *load_wq;/* overlay loader workqueue */
+	struct delayed_work work;	/* connector state machine */
+	struct delayed_work button_work;/* button press handler */
+	struct delayed_work presence_work;/* presence detect handler */
+	struct work_struct load_work;	/* load handler */
+	struct delayed_work power_enable_work;	/* power sequence work */
+	struct mutex mutex;		/* mutex to protect state changes */
+	bool synchronous;		/* true if state changes are ok */
+	struct mutex fdt_mutex;		/* mutex to protect fdt accesses */
+	enum jnx_conn_state state;
+	enum jnx_conn_state newstate;
+	enum jnx_conn_event event;
+	enum jnx_conn_button_state button_state;
+	enum jnx_conn_button_event button_event;
+	bool standby_to_master;		/* standby:master_ev processing */
+};
+
+/* gpio flags */
+#define POWER_ENABLE_ACTIVE_LOW			BIT(0)
+#define POWER_STATUS_ACTIVE_LOW			BIT(1)
+#define RESET_ACTIVE_LOW			BIT(2)
+#define ATTENTION_ACTIVE_LOW			BIT(3)
+#define PRESENCE_ACTIVE_LOW			BIT(4)
+
+/* timeouts in jiffies */
+#define POWER_ENABLE_TIMEOUT_DEFAULT		1000	/* in ms */
+#define ATTENTION_BUTTON_HOLDTIME_DEFAULT	3000	/* in ms */
+#define ACTIVATION_TIMEOUT_DEFAULT		10000	/* in ms */
+#define POWERON_RESET_DELAY_DEFAULT		0	/* in ms */
+
+static void jnx_conn_at24_callback(struct nvmem_device *nvmem,
+				   void *context)
+{
+	struct jnx_conn_data *data = context;
+	u8 id[2];
+	int retry = 3;
+
+	do {
+		if (nvmem_device_read(nvmem, 4, 2, id) == 2) {
+			data->assembly_id = (id[0] << 8) | id[1];
+			data->assembly_id_valid = true;
+			break;
+		}
+		mdelay(500);
+	} while (retry--);
+
+	if (!data->synchronous) {
+		mutex_lock(&data->mutex);
+		if (data->state == insert_wait) {
+			data->event = insert_done_ev;
+			mod_delayed_work(data->conn_wq, &data->work, 0);
+		}
+		mutex_unlock(&data->mutex);
+	}
+}
+
+/*
+ * jnx_conn_insert_ideeprom()
+ *   Inserts ideeprom with a parent from OF prop
+ */
+static int jnx_conn_insert_ideeprom(struct jnx_conn_data *data,
+				    struct i2c_adapter *adap,
+				    struct device_node *node,
+				    struct i2c_board_info *info)
+{
+	struct device *dev = data->dev;
+	struct i2c_adapter *parent = NULL;
+	struct i2c_client *client;
+	struct device_node *anode;
+	struct at24_platform_data at24_pdata = {
+		.byte_len = 256,
+		.page_size = 4,
+		.setup = jnx_conn_at24_callback,
+		.context = data,
+	};
+
+	info->platform_data = &at24_pdata;
+
+	anode = of_parse_phandle(node, "i2c-parent", 0);
+	if (anode) {
+		parent = of_find_i2c_adapter_by_node(anode);
+		of_node_put(anode);
+	}
+
+	data->synchronous = true;
+	if (parent) {
+		client = i2c_new_device(parent, info);
+		put_device(&parent->dev);
+	} else {
+		client = i2c_new_device(adap, info);
+	}
+	data->synchronous = false;
+
+	if (!client)
+		return -ENODEV;
+
+	/* create symlink for ideeproms */
+	return sysfs_create_link(&dev->kobj, &client->dev.kobj, "id");
+}
+
+/*
+ * The following function is mostly identical to of_i2c_register_devices(),
+ * except it checks for i2c ideeprom and installs a callback function if
+ * necessary.
+ * Note: If multiple ID eeproms are specified, the information retrieved
+ * from the last valid detected device will be used for board identification
+ * purposes.
+ */
+static void jnx_conn_insert_nodes(struct jnx_conn_data *data)
+{
+	struct device *dev = data->dev;
+	struct i2c_adapter *adap;
+	struct device_node *node;
+	int timeout;
+
+	if (!data->static_assembly_id) {
+		data->assembly_id_valid = false;
+		data->assembly_id = 0;
+	}
+
+	if (!data->i2c_node) {
+		data->state = insert_wait;
+		data->event = insert_done_ev;
+		mod_delayed_work(data->conn_wq, &data->work, 0);
+		return;
+	}
+
+	adap = i2c_get_adapter(data->adapter);
+	if (!adap) {
+		data->state = failed;
+		return;
+	}
+
+	for_each_available_child_of_node(data->i2c_node, node) {
+		struct i2c_board_info info = {};
+		const __be32 *addr;
+		int err = 0;
+		int len;
+
+		if (of_modalias_node(node, info.type, sizeof(info.type)) < 0) {
+			dev_err(dev, "modalias failure on %s\n",
+				node->full_name);
+			continue;
+		}
+
+		addr = of_get_property(node, "reg", &len);
+		if (!addr || (len < sizeof(int))) {
+			dev_err(dev, "invalid reg on %s\n", node->full_name);
+			continue;
+		}
+
+		info.addr = be32_to_cpup(addr);
+		if (info.addr > (1 << 10) - 1) {
+			dev_err(dev, "invalid addr=%x on %s\n",
+				info.addr, node->full_name);
+			continue;
+		}
+
+		info.irq = irq_of_parse_and_map(node, 0);
+		info.of_node = of_node_get(node);
+
+		if (of_property_read_bool(node, "wakeup-source"))
+			info.flags |= I2C_CLIENT_WAKE;
+
+		if (!data->static_assembly_id &&
+		    of_property_read_bool(node, "ideeprom")) {
+			err = jnx_conn_insert_ideeprom(data, adap, node, &info);
+		} else {
+			if (!i2c_new_device(adap, &info))
+				err = -ENODEV;
+		}
+		if (err) {
+			dev_err(dev, "Failed to register %s\n",
+				node->full_name);
+			of_node_put(node);
+			irq_dispose_mapping(info.irq);
+		}
+	}
+	/* Finally create adapter symlink */
+	if (sysfs_create_link(&dev->kobj, &adap->dev.kobj, "i2c-adapter"))
+		;
+
+	i2c_put_adapter(adap);
+
+	data->state = insert_wait;
+	if (data->assembly_id_valid) {
+		data->event = insert_done_ev;
+		timeout = 0;
+	} else {
+		data->event = timeout_ev;
+		timeout = 1000;
+	}
+
+	mod_delayed_work(data->conn_wq, &data->work, msecs_to_jiffies(timeout));
+}
+
+static void jnx_conn_remove_nodes(struct jnx_conn_data *data)
+{
+	struct i2c_client *client;
+	struct device_node *node;
+
+	if (data->i2c_node) {
+		for_each_available_child_of_node(data->i2c_node, node) {
+			client = of_find_i2c_device_by_node(node);
+			if (client)
+				i2c_unregister_device(client);
+		}
+	}
+}
+
+static irqreturn_t jnx_conn_irq_handler(int irq, void *context)
+{
+	struct jnx_conn_data *data = context;
+	enum jnx_conn_event event;
+	bool state;
+
+	if (data->enabled) {
+		state = gpio_get_value_cansleep(data->power_status);
+		if (data->gpio_flags & POWER_STATUS_ACTIVE_LOW)
+			state = !state;
+		if (data->poweron != state) {
+			event = state ? powergood_ev : powerbad_ev;
+			mutex_lock(&data->mutex);
+			data->event = event;
+			mod_delayed_work(data->conn_wq, &data->work, 0);
+			mutex_unlock(&data->mutex);
+		}
+	}
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t jnx_attention_irq_handler(int irq, void *context)
+{
+	struct jnx_conn_data *data = context;
+
+	if (data->enabled) {
+		mutex_lock(&data->mutex);
+		data->button_event = button_state_change_ev;
+		mod_delayed_work(data->conn_wq, &data->button_work, 0);
+		mutex_unlock(&data->mutex);
+	}
+	return IRQ_HANDLED;
+}
+
+/* presence detect interrupt handler */
+static irqreturn_t jnx_presence_irq_handler(int irq, void *context)
+{
+	struct jnx_conn_data *data = context;
+
+	mod_delayed_work(data->conn_wq, &data->presence_work, data->debounce);
+
+	return IRQ_HANDLED;
+}
+
+/*
+ * jnx_conn_power_update()
+ *
+ * read register from a i2c client at given address,
+ * update bits, write back and schedule the next
+ * register update.
+ */
+int jnx_conn_power_update(struct jnx_conn_data *data)
+{
+	struct device *dev = data->dev;
+	struct i2c_client *client = data->client;
+	struct jnx_i2c_power_seq *pseq = data->pseq;
+	u8 val, addr, reg, clr, set;
+	u32 timeout;
+	u32 *seq;
+	int ret;
+
+	if (!pseq->count || pseq->pos > (pseq->count - 1))
+		return -EINVAL;
+
+	seq = &pseq->seq[pseq->pos * 5];
+	addr = seq[0];
+	reg = seq[1];
+	clr = seq[2];
+	set = seq[3];
+	timeout = seq[4];
+
+	dev_dbg(dev,
+		"i2c power sequence #%u: <%02x|%02x|%02x|%02x>, <%u msec>\n",
+		pseq->pos, addr, reg, clr, set, timeout);
+
+	client->addr = addr; /* addr */
+	ret = i2c_smbus_read_byte_data(client, reg); /* reg */
+	if (ret < 0) {
+		dev_err(dev,
+			"Failed to read i2c client @%02x[%02x], error (%d)\n",
+			addr, reg, ret);
+		return ret;
+	}
+
+	val = ((u8)ret & ~clr) | set;
+	i2c_smbus_write_byte_data(client, reg, val);
+
+	pseq->pos++;
+
+	if (pseq->pos < pseq->count) {
+		dev_dbg(dev, "next i2c power sequence (%u) after %u msec\n",
+			pseq->pos, timeout);
+
+		mod_delayed_work(data->conn_wq, &data->power_enable_work,
+				 msecs_to_jiffies(timeout));
+	} else {
+		/* last in list - set poweron flag based on power sequence */
+		data->poweron = (pseq == &data->pon);
+	}
+
+	return 0;
+}
+
+/*
+ * jnx_conn_i2c_power_seq_init()
+ *
+ * Init a i2c power sequence from OF property
+ */
+static int jnx_conn_i2c_power_seq_init(struct jnx_conn_data *data,
+				       struct jnx_i2c_power_seq *pseq,
+				       const char *prop_name)
+{
+	struct device *dev = data->dev;
+	struct device_node *np = dev->of_node;
+	const __be32 *nseq;
+	int len = 0, i;
+
+	pseq->seq = NULL;
+	pseq->count = 0;
+	pseq->pos = 0;
+
+	nseq = of_get_property(np, prop_name, &len);
+	if (!nseq)
+		return 0;
+
+	if (len % (5 * sizeof(u32)))
+		return -EINVAL;
+
+	pseq->seq = devm_kzalloc(dev, len, GFP_KERNEL);
+	if (!pseq->seq)
+		return -ENOMEM;
+
+	for (i = 0; i < len / sizeof(u32); i++)
+		pseq->seq[i] = be32_to_cpu(nseq[i]);
+
+	pseq->count = len / (sizeof(u32) * 5);
+	pseq->pos = 0;
+
+	dev_dbg(dev, "Added i2c power sequence [%s] with %u reg updates\n",
+		prop_name, pseq->count);
+
+	return 0;
+}
+
+/*
+ * jnx_conn_i2c_power_seq_cleanup()
+ */
+static void jnx_conn_i2c_power_seq_cleanup(struct jnx_conn_data *data,
+					   struct jnx_i2c_power_seq *pseq)
+
+{
+	struct device *dev = data->dev;
+
+	if (pseq->seq) {
+		devm_kfree(dev, pseq->seq);
+		pseq->seq = NULL;
+		pseq->count = 0;
+		pseq->pos = 0;
+	}
+}
+
+/*
+ * jnx_conn_power_enable_work()
+ *
+ * Handle power on/off sequences
+ */
+static void jnx_conn_power_enable_work(struct work_struct *work)
+{
+	struct jnx_conn_data *data = container_of(work, struct jnx_conn_data,
+						  power_enable_work.work);
+
+	mutex_lock(&data->mutex);
+	jnx_conn_power_update(data);
+	mutex_unlock(&data->mutex);
+}
+
+static int jnx_conn_get_gpios(struct jnx_conn_data *data)
+{
+	struct device_node *np = data->dev->of_node;
+	enum of_gpio_flags flags;
+	int gpio;
+
+	/* Get and request various gpio pins */
+	data->gpio_flags &= ~(POWER_ENABLE_ACTIVE_LOW |
+			      POWER_STATUS_ACTIVE_LOW |
+			      RESET_ACTIVE_LOW |
+			      ATTENTION_ACTIVE_LOW);
+
+	data->power_enable = -1;
+	data->power_status = -1;
+	data->reset = -1;
+	data->attention_button = -1;
+	data->status_irq = 0;
+	data->attention_irq = 0;
+
+	gpio = of_get_named_gpio_flags(np, "power-enable-gpios", 0, &flags);
+	if (gpio == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
+	if (gpio_is_valid(gpio)) {
+		data->power_enable = gpio;
+		if (flags & OF_GPIO_ACTIVE_LOW)
+			data->gpio_flags |= POWER_ENABLE_ACTIVE_LOW;
+	}
+
+	gpio = of_get_named_gpio_flags(np, "power-status-gpios", 0, &flags);
+	if (gpio_is_valid(gpio)) {
+		data->power_status = gpio;
+		if (flags & OF_GPIO_ACTIVE_LOW)
+			data->gpio_flags |= POWER_STATUS_ACTIVE_LOW;
+	} else {
+		if (gpio == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		/* Mandatory if power-enable is configured */
+		if (data->pon.count > 0 || gpio_is_valid(data->power_enable)) {
+			dev_err(data->dev,
+				"power status defined without power-enable method\n");
+			return gpio;
+		}
+	}
+
+	gpio = of_get_named_gpio_flags(np, "reset-gpios", 0, &flags);
+	if (gpio == -EPROBE_DEFER)
+		return gpio;
+	if (gpio_is_valid(gpio)) {
+		data->reset = gpio;
+		if (flags & OF_GPIO_ACTIVE_LOW)
+			data->gpio_flags |= RESET_ACTIVE_LOW;
+	}
+
+	if (data->have_attention_button) {
+		gpio = of_get_named_gpio_flags(np, "attention-button-gpios", 0,
+					       &flags);
+		if (gpio < 0)
+			return gpio;
+		data->attention_button = gpio;
+		if (flags & OF_GPIO_ACTIVE_LOW)
+			data->gpio_flags |= ATTENTION_ACTIVE_LOW;
+	}
+
+	return 0;
+}
+
+/*
+ * jnx_conn_load()
+ *
+ * Load and install devicetree overlay.
+ */
+static void jnx_conn_load(struct jnx_conn_data *data,
+			  enum jnx_conn_state newstate)
+{
+	data->event = timeout_ev;
+	data->state = newstate;
+
+	queue_work(data->load_wq, &data->load_work);
+
+	mod_delayed_work(data->conn_wq, &data->work, data->activation_timeout);
+}
+
+/*
+ * jnx_conn_insert()
+ *
+ * Board was inserted, i2c devices have been instantiated,
+ * the initial devicetree overlay has been loaded.
+ * Handle post-processing.
+ */
+static void jnx_conn_insert(struct jnx_conn_data *data)
+{
+	struct i2c_adapter *adap = NULL;
+	int err;
+
+	if (!data->assembly_id_valid) {
+		data->state = failed;
+		return;
+	}
+
+	err = jnx_conn_get_gpios(data);
+	if (err < 0)
+		goto abort;
+
+	if (gpio_is_valid(data->power_enable)) {
+		err = gpio_request_one(data->power_enable,
+				       GPIOF_DIR_OUT, dev_name(data->dev));
+		if (err)
+			goto abort;
+	}
+
+	if (gpio_is_valid(data->power_status)) {
+		err = gpio_request_one(data->power_status,
+				       GPIOF_DIR_IN, dev_name(data->dev));
+		if (err)
+			goto abort_free_enable;
+
+		data->status_irq = gpio_to_irq(data->power_status);
+		if (data->status_irq < 0) {
+			err = data->status_irq;
+			goto abort_free_status;
+		}
+	}
+
+	if (gpio_is_valid(data->reset)) {
+		err = gpio_request_one(data->reset, GPIOF_DIR_OUT,
+				       dev_name(data->dev));
+		if (err)
+			goto abort_free_status;
+	}
+
+	if (data->have_attention_button) {
+		err = gpio_request_one(data->attention_button, GPIOF_DIR_IN,
+				       dev_name(data->dev));
+		if (err)
+			goto abort_free_reset;
+
+		data->attention_irq = gpio_to_irq(data->attention_button);
+		if (data->attention_irq < 0)
+			goto abort_free_attention;
+
+		data->button_state = idle;
+		data->button_event = button_state_change_ev;
+		mod_delayed_work(data->conn_wq, &data->button_work, 0);
+	}
+
+	/* power enable sequence */
+	err = jnx_conn_i2c_power_seq_init(data, &data->pon, "i2c-power-on");
+	if (err < 0)
+		dev_warn(data->dev, "Failed to add i2c-power-on sequence\n");
+
+	err = jnx_conn_i2c_power_seq_init(data, &data->poff, "i2c-power-off");
+	if (err < 0)
+		dev_warn(data->dev, "Failed to add i2c-power-off sequence\n");
+
+	if (data->pon.count || data->poff.count) {
+		adap = i2c_get_adapter(data->adapter);
+		if (!adap) {
+			err = -ENODEV;
+			goto abort_free_attention;
+		}
+
+		/*
+		 * This client only hold address information.
+		 * It's not registered.
+		 */
+		data->client = devm_kzalloc(data->dev,
+					    sizeof(struct i2c_client),
+					    GFP_KERNEL);
+		if (!data->client) {
+			i2c_put_adapter(adap);
+			data->state = failed;
+			dev_err(data->dev,
+				"insert: failed to create i2c_client\n");
+			goto abort_free_attention;
+		}
+		data->client->adapter = adap;
+	}
+
+	if (data->status_irq > 0) {
+		err = request_threaded_irq(data->status_irq, NULL,
+					   jnx_conn_irq_handler,
+					   IRQ_TYPE_EDGE_BOTH,
+					   dev_name(data->dev), data);
+		if (err < 0)
+			goto abort_stop_power_seq;
+	}
+
+	if (data->attention_irq > 0) {
+		err = request_threaded_irq(data->attention_irq,
+					   NULL, jnx_attention_irq_handler,
+					   IRQ_TYPE_EDGE_BOTH,
+					   dev_name(data->dev), data);
+		if (err < 0)
+			goto abort_free_status_irq;
+	}
+
+	/*
+	 * If we have a power status pin, check its state. If power is already
+	 * on, set the connector state to 'power'. 'power' is similar to
+	 * 'present', but doesn't enable power if 'enable' is set to 1.
+	 */
+	if (data->power_status >= 0) {
+		int state = gpio_get_value_cansleep(data->power_status);
+
+		if (data->gpio_flags & POWER_STATUS_ACTIVE_LOW)
+			state = !state;
+		if (state) {
+			data->state = power;
+			data->poweron = true;
+		} else {
+			data->state = present;
+		}
+	} else {
+		/*
+		 * Card with no power-enable and power-status pins.
+		 * Such type of cards are powered on by default. We can
+		 * set the state to 'power' and if auto-enable is set,
+		 * we can load the card's overlay.
+		 */
+		if (data->auto_enable) {
+			data->state = power;
+			data->poweron = true;
+		} else {
+			data->state = present;
+			if (data->type == JNX_BOARD_TYPE_SPMB) {
+				int reset;
+
+				reset = gpio_get_value_cansleep(data->reset);
+				if (data->gpio_flags & RESET_ACTIVE_LOW)
+					reset = !reset;
+				if (!reset)
+					data->state = active;
+			}
+		}
+	}
+
+	jnx_sysfs_create_link(data->dev, data->sysfs_linkname);
+
+	if (data->state == power &&
+	    (data->auto_enable || (data->standby_to_master ||
+	     jnx_warmboot()))) {
+		dev_info(data->dev, "%s\n", data->standby_to_master ?
+			"standby-to-master" : "auto-loading");
+		jnx_conn_load(data, loading);
+	}
+
+	return;
+
+abort_free_status_irq:
+	if (data->status_irq > 0)
+		free_irq(data->status_irq, data);
+abort_stop_power_seq:
+	jnx_conn_i2c_power_seq_cleanup(data, &data->pon);
+	jnx_conn_i2c_power_seq_cleanup(data, &data->poff);
+abort_free_attention:
+	if (gpio_is_valid(data->attention_button))
+		gpio_free(data->attention_button);
+abort_free_reset:
+	if (gpio_is_valid(data->reset))
+		gpio_free(data->reset);
+abort_free_status:
+	if (gpio_is_valid(data->power_status))
+		gpio_free(data->power_status);
+abort_free_enable:
+	if (gpio_is_valid(data->power_enable))
+		gpio_free(data->power_enable);
+abort:
+	if (err == -EPROBE_DEFER) {
+		data->state = insert_wait;
+		data->event = insert_done_ev;
+		mod_delayed_work(data->conn_wq, &data->work,
+				 msecs_to_jiffies(1000));
+	} else {
+		jnx_conn_remove_nodes(data);
+		dev_err(data->dev, "board insertion failed\n");
+		data->state = failed;
+	}
+}
+
+/*
+ * jnx_conn_poweron()
+ *
+ * Enable power to board, and take it out of reset.
+ * Sequence:
+ * - Put board reset
+ * - Poweron
+ * - Wait <n> milliseconds (possibly specify w/ devicetree property)
+ * - Take out of reset
+ */
+static void jnx_conn_poweron(struct jnx_conn_data *data)
+{
+	int timeout = data->power_enable_timeout;
+	bool no_power_enable = (data->power_enable < 0) || (!data->pon.count);
+
+	if (data->reset >= 0)
+		gpio_set_value_cansleep(data->reset,
+					!(data->gpio_flags & RESET_ACTIVE_LOW));
+
+	if (data->power_enable >= 0) {
+		gpio_set_value_cansleep(data->power_enable,
+					!(data->gpio_flags &
+					  POWER_ENABLE_ACTIVE_LOW));
+		data->event = timeout_ev;
+	}
+
+	if (data->reset >= 0) {
+		if (data->poweron_reset_delay)
+			usleep_range(data->poweron_reset_delay * 1000,
+				     data->poweron_reset_delay * 1200);
+		gpio_set_value_cansleep(data->reset, !!(data->gpio_flags &
+							RESET_ACTIVE_LOW));
+	}
+
+	/* power-on with i2c sequences */
+	if (data->pon.count > 0) {
+		cancel_delayed_work_sync(&data->power_enable_work);
+		data->pon.pos = 0;
+		data->pseq = &data->pon;
+		jnx_conn_power_update(data);
+		data->event = timeout_ev;
+	}
+
+	if (no_power_enable) {
+		data->event = powergood_ev;
+		timeout = 0;
+	}
+
+	/* We fired a sequence, wait for it to finish before setting poweron */
+	if (!data->pon.count)
+		data->poweron = true;
+	data->state = poweron;
+	mod_delayed_work(data->conn_wq, &data->work, timeout);
+}
+
+/*
+ * jnx_conn_unload()
+ *
+ * Remove devicetree overlay. Caller is responsible to set next state.
+ */
+static void jnx_conn_unload(struct jnx_conn_data *data, int index)
+{
+	mutex_lock(&data->fdt_mutex);
+	if (data->ov[index] >= 0) {
+		of_overlay_destroy(data->ov[index]);
+		data->ov[index] = -1;
+		release_firmware(data->ovfw[index]);
+		data->ovfw[index] = NULL;
+	}
+	mutex_unlock(&data->fdt_mutex);
+}
+
+/*
+ * jnx_conn_poweroff()
+ *
+ * Put board in reset, and disable power to board.
+ * Caller is responsible to set next state.
+ */
+static void jnx_conn_poweroff(struct jnx_conn_data *data)
+{
+	if (data->reset >= 0)
+		gpio_set_value_cansleep(data->reset,
+					!(data->gpio_flags & RESET_ACTIVE_LOW));
+
+	if (data->power_enable >= 0)
+		gpio_set_value_cansleep(data->power_enable,
+					!!(data->gpio_flags &
+					   POWER_ENABLE_ACTIVE_LOW));
+
+	/* power-off with i2c sequences */
+	if (data->poff.count) {
+		cancel_delayed_work_sync(&data->power_enable_work);
+		data->poff.pos = 0;
+		data->pseq = &data->poff;
+		jnx_conn_power_update(data);
+	}
+
+	data->poweron = false;
+}
+
+/*
+ * jnx_conn_remove()
+ *
+ * Unregister any i2c devices previously registered
+ * with jnx_conn_insert_nodes().
+ */
+static void jnx_conn_remove(struct jnx_conn_data *data)
+{
+	jnx_sysfs_delete_link(data->dev, data->sysfs_linkname);
+	sysfs_remove_link(&data->dev->kobj, "i2c-adapter");
+	sysfs_remove_link(&data->dev->kobj, "id");
+
+	if (data->attention_irq > 0)
+		free_irq(data->attention_irq, data);
+	if (data->status_irq > 0)
+		free_irq(data->status_irq, data);
+	if (data->attention_button >= 0) {
+		cancel_delayed_work_sync(&data->button_work);
+		gpio_free(data->attention_button);
+	}
+	if (data->reset >= 0)
+		gpio_free(data->reset);
+	if (data->power_status >= 0)
+		gpio_free(data->power_status);
+	if (data->power_enable >= 0)
+		gpio_free(data->power_enable);
+
+	/* Clean the power sequence lists */
+	cancel_delayed_work_sync(&data->power_enable_work);
+	jnx_conn_i2c_power_seq_cleanup(data, &data->pon);
+	jnx_conn_i2c_power_seq_cleanup(data, &data->poff);
+
+	if (data->client) {
+		i2c_put_adapter(data->client->adapter);
+		devm_kfree(data->dev, data->client);
+	}
+
+	jnx_conn_remove_nodes(data);
+
+	if (!data->static_assembly_id) {
+		data->assembly_id_valid = false;
+		data->assembly_id = 0;
+	}
+	data->state = empty;
+}
+
+/*
+ * jnx_conn_verify_overlay()
+ *
+ * Verify if overlay is compatible with this board/slot
+ */
+static int jnx_conn_verify_overlay(struct jnx_conn_data *data,
+				   struct device_node *np)
+{
+	struct device *dev = data->dev;
+	bool compatible = false;
+	int ret, i, names;
+	const char *name;
+	const __be32 *assembly_ids;
+	int size;
+	u32 var;
+
+	/*
+	 * 'compatible-systems' property must exist, and at least one of its
+	 * entries must match with the board's 'compatible' property.
+	 */
+	names = of_property_count_strings(np, "compatible-systems");
+	if (names < 0) {
+		dev_err(dev,
+			"Missing 'compatible-systems' property in overlay\n");
+		return names;
+	}
+
+	for (i = 0; i < names; i++) {
+		ret = of_property_read_string_index(np, "compatible-systems",
+						    i, &name);
+		if (ret) {
+			dev_err(dev,
+				"Error reading compatible-systems property\n");
+			return ret;
+		}
+		if (of_machine_is_compatible(name)) {
+			compatible = true;
+			break;
+		}
+	}
+	if (!compatible) {
+		dev_err(dev, "Overlay is incompatible with this hardware\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(np, "type", &var);
+	if (ret) {
+		dev_err(dev, "Missing type property\n");
+		return ret;
+	}
+	if (var != data->type) {
+		dev_err(dev, "Wrong type: Expected %d, got %d\n",
+			data->type, var);
+		return -EINVAL;
+	}
+
+	/*
+	 * 'assembly-ids' property must exist, and one of its entries must match
+	 * the card assembly id
+	 */
+	assembly_ids = of_get_property(np, "assembly-ids", &size);
+	if (!assembly_ids || size < sizeof(u32)) {
+		dev_err(dev, "Bad assembly-ids property\n");
+		return -EINVAL;
+	}
+	ret = -EINVAL;
+	for (i = 0; i < size / sizeof(u32); i++) {
+		if (be32_to_cpu(assembly_ids[i]) == data->assembly_id) {
+			ret = 0;
+			break;
+		}
+	}
+	if (ret) {
+		dev_err(dev, "Assembly ID 0x%x not supported by overlay\n",
+			data->assembly_id);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int jnx_conn_install_overlay(struct jnx_conn_data *data, int index)
+{
+	const struct firmware *firmware = data->ovfw[index];
+	struct device *dev = data->dev;
+	struct device_node *overlay;
+	char slotname[16];
+	char name[32];
+	int ret;
+
+	sprintf(name, "%s_%04x.dtbo",
+		data->name[index], data->assembly_id);
+
+	ret = request_firmware(&firmware, name, dev);
+	if (ret)
+		return ret;
+
+	of_fdt_unflatten_tree((void *)firmware->data, NULL, &overlay);
+	if (!overlay) {
+		dev_err(dev, "Failed to flatten devicetree data\n");
+		ret = -EINVAL;
+		goto error;
+	}
+	/* mark overlay as detached */
+	of_node_set_flag(overlay, OF_DETACHED);
+
+	/* perform resolution */
+	ret = of_resolve_phandles(overlay);
+	if (ret) {
+		dev_err(dev, "Failed to resolve tree\n");
+		goto error;
+	}
+	ret = jnx_conn_verify_overlay(data, overlay);
+	if (ret)
+		goto error;
+
+	snprintf(slotname, sizeof(slotname), "slot%d", data->slot);
+	/* install overlay */
+	data->ov[index] = of_overlay_create_indirect(overlay, slotname);
+	if (data->ov[index] < 0) {
+		dev_err(dev, "Failed to install overlay\n");
+		ret = data->ov[index];
+		goto err_fail_overlay;
+	}
+
+	return 0;
+
+err_fail_overlay:
+	data->ov[index] = -1;
+
+error:
+	release_firmware(firmware);
+	return ret;
+}
+
+static void jnx_conn_update_leds(struct jnx_conn_data *data,
+				 enum jnx_conn_state oldstate)
+{
+	unsigned long period;
+
+	switch (data->state) {
+	case empty:			/* all off */
+		led_trigger_event(data->led_green, LED_OFF);
+		led_trigger_event(data->led_red, LED_OFF);
+		break;
+	case standby: /* no LED control in standby state */
+		break;
+	case power:			/* amber */
+	case present:			/* amber */
+	case insert_wait:		/* amber */
+	case loading0:			/* amber */
+		switch (data->button_state) {
+		case idle:
+			led_trigger_event(data->led_green, LED_FULL);
+			led_trigger_event(data->led_red, LED_FULL);
+			break;
+		case pressed:		/* amber, blinking slow */
+			period = 500;
+			led_trigger_blink(data->led_green, &period, &period);
+			led_trigger_blink(data->led_red, &period, &period);
+			break;
+		case wait_release:	/* amber, blinking fast */
+			period = 125;
+			led_trigger_blink(data->led_green, &period, &period);
+			led_trigger_blink(data->led_red, &period, &period);
+			break;
+		}
+		break;
+	case poweron:
+	case loading:
+		/* Don't change anything if already blinking */
+		if (oldstate == poweron || oldstate == loading)
+			break;
+		period = 125;
+		led_trigger_blink(data->led_green, &period, &period);
+		led_trigger_blink(data->led_red, &period, &period);
+		break;
+	case abort:			/* red, blinking fast */
+		period = 125;
+		led_trigger_event(data->led_green, LED_OFF);
+		led_trigger_blink(data->led_red, &period, &period);
+		break;
+	case active:			/* green */
+		switch (data->button_state) {
+		case idle:
+			led_trigger_event(data->led_green, LED_FULL);
+			led_trigger_event(data->led_red, LED_OFF);
+			break;
+		case pressed:		/* green, blinking slow */
+			period = 500;
+			led_trigger_blink(data->led_green, &period, &period);
+			led_trigger_event(data->led_red, LED_OFF);
+			break;
+		case wait_release:	/* green, blinking fast */
+			period = 125;
+			led_trigger_blink(data->led_green, &period, &period);
+			led_trigger_event(data->led_red, LED_OFF);
+			break;
+		}
+		break;
+	case failed:			/* red */
+		led_trigger_event(data->led_green, LED_OFF);
+		led_trigger_event(data->led_red, LED_FULL);
+		break;
+	}
+}
+
+/*
+ * jnx_conn_load_work()
+ *
+ * Insert fdt overlay
+ */
+static void jnx_conn_load_work(struct work_struct *work)
+{
+	struct jnx_conn_data *data = container_of(work, struct jnx_conn_data,
+						  load_work);
+	int event = loaded_ev;
+	int ret, index;
+
+	index = (data->state == loading0 ? JNX_OV_POWER : JNX_OV_DEVICES);
+
+	/* Only attempt to load overlay if its name was provided */
+	mutex_lock(&data->fdt_mutex);
+	if (data->name[index]) {
+		ret = jnx_conn_install_overlay(data, index);
+		if (ret == -ENOENT)
+			event = enoent_ev;
+		else if (ret)
+			event = failure_ev;
+	}
+
+	mutex_lock(&data->mutex);
+	data->event = event;
+	mod_delayed_work(data->conn_wq, &data->work, 0);
+	mutex_unlock(&data->mutex);
+
+	mutex_unlock(&data->fdt_mutex);
+}
+
+static const char * const jnx_conn_states[] = {
+	"empty", "standby", "insert_wait", "loading0", "present",
+	"poweron", "power", "loading", "abort", "active",
+	"failed"
+};
+
+static const char * const jnx_conn_events[] = {
+	"invalid_ev", "insert_ev", "insert_done_ev", "remove_ev",
+	"loaded_ev", "timeout_ev", "enoent_ev", "failure_ev",
+	"poweroff_ev", "button_ev", "poweron_ev",
+	"powergood_ev", "powerbad_ev", "master_ev", "standby_ev" };
+
+/*
+ * jnx_conn_mastership_callback()
+ *
+ * mastership callback gets registered via jnx_probe() and will be called via
+ * notifier chain once a mastership switch event has occurred from user
+ * space. Either a master_ev or standby_ev gets set and state machine is kicked.
+ *
+ */
+static int jnx_conn_mastership_callback(struct notifier_block *nb,
+					unsigned long is_master, void *unused)
+{
+	struct jnx_conn_data *data = container_of(nb, struct jnx_conn_data, nb);
+
+	mutex_lock(&data->mutex);
+
+	/*
+	 * 1. Protect against a race condition where mastership changes and
+	 *    jnx_is_master() is called during empty:insert_ev (returns true)
+	 *    before the callback gets a chance to run. Otherwise, data->event
+	 *    gets overwritten with a state:event combination that is a NOP.
+	 * 2. Do not process empty:standby_ev for empty cards, in order to
+	 *    prevent insertion during standby:master_ev
+	 * 3. skip empty:master_ev, standby:standby_ev that are NOP.
+	 */
+	dev_dbg(data->dev, "mastership_callback(): %s:%s is_master:%ld\n",
+		jnx_conn_states[data->state], jnx_conn_events[data->event],
+		is_master);
+
+	if ((is_master && data->state == standby) ||
+	    (!is_master && data->state != standby && data->state != empty)) {
+		data->event = is_master ? master_ev : standby_ev;
+		mod_delayed_work(data->conn_wq, &data->work, 0);
+	}
+	mutex_unlock(&data->mutex);
+
+	return NOTIFY_OK;
+}
+
+/*
+ * jnx_conn_button_work()
+ *
+ * Handle button event (pressed, released, timeout)
+ */
+static void jnx_conn_button_work(struct work_struct *work)
+{
+	struct jnx_conn_data *data = container_of(work, struct jnx_conn_data,
+						  button_work.work);
+	enum jnx_conn_button_state oldstate = data->button_state;
+	bool do_notify = false;
+	int button;
+	char object[JNX_BRD_I2C_NAME_LEN + 8];
+	char subobject[17];
+	char *envp[3];
+
+	envp[0] = object;
+	envp[1] = subobject;
+	envp[2] = NULL;
+
+	mutex_lock(&data->mutex);
+
+	if (data->state != present && data->state != active &&
+	    data->state != failed) {
+		data->button_state = idle;
+		goto done;
+	}
+
+	button = gpio_get_value_cansleep(data->attention_button);
+	if (data->gpio_flags & ATTENTION_ACTIVE_LOW)
+		button = !button;
+
+	switch (data->button_state) {
+	case idle:
+		if (data->button_event == button_state_change_ev && button) {
+			data->button_state = pressed;
+			data->button_event = button_timeout_ev;
+			mod_delayed_work(data->conn_wq, &data->button_work,
+					 data->attention_button_holdtime);
+		}
+		break;
+	case pressed:
+		switch (data->button_event) {
+		case button_state_change_ev:
+			if (!button) {
+				data->button_state = idle;
+				break;
+			}
+			data->button_state = pressed;
+			data->button_event = button_timeout_ev;
+			mod_delayed_work(data->conn_wq,
+					 &data->button_work,
+					 data->attention_button_holdtime);
+			break;
+		case button_timeout_ev:
+			if (button)
+				data->button_state = wait_release;
+			else
+				do_notify = true;
+			break;
+		}
+		break;
+	case wait_release:
+		if (!button)
+			do_notify = true;
+		break;
+	}
+	if (do_notify) {
+		data->button_state = idle;
+		if (!data->attention_ignore) {
+			data->event = button_ev;
+			mod_delayed_work(data->conn_wq, &data->work, 0);
+		}
+		sysfs_notify(&data->dev->kobj, NULL, "attention");
+		snprintf(object, sizeof(object), "OBJECT=%s",
+			 data->dev->of_node->name);
+		sprintf(subobject, "SUBOBJECT=button");
+		kobject_uevent_env(&data->dev->kobj, KOBJ_CHANGE, envp);
+	}
+done:
+	if (data->button_state != oldstate && !data->attention_ignore)
+		jnx_conn_update_leds(data, data->state);
+
+	mutex_unlock(&data->mutex);
+}
+
+/*
+ * jnx_conn_work()
+ *
+ * Execute state machine
+ */
+static void jnx_conn_work(struct work_struct *work)
+{
+	struct jnx_conn_data *data = container_of(work, struct jnx_conn_data,
+						  work.work);
+	enum jnx_conn_state oldstate;
+	enum jnx_conn_event old_event;
+	char object[JNX_BRD_I2C_NAME_LEN + 8];
+	char subobject[11];
+	char *envp[3];
+
+	envp[0] = object;
+	envp[1] = subobject;
+	envp[2] = NULL;
+
+	mutex_lock(&data->mutex);
+	oldstate = data->state;
+	old_event = data->event;
+
+	if (data->event == invalid_ev) {
+		dev_err(data->dev, "%s:%s, ignored\n",
+			jnx_conn_states[data->state],
+			jnx_conn_events[data->event]);
+		goto abort;
+	}
+
+	dev_info(data->dev, "%s:%s\n", jnx_conn_states[data->state],
+		 jnx_conn_events[data->event]);
+
+	switch (data->state) {
+	case empty:
+		switch (data->event) {
+		case insert_ev:
+			/* only allow insertion while master */
+			if (jnx_is_master())
+				jnx_conn_insert_nodes(data);
+			else
+				data->state = standby;
+			break;
+		case standby_ev:
+			data->state = standby;
+			break;
+		case master_ev:
+			break;
+		default:
+			break;
+		}
+		break;
+	case standby:
+		switch (data->event) {
+		case master_ev:
+			data->standby_to_master = true;
+			jnx_conn_insert_nodes(data);
+			break;
+		case remove_ev:
+			data->state = empty;
+			break;
+		case standby_ev:
+		case insert_ev:
+			/* nothing to do here really */
+			break;
+		default:
+			break;
+		}
+		break;
+	case insert_wait:
+		switch (data->event) {
+		case timeout_ev:
+			dev_err(data->dev, "Failed to get assembly ID\n");
+			jnx_conn_remove(data);
+			data->state = failed;
+			break;
+		case insert_done_ev:
+			jnx_conn_load(data, loading0);
+			break;
+		case remove_ev:
+			jnx_conn_remove(data);
+			break;
+		case standby_ev:
+			jnx_conn_remove(data);
+			data->state = standby;
+			break;
+		default:
+			break;
+		}
+		break;
+	case loading0:
+		switch (data->event) {
+		case timeout_ev:
+			jnx_conn_remove(data);
+			data->state = failed;
+			break;
+		case enoent_ev:
+		case loaded_ev:
+			jnx_conn_insert(data);
+			break;
+		case remove_ev:
+			jnx_conn_remove(data);
+			break;
+		case standby_ev:
+			jnx_conn_remove(data);
+			data->state = standby;
+			break;
+		default:
+			break;
+		}
+		break;
+	case present:
+		switch (data->event) {
+		case button_ev:
+		case poweron_ev:
+			jnx_conn_poweron(data);
+			break;
+		case remove_ev:
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			break;
+		case powergood_ev:
+			/* load overlay if configured for auto-enable */
+			if (data->auto_enable) {
+				dev_info(data->dev, "auto-loading\n");
+				jnx_conn_load(data, loading);
+			}
+			break;
+		case standby_ev:
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			data->state = standby;
+			break;
+		default:
+			break;
+		}
+		break;
+	case poweron:
+		switch (data->event) {
+		case powergood_ev:
+			jnx_conn_load(data, loading);
+			break;
+		case powerbad_ev:
+			/* ignore; powergood_ev may follow */
+			break;
+		case timeout_ev:
+			jnx_conn_poweroff(data);
+			data->state = failed;
+			break;
+		case remove_ev:
+			jnx_conn_poweroff(data);
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			break;
+		case poweroff_ev:
+			jnx_conn_poweroff(data);
+			data->state = present;
+			break;
+		case insert_ev:
+			/* bad state change, but handle anyway */
+			jnx_conn_poweroff(data);
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			jnx_conn_insert(data);
+			break;
+		case standby_ev:
+			/* skip jnx_conn_poweroff() to preserve state */
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			data->state = standby;
+			break;
+		default:
+			break;
+		}
+		break;
+	case power:
+		switch (data->event) {
+		case button_ev:
+		case poweron_ev:
+			jnx_conn_load(data, loading);
+			break;
+		case powerbad_ev:
+			/* Happens if power is managed by user space */
+			jnx_conn_poweroff(data);
+			data->state = present;
+			break;
+		case timeout_ev:
+			jnx_conn_poweroff(data);
+			data->state = failed;
+			break;
+		case remove_ev:
+			jnx_conn_poweroff(data);
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			break;
+		case poweroff_ev:
+			jnx_conn_poweroff(data);
+			data->state = present;
+			break;
+		case insert_ev:
+			/* bad state change, but handle anyway */
+			jnx_conn_poweroff(data);
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			jnx_conn_insert(data);
+			break;
+		case standby_ev:
+			/* skip jnx_conn_poweroff() to preserve state */
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			data->state = standby;
+			break;
+		default:
+			break;
+		}
+		break;
+	case loading:
+		switch (data->event) {
+		case loaded_ev:
+			data->state = active;
+			data->standby_to_master = false;
+			break;
+		case powerbad_ev:
+			/* User space messing with card power */
+			data->state = abort;
+			data->newstate = present;
+			break;
+		case timeout_ev:
+			data->state = abort;
+			data->newstate = failed;
+			break;
+		case enoent_ev:
+		case failure_ev:
+			jnx_conn_poweroff(data);
+			data->state = failed;
+			break;
+		case remove_ev:
+			data->state = abort;
+			data->newstate = empty;
+			break;
+		case poweroff_ev:
+			data->state = abort;
+			data->newstate = present;
+			break;
+		case insert_ev:
+			/* bad state change, but handle anyway */
+			data->state = abort;
+			data->newstate = present;
+			break;
+		case standby_ev:
+			data->state = abort;
+			data->newstate = standby;
+			break;
+		default:
+			break;
+		}
+		break;
+	case abort:
+		switch (data->event) {
+		case loaded_ev:
+			jnx_conn_unload(data, JNX_OV_DEVICES);
+			jnx_conn_poweroff(data);
+			data->state = data->newstate;
+			break;
+		case failure_ev:
+			jnx_conn_poweroff(data);
+			data->state = data->newstate;
+			break;
+		case timeout_ev:
+			/* Not really sure what to do here. */
+			jnx_conn_poweroff(data);
+			data->state = failed;
+			break;
+		case powerbad_ev:
+			if (data->newstate != empty)
+				data->newstate = failed;
+			break;
+		case remove_ev:
+			data->newstate = empty;
+			break;
+		case poweroff_ev:
+			if (data->newstate != empty)
+				data->newstate = present;
+			break;
+		case insert_ev:
+			data->newstate = jnx_is_master() ? present : standby;
+			break;
+		case standby_ev:
+			data->newstate = standby;
+			break;
+		default:
+			break;
+		}
+		break;
+	case active:
+		switch (data->event) {
+		case powerbad_ev:
+			/* Card may have been powered off from user space */
+			jnx_conn_unload(data, JNX_OV_DEVICES);
+			jnx_conn_poweroff(data);
+			data->state = present;
+			break;
+		case remove_ev:
+			jnx_conn_unload(data, JNX_OV_DEVICES);
+			jnx_conn_poweroff(data);
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			break;
+		case button_ev:
+		case poweroff_ev:
+			jnx_conn_unload(data, JNX_OV_DEVICES);
+			jnx_conn_poweroff(data);
+			data->state = present;
+			break;
+		case insert_ev:
+			/* bad state change, but handle anyway */
+			jnx_conn_unload(data, JNX_OV_DEVICES);
+			jnx_conn_poweroff(data);
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			jnx_conn_insert(data);
+			break;
+		case standby_ev:
+			jnx_conn_unload(data, JNX_OV_DEVICES);
+			/* skip jnx_conn_poweroff() to preserve state */
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			data->state = standby;
+			break;
+		default:
+			break;
+		}
+		break;
+	case failed:
+		switch (data->event) {
+		case remove_ev:
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			break;
+		case button_ev:
+		case powerbad_ev:
+		case poweroff_ev:
+			/*
+			 * already powered off. All we need to do is to update
+			 * the state.
+			 */
+			data->state = present;
+			break;
+		case insert_ev:
+			/* Bad state change, but handle anyway */
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			jnx_conn_insert(data);
+			break;
+		case standby_ev:
+			jnx_conn_unload(data, JNX_OV_POWER);
+			jnx_conn_remove(data);
+			data->state = standby;
+			break;
+		default:
+			break;
+		}
+		break;
+	}
+
+	dev_info(data->dev, "%s:%s -> %s:%s\n",
+		 jnx_conn_states[oldstate], jnx_conn_events[old_event],
+		 jnx_conn_states[data->state], jnx_conn_events[data->event]);
+
+	if (data->state != oldstate) {
+		jnx_conn_update_leds(data, oldstate);
+		sysfs_notify(&data->dev->kobj, NULL, "state");
+		snprintf(object, sizeof(object), "OBJECT=%s",
+			 data->dev->of_node->name);
+		sprintf(subobject, "SUBOBJECT=");
+		kobject_uevent_env(&data->dev->kobj, KOBJ_CHANGE, envp);
+	}
+abort:
+	mutex_unlock(&data->mutex);
+}
+
+static ssize_t attention_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct jnx_conn_data *data = dev_get_drvdata(dev);
+	int button = 0;
+
+	if (data->state != empty && data->state != failed &&
+	    data->attention_button >= 0) {
+		button = gpio_get_value_cansleep(data->attention_button);
+		if (data->gpio_flags & ATTENTION_ACTIVE_LOW)
+			button = !button;
+	}
+
+	return sprintf(buf, "%d\n", button);
+}
+
+static ssize_t enable_show(struct device *dev, struct device_attribute *attr,
+			   char *buf)
+{
+	struct jnx_conn_data *data = dev_get_drvdata(dev);
+	int enable = data->poweron;
+
+	if (data->type == JNX_BOARD_TYPE_SPMB) {
+		if (!gpio_is_valid(data->reset))
+			return -EINVAL;
+
+		enable = gpio_get_value_cansleep(data->reset);
+		if (!(data->gpio_flags & RESET_ACTIVE_LOW))
+			enable = !enable;
+	}
+
+	return sprintf(buf, "%d\n", enable);
+}
+
+static ssize_t enable_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct jnx_conn_data *data = dev_get_drvdata(dev);
+	unsigned long enable;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &enable);
+	if (ret)
+		return ret;
+
+	if (enable > 1)
+		return -EINVAL;
+
+	if (data->type == JNX_BOARD_TYPE_SPMB) {
+		int reset;
+
+		if (!gpio_is_valid(data->reset))
+			return -EINVAL;
+
+		reset = gpio_get_value_cansleep(data->reset);
+		if (!(data->gpio_flags & RESET_ACTIVE_LOW))
+			reset = !reset;
+
+		if (!enable && reset) {
+			/* put board into reset */
+			gpio_set_value_cansleep(data->reset, reset);
+			data->state = present;
+		} else if (enable && !reset) {
+			/* Take board out of reset */
+			if (data->poweron_reset_delay) {
+				usleep_range(data->poweron_reset_delay * 1000,
+					     data->poweron_reset_delay * 1200);
+			}
+			gpio_set_value_cansleep(data->reset, reset);
+			data->state = active;
+		}
+	} else {
+		mutex_lock(&data->mutex);
+		data->event = enable ? poweron_ev : poweroff_ev;
+		mod_delayed_work(data->conn_wq, &data->work, 0);
+		mutex_unlock(&data->mutex);
+	}
+
+	return count;
+}
+
+static ssize_t state_show(struct device *dev, struct device_attribute *attr,
+			  char *buf)
+{
+	struct jnx_conn_data *data = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%s\n", jnx_conn_states[data->state]);
+}
+
+static ssize_t assembly_id_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct jnx_conn_data *data = dev_get_drvdata(dev);
+
+	return sprintf(buf, "0x%04x\n",
+		       data->assembly_id_valid ? data->assembly_id : 0);
+}
+
+static ssize_t slot_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct jnx_conn_data *data = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", data->slot);
+}
+
+static ssize_t type_show(struct device *dev, struct device_attribute *attr,
+			 char *buf)
+{
+	struct jnx_conn_data *data = dev_get_drvdata(dev);
+
+	return sprintf(buf, "%d\n", data->type);
+}
+
+static DEVICE_ATTR(attention, S_IRUGO, attention_show, NULL);
+static DEVICE_ATTR(enable, S_IWUSR | S_IRUGO, enable_show, enable_store);
+static DEVICE_ATTR(state, S_IRUGO, state_show, NULL);
+static DEVICE_ATTR(assembly_id, S_IRUGO, assembly_id_show, NULL);
+static DEVICE_ATTR(slot, S_IRUGO, slot_show, NULL);
+static DEVICE_ATTR(type, S_IRUGO, type_show, NULL);
+
+static struct attribute *jnx_conn_attrs[] = {
+	&dev_attr_attention.attr,
+	&dev_attr_enable.attr,
+	&dev_attr_state.attr,
+	&dev_attr_assembly_id.attr,
+	&dev_attr_slot.attr,
+	&dev_attr_type.attr,
+	NULL,
+};
+
+static umode_t jnx_conn_is_visible(struct kobject *kobj, struct attribute *attr,
+				   int index)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct jnx_conn_data *data = dev_get_drvdata(dev);
+
+	if (index == 0 && !data->have_attention_button)
+		return 0;
+	return attr->mode;
+};
+
+static const struct attribute_group jnx_conn_group = {
+	.attrs = jnx_conn_attrs,
+	.is_visible = jnx_conn_is_visible,
+};
+
+/*
+ * jnx_conn_presence_work()
+ *
+ * Handle presence detect event
+ */
+static void jnx_conn_presence_work(struct work_struct *work)
+{
+	struct jnx_conn_data *data = container_of(work, struct jnx_conn_data,
+						  presence_work.work);
+	int state = 1;
+
+	if (gpio_is_valid(data->presence_detect)) {
+		state = gpio_get_value_cansleep(data->presence_detect);
+		if (data->gpio_flags & PRESENCE_ACTIVE_LOW)
+			state = !state;
+	}
+
+	mutex_lock(&data->mutex);
+	data->event = state ? insert_ev : remove_ev;
+	mod_delayed_work(data->conn_wq, &data->work, 0);
+	mutex_unlock(&data->mutex);
+}
+
+static int jnx_conn_handle_i2c_node(struct device *dev, struct device_node *np,
+				    struct jnx_conn_data *data)
+{
+	struct i2c_adapter *adapter;
+	struct device_node *anp;
+
+	anp = of_parse_phandle(np, "i2c-parent", 0);
+	if (!anp) {
+		dev_err(dev, "Failed to parse i2c-parent\n");
+		return -ENODEV;
+	}
+	adapter = of_find_i2c_adapter_by_node(anp);
+	if (!adapter)
+		return -EPROBE_DEFER;
+	data->adapter = i2c_adapter_id(adapter);
+	put_device(&adapter->dev);
+
+	data->i2c_node = np;
+
+	return 0;
+}
+
+static int jnx_conn_config_of(struct jnx_conn_data *data)
+{
+	struct device_node *child, *np = data->dev->of_node;
+	enum of_gpio_flags flags;
+	u32 var, timeout;
+	int i, gpio, ret, overlays;
+
+	data->presence_detect = -1;
+	gpio = of_get_named_gpio_flags(np, "presence-detect-gpios", 0, &flags);
+	if (gpio == -EPROBE_DEFER)
+		return gpio;
+	if (gpio_is_valid(gpio)) {
+		data->presence_detect = gpio;
+		if (flags & OF_GPIO_ACTIVE_LOW)
+			data->gpio_flags |= PRESENCE_ACTIVE_LOW;
+	}
+
+	ret = of_property_read_u32(np, "slot", &var);
+	if (ret)
+		return ret;
+	data->slot = var;
+
+	if (!of_property_read_u32(np, "assembly-id", &var)) {
+		if (var > 0xffff)
+			return -EINVAL;
+		data->assembly_id = var;
+		data->static_assembly_id = true;
+		data->assembly_id_valid = true;
+	}
+
+	if (!of_property_read_u32(np, "debounce-interval", &var))
+		data->debounce = msecs_to_jiffies(var);
+
+	overlays = of_property_count_strings(np, "ovname");
+	if (overlays < 0)
+		return overlays;
+	if (overlays > NUM_OVERLAYS)
+		return -EINVAL;
+
+	for (i = 0; i < overlays; i++) {
+		ret = of_property_read_string_index(np, "ovname",
+						    i, &data->name[i]);
+		if (ret)
+			return ret;
+	}
+
+	gpio = of_get_named_gpio_flags(np, "attention-button-gpios", 0, &flags);
+	data->have_attention_button = (gpio >= 0 || gpio == -EPROBE_DEFER);
+	if (data->have_attention_button) {
+		data->attention_ignore = of_get_property(np,
+						"attention-button-ignore",
+						NULL);
+	}
+
+	/*
+	 * timeout and hold time values are provided in milli-seconds
+	 * but used as jiffies. Read and convert to jiffies to simplify use.
+	 */
+	if (of_property_read_u32(np, "power-enable-timeout", &timeout))
+		timeout = POWER_ENABLE_TIMEOUT_DEFAULT;
+	data->power_enable_timeout = msecs_to_jiffies(timeout);
+
+	if (of_property_read_u32(np, "attention-button-holdtime", &timeout))
+		timeout = ATTENTION_BUTTON_HOLDTIME_DEFAULT;
+	data->attention_button_holdtime = msecs_to_jiffies(timeout);
+
+	if (of_property_read_u32(np, "activation-timeout", &timeout))
+		timeout = ACTIVATION_TIMEOUT_DEFAULT;
+	data->activation_timeout = msecs_to_jiffies(timeout);
+
+	if (of_property_read_u32(np, "poweron-reset-delay", &timeout))
+		timeout = POWERON_RESET_DELAY_DEFAULT;
+	data->poweron_reset_delay = msecs_to_jiffies(timeout);
+
+	data->sysfs_linkname =
+	of_get_property(np, "sysfs-linkname", NULL) ? : dev_name(data->dev);
+
+	child = of_parse_phandle(np, "led-green", 0);
+	if (child)
+		data->led_green_name =
+			of_get_property(child, "label", NULL) ? : child->name;
+	child = of_parse_phandle(np, "led-red", 0);
+	if (child)
+		data->led_red_name =
+			of_get_property(child, "label", NULL) ? : child->name;
+
+	data->auto_enable = of_property_read_bool(np, "auto-enable");
+
+	for_each_available_child_of_node(np, child) {
+		if (!strcmp(child->name, "i2c-bus")) {
+			ret = jnx_conn_handle_i2c_node(data->dev, child, data);
+			if (ret < 0) {
+				of_node_put(child);
+				break;
+			}
+		}
+	}
+	return ret;
+}
+
+static const struct of_device_id of_jnx_conn_match[] = {
+	{
+		.compatible = "jnx,pic-connector",
+		.data = (void *)JNX_BOARD_TYPE_PIC
+	}, {
+		.compatible = "jnx,sib-connector",
+		.data = (void *)JNX_BOARD_TYPE_SIB
+	}, {
+		.compatible = "jnx,fpc-connector",
+		.data = (void *)JNX_BOARD_TYPE_FPC
+	}, {
+		.compatible = "jnx,cb-connector",
+		.data = (void *)JNX_BOARD_TYPE_CB
+	}, {
+		.compatible = "jnx,psm-connector",
+		.data = (void *)JNX_BOARD_TYPE_PS
+	}, {
+		.compatible = "jnx,fan-connector",
+		.data = (void *)JNX_BOARD_TYPE_FAN
+	}, {
+		.compatible = "jnx,mp-connector",
+		.data = (void *)JNX_BOARD_TYPE_MIDPLANE
+	}, {
+		.compatible = "jnx,fpm-connector",
+		  .data = (void *)JNX_BOARD_TYPE_FPM
+	}, {
+		.compatible = "jnx,spmb-connector",
+		  .data = (void *)JNX_BOARD_TYPE_SPMB
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, of_jnx_conn_match);
+
+static int jnx_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	struct device *dev = &pdev->dev;
+	struct jnx_conn_data *data;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->dev = dev;
+
+	match = of_match_device(of_jnx_conn_match, dev);
+	if (!match)
+		return -ENODEV;
+	data->type = (int)(unsigned long)match->data;
+
+	ret = jnx_conn_config_of(data);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, data);
+
+	/*
+	 * Inserting multiple cards (e.g on startup) overloads the system_wq.
+	 * Allocate ordered workqueue for these work items.
+	 */
+	data->conn_wq = alloc_ordered_workqueue("%s:connect", WQ_MEM_RECLAIM,
+						dev_name(&pdev->dev));
+	if (!data->conn_wq) {
+		dev_err(dev, "Failed to create connect workqueue\n");
+		return -ENOMEM;
+	}
+
+	/*
+	 * The devicetree loader needs its own workqueue to ensure
+	 * a reasonable insertion time.
+	 */
+	data->load_wq = alloc_ordered_workqueue("%s:load", WQ_MEM_RECLAIM,
+						dev_name(&pdev->dev));
+	if (!data->load_wq) {
+		dev_err(dev, "Failed to create load workqueue\n");
+		ret = -ENOMEM;
+		goto error_conn_wq;
+	}
+
+	INIT_DELAYED_WORK(&data->button_work, jnx_conn_button_work);
+	INIT_DELAYED_WORK(&data->work, jnx_conn_work);
+	INIT_DELAYED_WORK(&data->presence_work, jnx_conn_presence_work);
+	INIT_DELAYED_WORK(&data->power_enable_work, jnx_conn_power_enable_work);
+	INIT_WORK(&data->load_work, jnx_conn_load_work);
+	mutex_init(&data->mutex);
+	mutex_init(&data->fdt_mutex);
+	data->state = empty;
+	data->enabled = true;
+	data->ov[JNX_OV_POWER] = -1;
+	data->ov[JNX_OV_DEVICES] = -1;
+	data->pseq = NULL;
+	data->standby_to_master = false;
+
+	if (gpio_is_valid(data->presence_detect)) {
+		ret = devm_gpio_request_one(dev, data->presence_detect,
+					    GPIOF_DIR_IN,
+					    dev_name(data->dev));
+		if (ret)
+			goto error_wq;
+
+		data->presence_irq = gpio_to_irq(data->presence_detect);
+		if (data->presence_irq < 0) {
+			ret = data->presence_irq;
+			goto error_wq;
+		}
+
+		ret = request_threaded_irq(data->presence_irq, NULL,
+					   jnx_presence_irq_handler,
+					   IRQ_TYPE_EDGE_BOTH,
+					   dev_name(data->dev), data);
+		if (ret < 0)
+			goto error_wq;
+	}
+
+	ret = sysfs_create_group(&dev->kobj, &jnx_conn_group);
+	if (ret)
+		goto error_free;
+
+	/* register led triggers */
+	if (data->led_green_name)
+		led_trigger_register_simple(data->led_green_name,
+					    &data->led_green);
+	if (data->led_red_name)
+		led_trigger_register_simple(data->led_red_name,
+					    &data->led_red);
+
+	/* Init and registeration of mastership notifier callback */
+	data->nb.notifier_call = jnx_conn_mastership_callback;
+	register_mastership_notifier(&data->nb);
+
+	/* schedule presence detect work */
+	mod_delayed_work(data->conn_wq, &data->presence_work, 0);
+
+	return 0;
+
+error_free:
+	if (gpio_is_valid(data->presence_detect))
+		free_irq(data->presence_irq, data);
+error_wq:
+	destroy_workqueue(data->load_wq);
+error_conn_wq:
+	destroy_workqueue(data->conn_wq);
+	return ret;
+}
+
+static int jnx_remove(struct platform_device *pdev)
+{
+	struct jnx_conn_data *data = platform_get_drvdata(pdev);
+
+	data->enabled = false;
+
+	/*
+	 * Remove the card's devices in case jnx_remove() is
+	 * called if the card is still active
+	 */
+	jnx_conn_remove(data);
+
+	if (gpio_is_valid(data->presence_detect))
+		free_irq(data->presence_irq, data);
+
+	sysfs_remove_group(&pdev->dev.kobj, &jnx_conn_group);
+
+	/* unregister mastership notifier */
+	unregister_mastership_notifier(&data->nb);
+
+	flush_delayed_work(&data->presence_work);
+	mutex_lock(&data->mutex);
+	data->event = remove_ev;
+	mod_delayed_work(data->conn_wq, &data->work, 0);
+	mutex_unlock(&data->mutex);
+	flush_delayed_work(&data->work);
+
+	led_trigger_unregister_simple(data->led_red);
+	led_trigger_unregister_simple(data->led_green);
+	destroy_workqueue(data->conn_wq);
+	destroy_workqueue(data->load_wq);
+
+	return 0;
+}
+
+static struct platform_driver jnx_conn_driver = {
+	.probe		= jnx_probe,
+	.remove		= jnx_remove,
+	.driver		= {
+		.name	= "jnx-connector",
+		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(of_jnx_conn_match),
+	},
+};
+
+module_platform_driver(jnx_conn_driver);
+
+MODULE_AUTHOR("Guenter Roeck <groeck-3r7Miqu9kMnR7s880joybQ@public.gmane.org>");
+MODULE_DESCRIPTION("Juniper PIC/SIB connector driver");
+MODULE_LICENSE("GPL");
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
