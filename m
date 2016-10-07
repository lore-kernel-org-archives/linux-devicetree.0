From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 6/6] staging: jnx: CBD-FPGA infrastructure
Date: Fri,  7 Oct 2016 18:20:14 +0300
Message-ID: <1475853614-22409-7-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1475853614-22409-1-git-send-email-pantelis.antoniou@konsulko.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alexandre Courbot <gnurou@gmail.com>, devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, linux-kernel@vger.kernel.org, JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Debjit Ghosh <dghosh@juniper.net>, Mohammad Kamil <mkamil@juniper.net>, Georgi Vlaev <gvlaev@juniper.net>, Frank Rowand <frowand.list@gmail.com>, Guenter Roeck <linux@roeck-us.net>
List-Id: devicetree@vger.kernel.org

From: Tom Kavanagh <tkavanagh@juniper.net>

Every Juniper platform contains a CBD (Control Board) FPGA.

While each CBD FPGA is different, a common abstact API makes
handling them common for every platform and the same parts
they have can be factored out.

The supported CBDs are PTX1K, PTX21K, PTX3K & PTX5K.

Signed-off-by: Georgi Vlaev <gvlaev@juniper.net>
Signed-off-by: Guenter Roeck <groeck@juniper.net>
Signed-off-by: JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>
Signed-off-by: Mohammad Kamil <mkamil@juniper.net>
Signed-off-by: Tom Kavanagh <tkavanagh@juniper.net>
Signed-off-by: Debjit Ghosh <dghosh@juniper.net>
[Ported from Juniper kernel]
Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/staging/jnx/Kconfig                 |  34 ++
 drivers/staging/jnx/Makefile                |   5 +
 drivers/staging/jnx/jnx-cbc-ptx1k.c         | 242 +++++++++++++
 drivers/staging/jnx/jnx-cbd-fpga-common.c   | 332 +++++++++++++++++
 drivers/staging/jnx/jnx-cbd-fpga-common.h   |  27 ++
 drivers/staging/jnx/jnx-cbd-fpga-core.c     | 540 ++++++++++++++++++++++++++++
 drivers/staging/jnx/jnx-cbd-fpga-core.h     |  68 ++++
 drivers/staging/jnx/jnx-cbd-fpga-platdata.h |  51 +++
 drivers/staging/jnx/jnx-cbd-fpga-ptx1k.c    | 134 +++++++
 drivers/staging/jnx/jnx-cbd-fpga-ptx21k.c   | 143 ++++++++
 drivers/staging/jnx/jnx-cbd-fpga-ptx3k.c    | 111 ++++++
 drivers/staging/jnx/jnx-cbd-fpga-ptx5k.c    | 107 ++++++
 12 files changed, 1794 insertions(+)
 create mode 100644 drivers/staging/jnx/jnx-cbc-ptx1k.c
 create mode 100644 drivers/staging/jnx/jnx-cbd-fpga-common.c
 create mode 100644 drivers/staging/jnx/jnx-cbd-fpga-common.h
 create mode 100644 drivers/staging/jnx/jnx-cbd-fpga-core.c
 create mode 100644 drivers/staging/jnx/jnx-cbd-fpga-core.h
 create mode 100644 drivers/staging/jnx/jnx-cbd-fpga-platdata.h
 create mode 100644 drivers/staging/jnx/jnx-cbd-fpga-ptx1k.c
 create mode 100644 drivers/staging/jnx/jnx-cbd-fpga-ptx21k.c
 create mode 100644 drivers/staging/jnx/jnx-cbd-fpga-ptx3k.c
 create mode 100644 drivers/staging/jnx/jnx-cbd-fpga-ptx5k.c

diff --git a/drivers/staging/jnx/Kconfig b/drivers/staging/jnx/Kconfig
index 4c38fc2..cd29276 100644
--- a/drivers/staging/jnx/Kconfig
+++ b/drivers/staging/jnx/Kconfig
@@ -34,6 +34,40 @@ config JNX_CONNECTOR
 	  This driver can also be built as a module.  If so, the module
 	  will be called jnx-connector.
 
+config JNX_CBD_FPGA
+	tristate "Juniper Generic CBD FPGA"
+	select I2C_MUX
+	help
+	  Driver to support the Juniper Control Board (CBD) FPGA.  Provides all
+	  common functionality for device across all supported juniper platforms.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called jnx-cbd-fpga.
+
+config JNX_CBD_FPGA_PTX21K
+	tristate "Juniper PTX21K CBC FPGA"
+	depends on JNX_SYSTEM && MFD_JUNIPER_CBC && JNX_PTX21K_BOARDS
+	depends on JNX_PTX21K_RCB
+	default m
+	help
+	  Driver to support the Juniper Control Board (CBC) FPGA in PTX21K.
+	  Provides hooks for the common fpga handling core for these
+	  particular Juniper Boards.
+
+	  When compiled as a module it is included in jnx-cbd-fpga.
+
+config JNX_CBD_FPGA_PTX1K
+	tristate "Juniper PTX1K CBC FPGA"
+	depends on JNX_SYSTEM && MFD_JUNIPER_CBC && JNX_PTX1K_BOARDS
+	depends on JNX_CBD_FPGA_PTX21K
+	help
+	  Driver to support the Juniper Control Board (CBC) FPGA in PTX1K.
+	  Provides all common functionality for device across platforms and
+	  hooks for the common fpga handling core for these particular
+	  Juniper Boards.
+
+	  When compiled as a module it is included in jnx-cbd-fpga.
+
 endmenu
 
 config JNX_COMMON_PCI
diff --git a/drivers/staging/jnx/Makefile b/drivers/staging/jnx/Makefile
index c89e701..b937896 100644
--- a/drivers/staging/jnx/Makefile
+++ b/drivers/staging/jnx/Makefile
@@ -7,3 +7,8 @@ obj-$(CONFIG_JNX_CHIP_PCI_QUIRKS)+= jnx-chip-pci-quirks.o
 obj-$(CONFIG_JNX_COMMON_PCI)	+= jnx_common_pci.o
 obj-$(CONFIG_JNX_PEX8XXX_I2C)	+= pex8xxx_i2c.o
 obj-$(CONFIG_JNX_CONNECTOR)	+= jnx-connector.o
+obj-$(CONFIG_JNX_CBD_FPGA)	+= jnx-cbd-fpga.o jnx-cbd-fpga-common.o
+obj-$(CONFIG_JNX_CBD_FPGA_PTX1K)+= jnx-cbd-ptx1k.o
+obj-$(CONFIG_JNX_CBD_FPGA_PTX21K)+= jnx-cbd-fpga-ptx21k.o
+jnx-cbd-fpga-y := jnx-cbd-fpga-core.o jnx-cbd-fpga-ptx5k.o jnx-cbd-fpga-ptx3k.o
+jnx-cbd-ptx1k-y := jnx-cbc-ptx1k.o jnx-cbd-fpga-ptx1k.o
diff --git a/drivers/staging/jnx/jnx-cbc-ptx1k.c b/drivers/staging/jnx/jnx-cbc-ptx1k.c
new file mode 100644
index 0000000..7eff5ce
--- /dev/null
+++ b/drivers/staging/jnx/jnx-cbc-ptx1k.c
@@ -0,0 +1,242 @@
+/*
+ * Juniper Generic Control Board (CB) FPGA Driver
+ *
+ * Copyright (C) 2012, 2013, 2014 Juniper Networks. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/sysfs.h>
+#include <linux/i2c.h>
+#include <linux/workqueue.h>
+#include <linux/jnx/jnx-subsys.h>
+#include <linux/jnx/jnx-board-core.h>
+#include <linux/jnx/board_ids.h>
+#include <linux/mfd/cbc-core.h>
+#include <linux/of.h>
+#include <linux/dmi.h>
+#include "jnx-cbd-fpga-core.h"
+#include "jnx-cbd-fpga-common.h"
+#include "jnx-cbd-fpga-platdata.h"
+#include "jnx-subsys-private.h"
+
+/*
+ * Polaris notes (current state):
+ *
+ * I2C: We dont have I2C mux and I2C slow bus. The I2C is handled
+ *   by the I2C accellerator in the CBC FPGA (40 buses -> 10 i2c masters
+ *   internaly muxed x4), supported by the SAM i2c driver.
+ * Presence detect: (CH_PRS and OTHER_CH_PRS) - these bits are exported as
+ *   GPIOs by the gpio-cbc-presence driver
+ * DEVICE_CRTL is not valid for Polaris - we don't have to reset anything a mux
+ */
+
+#define PTX1K_SAM_CHANNELS	4
+static struct i2c_adapter *jnx_find_sam_adapter(int chan)
+{
+	char name[JNX_BRD_I2C_NAME_LEN];
+	struct i2c_adapter *adap;
+	int base, mux, chan_id;
+
+	/*
+	 * Find base adapter index first. Base is first SAM adapter,
+	 * and the name starts with 'i2c-sam.'. We can not assume this
+	 * to be constant.
+	 */
+	adap = jnx_i2c_find_adapter("i2c-sam");
+	if (!adap)
+		return NULL;
+	base = adap->nr;
+	i2c_put_adapter(adap);
+
+	/*
+	 * (zero based)  channel -> sam i2c_adapter
+	 * Example:
+	 *	bus #11 = i2c-10-mux (chan_id 3)
+	 *	bus #4  = i2c-5-mux (chan_id 0)
+	 */
+	chan_id = chan % PTX1K_SAM_CHANNELS; /* 0..3 */
+	mux = chan / PTX1K_SAM_CHANNELS;
+	mux *= (PTX1K_SAM_CHANNELS + 1); /* 0, 5, 10, ... */
+	mux += base;
+
+	sprintf(name, "i2c-%d-mux (chan_id %d)", mux, chan_id);
+
+	return jnx_i2c_find_adapter(name);
+}
+
+/*
+ * Check if we're on OF enabled setup and if the jnx_connector is defined
+ * in boot dtb. If present we'll assume that board insertion/removal will
+ * be handled by the connector and the card overlays and not the jnx-*
+ * platform drivers. This allows a temp fallback util the ptx1k/x86 code
+ * is fully DT capable.
+ */
+static int jnx_connector_present(void)
+{
+	return of_have_populated_dt();
+}
+
+const struct jnx_cbd_fpga_info * const jnx_cbc_cfinfo[] = {
+	[JNX_CBD_FPGA_PTX1K] = &jnx_cbd_fpga_ptx1k_info,
+	[JNX_CBD_FPGA_PTX1K_P2] = &jnx_cbd_fpga_ptx1k_p2_info,
+	[JNX_CBD_FPGA_PTX21K] = &jnx_cbd_fpga_ptx21k_info,
+};
+
+static int jnx_cbc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cbc_fpga_platdata *pdata = dev_get_platdata(dev);
+	const struct jnx_cbd_fpga_info *cfinfo;
+	struct jnx_cbd_fpga_data *fdata;
+	struct jnx_chassis_info chinfo;
+	struct jnx_card_info cinfo;
+	struct resource *res;
+	u32 ch_prs;
+	int err;
+
+	if (!pdata || pdata->board_type >= ARRAY_SIZE(jnx_cbc_cfinfo))
+		return -ENODEV;
+
+	cfinfo = jnx_cbc_cfinfo[pdata->board_type];
+
+	fdata = devm_kzalloc(dev, sizeof(*fdata), GFP_KERNEL);
+	if (!fdata)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+
+	fdata->region0 = devm_ioremap(dev, res->start, resource_size(res));
+	if (!fdata->region0)
+		return -ENOMEM;
+
+	fdata->cfinfo = cfinfo;
+	fdata->find_mux_adapter = jnx_find_sam_adapter;
+	fdata->default_chan = cfinfo->i2cmux_default_chan;
+	fdata->mux_channels = cfinfo->mux_channels;
+	if (fdata->mux_channels > JNX_CBD_FPGA_NUM_MUXES)
+		fdata->mux_channels = JNX_CBD_FPGA_NUM_MUXES;
+
+	mutex_init(&fdata->lock);
+
+	platform_set_drvdata(pdev, fdata);
+
+	err = jnx_cbd_fpga_sysfs_init(dev);
+	if (err)
+		return err;
+
+	/*
+	 * Register the chassis with the system so userspace is able to
+	 * determine platform type, etc.
+	 */
+	chinfo.platform = cfinfo->platform;
+	chinfo.chassis_no = 0;
+	chinfo.multichassis = 0;
+	chinfo.master_data = fdata;
+	chinfo.get_master = jnx_cbd_fpga_get_master;
+	chinfo.mastership_get = jnx_cbd_fpga_mastership_get;
+	chinfo.mastership_set = jnx_cbd_fpga_mastership_set;
+	chinfo.mastership_ping = jnx_cbd_fpga_mastership_ping;
+	chinfo.mastership_count_get = jnx_cbd_fpga_mastership_count_get;
+	chinfo.mastership_count_set = jnx_cbd_fpga_mastership_count_set;
+
+	jnx_register_chassis(&chinfo);
+
+	/*
+	 * Register the local card with the system so userspace is able to
+	 * determine board type etc.
+	 */
+	ch_prs = ioread32(fdata->region0 + JNX_CBD_FPGA_CH_PRS_REG);
+
+	fdata->slot = (ch_prs & cfinfo->ch_prs_cb0_bit) ? 0 : 1;
+
+	cinfo.assembly_id = cfinfo->assembly_id;
+	cinfo.slot = fdata->slot;
+	cinfo.type = JNX_BOARD_TYPE_RE;
+	cinfo.adap = NULL;
+
+	jnx_register_local_card(&cinfo);
+
+	/* The jnx-connector & gpio-cbc-presence will handle the cards */
+	fdata->dt_enabled = jnx_connector_present();
+	if (fdata->dt_enabled) {
+		dev_info(dev, "line cards will handled by the jnx-connector\n");
+		return 0;
+	}
+
+	fdata->workqueue = create_singlethread_workqueue("jnx-cbd-poller");
+	if (!fdata->workqueue) {
+		err = -ENOMEM;
+		goto err_unregister;
+	}
+
+	INIT_DELAYED_WORK(&fdata->work, jnx_cbd_fpga_ch_prs_handler);
+
+	return 0;
+
+err_unregister:
+	jnx_unregister_local_card();
+	jnx_unregister_chassis();
+	jnx_cbd_fpga_sysfs_remove(dev);
+
+	return err;
+}
+
+static int jnx_cbc_remove(struct platform_device *pdev)
+{
+	struct jnx_cbd_fpga_data *fdata = platform_get_drvdata(pdev);
+	int i;
+
+	if (!fdata->dt_enabled) {
+		cancel_delayed_work_sync(&fdata->work);
+		flush_workqueue(fdata->workqueue);
+		destroy_workqueue(fdata->workqueue);
+
+		for (i = 0; i < fdata->mux_channels; i++) {
+			/*
+			 * jnx_i2c_find_adapter acquires a hold on
+			 * the  adapter
+			 */
+			i2c_put_adapter(fdata->mux[i]);
+		}
+	}
+
+	jnx_unregister_local_card();
+	jnx_unregister_chassis();
+
+	jnx_cbd_fpga_sysfs_remove(&pdev->dev);
+
+	return 0;
+}
+
+static struct platform_driver jnx_cbc_driver = {
+	.driver = {
+		.name = "jnx-cbd-fpga",
+		.owner  = THIS_MODULE,
+	},
+	.probe = jnx_cbc_probe,
+	.remove = jnx_cbc_remove,
+};
+module_platform_driver(jnx_cbc_driver);
+
+MODULE_DESCRIPTION("JNX Polaris CBC Driver");
+MODULE_AUTHOR("Georgi Vlaev <gvlaev@juniper.net>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:jnx-cbd-fpga");
diff --git a/drivers/staging/jnx/jnx-cbd-fpga-common.c b/drivers/staging/jnx/jnx-cbd-fpga-common.c
new file mode 100644
index 0000000..718fb37
--- /dev/null
+++ b/drivers/staging/jnx/jnx-cbd-fpga-common.c
@@ -0,0 +1,332 @@
+/*
+ * Juniper Generic Control Board (CB) FPGA Driver common code
+ *
+ * Copyright (C) 2012, 2013, 2014, 2015 Juniper Networks. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/sysfs.h>
+#include <linux/i2c.h>
+#include <linux/workqueue.h>
+#include <linux/jnx/jnx-subsys.h>
+#include <linux/jnx/jnx-board-core.h>
+#include <linux/jnx/board_ids.h>
+#include <linux/of.h>
+#include <linux/dmi.h>
+#include "jnx-cbd-fpga-common.h"
+#include "jnx-cbd-fpga-core.h"
+#include "jnx-cbd-fpga-platdata.h"
+#include "jnx-subsys-private.h"
+
+/**********************************************************************
+ *
+ * JNX CBD FPGA Board insertion/removal handling
+ *
+ **********************************************************************/
+
+void jnx_cbd_fpga_board_insert(struct jnx_cbd_fpga_data *fdata,
+			       int slot, int chan)
+{
+	int mindex = chan / 64;
+	int mchan = chan % 64;
+
+	if (WARN(chan >= ARRAY_SIZE(fdata->client), "bad chan=%d\n", chan))
+		return;
+	fdata->client[chan] =
+	  jnx_board_inserted(fdata->mux[chan], slot,
+			     fdata->cfinfo->cpld_mux_bitmask[mindex] &
+			       BIT_ULL(mchan));
+}
+EXPORT_SYMBOL(jnx_cbd_fpga_board_insert);
+
+void jnx_cbd_fpga_board_remove(struct jnx_cbd_fpga_data *fdata, int chan)
+{
+	jnx_board_removed(fdata->mux[chan], fdata->client[chan]);
+	fdata->client[chan] = NULL;
+}
+EXPORT_SYMBOL(jnx_cbd_fpga_board_remove);
+
+static void jnx_cbd_fpga_board_remove_all(struct jnx_cbd_fpga_data *fdata)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(fdata->client); i++)
+		jnx_cbd_fpga_board_remove(fdata, i);
+}
+
+/**********************************************************************
+ *
+ * JNX CBD FPGA Mastership attribute support
+ *
+ ***********************************************************************/
+#define JNX_MSTR_CFG_REG		0x003C
+#define JNX_MSTR_ALIVE_REG		0x0040
+#define JNX_MSTR_ALIVE_CNT_REG		0x0044
+
+#define JNX_MSTR_BOOTED			BIT(0)
+#define JNX_MSTR_RELINQUISH		BIT(1)
+#define JNX_MSTR_IM_RDY			BIT(3)
+#define JNX_MSTR_IM_MASTER		BIT(4)
+#define JNX_MSTR_HE_RDY			BIT(5)
+#define JNX_MSTR_HE_MASTER		BIT(6)
+
+#define JNX_MSTR	(JNX_MSTR_BOOTED | JNX_MSTR_IM_RDY | JNX_MSTR_IM_MASTER)
+#define JNX_ANY_MSTR	(JNX_MSTR_IM_MASTER | JNX_MSTR_HE_MASTER)
+#define JNX_HE_MSTR	(JNX_MSTR_HE_RDY | JNX_MSTR_HE_MASTER)
+
+#define MSTR_ALIVE_CNT			0x01FF
+#define JNX_MSTR_ALIVE			0x0001
+
+#define JNX_MSTR_REFRESH_TIMEOUT	21
+#define JNX_MAX_MSTR_ALIVE_CNT		0xFF
+
+static bool jnx_cbd_fpga_am_master(struct jnx_cbd_fpga_data *fdata)
+{
+	u32 mstr_cfg = ioread32(fdata->region0 + JNX_MSTR_CFG_REG);
+
+	return (mstr_cfg & JNX_MSTR) == JNX_MSTR;
+}
+
+static bool jnx_cbd_fpga_he_master(struct jnx_cbd_fpga_data *fdata)
+{
+	u32 mstr_cfg = ioread32(fdata->region0 + JNX_MSTR_CFG_REG);
+
+	return (mstr_cfg & JNX_HE_MSTR) == JNX_HE_MSTR;
+}
+
+static bool jnx_cbd_fpga_become_master(struct jnx_cbd_fpga_data *fdata)
+{
+	bool am_master;
+	int  i;
+
+	iowrite32(JNX_MSTR_REFRESH_TIMEOUT | (1 << 8),
+		  fdata->region0 + JNX_MSTR_ALIVE_CNT_REG);
+	iowrite32(1, fdata->region0 + JNX_MSTR_ALIVE_REG);
+	iowrite32(JNX_MSTR_BOOTED, fdata->region0 + JNX_MSTR_CFG_REG);
+
+	for (i = 0; i < 20; i++) {
+		am_master = jnx_cbd_fpga_am_master(fdata);
+		if (am_master)
+			break;
+		usleep_range(10, 20);
+	}
+
+	if (am_master && !fdata->dt_enabled)	/* FIXME dt_enabled is odd */
+		queue_delayed_work(fdata->workqueue, &fdata->work, 0);
+
+	return am_master;
+}
+
+static void jnx_cbd_fpga_relinquish_master(struct jnx_cbd_fpga_data *fdata)
+{
+	u32 mstr_cfg;
+	int i;
+
+	cancel_delayed_work_sync(&fdata->work);
+
+	jnx_cbd_fpga_board_remove_all(fdata);
+
+	mstr_cfg = ioread32(fdata->region0 + JNX_MSTR_CFG_REG);
+	mstr_cfg &= ~JNX_MSTR_BOOTED;
+	iowrite32(mstr_cfg, fdata->region0 + JNX_MSTR_CFG_REG);
+
+	for (i = 0; i < ARRAY_SIZE(fdata->prev_ch_prs); i++)
+		fdata->prev_ch_prs[i] = 0;
+}
+
+int jnx_cbd_fpga_get_master(void *data)
+{
+	struct jnx_cbd_fpga_data *fdata = data;
+
+	if (jnx_cbd_fpga_am_master(fdata))
+		return fdata->slot;
+
+	if (jnx_cbd_fpga_he_master(fdata))
+		return fdata->slot ^ 1;
+
+	return -1;
+}
+EXPORT_SYMBOL(jnx_cbd_fpga_get_master);
+
+bool jnx_cbd_fpga_mastership_get(void *data)
+{
+	struct jnx_cbd_fpga_data *fdata = data;
+
+	return jnx_cbd_fpga_am_master(fdata);
+}
+EXPORT_SYMBOL(jnx_cbd_fpga_mastership_get);
+
+void jnx_cbd_fpga_mastership_set(void *data, bool master)
+{
+	struct jnx_cbd_fpga_data *fdata = data;
+
+	mutex_lock(&fdata->lock);
+	if (jnx_cbd_fpga_am_master(fdata)) {
+		if (!master)
+			jnx_cbd_fpga_relinquish_master(fdata);
+	} else {
+		if (master)
+			jnx_cbd_fpga_become_master(fdata);
+	}
+	mutex_unlock(&fdata->lock);
+}
+EXPORT_SYMBOL(jnx_cbd_fpga_mastership_set);
+
+void jnx_cbd_fpga_mastership_ping(void *data)
+{
+	struct jnx_cbd_fpga_data *fdata = data;
+
+	iowrite32(1, fdata->region0 + JNX_MSTR_ALIVE_REG);
+}
+EXPORT_SYMBOL(jnx_cbd_fpga_mastership_ping);
+
+int jnx_cbd_fpga_mastership_count_get(void *data)
+{
+	struct jnx_cbd_fpga_data *fdata = data;
+
+	return ioread32(fdata->region0 + JNX_MSTR_ALIVE_CNT_REG) &
+		JNX_MAX_MSTR_ALIVE_CNT;
+}
+EXPORT_SYMBOL(jnx_cbd_fpga_mastership_count_get);
+
+int jnx_cbd_fpga_mastership_count_set(void *data, int val)
+{
+	struct jnx_cbd_fpga_data *fdata = data;
+
+	if (val < 0 || val > JNX_MAX_MSTR_ALIVE_CNT)
+		return -EINVAL;
+
+	iowrite32(val | (1 << 8), fdata->region0 + JNX_MSTR_ALIVE_CNT_REG);
+
+	return 0;
+}
+EXPORT_SYMBOL(jnx_cbd_fpga_mastership_count_set);
+
+#define FPGA_MEM_SIZE		0x1000
+
+static struct jnx_cbd_fpga_data *cbd_sysfs_get_dev_info(struct kobject *kobj)
+{
+	struct platform_device *pdev =
+		to_platform_device(container_of(kobj, struct device, kobj));
+
+	return platform_get_drvdata(pdev);
+}
+
+static int cbd_fpga_validate_access_parameters(loff_t offset, size_t count)
+{
+	/*
+	 * Need to make sure the count is a multiple of JNX_CBD_FPGA_REG_SIZE
+	 * bytes and that the offset plus the number of registers being read
+	 * is less than the size of the fpga.
+	 */
+	if ((count % JNX_CBD_FPGA_REG_SIZE) == 0)
+		if ((offset + (count / JNX_CBD_FPGA_REG_SIZE)) < FPGA_MEM_SIZE)
+			return 0;
+
+	return -EINVAL;
+}
+
+static ssize_t cbd_fpga_read(struct file *filp, struct kobject *kobj,
+			     struct bin_attribute *bin_attr,
+			     char *buffer, loff_t offset, size_t count)
+{
+	struct jnx_cbd_fpga_data *cfpga = cbd_sysfs_get_dev_info(kobj);
+	void __iomem *addr;
+	ssize_t err;
+	int nregs;
+	u32 *buf;
+	int i;
+
+	err = cbd_fpga_validate_access_parameters(offset, count);
+	if (err)
+		return err;
+
+	nregs = count / JNX_CBD_FPGA_REG_SIZE;
+	buf = (u32 *)buffer;
+	addr = cfpga->region0 + offset;
+
+	for (i = 0; i < nregs; i++)
+		buf[i] = ioread32(addr + i * JNX_CBD_FPGA_REG_SIZE);
+
+	return count;
+}
+
+static ssize_t cbd_fpga_write(struct file *filp, struct kobject *kobj,
+			      struct bin_attribute *bin_attr,
+			      char *buffer, loff_t offset, size_t count)
+{
+	struct jnx_cbd_fpga_data *cfpga = cbd_sysfs_get_dev_info(kobj);
+	void __iomem *addr;
+	ssize_t err;
+	int nregs;
+	u32 *buf;
+	int i;
+
+	err = cbd_fpga_validate_access_parameters(offset, count);
+	if (err)
+		return err;
+
+	nregs = count / JNX_CBD_FPGA_REG_SIZE;
+	buf = (u32 *)buffer;
+	addr = cfpga->region0 + offset;
+
+	for (i = 0; i < nregs; i++)
+		iowrite32(buf[i], addr + i * JNX_CBD_FPGA_REG_SIZE);
+
+	return count;
+}
+
+static struct bin_attribute cbd_fpga_attr = {
+	.attr = {
+		.name = "fpga-data",
+		.mode = S_IRUGO | S_IWUSR,
+	},
+
+	.size = FPGA_MEM_SIZE,
+	.read = cbd_fpga_read,
+	.write = cbd_fpga_write,
+};
+
+int jnx_cbd_fpga_sysfs_init(struct device *dev)
+{
+	int err;
+
+	err = sysfs_create_bin_file(&dev->kobj, &cbd_fpga_attr);
+	if (err)
+		return err;
+
+	err = sysfs_create_link(&dev->parent->parent->parent->kobj,
+				&dev->kobj, "cbfpga");
+	if (err)
+		goto err_bin_file;
+	return 0;
+
+err_bin_file:
+	sysfs_remove_bin_file(&dev->kobj, &cbd_fpga_attr);
+	return err;
+}
+EXPORT_SYMBOL(jnx_cbd_fpga_sysfs_init);
+
+void jnx_cbd_fpga_sysfs_remove(struct device *dev)
+{
+	sysfs_remove_link(&dev->parent->parent->parent->kobj,
+			  "cbfpga");
+	sysfs_remove_bin_file(&dev->kobj, &cbd_fpga_attr);
+}
+EXPORT_SYMBOL(jnx_cbd_fpga_sysfs_remove);
diff --git a/drivers/staging/jnx/jnx-cbd-fpga-common.h b/drivers/staging/jnx/jnx-cbd-fpga-common.h
new file mode 100644
index 0000000..9bf4949
--- /dev/null
+++ b/drivers/staging/jnx/jnx-cbd-fpga-common.h
@@ -0,0 +1,27 @@
+/*
+ * jnx-cbd-fpga-common.h
+ *
+ * Copyright (C) 2015 Juniper Networks. All rights reserved.
+ *
+ */
+
+#ifndef JNX_CBD_FPGA_COMMON_H
+#define JNX_CBD_FPGA_COMMON_H
+
+struct jnx_cbd_fpga_data;
+
+void jnx_cbd_fpga_board_insert(struct jnx_cbd_fpga_data *fdata,
+			       int slot, int chan);
+void jnx_cbd_fpga_board_remove(struct jnx_cbd_fpga_data *fdata, int chan);
+
+int jnx_cbd_fpga_get_master(void *data);
+bool jnx_cbd_fpga_mastership_get(void *data);
+void jnx_cbd_fpga_mastership_set(void *data, bool master);
+void jnx_cbd_fpga_mastership_ping(void *data);
+int jnx_cbd_fpga_mastership_count_get(void *data);
+int jnx_cbd_fpga_mastership_count_set(void *data, int val);
+
+int jnx_cbd_fpga_sysfs_init(struct device *dev);
+void jnx_cbd_fpga_sysfs_remove(struct device *dev);
+
+#endif /* JNX_CBD_FPGA_COMMON_H */
diff --git a/drivers/staging/jnx/jnx-cbd-fpga-core.c b/drivers/staging/jnx/jnx-cbd-fpga-core.c
new file mode 100644
index 0000000..b665f46
--- /dev/null
+++ b/drivers/staging/jnx/jnx-cbd-fpga-core.c
@@ -0,0 +1,540 @@
+/*
+ * Juniper Generic Control Board (CB) FPGA Driver
+ *
+ * Copyright (C) 2012, 2013, 2014 Juniper Networks. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/i2c.h>
+#include <linux/i2c-mux.h>
+#include <linux/platform_device.h>
+#include <linux/sysfs.h>
+#include <linux/workqueue.h>
+#include <linux/jnx/jnx-subsys.h>
+#include <linux/jnx/jnx-board-core.h>
+#include <linux/jnx/board_ids.h>
+#include <linux/jnx/pci_ids.h>
+#include <linux/platform_data/i2c-pca-jnx.h>
+#include <linux/of.h>
+#include "jnx-cbd-fpga-core.h"
+#include "jnx-cbd-fpga-common.h"
+#include "jnx-cbd-fpga-platdata.h"
+#include "jnx-subsys-private.h"
+
+#define DRIVER_VERSION  "0.01.0"
+#define DRIVER_DESC     "JNX CB FPGA Driver"
+
+#define JNX_CBD_FPGA_MODULE_NAME	"jnx-cbd-fpga"
+
+static const struct pci_device_id jnx_cbd_fpga_id_table[] = {
+	{PCI_VDEVICE(JUNIPER, JNX_CBD_FPGA_DID_09B3), JNX_CBD_FPGA_PTX5K},
+	{PCI_VDEVICE(JUNIPER, JNX_CBD_FPGA_DID_0BA8), JNX_CBD_FPGA_PTX3K},
+	{0,}
+};
+MODULE_DEVICE_TABLE(pci, jnx_cbd_fpga_id_table);
+
+static const struct jnx_cbd_fpga_info *jnx_cbd_fpga_info_tbl[] = {
+	[JNX_CBD_FPGA_PTX5K] = &jnx_cbd_fpga_ptx5k_info,
+	[JNX_CBD_FPGA_PTX3K] = &jnx_cbd_fpga_ptx3k_info,
+};
+
+/**********************************************************************
+ *
+ * JNX CBD FPGA I2C controller APIs
+ *
+ **********************************************************************/
+#define JNX_CBD_FPGA_WAIT_FOR_IDLE	10000
+
+#define JNX_CBD_FPGA_I2C_CTRL_READ	BIT(0)
+#define JNX_CBD_FPGA_I2C_CTRL_WRITE	0
+#define JNX_CBD_FPGA_I2C_CTRL_START	BIT(1)
+#define JNX_CBD_FPGA_I2C_CTRL_SEL_I2C	BIT(2)
+
+static int jnx_cbd_fpga_i2c_wait_bus_inactive(struct jnx_cbd_fpga_data *fdata)
+{
+	int i = 0;
+
+	while (ioread32(fdata->ctrl_reg) & JNX_CBD_FPGA_I2C_CTRL_START &&
+	       i++ < JNX_CBD_FPGA_WAIT_FOR_IDLE) {
+		udelay(1);
+	}
+
+	if (i >= JNX_CBD_FPGA_WAIT_FOR_IDLE)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static void jnx_cbd_fpga_iowrite32_sync(u32 val, void __iomem *reg)
+{
+	iowrite32(val, reg);
+	ioread32(reg);
+}
+
+static void jnx_cbd_fpga_i2c_writebyte(struct device *dev, int reg, int value)
+{
+	struct jnx_cbd_fpga_data *fdata = dev_get_drvdata(dev);
+	int rc;
+
+	rc = jnx_cbd_fpga_i2c_wait_bus_inactive(fdata);
+	if (rc < 0)
+		return;
+
+	iowrite32(value, fdata->data_reg);
+
+	iowrite32(reg, fdata->addr_reg);
+
+	jnx_cbd_fpga_iowrite32_sync(JNX_CBD_FPGA_I2C_CTRL_SEL_I2C |
+				    JNX_CBD_FPGA_I2C_CTRL_WRITE |
+				    JNX_CBD_FPGA_I2C_CTRL_START,
+				    fdata->ctrl_reg);
+}
+
+static int jnx_cbd_fpga_i2c_readbyte(struct device *dev, int reg)
+{
+	struct jnx_cbd_fpga_data *fdata = dev_get_drvdata(dev);
+	int rc;
+
+	rc = jnx_cbd_fpga_i2c_wait_bus_inactive(fdata);
+	if (rc)
+		return 0;
+
+	iowrite32(reg, fdata->addr_reg);
+
+	iowrite32(JNX_CBD_FPGA_I2C_CTRL_SEL_I2C | JNX_CBD_FPGA_I2C_CTRL_READ |
+		  JNX_CBD_FPGA_I2C_CTRL_START, fdata->ctrl_reg);
+
+	rc = jnx_cbd_fpga_i2c_wait_bus_inactive(fdata);
+	if (rc)
+		return 0;
+
+	return (u8)ioread32(fdata->data_reg);
+}
+
+/**********************************************************************
+ *
+ * End JNX CBD FPGA I2C controller APIs
+ *
+ **********************************************************************/
+
+/**********************************************************************
+ *
+ * JNX CBD FPGA I2C Selector Mux APIs
+ *
+ **********************************************************************/
+
+static int cbd_i2c_select_chan(struct i2c_mux_core *muxc, u32 chan)
+{
+	struct jnx_cbd_fpga_data *fdata = i2c_mux_priv(muxc);
+	u32 select;
+
+	select = ioread32(fdata->select_reg);
+	if (select != chan)
+		jnx_cbd_fpga_iowrite32_sync(chan, fdata->select_reg);
+
+	return 0;
+}
+
+static int cbd_i2c_deselect_chan(struct i2c_mux_core *muxc, u32 chan)
+{
+	struct jnx_cbd_fpga_data *fdata = i2c_mux_priv(muxc);
+
+	return cbd_i2c_select_chan(muxc, fdata->default_chan);
+}
+
+/**********************************************************************
+ * JNX CBD FPGA I2C Selector Mux APIs
+ **********************************************************************/
+
+void jnx_cbd_fpga_ch_prs_handler(struct work_struct *work)
+{
+	struct jnx_cbd_fpga_data *fdata = container_of(to_delayed_work(work),
+						       struct jnx_cbd_fpga_data,
+						       work);
+	const struct jnx_cbd_fpga_info *cfinfo;
+	unsigned long ch_prs, prs_change;
+	int slot, chan;
+	int i, bit;
+
+	cfinfo = fdata->cfinfo;
+
+	mutex_lock(&fdata->lock);
+
+	for (i = 0; i < ARRAY_SIZE(cfinfo->cpld_prs_reg); i++) {
+		if (!cfinfo->cpld_prs_reg[i])
+			continue;
+
+		ch_prs = ioread32(fdata->region0 + cfinfo->cpld_prs_reg[i]);
+		ch_prs |= cfinfo->cpld_prs_set_bitmask[i];
+		if (cfinfo->cpld_prs_bitmask[i])
+			ch_prs &= cfinfo->cpld_prs_bitmask[i];
+		prs_change = ch_prs ^ fdata->prev_ch_prs[i];
+		fdata->prev_ch_prs[i] = ch_prs;
+
+		for_each_set_bit(bit, &prs_change, sizeof(u32) * 8) {
+			chan = cfinfo->get_channel(bit + i * 32);
+			if (chan < 0)
+				continue;
+
+			if (!fdata->mux[chan] && fdata->find_mux_adapter)
+				fdata->mux[chan] =
+					fdata->find_mux_adapter(chan);
+
+			if (!fdata->mux[chan])
+				continue;
+
+			slot = cfinfo->get_slot_from_chan(chan);
+			if (slot < 0)
+				continue;
+
+			pr_info("CBC: presence bit %d -> chan: %d, adap %p\n",
+				bit + i * 32, chan, fdata->mux[chan]);
+
+			if (test_bit(bit, &ch_prs))
+				jnx_cbd_fpga_board_insert(fdata, slot, chan);
+			else
+				jnx_cbd_fpga_board_remove(fdata, chan);
+		}
+	}
+
+	mutex_unlock(&fdata->lock);
+
+	queue_delayed_work(fdata->workqueue, &fdata->work, 10 * HZ);
+}
+EXPORT_SYMBOL(jnx_cbd_fpga_ch_prs_handler);
+
+/**********************************************************************
+ * End JNX CBD FPGA Board insertion/removal handling
+ **********************************************************************/
+
+static void jnx_cbd_fpga_device_reset(void __iomem *reg_addr, u32 mask)
+{
+	u32 device_ctrl = 0;
+
+	device_ctrl = ioread32(reg_addr);
+	device_ctrl |= mask;
+	iowrite32(device_ctrl, reg_addr);
+
+	usleep_range(100, 500);	/* was udelay(100) */
+
+	device_ctrl = ioread32(reg_addr);
+	device_ctrl &= ~mask;
+	iowrite32(device_ctrl, reg_addr);
+}
+
+static int jnx_cbd_fpga_ptx5k_get_master(void *data)
+{
+	struct jnx_cbd_fpga_data *fdata = data;
+	int slot;
+	u32 rev;
+
+	slot = jnx_cbd_fpga_get_master(data);
+	if (slot < 0) {
+		rev = ioread32(fdata->region0 + JNX_CBD_FPGA_REV_REG);
+		if (rev < JNX_CBD_FPGA_REV_GOOD) {
+			WARN_ONCE(1,
+				  "FPGA ver. 0x%x can't support master detect\n",
+				  rev);
+			/*
+			 * We can not determine who is master. It is not us,
+			 * so assume that the other RE is master.
+			 */
+			slot = fdata->slot ^ 1;
+		}
+	}
+
+	return slot;
+}
+
+/*
+ * Check if we're on OF enabled setup. If so, we'll assume that board
+ * insertion/removal is handled by the jnx-connector driver + overlays
+ * and not the jnx-* platform drivers. This allows a temporary workaround
+ * until all the ptx-x86 code is OF capable.
+ */
+static int jnx_connector_present(void)
+{
+	return of_have_populated_dt();
+}
+
+/*
+ * jnx_of_create_device()
+ *	Hack - create the presence driver and associate with dt node
+ *	This vaguely simulates what the mfd_core does.
+ */
+static char * const of_presence_dev_names[] = {
+	"jnx,gpio-cbc-presence",
+	"jnx,gpio-cbc-presence-other",
+};
+
+static struct platform_device *jnx_of_create_device(struct pci_dev *pcidev,
+						    int id, const char *name,
+						    const char *of_compatible)
+{
+	struct device *parent = &pcidev->dev;
+	struct platform_device *pdev = NULL;
+	struct device_node *np = NULL;
+	struct resource res;
+
+	if (!parent->of_node || !of_compatible)
+		return NULL;
+
+	memset(&res, 0, sizeof(res));
+	res.start = pci_resource_start(pcidev, 0);
+	res.end = pci_resource_end(pcidev, 0);
+	res.flags = IORESOURCE_MEM;
+	res.parent = &pcidev->resource[0];
+
+	pdev = platform_device_register_resndata(parent, name, id,
+						 &res, 1, NULL, 0);
+
+	if (IS_ERR(pdev))
+		return NULL;
+
+	for_each_child_of_node(parent->of_node, np) {
+		if (of_device_is_compatible(np, of_compatible)) {
+			pdev->dev.of_node = np;
+			return pdev;
+		}
+	}
+
+	dev_err(parent, "Failed to create %s device\n", of_compatible);
+	/* of_compatible node missing */
+	platform_device_put(pdev);
+
+	return NULL;
+}
+
+static int
+jnx_cbd_fpga_probe(struct pci_dev *pdev, const struct pci_device_id *id)
+{
+	const struct jnx_cbd_fpga_info *cfinfo =
+		jnx_cbd_fpga_info_tbl[id->driver_data];
+	struct jnx_i2c_pca_platform_data idata;
+	struct device *dev = &pdev->dev;
+	struct jnx_cbd_fpga_data *fdata;
+	struct jnx_chassis_info chinfo;
+	struct jnx_card_info cinfo;
+	void __iomem *reset_reg;
+	u32 *bitmasks;
+	u32 ch_prs;
+	int err;
+	int i;
+
+	fdata = devm_kzalloc(dev, sizeof(*fdata), GFP_KERNEL);
+	if (!fdata)
+		return -ENOMEM;
+
+	dev_dbg(dev, "%s.%s(): irq pin %d\n", JNX_CBD_FPGA_MODULE_NAME,
+		__func__, pdev->irq);
+
+	err = pcim_enable_device(pdev);
+	if (err)
+		return err;
+
+	err = pcim_iomap_regions(pdev, 1 << 0, JNX_CBD_FPGA_MODULE_NAME);
+	if (err)
+		return err;
+
+	/*
+	 * Need to remap the io regions for the slow bus registers and
+	 * the i2c select register.  These are needed for the associated
+	 * i2c adapter and mux drivers.
+	 */
+	fdata->region0 = pcim_iomap_table(pdev)[0];
+
+	fdata->cfinfo = cfinfo;
+	fdata->default_chan = cfinfo->i2cmux_default_chan;
+	fdata->mux_channels = cfinfo->mux_channels;
+	if (fdata->mux_channels > JNX_CBD_FPGA_NUM_MUXES)
+		fdata->mux_channels = JNX_CBD_FPGA_NUM_MUXES;
+
+	mutex_init(&fdata->lock);
+
+	/*
+	 * Set up the slow bus address registers
+	 */
+	fdata->addr_reg = fdata->region0 + JNX_CBD_FPGA_SLOW_BUS_REG;
+	fdata->data_reg = fdata->addr_reg + JNX_CBD_FPGA_REG_SIZE;
+	fdata->ctrl_reg = fdata->data_reg + JNX_CBD_FPGA_REG_SIZE;
+
+	fdata->select_reg = fdata->region0 + JNX_CBD_FPGA_I2C_SELECT_REG;
+
+	pci_set_drvdata(pdev, fdata);
+
+	err = jnx_cbd_fpga_sysfs_init(dev);
+	if (err)
+		return err;
+
+	/*
+	 * Run any devices resets that are required before instantiating
+	 * any other devices.
+	 */
+	reset_reg = fdata->region0 + cfinfo->reset->reg_offset;
+	bitmasks = cfinfo->reset->bitmasks;
+	i = 0;
+
+	while (bitmasks[i])
+		jnx_cbd_fpga_device_reset(reset_reg, bitmasks[i++]);
+
+	/*
+	 * Register the chassis with the system so userspace is able to
+	 * determine platform type, etc.
+	 */
+	chinfo.platform = cfinfo->platform;
+	chinfo.chassis_no = 0;
+	chinfo.multichassis = 0;
+	chinfo.master_data = fdata;
+	chinfo.get_master = jnx_cbd_fpga_ptx5k_get_master;
+	chinfo.mastership_get = jnx_cbd_fpga_mastership_get;
+	chinfo.mastership_set = jnx_cbd_fpga_mastership_set;
+	chinfo.mastership_ping = jnx_cbd_fpga_mastership_ping;
+	chinfo.mastership_count_get = jnx_cbd_fpga_mastership_count_get;
+	chinfo.mastership_count_set = jnx_cbd_fpga_mastership_count_set;
+
+	jnx_register_chassis(&chinfo);
+
+	/*
+	 * Register the local card with the system so userspace is able to
+	 * determine board type etc.
+	 */
+	ch_prs = ioread32(fdata->region0 + JNX_CBD_FPGA_CH_PRS_REG);
+
+	fdata->slot = (ch_prs & cfinfo->ch_prs_cb0_bit) ? 0 : 1;
+
+	cinfo.assembly_id = cfinfo->assembly_id;
+	cinfo.slot = fdata->slot;
+	cinfo.type = JNX_BOARD_TYPE_RE;
+	cinfo.adap = NULL;
+
+	jnx_register_local_card(&cinfo);
+
+	/*
+	 * Set up and create the i2c controller
+	 */
+	idata.dev = dev;
+	idata.adap = &fdata->adap;
+	idata.clock = 400000;
+	idata.read_byte = jnx_cbd_fpga_i2c_readbyte;
+	idata.write_byte = jnx_cbd_fpga_i2c_writebyte;
+
+	fdata->i2c_ctlr = platform_device_alloc(cfinfo->i2c_ctlr_name, -1);
+	if (!fdata->i2c_ctlr) {
+		err = -ENOMEM;
+		goto err_unregister;
+	}
+
+	err = platform_device_add_data(fdata->i2c_ctlr, &idata, sizeof(idata));
+	if (err)
+		goto err_pdev;
+
+	err = platform_device_add(fdata->i2c_ctlr);
+	if (err)
+		goto err_pdev;
+
+	/* Now create i2c muxes on top of the i2c adapter */
+	fdata->muxc = i2c_mux_alloc(&fdata->adap, &pdev->dev,
+				    fdata->mux_channels, 0, 0,
+				    cbd_i2c_select_chan,
+				    cbd_i2c_deselect_chan);
+	if (!fdata->muxc) {
+		err = -ENOMEM;
+		goto err_pdev;
+	}
+	fdata->muxc->priv = fdata;
+
+	for (i = 0; i < fdata->mux_channels; i++) {
+		err = i2c_mux_add_adapter(fdata->muxc, 0, i, 0);
+		if (err)
+			goto err_mux;
+	}
+
+	/* The jnx-connector & gpio-cbc-presence will handle the cards */
+	fdata->dt_enabled = jnx_connector_present();
+	if (fdata->dt_enabled) {
+		dev_info(dev, "line cards will handled by the jnx-connector\n");
+		for (i = 0; i < ARRAY_SIZE(fdata->presence_devices); i++) {
+			fdata->presence_devices[i] =
+				jnx_of_create_device(pdev, i,
+						     "gpio-cbc-presence",
+						     of_presence_dev_names[i]);
+			if (!fdata->presence_devices[i])
+				dev_err(dev, "Failed to create %s device\n",
+					of_presence_dev_names[i]);
+		}
+		return 0;
+	}
+
+	fdata->workqueue = create_singlethread_workqueue("jnx-cbd-poller");
+	if (!fdata->workqueue) {
+		err = -ENOMEM;
+		goto err_mux;
+	}
+
+	INIT_DELAYED_WORK(&fdata->work, jnx_cbd_fpga_ch_prs_handler);
+
+	return 0;
+
+err_mux:
+	i2c_mux_del_adapters(fdata->muxc);
+
+err_pdev:
+	platform_device_put(fdata->i2c_ctlr);
+
+err_unregister:
+	jnx_unregister_chassis();
+	jnx_cbd_fpga_sysfs_remove(dev);
+
+	return err;
+}
+
+static void jnx_cbd_fpga_remove(struct pci_dev *pdev)
+{
+	struct jnx_cbd_fpga_data *fdata = pci_get_drvdata(pdev);
+	int i;
+
+	if (!fdata->dt_enabled) {
+		cancel_delayed_work_sync(&fdata->work);
+		flush_workqueue(fdata->workqueue);
+		destroy_workqueue(fdata->workqueue);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(fdata->presence_devices); i++) {
+		if (fdata->presence_devices[i])
+			platform_device_put(fdata->presence_devices[i]);
+	}
+
+	i2c_mux_del_adapters(fdata->muxc);
+	platform_device_put(fdata->i2c_ctlr);
+	jnx_unregister_local_card();
+	jnx_unregister_chassis();
+	jnx_cbd_fpga_sysfs_remove(&pdev->dev);
+}
+
+static struct pci_driver jnx_cbd_fpga_driver = {
+	.name = JNX_CBD_FPGA_MODULE_NAME,
+	.id_table = jnx_cbd_fpga_id_table,
+	.probe = jnx_cbd_fpga_probe,
+	.remove = jnx_cbd_fpga_remove,
+};
+
+module_pci_driver(jnx_cbd_fpga_driver);
+
+MODULE_DESCRIPTION(DRIVER_DESC);
+MODULE_VERSION(DRIVER_VERSION);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/staging/jnx/jnx-cbd-fpga-core.h b/drivers/staging/jnx/jnx-cbd-fpga-core.h
new file mode 100644
index 0000000..ac7a4cf
--- /dev/null
+++ b/drivers/staging/jnx/jnx-cbd-fpga-core.h
@@ -0,0 +1,68 @@
+/*
+ * Juniper Generic Control Board (CB) FPGA Driver
+ *
+ * Copyright (C) 2012, 2013, 2014 Juniper Networks. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#ifndef _JNX_CBD_FPGA_CORE_H
+#define _JNX_CBD_FPGA_CORE_H
+
+#include <linux/bitops.h>
+
+#define JNX_CBD_FPGA_REG_SIZE		4
+
+#define JNX_CBD_FPGA_INTR_SRC		0x0000
+#define JNX_CBD_FPGA_INTR_EN		0x0004
+#define JNX_CBD_FPGA_I2C_SELECT_REG	0x0010
+#define JNX_CBD_FPGA_CH_PRS_REG		0x0014
+#define JNX_CBD_FPGA_SLOW_BUS_REG	0x0054
+#define JNX_CBD_FPGA_REV_REG		0x0060
+#define JNX_CBD_FPGA_DUMMY_READ_REG	0x0064
+#define JNX_CBD_FPGA_CH_OTHER_PRS_REG	0x00D4
+
+#define JNX_CBD_FPGA_REV_GOOD		0x011F
+
+#define JNX_CBD_FPGA_NUM_MUXES		96
+/*
+ * JNX CBD CH Presence definitions
+ */
+#define JNX_CBD_FPGA_CH_PRS_CB0_PIN	BIT(27)
+
+struct jnx_cbd_fpga_data {
+	u32 slot;
+	const struct jnx_cbd_fpga_info *cfinfo;
+	u32 default_chan;
+	u32 prev_ch_prs[4];
+	struct i2c_adapter * (*find_mux_adapter)(int chan);
+	int mux_channels;
+	struct i2c_adapter *mux[JNX_CBD_FPGA_NUM_MUXES];
+	struct i2c_client *client[JNX_CBD_FPGA_NUM_MUXES];
+	struct i2c_mux_core *muxc;
+	bool standalone;
+	int irq;
+	struct i2c_adapter adap;
+	struct mutex lock;			/* safe access lock */
+	struct platform_device *i2c_ctlr;
+	struct workqueue_struct *workqueue;
+	struct delayed_work work;
+	int dt_enabled;
+	struct platform_device *presence_devices[2];
+	void __iomem *region0;
+	void __iomem *addr_reg;
+	void __iomem *data_reg;
+	void __iomem *ctrl_reg;
+	void __iomem *select_reg;
+};
+
+void jnx_cbd_fpga_ch_prs_handler(struct work_struct *work);
+
+#endif /* _JNX_CBD_FPGA_CORE_H */
diff --git a/drivers/staging/jnx/jnx-cbd-fpga-platdata.h b/drivers/staging/jnx/jnx-cbd-fpga-platdata.h
new file mode 100644
index 0000000..a91e38d
--- /dev/null
+++ b/drivers/staging/jnx/jnx-cbd-fpga-platdata.h
@@ -0,0 +1,51 @@
+/*
+ * Juniper CBD FPGA Platform Data
+ *
+ * Copyright (C) 2012, 2013, 2014 Juniper Networks. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#ifndef __JNX_CBD_FPGA_H
+#define __JNX_CBD_FPGA_H
+
+enum jnx_cbd_fpga_boards {
+	JNX_CBD_FPGA_PTX5K,
+	JNX_CBD_FPGA_PTX3K,
+};
+
+struct jnx_cbd_fpga_dev_reset_data {
+	u16 reg_offset;
+	u32 *bitmasks;
+};
+
+struct jnx_cbd_fpga_info {
+	u32 platform;
+	u32 assembly_id;
+	u64 cpld_mux_bitmask[2];
+	u32 cpld_prs_reg[4];
+	u32 cpld_prs_set_bitmask[4];
+	u32 cpld_prs_bitmask[4];
+	u32 ch_prs_cb0_bit;
+	u32 mux_channels;
+	u32 i2cmux_default_chan;
+	const char *i2c_ctlr_name;
+	struct jnx_cbd_fpga_dev_reset_data *reset;
+	int (*get_channel)(u32 bit);
+	int (*get_slot_from_chan)(int chan);
+};
+
+extern struct jnx_cbd_fpga_info jnx_cbd_fpga_ptx5k_info,
+				jnx_cbd_fpga_ptx3k_info,
+				jnx_cbd_fpga_ptx1k_info,
+				jnx_cbd_fpga_ptx1k_p2_info,
+				jnx_cbd_fpga_ptx21k_info;
+
+#endif /* __JNX_CBD_FPGA_H */
diff --git a/drivers/staging/jnx/jnx-cbd-fpga-ptx1k.c b/drivers/staging/jnx/jnx-cbd-fpga-ptx1k.c
new file mode 100644
index 0000000..3314569
--- /dev/null
+++ b/drivers/staging/jnx/jnx-cbd-fpga-ptx1k.c
@@ -0,0 +1,134 @@
+/*
+ * Juniper PTX 1000 Control Board (CB) FPGA
+ *
+ * Copyright (C) 2014 Juniper Networks. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/jnx/jnx-subsys.h>
+#include <linux/jnx/board_ids.h>
+#include "jnx-cbd-fpga-core.h"
+#include "jnx-cbd-fpga-platdata.h"
+#include "jnx-subsys-private.h"
+
+#define JNX_CBD_FPGA_PTX1K_DEVICE_CTRL_REG	0x00C0
+#define JNX_CBD_FPGA_PTX1K_DEFAULT_CHAN		26 /* LOCAL_I2C */
+
+#define JNX_CBD_FPGA_PTX1K_CPLD_MUX		0xFF00 /* FPC[8] 8..15 */
+
+static u32 jnx_cbd_fpga_ptx1k_bitmask[] = { 0 };
+
+/* DEVICE_CTRL is not valid for Polaris */
+static struct jnx_cbd_fpga_dev_reset_data jnx_cbd_fpga_ptx1k_device_reset = {
+	.reg_offset = JNX_CBD_FPGA_PTX1K_DEVICE_CTRL_REG,
+	.bitmasks = jnx_cbd_fpga_ptx1k_bitmask,
+};
+
+/* Table to map from mux channel number to slot */
+
+static s8 ptx1k_mux_slot_map[40] = {
+	-1, -1, -1, -1, -1, -1, -1, -1, /*  0.. 7: Unused + RSVD[2] */
+	0, 1, 2, 3, 4, 5, 6, 7,		/*  8..15: FPC[8] */
+	0, 1, 2, 3, 4, 5,		/* 16..21: SIB[6] */
+	-1, -1, -1,			/* 22..24: Unused */
+	0,				/* 25:	   MP */
+	1,				/* 26:     Local */
+	-1,				/* 27:     Unused */
+	0, 1, 2, 3, 4,			/* 28..32: PSM[5] */
+	-1,				/* 33:     Unused */
+	0,				/* 34:     FT0 */
+	0,				/* 35:     FPD */
+	0, 1,				/* 36..37: CB[2] */
+	-1, -1				/* 38..39: SFPP[2] */
+};
+
+static int jnx_cbd_fpga_ptx1k_get_slot_from_channel(int chan)
+{
+	if (chan < 0 || chan >= ARRAY_SIZE(ptx1k_mux_slot_map) ||
+	    ptx1k_mux_slot_map[chan] < 0)
+		return -EINVAL;
+
+	return ptx1k_mux_slot_map[chan];
+}
+
+/* Table to map from presence bit to mux channel */
+static s8 ptx1k_mux_channel_map[64] = {
+	8, 9, 10, 11, 12, 13, 14, 15,	/* CH_PRS FPC[7:0] */
+	-1, -1, -1, -1, -1, -1, -1, -1,	/* CH_PRS Reserved [15:8] */
+	34,				/* CH_PRS FT[16] */
+	-1, -1, -1, -1,			/* CH_PRS Reserved [20:17] */
+	36, 37,				/* CH_PRS CB[22:21] */
+	35,				/* CH_PRS FPD[23] */
+	-1, -1, -1, -1, -1, -1,		/* CH_PRS Reserved[29:24] */
+	25,				/* CH_PRS MP[30] */
+	-1,				/* CH_PRS Reserved[31]*/
+	28, 29, 30, 31, 32,		/* OTHER_CH_PRS PSM[4:0] */
+	16, 17, 18, 19, 20, 21,		/* OTHER_CH_PRS SIB[10:5] */
+	-1, -1, -1, -1, -1, -1, -1, -1,
+	-1, -1, -1, -1, -1, -1, -1, -1,
+	-1, -1, -1, -1, -1		/* OTHER_CH_PRS Reserved[31:11] */
+};
+
+static int jnx_cbd_fpga_ptx1k_get_channel(u32 bit)
+{
+	if (bit > 63 || ptx1k_mux_channel_map[bit] < 0)
+		return -EINVAL;
+
+	return ptx1k_mux_channel_map[bit];
+}
+
+struct jnx_cbd_fpga_info jnx_cbd_fpga_ptx1k_info = {
+	.platform = JNX_PRODUCT_POLARIS,
+	.assembly_id = JNX_ID_POLARIS_RCB,
+	.cpld_mux_bitmask = {
+		JNX_CBD_FPGA_PTX1K_CPLD_MUX,
+	},
+	.cpld_prs_set_bitmask = {
+		BIT(30),	/* MP */
+	},
+	.cpld_prs_reg = {
+		JNX_CBD_FPGA_CH_PRS_REG,
+		JNX_CBD_FPGA_CH_OTHER_PRS_REG,
+	},
+	.ch_prs_cb0_bit = JNX_CBD_FPGA_CH_PRS_CB0_PIN,
+	.mux_channels = ARRAY_SIZE(ptx1k_mux_slot_map),
+	.i2cmux_default_chan = JNX_CBD_FPGA_PTX1K_DEFAULT_CHAN,
+	.i2c_ctlr_name = "",
+	.reset = &jnx_cbd_fpga_ptx1k_device_reset,
+	.get_channel = jnx_cbd_fpga_ptx1k_get_channel,
+	.get_slot_from_chan = jnx_cbd_fpga_ptx1k_get_slot_from_channel,
+};
+
+struct jnx_cbd_fpga_info jnx_cbd_fpga_ptx1k_p2_info = {
+	.platform = JNX_PRODUCT_POLARIS,
+	.assembly_id = JNX_ID_POLARIS_RCB_P2,
+	.cpld_mux_bitmask = {
+		JNX_CBD_FPGA_PTX1K_CPLD_MUX,
+	},
+	.cpld_prs_set_bitmask = {
+		BIT(30),	/* MP */
+	},
+	.cpld_prs_reg = {
+		JNX_CBD_FPGA_CH_PRS_REG,
+		JNX_CBD_FPGA_CH_OTHER_PRS_REG,
+	},
+	.ch_prs_cb0_bit = JNX_CBD_FPGA_CH_PRS_CB0_PIN,
+	.mux_channels = ARRAY_SIZE(ptx1k_mux_slot_map),
+	.i2cmux_default_chan = JNX_CBD_FPGA_PTX1K_DEFAULT_CHAN,
+	.i2c_ctlr_name = "",
+	.reset = &jnx_cbd_fpga_ptx1k_device_reset,
+	.get_channel = jnx_cbd_fpga_ptx1k_get_channel,
+	.get_slot_from_chan = jnx_cbd_fpga_ptx1k_get_slot_from_channel,
+};
diff --git a/drivers/staging/jnx/jnx-cbd-fpga-ptx21k.c b/drivers/staging/jnx/jnx-cbd-fpga-ptx21k.c
new file mode 100644
index 0000000..d9a4227
--- /dev/null
+++ b/drivers/staging/jnx/jnx-cbd-fpga-ptx21k.c
@@ -0,0 +1,143 @@
+/*
+ * Juniper PTX 21000 Control Board (CB) FPGA
+ *
+ * Copyright (C) 2014 Juniper Networks. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/jnx/jnx-subsys.h>
+#include <linux/jnx/board_ids.h>
+#include <linux/bitops.h>
+
+#include "jnx-cbd-fpga-platdata.h"
+#include "jnx-cbd-fpga-core.h"
+#include "jnx-subsys-private.h"
+
+#define JNX_CBD_FPGA_PTX21K_DEVICE_CTRL_REG	0x00C0
+#define JNX_CBD_FPGA_PTX21K_DEFAULT_CHAN	57 /* LOCAL_I2C */
+
+#define JNX_CBD_FPGA_PTX21K_CPLD_MUX		0x00000000
+#define JNX_CBD_FPGA_PTX21K_CPLD_MUX_HI		0x00000000
+
+/* PTX21k has a different bit for the CB slot */
+#define JNX_CBD_FPGA_21K_CH_PRS_CB0_PIN		BIT(30)
+
+#define JNX_CBD_FPGA_21K_CH_PRS_SIB_REG		0x0028
+#define JNX_CBD_FPGA_21K_CH_PRS_SIB_MASK	0x1ff
+
+static u32 jnx_cbd_fpga_ptx21k_bitmask[] = { 0 };
+
+static struct jnx_cbd_fpga_dev_reset_data jnx_cbd_fpga_ptx21k_device_reset = {
+	.reg_offset = JNX_CBD_FPGA_PTX21K_DEVICE_CTRL_REG,
+	.bitmasks = jnx_cbd_fpga_ptx21k_bitmask,
+};
+
+/* Table to map from mux channel number to slot */
+
+static s8 ptx21k_mux_slot_map[72] = {
+	0, 1, 2, 3,			/* 0..3: FPC */
+	4, 5, 6, 7,			/* 4..7: FPC */
+	8, 9, 10, 11,			/* 8..11: FPC */
+	12, 13, 14, 15,			/* 12..15: FPC */
+	16, 17, 18, 19,			/* 16..19: FPC */
+	0, 1, 2, 3,			/* 20..23: PSM */
+	4, 5, 6, 7,			/* 24..27: PSM */
+	8, 9, 10, 11,			/* 28..31: PSM */
+	12, 13, 14, 15,			/* 32..35: PSM */
+	16, 17, 18, 19,			/* 36..39: PSM */
+	20, 21, 22, 23,			/* 40..43: PSM */
+	0, 1, 2, 3, 4, 5,		/* 44..49: FT */
+	0, 1,				/* 50..51: CB */
+	0, 1, 2, 3, 4,			/* 52..56: BP */
+	0,				/* 57:     Local */
+	-1,				/* 58:     QSFP */
+	0,				/* 59:     FPD */
+	0, 1, 2, 3, 4,			/* 60 ..64: SIB */
+	5, 6, 7, 8,			/* 65 ..68: SIB */
+	0,				/* 69:     CB PCIeSW */
+};
+
+static int jnx_cbd_fpga_ptx21k_get_slot_from_channel(int chan)
+{
+	if (chan < 0 || chan >= ARRAY_SIZE(ptx21k_mux_slot_map) ||
+	    ptx21k_mux_slot_map[chan] < 0)
+		return -EINVAL;
+
+	return ptx21k_mux_slot_map[chan];
+}
+
+static s8 ptx21k_mux_channel_map[96] = {
+	0, 1, 2, 3, 4, 5, 6, 7,		/* CH_PRS[7:0]   = FPC[7:0] */
+	8, 9, 10, 11, 12, 13, 14, 15,	/* CH_PRS[15:8]  = FPC[15:8] */
+	16, 17, 18, 19,			/* CH_PRS[19:16] = FPC[19:16] */
+	44, 45, 46, 47,			/* CH_PRS[23:20] = FT[3:0] */
+	50, 51,				/* CH_PRS[25:24] = CB[0:1] */
+	59,				/* CH_PRS[26]    = FPD */
+	-1, -1, -1, -1,			/* CH_PRS[30:27] = Reserved */
+	-1,				/* CH_PRS MP[31] There are 5 MPs*/
+	20, 21, 22, 23, 24, 25, 26, 27,	/* OTHER_CH_PRS[7:0]   = PSM[7:0] */
+	28, 29, 30, 31, 32, 33, 34, 35,	/* OTHER_CH_PRS[15:8]  = PSM[15:8] */
+	36, 37, 38, 39, 40, 41, 42, 43,	/* OTHER_CH_PRS[23:15] = PSM[23:15] */
+	48, 49,				/* OTHER_CH_PRS[25:24] = FT[5:4] */
+	-1, -1, -1, -1, -1, -1,		/* OTHER_CH_PRS[31:26]  QSFP, SFP */
+	60, 61, 62, 63, 64, 65, 66, 67, 68,	/* CH_PRS_SIB[8:0] = SIB[8:0] */
+	-1, -1, -1, -1, -1, -1, -1, -1,	/* CH_PRS_SIB[16:9] = NA */
+	-1, -1, -1, -1, -1, -1, -1, -1,	/* CH_PRS_SIB[17:24] = NA */
+	-1, -1, -1, -1, -1, -1, -1	/* CH_PRS_SIB[25:31] = NA */
+};
+
+static int jnx_cbd_fpga_ptx21k_get_channel(u32 bit)
+{
+	if (bit >= ARRAY_SIZE(ptx21k_mux_channel_map) ||
+	    ptx21k_mux_channel_map[bit] < 0)
+		return -EINVAL;
+
+	return ptx21k_mux_channel_map[bit];
+}
+
+struct jnx_cbd_fpga_info jnx_cbd_fpga_ptx21k_info = {
+	.platform = JNX_PRODUCT_OMEGA,
+	.assembly_id = JNX_ID_OMEGA_RCB,
+	.cpld_mux_bitmask = {
+		JNX_CBD_FPGA_PTX21K_CPLD_MUX,
+		JNX_CBD_FPGA_PTX21K_CPLD_MUX_HI,
+	},
+	.ch_prs_cb0_bit = JNX_CBD_FPGA_21K_CH_PRS_CB0_PIN,
+	.cpld_prs_set_bitmask = {
+		BIT(31),	/* MP */
+	},
+	.cpld_prs_reg = {
+		JNX_CBD_FPGA_CH_PRS_REG,
+		JNX_CBD_FPGA_CH_OTHER_PRS_REG,
+		JNX_CBD_FPGA_21K_CH_PRS_SIB_REG,
+		0
+	},
+	.cpld_prs_bitmask = {
+		0,
+		0,
+		JNX_CBD_FPGA_21K_CH_PRS_SIB_MASK,
+		0
+	},
+	.mux_channels = ARRAY_SIZE(ptx21k_mux_slot_map),
+	.i2cmux_default_chan = JNX_CBD_FPGA_PTX21K_DEFAULT_CHAN,
+	.i2c_ctlr_name = "",
+	.reset = &jnx_cbd_fpga_ptx21k_device_reset,
+	.get_channel = jnx_cbd_fpga_ptx21k_get_channel,
+	.get_slot_from_chan = jnx_cbd_fpga_ptx21k_get_slot_from_channel,
+};
+EXPORT_SYMBOL_GPL(jnx_cbd_fpga_ptx21k_info);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/staging/jnx/jnx-cbd-fpga-ptx3k.c b/drivers/staging/jnx/jnx-cbd-fpga-ptx3k.c
new file mode 100644
index 0000000..ad575c0
--- /dev/null
+++ b/drivers/staging/jnx/jnx-cbd-fpga-ptx3k.c
@@ -0,0 +1,111 @@
+/*
+ * Juniper PTX 3000 Control Board (CB) FPGA
+ *
+ * Copyright (C) 2014 Juniper Networks. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/jnx/jnx-subsys.h>
+#include <linux/jnx/board_ids.h>
+#include <linux/platform_data/i2c-pca-jnx.h>
+#include "jnx-cbd-fpga-core.h"
+#include "jnx-cbd-fpga-platdata.h"
+#include "jnx-subsys-private.h"
+
+#define JNX_CBD_FPGA_PTX3K_DEVICE_CTRL_REG	0x00C0
+#define JNX_CBD_FPGA_PTX3K_I2C_CTRL_RESET	BIT(24)
+#define JNX_CBD_FPGA_PTX3K_DEFAULT_CHAN		0x10
+
+#define JNX_CBD_FPGA_PTX3K_CPLD_MUX		0xFF
+
+static u32 jnx_cbd_fpga_ptx3k_bitmask[] = {
+	JNX_CBD_FPGA_PTX3K_I2C_CTRL_RESET,
+	0
+};
+
+static struct jnx_cbd_fpga_dev_reset_data jnx_cbd_fpga_ptx3k_device_reset = {
+	.reg_offset = JNX_CBD_FPGA_PTX3K_DEVICE_CTRL_REG,
+	.bitmasks = jnx_cbd_fpga_ptx3k_bitmask,
+};
+
+/* Table to map from mux channel number to slot */
+
+static s8 ptx3k_mux_slot_map[42] = {
+	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,	/* FPC */
+	1,						/* 0x10, local */
+	0, 1,						/* 0x11, CB */
+	-1, -1,
+	0,						/* 0x15, FPD */
+	0,						/* 0x16, MP */
+	0, 1,						/* 0x17, fans */
+	-1, -1, -1,
+	0, 1, 2, 3, 4,					/* 0x1c, PSM */
+	0, 1, 2, 3, 4, 5, 6, 7, 8,			/* 0x21, SIB */
+};
+
+static int jnx_cbd_fpga_ptx3k_get_slot_from_channel(int chan)
+{
+	if (chan < 0 || chan >= ARRAY_SIZE(ptx3k_mux_slot_map) ||
+	    ptx3k_mux_slot_map[chan] < 0)
+		return -EINVAL;
+
+	return ptx3k_mux_slot_map[chan];
+}
+
+/* Table to map from presence bit to mux channel */
+static s8 ptx3k_mux_channel_map[64] = {
+	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,	/* FPC */
+	0x17, 0x18,						/* fans */
+	-1, -1, -1,
+	0x11, 0x12,						/* CB */
+	0x15,							/* FPD */
+	-1, -1, -1, -1, -1, -1,
+	0x16,							/* MP */
+	-1,
+	0x1c, 0x1d, 0x1e, 0x1f, 0x20,				/* PSM */
+	0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29,	/* SIB */
+	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+	-1, -1, -1, -1, -1, -1,
+};
+
+static int jnx_cbd_fpga_ptx3k_get_channel(u32 bit)
+{
+	if (bit > 63 || ptx3k_mux_channel_map[bit] < 0)
+		return -EINVAL;
+
+	return ptx3k_mux_channel_map[bit];
+}
+
+struct jnx_cbd_fpga_info jnx_cbd_fpga_ptx3k_info = {
+	.platform = JNX_PRODUCT_HENDRICKS,
+	.assembly_id = JNX_ID_HENDRICKS_CB,
+	.cpld_mux_bitmask = {
+		JNX_CBD_FPGA_PTX3K_CPLD_MUX,
+	},
+	.cpld_prs_set_bitmask = {
+		BIT(30),
+	},
+	.cpld_prs_reg = {
+		JNX_CBD_FPGA_CH_PRS_REG,
+		JNX_CBD_FPGA_CH_OTHER_PRS_REG,
+	},
+	.ch_prs_cb0_bit = JNX_CBD_FPGA_CH_PRS_CB0_PIN,
+	.mux_channels = 42,
+	.i2cmux_default_chan = JNX_CBD_FPGA_PTX3K_DEFAULT_CHAN,
+	.i2c_ctlr_name = I2C_PCA_JNX_CTLR_NAME,
+	.reset = &jnx_cbd_fpga_ptx3k_device_reset,
+	.get_channel = jnx_cbd_fpga_ptx3k_get_channel,
+	.get_slot_from_chan = jnx_cbd_fpga_ptx3k_get_slot_from_channel,
+};
diff --git a/drivers/staging/jnx/jnx-cbd-fpga-ptx5k.c b/drivers/staging/jnx/jnx-cbd-fpga-ptx5k.c
new file mode 100644
index 0000000..11adc8f
--- /dev/null
+++ b/drivers/staging/jnx/jnx-cbd-fpga-ptx5k.c
@@ -0,0 +1,107 @@
+/*
+ * Juniper PTX 5000 Control Board (CB) FPGA
+ *
+ * Copyright (C) 2012, 2013, 2014 Juniper Networks. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/bitops.h>
+#include <linux/device.h>
+#include <linux/i2c.h>
+#include <linux/jnx/board_ids.h>
+#include <linux/jnx/jnx-subsys.h>
+#include <linux/platform_data/i2c-pca-jnx.h>
+#include "jnx-cbd-fpga-core.h"
+#include "jnx-cbd-fpga-platdata.h"
+#include "jnx-subsys-private.h"
+
+#define JNX_CBD_FPGA_PTX5K_DEVICE_CTRL_REG	0x00C0
+#define JNX_CBD_FPGA_PTX5K_I2C_CTRL_RESET	BIT(24)
+#define JNX_CBD_FPGA_PTX5K_DEFAULT_CHAN		0x10
+
+#define JNX_CBD_FPGA_PTX5K_CPLD_MUX		0xFF
+
+static u32 jnx_cbd_fpga_ptx5k_bitmask[] = {
+	JNX_CBD_FPGA_PTX5K_I2C_CTRL_RESET,
+	0
+};
+
+static struct jnx_cbd_fpga_dev_reset_data jnx_cbd_fpga_ptx5k_device_reset = {
+	.reg_offset = JNX_CBD_FPGA_PTX5K_DEVICE_CTRL_REG,
+	.bitmasks = jnx_cbd_fpga_ptx5k_bitmask,
+};
+
+/* Table to map from mux channel number to slot */
+
+static s8 mux_slot_map[30] = {
+	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,	/* FPC */
+	1,						/* 0x10, local */
+	0, 1,						/* 0x11, CB */
+	0, 1,						/* 0x13, CCG */
+	0,						/* 0x15, FPD */
+	0,						/* 0x16, MP */
+	0, 1, 2, 3, 4,					/* 0x17, fans */
+	0, 1,						/* 0x1c, PDU */
+};
+
+static int jnx_cbd_fpga_ptx5k_get_slot_from_channel(int chan)
+{
+	if (chan < 0 || chan >= ARRAY_SIZE(mux_slot_map))
+		return -EINVAL;
+
+	return mux_slot_map[chan];
+}
+
+/* Table to map from presence bit to mux channel */
+static s8 mux_channel_map[64] = {
+	0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,	/* FPC */
+	0x17, 0x18, 0x19, 0x1a, 0x1b,				/* fans */
+	0x11, 0x12,						/* CB */
+	0x15,							/* FPD */
+	-1, -1, -1, -1,
+	0x13, 0x14,						/* CCG */
+	0x16,							/* MP */
+	-1,
+	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+	0x1c, 0x1d,						/* PDU */
+	-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1,
+};
+
+static int jnx_cbd_fpga_ptx5k_get_channel(u32 bit)
+{
+	if (bit > 63)
+		return -EINVAL;
+
+	return mux_channel_map[bit];
+}
+
+struct jnx_cbd_fpga_info jnx_cbd_fpga_ptx5k_info = {
+	.platform = JNX_PRODUCT_SANGRIA,
+	.assembly_id = JNX_ID_SNG_CB,
+	.cpld_mux_bitmask = {
+		JNX_CBD_FPGA_PTX5K_CPLD_MUX,
+	},
+	.cpld_prs_set_bitmask = {
+		BIT(30),
+	},
+	.cpld_prs_reg = {
+		JNX_CBD_FPGA_CH_PRS_REG,
+		JNX_CBD_FPGA_CH_OTHER_PRS_REG,
+	},
+	.ch_prs_cb0_bit = JNX_CBD_FPGA_CH_PRS_CB0_PIN,
+	.mux_channels = 30,
+	.i2cmux_default_chan = JNX_CBD_FPGA_PTX5K_DEFAULT_CHAN,
+	.i2c_ctlr_name = I2C_PCA_JNX_CTLR_NAME,
+	.reset = &jnx_cbd_fpga_ptx5k_device_reset,
+	.get_channel = jnx_cbd_fpga_ptx5k_get_channel,
+	.get_slot_from_chan = jnx_cbd_fpga_ptx5k_get_slot_from_channel,
+};
-- 
1.9.1
