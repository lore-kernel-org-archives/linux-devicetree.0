Return-Path: <SRS0=DeSZ=NL=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:51631 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729828AbeKADKR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 31 Oct 2018 23:10:17 -0400
From: Liming Sun <lsun@mellanox.com>
Subject: [PATCH v5 5/5] soc: mellanox: Add host side drivers to support Mellanox BlueField SoCs.
Date: Wed, 31 Oct 2018 14:09:57 -0400
Message-Id: <1541009397-76223-5-git-send-email-lsun@mellanox.com>
In-Reply-To: <1541009397-76223-1-git-send-email-lsun@mellanox.com>
References: <1541009397-76223-1-git-send-email-lsun@mellanox.com>
In-Reply-To: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
References: <b143b40446c1870fb8d422b364ead95d54552be9.1527264077.git.lsun@mellanox.com>
Sender: devicetree-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, David Woods <dwoods@mellanox.com>, Robin Murphy <robin.murphy@arm.com>, arm-soc <arm@kernel.org>
Cc: Liming Sun <lsun@mellanox.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-ID: <devicetree@vger.kernel.org>

An external host can connect to a Mellanox BlueField SoC using an
interface called the Rshim.  The rshim driver provides console,
networking and boot services over this interface.  There are three
possible transports for connecting a host to the rshim and there is
a back-end driver for each of them.

  rshim_usb - connection via a USB port.

  rshim_pcie - connections via PCI express, this is used for boards
               in a PCIe form-factor.

  rshim_pcie_lf - connectsion via PCI express when the device is
                  in "livefish" mode where FW is not loaded yet.

Reviewed-by: David Woods <dwoods@mellanox.com>
Signed-off-by: Liming Sun <lsun@mellanox.com>
---
 drivers/soc/mellanox/Kconfig              |    8 +
 drivers/soc/mellanox/Makefile             |    1 +
 drivers/soc/mellanox/host/Makefile        |    2 +
 drivers/soc/mellanox/host/rshim.c         | 2673 +++++++++++++++++++++++++++++
 drivers/soc/mellanox/host/rshim.h         |  361 ++++
 drivers/soc/mellanox/host/rshim_net.c     |  834 +++++++++
 drivers/soc/mellanox/host/rshim_pcie.c    |  478 ++++++
 drivers/soc/mellanox/host/rshim_pcie_lf.c |  695 ++++++++
 drivers/soc/mellanox/host/rshim_regs.h    |  163 ++
 drivers/soc/mellanox/host/rshim_usb.c     | 1035 +++++++++++
 10 files changed, 6250 insertions(+)
 create mode 100644 drivers/soc/mellanox/host/Makefile
 create mode 100644 drivers/soc/mellanox/host/rshim.c
 create mode 100644 drivers/soc/mellanox/host/rshim.h
 create mode 100644 drivers/soc/mellanox/host/rshim_net.c
 create mode 100644 drivers/soc/mellanox/host/rshim_pcie.c
 create mode 100644 drivers/soc/mellanox/host/rshim_pcie_lf.c
 create mode 100644 drivers/soc/mellanox/host/rshim_regs.h
 create mode 100644 drivers/soc/mellanox/host/rshim_usb.c

diff --git a/drivers/soc/mellanox/Kconfig b/drivers/soc/mellanox/Kconfig
index d88efa1..ecd83a4 100644
--- a/drivers/soc/mellanox/Kconfig
+++ b/drivers/soc/mellanox/Kconfig
@@ -16,3 +16,11 @@ config MLNX_BLUEFIELD_TMFIFO
 	  the implementation of a console and network driver.
 
 endif # ARCH_MLNX_BLUEFIELD
+
+config MLNX_BLUEFIELD_HOST
+	tristate "Mellnox BlueField host side drivers"
+	help
+	  If you say yes to this option, then support will be added
+	  for control and communication of Mellanox BlueField SoCs
+	  from an external host via USB or PCI-express.
+
diff --git a/drivers/soc/mellanox/Makefile b/drivers/soc/mellanox/Makefile
index c44c0e2..aaaf2be 100644
--- a/drivers/soc/mellanox/Makefile
+++ b/drivers/soc/mellanox/Makefile
@@ -3,3 +3,4 @@
 # Makefile for Mellanox SoC drivers.
 #
 obj-$(CONFIG_MLNX_BLUEFIELD_TMFIFO)	+= tmfifo.o
+obj-$(CONFIG_MLNX_BLUEFIELD_HOST)	+= host/
diff --git a/drivers/soc/mellanox/host/Makefile b/drivers/soc/mellanox/host/Makefile
new file mode 100644
index 0000000..79a1c86
--- /dev/null
+++ b/drivers/soc/mellanox/host/Makefile
@@ -0,0 +1,2 @@
+obj-m := rshim.o rshim_net.o rshim_usb.o rshim_pcie.o rshim_pcie_lf.o
+
diff --git a/drivers/soc/mellanox/host/rshim.c b/drivers/soc/mellanox/host/rshim.c
new file mode 100644
index 0000000..32f1124
--- /dev/null
+++ b/drivers/soc/mellanox/host/rshim.c
@@ -0,0 +1,2673 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rshim_common.c - Mellanox host-side driver for RShim
+ *
+ * Copyright 2017 Mellanox Technologies. All Rights Reserved.
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful, but
+ *   WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
+ *   NON INFRINGEMENT.	See the GNU General Public License for more details.
+ */
+
+#include <linux/kernel.h>
+#include <linux/fs.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kref.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/poll.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/version.h>
+#include <linux/uaccess.h>
+#include <linux/ioctl.h>
+#include <linux/termios.h>
+#include <linux/workqueue.h>
+#include <linux/sched.h>
+#include <asm/termbits.h>
+#include <linux/circ_buf.h>
+#include <linux/delay.h>
+#include <linux/virtio_ids.h>
+
+#include "rshim.h"
+
+/* Maximum number of devices controlled by this driver. */
+int rshim_nr_devs = 64;
+module_param(rshim_nr_devs, int, 0444);
+MODULE_PARM_DESC(rshim_nr_devs, "Maximum number of supported devices");
+
+static char *backend_driver = "";
+module_param(backend_driver, charp, 0444);
+MODULE_PARM_DESC(backend_driver, "Rshim backend driver to use");
+
+static int rshim_keepalive_period = 300;
+module_param(rshim_keepalive_period, int, 0644);
+MODULE_PARM_DESC(rshim_keepalive_period, "keepalive period in milliseconds");
+
+#define RSH_KEEPALIVE_MAGIC_NUM 0x5089836482ULL
+
+/* Circular buffer macros. */
+
+#define read_empty(bd, chan) \
+	(CIRC_CNT((bd)->read_fifo[chan].head, \
+		  (bd)->read_fifo[chan].tail, READ_FIFO_SIZE) == 0)
+#define read_full(bd, chan) \
+	(CIRC_SPACE((bd)->read_fifo[chan].head, \
+		    (bd)->read_fifo[chan].tail, READ_FIFO_SIZE) == 0)
+#define read_space(bd, chan) \
+	CIRC_SPACE((bd)->read_fifo[chan].head, \
+		   (bd)->read_fifo[chan].tail, READ_FIFO_SIZE)
+#define read_cnt(bd, chan) \
+	CIRC_CNT((bd)->read_fifo[chan].head, \
+		 (bd)->read_fifo[chan].tail, READ_FIFO_SIZE)
+#define read_cnt_to_end(bd, chan) \
+	CIRC_CNT_TO_END((bd)->read_fifo[chan].head, \
+			(bd)->read_fifo[chan].tail, READ_FIFO_SIZE)
+#define read_data_ptr(bd, chan) \
+	((bd)->read_fifo[chan].data + \
+	 ((bd)->read_fifo[chan].tail & (READ_FIFO_SIZE - 1)))
+#define read_consume_bytes(bd, chan, nbytes) \
+	((bd)->read_fifo[chan].tail = \
+		((bd)->read_fifo[chan].tail + (nbytes)) & \
+		 (READ_FIFO_SIZE - 1))
+#define read_space_to_end(bd, chan) \
+	CIRC_SPACE_TO_END((bd)->read_fifo[chan].head, \
+			  (bd)->read_fifo[chan].tail, READ_FIFO_SIZE)
+#define read_space_offset(bd, chan) \
+	((bd)->read_fifo[chan].head & (READ_FIFO_SIZE - 1))
+#define read_space_ptr(bd, chan) \
+	((bd)->read_fifo[chan].data + read_space_offset(bd, (chan)))
+#define read_add_bytes(bd, chan, nbytes) \
+	((bd)->read_fifo[chan].head = \
+		((bd)->read_fifo[chan].head + (nbytes)) & \
+		 (READ_FIFO_SIZE - 1))
+#define read_reset(bd, chan) \
+	((bd)->read_fifo[chan].head = (bd)->read_fifo[chan].tail = 0)
+
+#define write_empty(bd, chan) \
+	(CIRC_CNT((bd)->write_fifo[chan].head, \
+		  (bd)->write_fifo[chan].tail, WRITE_FIFO_SIZE) == 0)
+#define write_full(bd, chan) \
+	(CIRC_SPACE((bd)->write_fifo[chan].head, \
+		    (bd)->write_fifo[chan].tail, WRITE_FIFO_SIZE) == 0)
+#define write_space(bd, chan) \
+	CIRC_SPACE((bd)->write_fifo[chan].head, \
+		   (bd)->write_fifo[chan].tail, WRITE_FIFO_SIZE)
+#define write_cnt(bd, chan) \
+	CIRC_CNT((bd)->write_fifo[chan].head, \
+		 (bd)->write_fifo[chan].tail, WRITE_FIFO_SIZE)
+#define write_cnt_to_end(bd, chan) \
+	CIRC_CNT_TO_END((bd)->write_fifo[chan].head, \
+			(bd)->write_fifo[chan].tail, WRITE_FIFO_SIZE)
+#define write_data_offset(bd, chan) \
+	((bd)->write_fifo[chan].tail & (WRITE_FIFO_SIZE - 1))
+#define write_data_ptr(bd, chan) \
+	((bd)->write_fifo[chan].data + write_data_offset(bd, (chan)))
+#define write_consume_bytes(bd, chan, nbytes) \
+	((bd)->write_fifo[chan].tail = \
+		 ((bd)->write_fifo[chan].tail + (nbytes)) & \
+		  (WRITE_FIFO_SIZE - 1))
+#define write_space_to_end(bd, chan) \
+	CIRC_SPACE_TO_END((bd)->write_fifo[chan].head, \
+			  (bd)->write_fifo[chan].tail, WRITE_FIFO_SIZE)
+#define write_space_ptr(bd, chan) \
+	((bd)->write_fifo[chan].data + \
+	 ((bd)->write_fifo[chan].head & (WRITE_FIFO_SIZE - 1)))
+#define write_add_bytes(bd, chan, nbytes) \
+	((bd)->write_fifo[chan].head = \
+	 ((bd)->write_fifo[chan].head + (nbytes)) & \
+	  (WRITE_FIFO_SIZE - 1))
+#define write_reset(bd, chan) \
+	((bd)->write_fifo[chan].head = (bd)->write_fifo[chan].tail = 0)
+
+/*
+ * Tile-to-host bits (UART 0 scratchpad).
+ */
+/*
+ * Output write pointer mask.  Note that this is the maximum size; the
+ * write pointer may be smaller if requested by the host.
+ */
+#define CONS_RSHIM_T2H_OUT_WPTR_MASK     0x3FF
+
+/* Tile is done mask. */
+#define CONS_RSHIM_T2H_DONE_MASK         0x400
+
+/*
+ * Input read pointer mask.  Note that this is the maximum size; the read
+ * pointer may be smaller if requested by the host.
+ */
+#define CONS_RSHIM_T2H_IN_RPTR_MASK      0x1FF800
+
+/* Input read pointer shift. */
+#define CONS_RSHIM_T2H_IN_RPTR_SHIFT     11
+
+/* Tile is done mask. */
+#define CONS_RSHIM_T2H_DONE_MASK         0x400
+
+/* Number of words to send as sync-data (calculated by packet MTU). */
+#define TMFIFO_MAX_SYNC_WORDS            (1536 / 8)
+
+/* Terminal characteristics for newly created consoles. */
+static struct ktermios init_console_termios = {
+	.c_iflag = INLCR | ICRNL,
+	.c_oflag = OPOST | ONLCR,
+	.c_cflag = B115200 | HUPCL | CLOCAL | CREAD | CS8,
+	.c_lflag = ISIG | ICANON | ECHOE | ECHOK | ECHOCTL | ECHOKE | IEXTEN,
+	.c_line = 0,
+	.c_cc = INIT_C_CC,
+};
+
+/* Global mutex. */
+static DEFINE_MUTEX(rshim_mutex);
+
+/*
+ * Array of all of the rshim devices.  The high bits of our minor number
+ * index into this table to find the relevant device.
+ */
+struct rshim_backend **rshim_devs;
+
+/*
+ * Work queue. Right now we have one for the whole driver; we might
+ * eventually decide that we need one per device, but we'll see.
+ */
+struct workqueue_struct *rshim_wq;
+EXPORT_SYMBOL(rshim_wq);
+
+/*
+ * Array of pointers to kmalloc'ed strings, holding the path name for
+ * all of the devices we've seen.  If rshim_devs[i] is non-NULL, then
+ * rshim_dev_names[i] is its path name.  If rshim_devs[i] is NULL, then
+ * rshim_dev_names[i] is the name that was last used for that device.
+ * When we see a new device, we look it up in this table; this allows us to
+ * use the same device index we did last time we saw the device.  The
+ * strings within the array persist until the driver is unloaded.
+ */
+char **rshim_dev_names;
+
+/* Name of the sub-device types. */
+char *rshim_dev_minor_names[RSH_DEV_TYPES] = {
+	[RSH_DEV_TYPE_RSHIM] = "rshim",
+	[RSH_DEV_TYPE_BOOT] = "boot",
+	[RSH_DEV_TYPE_CONSOLE] = "console",
+	[RSH_DEV_TYPE_NET] = "net",
+	[RSH_DEV_TYPE_MISC] = "misc",
+};
+
+/* dev_t base index. */
+static dev_t rshim_dev_base;
+
+/* Class structure for our device class. */
+static struct class *rshim_class;
+
+/* Registered services. */
+static struct rshim_service *rshim_svc[RSH_SVC_MAX];
+
+/* FIFO reset. */
+static void rshim_fifo_reset(struct rshim_backend *bd);
+
+/* Global lock / unlock. */
+
+void rshim_lock(void)
+{
+	mutex_lock(&rshim_mutex);
+}
+EXPORT_SYMBOL(rshim_lock);
+
+void rshim_unlock(void)
+{
+	mutex_unlock(&rshim_mutex);
+}
+EXPORT_SYMBOL(rshim_unlock);
+
+/*
+ * Read some bytes from RShim.
+ *
+ * The provided buffer size should be multiple of 8 bytes. If not, the
+ * leftover bytes (which presumably were sent as NUL bytes by the sender)
+ * will be discarded.
+ */
+static ssize_t rshim_read_default(struct rshim_backend *bd, int devtype,
+				char *buf, size_t count)
+{
+	int retval, total = 0, avail = 0;
+	u64 word;
+
+	/* Read is only supported for RShim TMFIFO. */
+	if (devtype != RSH_DEV_TYPE_NET && devtype != RSH_DEV_TYPE_CONSOLE) {
+		pr_err("bad devtype %d\n", devtype);
+		return -EINVAL;
+	}
+	if (bd->is_boot_open)
+		return 0;
+
+	while (total < count) {
+		if (avail == 0) {
+			retval = bd->read_rshim(bd, RSHIM_CHANNEL,
+						RSH_TM_TILE_TO_HOST_STS, &word);
+			if (retval < 0)
+				break;
+			avail = word & RSH_TM_TILE_TO_HOST_STS__COUNT_MASK;
+			if (avail == 0)
+				break;
+		}
+		retval = bd->read_rshim(bd, RSHIM_CHANNEL,
+					RSH_TM_TILE_TO_HOST_DATA, &word);
+		if (retval < 0)
+			break;
+		/*
+		 * Convert it to little endian before sending to RShim. The
+		 * other side should decode it as little endian as well which
+		 * is usually the default case.
+		 */
+		word = le64_to_cpu(word);
+		if (total + sizeof(word) <= count) {
+			*(u64 *)buf = word;
+			buf += sizeof(word);
+			total += sizeof(word);
+		} else {
+			/* Copy the rest data which is less than 8 bytes. */
+			memcpy(buf, &word, count - total);
+			total = count;
+			break;
+		}
+		avail--;
+	}
+
+	return total;
+}
+
+/*
+ * Write some bytes to the RShim backend.
+ *
+ * If count is not multiple of 8-bytes, the data will be padded to 8-byte
+ * aligned which is required by RShim HW.
+ */
+static ssize_t rshim_write_delayed(struct rshim_backend *bd, int devtype,
+				   const char *buf, size_t count)
+{
+	u64 word;
+	char pad_buf[sizeof(u64)] = { 0 };
+	int size_addr, size_mask, data_addr, max_size;
+	int retval, avail = 0, byte_cnt = 0, retry;
+
+	switch (devtype) {
+	case RSH_DEV_TYPE_NET:
+	case RSH_DEV_TYPE_CONSOLE:
+		if (bd->is_boot_open)
+			return count;
+		size_addr = RSH_TM_HOST_TO_TILE_STS;
+		size_mask = RSH_TM_HOST_TO_TILE_STS__COUNT_MASK;
+		data_addr = RSH_TM_HOST_TO_TILE_DATA;
+		retval = bd->read_rshim(bd, RSHIM_CHANNEL,
+					RSH_TM_HOST_TO_TILE_CTL, &word);
+		if (retval < 0) {
+			pr_err("read_rshim error %d\n", retval);
+			return retval;
+		}
+		max_size = (word >> RSH_TM_HOST_TO_TILE_CTL__MAX_ENTRIES_SHIFT)
+			   & RSH_TM_HOST_TO_TILE_CTL__MAX_ENTRIES_RMASK;
+		break;
+
+	case RSH_DEV_TYPE_BOOT:
+		size_addr = RSH_BOOT_FIFO_COUNT;
+		size_mask = RSH_BOOT_FIFO_COUNT__BOOT_FIFO_COUNT_MASK;
+		data_addr = RSH_BOOT_FIFO_DATA;
+		max_size = RSH_BOOT_FIFO_SIZE;
+		break;
+
+	default:
+		pr_err("bad devtype %d\n", devtype);
+		return -EINVAL;
+	}
+
+	while (byte_cnt < count) {
+		/* Check the boot cancel condition. */
+		if (devtype == RSH_DEV_TYPE_BOOT && !bd->boot_work_buf)
+			break;
+
+		/* Add padding if less than 8 bytes left. */
+		if (byte_cnt + sizeof(u64) > count) {
+			memcpy(pad_buf, buf, count - byte_cnt);
+			buf = (const char *)pad_buf;
+		}
+
+		retry = 0;
+		while (avail <= 0) {
+			/* Calculate available space in words. */
+			retval = bd->read_rshim(bd, RSHIM_CHANNEL, size_addr,
+						&word);
+			if (retval < 0) {
+				pr_err("read_rshim error %d\n", retval);
+				break;
+			}
+			avail = max_size - (int)(word & size_mask) - 8;
+			if (avail > 0)
+				break;
+
+			/*
+			 * Retry 100s, or else return failure since the other
+			 * side seems not to be responding.
+			 */
+			if (++retry > 100000)
+				return -ETIMEDOUT;
+			msleep(1);
+		}
+
+		word = *(u64 *)buf;
+		/*
+		 * Convert to little endian before sending to RShim. The
+		 * receiving side should call le64_to_cpu() to convert
+		 * it back.
+		 */
+		word = cpu_to_le64(word);
+		retval = bd->write_rshim(bd, RSHIM_CHANNEL, data_addr, word);
+		if (retval < 0) {
+			pr_err("write_rshim error %d\n", retval);
+			break;
+		}
+		buf += sizeof(word);
+		byte_cnt += sizeof(word);
+		avail--;
+	}
+
+	/* Return number shouldn't count the padded bytes. */
+	return (byte_cnt > count) ? count : byte_cnt;
+}
+
+static ssize_t rshim_write_default(struct rshim_backend *bd, int devtype,
+				   const char *buf, size_t count)
+{
+	int retval;
+
+	switch (devtype) {
+	case RSH_DEV_TYPE_NET:
+	case RSH_DEV_TYPE_CONSOLE:
+		if (bd->is_boot_open)
+			return count;
+
+		/* Set the flag so there is only one outstanding request. */
+		bd->spin_flags |= RSH_SFLG_WRITING;
+
+		/* Wake up the worker. */
+		bd->fifo_work_buf = (char *)buf;
+		bd->fifo_work_buf_len = count;
+		bd->fifo_work_devtype = devtype;
+		/*
+		 * Add barrier so the above writes complete before setting the
+		 * has_fifo_work flag.
+		 */
+		wmb();
+		bd->has_fifo_work = 1;
+		queue_delayed_work(rshim_wq, &bd->work, 0);
+		return 0;
+
+	case RSH_DEV_TYPE_BOOT:
+		reinit_completion(&bd->boot_write_complete);
+		bd->boot_work_buf_len = count;
+		bd->boot_work_buf_actual_len = 0;
+		/*
+		 * Add barrier so the above writes complete before setting the
+		 * boot_work_buf pointer since it's checked in other places.
+		 */
+		wmb();
+		bd->boot_work_buf = (char *)buf;
+		queue_delayed_work(rshim_wq, &bd->work, 0);
+
+		mutex_unlock(&bd->mutex);
+		retval = wait_for_completion_interruptible(
+					&bd->boot_write_complete);
+		/* Cancel the request if interrupted. */
+		if (retval)
+			bd->boot_work_buf = NULL;
+
+		mutex_lock(&bd->mutex);
+		return bd->boot_work_buf_actual_len;
+
+	default:
+		pr_err("bad devtype %d\n", devtype);
+		return -EINVAL;
+	}
+}
+
+/* Boot file operations routines */
+
+/*
+ * Wait for boot to complete, if necessary.  Return 0 if the boot is done
+ * and it's safe to continue, an error code if something went wrong.  Note
+ * that this routine must be called with the device mutex held.  If it
+ * returns successfully, the mutex will still be held (although it may have
+ * been dropped and reacquired); if it returns unsuccessfully the mutex
+ * will have been dropped.
+ */
+static int wait_for_boot_done(struct rshim_backend *bd)
+{
+	int retval;
+
+	if (!bd->has_reprobe)
+		return 0;
+
+	if (!bd->has_rshim || bd->is_booting) {
+		while (bd->is_booting) {
+			pr_info("boot write, waiting for re-probe\n");
+			/* We're booting, and the backend isn't ready yet. */
+			mutex_unlock(&bd->mutex);
+			/*
+			 * FIXME: might we want a timeout here, too?  If
+			 * the reprobe takes a very long time, something's
+			 * probably wrong.  Maybe a couple of minutes?
+			 */
+			retval = wait_for_completion_interruptible(
+				&bd->booting_complete);
+			if (retval)
+				return retval;
+			mutex_lock(&bd->mutex);
+		}
+		if (!bd->has_rshim) {
+			mutex_unlock(&bd->mutex);
+			return -ENODEV;
+		}
+	}
+
+	return 0;
+}
+
+static ssize_t rshim_boot_write(struct file *file, const char *user_buffer,
+			      size_t count, loff_t *ppos)
+{
+	struct rshim_backend *bd = file->private_data;
+	int retval = 0, whichbuf = 0;
+	size_t bytes_written = 0, bytes_left;
+
+	/*
+	 * Hardware requires that we send multiples of 8 bytes.  Ideally
+	 * we'd handle the case where we got unaligned writes by
+	 * accumulating the residue somehow, but none of our clients
+	 * typically do this, so we just clip the size to prevent any
+	 * inadvertent errors from causing hardware problems.
+	 */
+	bytes_left = count & (-((size_t)8));
+	if (!bytes_left)
+		return 0;
+
+	mutex_lock(&bd->mutex);
+	if (bd->is_in_boot_write) {
+		mutex_unlock(&bd->mutex);
+		return -EBUSY;
+	}
+
+	retval = wait_for_boot_done(bd);
+	if (retval) {
+		pr_err("boot_write: wait for boot failed, err %d\n", retval);
+		/* wait_for_boot_done already dropped mutex */
+		return retval;
+	}
+
+	/*
+	 * We're going to drop the mutex while we wait for any outstanding
+	 * write to complete; this keeps another thread from getting in here
+	 * while we do that.
+	 */
+	bd->is_in_boot_write = 1;
+
+	while (bytes_left) {
+		size_t buf_bytes = min((size_t)BOOT_BUF_SIZE, bytes_left);
+		char *buf = bd->boot_buf[whichbuf];
+
+		whichbuf ^= 1;
+		if (copy_from_user(buf, user_buffer, buf_bytes)) {
+			retval = -EFAULT;
+			pr_err("boot_write: copy from user failed\n");
+			break;
+		}
+
+		retval = bd->write(bd, RSH_DEV_TYPE_BOOT, buf, buf_bytes);
+		if (retval > 0) {
+			bytes_left -= retval;
+			user_buffer += retval;
+			bytes_written += retval;
+		} else if (retval == 0) {
+			/* Wait for some time instead of busy polling. */
+			msleep_interruptible(1);
+			continue;
+		}
+		if (retval != buf_bytes)
+			break;
+	}
+
+	bd->is_in_boot_write = 0;
+	mutex_unlock(&bd->mutex);
+
+	/*
+	 * Return an error in case the 'count' is not multiple of 8 bytes.
+	 * At this moment, the truncated data has already been sent to
+	 * the BOOT fifo and hopefully it could still boot the chip.
+	 */
+	if (count % 8 != 0)
+		return -EINVAL;
+
+	return bytes_written ? bytes_written : retval;
+}
+
+static int rshim_boot_release(struct inode *inode, struct file *file)
+{
+	struct rshim_backend *bd = file->private_data;
+	struct module *owner;
+	int retval;
+
+	/* Restore the boot mode register. */
+	retval = bd->write_rshim(bd, RSHIM_CHANNEL,
+				 RSH_BOOT_CONTROL,
+				 RSH_BOOT_CONTROL__BOOT_MODE_VAL_EMMC);
+	if (retval)
+		pr_err("couldn't set boot_control, err %d\n", retval);
+
+	mutex_lock(&bd->mutex);
+	bd->is_boot_open = 0;
+	queue_delayed_work(rshim_wq, &bd->work, HZ);
+	mutex_unlock(&bd->mutex);
+
+	rshim_lock();
+	owner = RSHIM_READ_ONCE(bd->owner);
+	kref_put(&bd->kref, bd->destroy);
+	module_put(owner);
+	rshim_unlock();
+
+	return 0;
+}
+
+static const struct file_operations rshim_boot_fops = {
+	.owner = THIS_MODULE,
+	.write = rshim_boot_write,
+	.release = rshim_boot_release,
+};
+
+int rshim_boot_open(struct file *file)
+{
+	int retval;
+	int i;
+	struct rshim_backend *bd = file->private_data;
+#if RSH_RESET_MUTEX
+	unsigned long devs_locked = 0;
+#endif
+
+	file->f_op = &rshim_boot_fops;
+
+#if RSH_RESET_MUTEX
+	/*
+	 * We're going to prevent resets and operations from running in
+	 * parallel with other resets.  Our method for this is to grab
+	 * every device's mutex before doing the reset, and then holding
+	 * onto them until the device we reset is reprobed, or a timeout
+	 * expires; the latter is mostly paranoia.  Anyway, in order to
+	 * find all of the other devices, we're going to need to walk the
+	 * device table, so we need to grab its mutex.  We have to do it
+	 * before we get our own device's mutex for lock ordering reasons.
+	 */
+	rshim_lock();
+#endif
+
+	mutex_lock(&bd->mutex);
+
+	if (bd->is_boot_open) {
+		pr_info("can't boot, boot file already open\n");
+		mutex_unlock(&bd->mutex);
+#if RSH_RESET_MUTEX
+		rshim_unlock();
+#endif
+		return -EBUSY;
+	}
+
+	if (!bd->has_rshim) {
+		mutex_unlock(&bd->mutex);
+#if RSH_RESET_MUTEX
+		rshim_unlock();
+#endif
+		return -ENODEV;
+	}
+
+	pr_info("begin booting\n");
+	reinit_completion(&bd->booting_complete);
+	bd->is_booting = 1;
+
+	/*
+	 * Before we reset the chip, make sure we don't have any
+	 * outstanding writes, and flush the write and read FIFOs. (Note
+	 * that we can't have any outstanding reads, since we kill those
+	 * upon release of the TM FIFO file.)
+	 */
+	if (bd->cancel)
+		bd->cancel(bd, RSH_DEV_TYPE_NET, true);
+	bd->read_buf_bytes = 0;
+	bd->read_buf_pkt_rem = 0;
+	bd->read_buf_pkt_padding = 0;
+	spin_lock_irq(&bd->spinlock);
+	/* FIXME: should we be waiting for WRITING to go off, instead? */
+	bd->spin_flags &= ~RSH_SFLG_WRITING;
+	for (i = 0; i < TMFIFO_MAX_CHAN; i++) {
+		read_reset(bd, i);
+		write_reset(bd, i);
+	}
+	spin_unlock_irq(&bd->spinlock);
+
+	/* Set RShim (external) boot mode. */
+	retval = bd->write_rshim(bd, RSHIM_CHANNEL, RSH_BOOT_CONTROL,
+				 RSH_BOOT_CONTROL__BOOT_MODE_VAL_NONE);
+	if (retval) {
+		pr_err("boot_open: error %d writing boot control\n", retval);
+		bd->is_booting = 0;
+		mutex_unlock(&bd->mutex);
+#if RSH_RESET_MUTEX
+		rshim_unlock();
+#endif
+		return retval;
+	}
+
+#if RSH_RESET_MUTEX
+	/*
+	 * Acquire all of the other devices' mutexes, to keep them from
+	 * doing anything while we're performing the reset.  Also kill
+	 * any outstanding boot urbs; that way we'll restart them, after
+	 * the reset is done, and not report errors to the writers.
+	 */
+	for (i = 0; i < rshim_nr_devs; i++) {
+		if (rshim_devs[i] && rshim_devs[i] != bd) {
+			mutex_lock(&rshim_devs[i]->mutex);
+			devs_locked |= 1UL << i;
+			if (rshim_devs[i]->cancel) {
+				rshim_devs[i]->cancel(rshim_devs[i],
+						    RSH_DEV_TYPE_BOOT, true);
+			}
+		}
+	}
+	reinit_completion(&bd->reset_complete);
+#endif
+
+	bd->is_boot_open = 1;
+
+	/* SW reset. */
+	retval = bd->write_rshim(bd, RSHIM_CHANNEL, RSH_RESET_CONTROL,
+				 RSH_RESET_CONTROL__RESET_CHIP_VAL_KEY);
+
+	/* Reset the TmFifo. */
+	rshim_fifo_reset(bd);
+
+	/*
+	 * Note that occasionally, we get various errors on writing to
+	 * the reset register.  This appears to be caused by the chip
+	 * actually resetting before the response goes out, or perhaps by
+	 * our noticing the device unplug before we've seen the response.
+	 * Either way, the chip _does_ actually reset, so we just ignore
+	 * the error.  Should we ever start getting these errors without
+	 * the chip being reset, we'll have to figure out how to handle
+	 * this more intelligently.  (One potential option is to not reset
+	 * directly, but to set up a down counter to do the reset, but that
+	 * seems kind of kludgy, especially since Tile software might also
+	 * be trying to use the down counter.)
+	 */
+	if (retval && retval != -EPROTO && retval != -ESHUTDOWN &&
+#ifdef RSH_USB_BMC
+	    /*
+	     * The host driver on the BMC sometimes produces EOVERFLOW on
+	     * reset.  It also seems to have seems to have some sort of bug
+	     * which makes it return more bytes than we actually wrote!  In
+	     * that case we're returning EBADE.
+	     */
+	    retval != -EOVERFLOW && retval != -EBADE &&
+#endif
+	    retval != -ETIMEDOUT && retval != -EPIPE) {
+		pr_err("boot_open: error %d writing reset control\n", retval);
+		mutex_unlock(&bd->mutex);
+#if RSH_RESET_MUTEX
+		while (devs_locked) {
+			int i = __builtin_ctzl(devs_locked);
+
+			mutex_unlock(&rshim_devs[i]->mutex);
+			devs_locked &= ~(1UL << i);
+		}
+		rshim_unlock();
+#endif
+		bd->is_boot_open = 0;
+
+		return retval;
+	}
+
+	if (retval)
+		pr_err("boot_open: got error %d on reset write\n", retval);
+
+	mutex_unlock(&bd->mutex);
+
+#if RSH_RESET_MUTEX
+	rshim_unlock();
+	/*
+	 * We wait for reset_complete (signaled by probe), or for an
+	 * interrupt, or a timeout (set to 5s because of no re-probe
+	 * in the PCIe case). Note that we dropped dev->mutex above
+	 * so that probe can run; the BOOT_OPEN flag should keep our device
+	 * from trying to do anything before the device is reprobed.
+	 */
+	retval = wait_for_completion_interruptible_timeout(&bd->reset_complete,
+							   5 * HZ);
+	if (retval == 0)
+		pr_err("timed out waiting for device reprobe after reset\n");
+
+	while (devs_locked) {
+		int i = __builtin_ctz(devs_locked);
+
+		mutex_unlock(&rshim_devs[i]->mutex);
+		devs_locked &= ~(1UL << i);
+	}
+#endif
+
+	return 0;
+}
+
+/* FIFO common file operations routines */
+
+/*
+ * Signal an error on the FIFO, and wake up anyone who might need to know
+ * about it.
+ */
+static void rshim_fifo_err(struct rshim_backend *bd, int err)
+{
+	int i;
+
+	bd->tmfifo_error = err;
+	wake_up_interruptible_all(&bd->write_completed);
+	for (i = 0; i < TMFIFO_MAX_CHAN; i++) {
+		wake_up_interruptible_all(&bd->read_fifo[i].operable);
+		wake_up_interruptible_all(&bd->write_fifo[i].operable);
+	}
+}
+
+/* Drain the read buffer, and start another read/interrupt if needed. */
+static void rshim_fifo_input(struct rshim_backend *bd)
+{
+	union rshim_tmfifo_msg_hdr *hdr;
+	bool rx_avail = false;
+
+	if (bd->is_boot_open)
+		return;
+
+again:
+	while (bd->read_buf_next < bd->read_buf_bytes) {
+		int copysize;
+
+		/*
+		 * If we're at the start of a packet, then extract the
+		 * header, and update our count of bytes remaining in the
+		 * packet.
+		 */
+		if (bd->read_buf_pkt_rem == 0) {
+			/* Make sure header is received. */
+			if (bd->read_buf_next + sizeof(*hdr) >
+				bd->read_buf_bytes)
+				break;
+
+			pr_debug("next hdr %d\n", bd->read_buf_next);
+
+			hdr = (union rshim_tmfifo_msg_hdr *)
+				&bd->read_buf[bd->read_buf_next];
+
+			bd->read_buf_pkt_rem = ntohs(hdr->len) + sizeof(*hdr);
+			bd->read_buf_pkt_padding =
+				(8 - (bd->read_buf_pkt_rem & 7)) & 7;
+			if (hdr->type == VIRTIO_ID_NET)
+				bd->rx_chan = TMFIFO_NET_CHAN;
+			else if (hdr->type == VIRTIO_ID_CONSOLE) {
+				bd->rx_chan = TMFIFO_CONS_CHAN;
+				/* Strip off the message header for console. */
+				bd->read_buf_next += sizeof(*hdr);
+				bd->read_buf_pkt_rem -= sizeof(*hdr);
+				if (bd->read_buf_pkt_rem == 0)
+					continue;
+			} else {
+				pr_debug("bad type %d, drop it", hdr->type);
+				bd->read_buf_pkt_rem = 0;
+				bd->read_buf_pkt_padding = 0;
+				bd->read_buf_next = bd->read_buf_bytes;
+				break;
+			}
+
+			pr_debug("drain: hdr, nxt %d rem %d chn %d\n",
+			      bd->read_buf_next, bd->read_buf_pkt_rem,
+			      bd->rx_chan);
+			bd->drop = 0;
+		}
+
+		if (bd->rx_chan == TMFIFO_CONS_CHAN &&
+		    !(bd->spin_flags & RSH_SFLG_CONS_OPEN)) {
+			/*
+			 * If data is coming in for a closed console
+			 * channel, we want to just throw it away.
+			 * Resetting the channel every time through this
+			 * loop is a relatively cheap way to do that.  Note
+			 * that this works because the read buffer is no
+			 * larger than the read FIFO; thus, we know that if
+			 * we reset it here, we will always be able to
+			 * drain the read buffer of any console data, and
+			 * will then launch another read.
+			 */
+			read_reset(bd, TMFIFO_CONS_CHAN);
+			bd->drop = 1;
+		} else if (bd->rx_chan == TMFIFO_NET_CHAN && bd->net == NULL) {
+			/* Drop if networking is not enabled. */
+			read_reset(bd, TMFIFO_NET_CHAN);
+			bd->drop = 1;
+		}
+
+		copysize = min(bd->read_buf_pkt_rem,
+			       bd->read_buf_bytes - bd->read_buf_next);
+		copysize = min(copysize,
+			       read_space_to_end(bd, bd->rx_chan));
+
+		pr_debug("drain: copysize %d, head %d, tail %d, remaining %d\n",
+			 copysize, bd->read_fifo[bd->rx_chan].head,
+			 bd->read_fifo[bd->rx_chan].tail,
+			 bd->read_buf_pkt_rem);
+
+		if (copysize == 0) {
+			/*
+			 * We have data, but no space to put it in, so
+			 * we're done.
+			 */
+			pr_debug("drain: no more space in channel %d\n",
+				 bd->rx_chan);
+			break;
+		}
+
+		if (!bd->drop) {
+			memcpy(read_space_ptr(bd, bd->rx_chan),
+			       &bd->read_buf[bd->read_buf_next],
+			       copysize);
+			read_add_bytes(bd, bd->rx_chan, copysize);
+		}
+
+		bd->read_buf_next += copysize;
+		bd->read_buf_pkt_rem -= copysize;
+
+		wake_up_interruptible_all(&bd->read_fifo[
+				      bd->rx_chan].operable);
+		pr_debug("woke up readable chan %d\n", bd->rx_chan);
+
+		if (bd->read_buf_pkt_rem <= 0) {
+			bd->read_buf_next = bd->read_buf_next +
+				bd->read_buf_pkt_padding;
+			rx_avail = true;
+		}
+	}
+
+	/*
+	 * We've processed all of the data we can, so now we decide if we
+	 * need to launch another I/O.  If there's still data in the read
+	 * buffer, or if we're already reading, don't launch any new
+	 * operations.  If an interrupt just completed, and said there was
+	 * data, or the last time we did a read we got some data, then do
+	 * another read.  Otherwise, do an interrupt.
+	 */
+	if (bd->read_buf_next < bd->read_buf_bytes ||
+	    (bd->spin_flags & RSH_SFLG_READING)) {
+		/* We're doing nothing. */
+		pr_debug("fifo_input: no new read: %s\n",
+			 (bd->read_buf_next < bd->read_buf_bytes) ?
+			 "have data" : "already reading");
+	} else {
+		int len;
+
+		/* Process it if more data is received. */
+		len = bd->read(bd, RSH_DEV_TYPE_NET, (char *)bd->read_buf,
+			      READ_BUF_SIZE);
+		if (len > 0) {
+			bd->read_buf_bytes = len;
+			bd->read_buf_next = 0;
+			goto again;
+		}
+	}
+
+	if (rx_avail) {
+		if (bd->rx_chan == TMFIFO_NET_CHAN) {
+			struct rshim_service *svc;
+
+			/*
+			 * Protect rshim_svc with RCU lock. See comments in
+			 * rshim_register_service() / rshim_register_service()
+			 */
+			rcu_read_lock();
+			svc = rcu_dereference(rshim_svc[RSH_SVC_NET]);
+			if (svc != NULL)
+				(*svc->rx_notify)(bd);
+			rcu_read_unlock();
+		}
+	}
+}
+
+ssize_t rshim_fifo_read(struct rshim_backend *bd, char *buffer,
+		      size_t count, int chan, bool nonblock,
+		      bool to_user)
+{
+	size_t rd_cnt = 0;
+
+	mutex_lock(&bd->mutex);
+
+	while (count) {
+		size_t readsize;
+		int pass1;
+		int pass2;
+
+		pr_debug("fifo_read, top of loop, remaining count %zd\n",
+			 count);
+
+		/*
+		 * We check this each time through the loop since the
+		 * device could get disconnected while we're waiting for
+		 * more data in the read FIFO.
+		 */
+		if (!bd->has_tm) {
+			mutex_unlock(&bd->mutex);
+			pr_debug("fifo_read: returning %zd/ENODEV\n", rd_cnt);
+			return rd_cnt ? rd_cnt : -ENODEV;
+		}
+
+		if (bd->tmfifo_error) {
+			mutex_unlock(&bd->mutex);
+			pr_debug("fifo_read: returning %zd/%d\n", rd_cnt,
+			      bd->tmfifo_error);
+			return rd_cnt ? rd_cnt : bd->tmfifo_error;
+		}
+
+		if (read_empty(bd, chan)) {
+			pr_debug("fifo_read: fifo empty\n");
+			if (rd_cnt || nonblock) {
+				if (rd_cnt == 0) {
+					spin_lock_irq(&bd->spinlock);
+					rshim_fifo_input(bd);
+					spin_unlock_irq(&bd->spinlock);
+				}
+				mutex_unlock(&bd->mutex);
+				pr_debug("fifo_read: returning %zd/EAGAIN\n",
+				      rd_cnt);
+				return rd_cnt ? rd_cnt : -EAGAIN;
+			}
+
+			mutex_unlock(&bd->mutex);
+
+			pr_debug("fifo_read: waiting for readable chan %d\n",
+				 chan);
+			if (wait_event_interruptible(
+					bd->read_fifo[chan].operable,
+					    !read_empty(bd, chan))) {
+				pr_debug("fifo_read: returning ERESTARTSYS\n");
+				return to_user ? -EINTR : -ERESTARTSYS;
+			}
+
+			mutex_lock(&bd->mutex);
+
+			/*
+			 * Since we dropped the mutex, we must make
+			 * sure our interface is still there before
+			 * we do anything else.
+			 */
+			continue;
+		}
+
+		/*
+		 * Figure out how many bytes we will transfer on this pass.
+		 */
+		spin_lock_irq(&bd->spinlock);
+
+		readsize = min(count, (size_t)read_cnt(bd, chan));
+
+		pass1 = min(readsize, (size_t)read_cnt_to_end(bd, chan));
+		pass2 = readsize - pass1;
+
+		spin_unlock_irq(&bd->spinlock);
+
+		pr_debug("fifo_read: readsize %zd, head %d, tail %d\n",
+			 readsize, bd->read_fifo[chan].head,
+			 bd->read_fifo[chan].tail);
+
+		if (!to_user) {
+			memcpy(buffer, read_data_ptr(bd, chan), pass1);
+			if (pass2) {
+				memcpy(buffer + pass1,
+				       bd->read_fifo[chan].data, pass2);
+			}
+		} else {
+			if (copy_to_user(buffer, read_data_ptr(bd, chan),
+				pass1) || (pass2 && copy_to_user(buffer + pass1,
+				bd->read_fifo[chan].data, pass2))) {
+				mutex_unlock(&bd->mutex);
+				pr_debug("fifo_read: returns %zd/EFAULT\n",
+					 rd_cnt);
+				return rd_cnt ? rd_cnt : -EFAULT;
+			}
+		}
+
+		spin_lock_irq(&bd->spinlock);
+
+		read_consume_bytes(bd, chan, readsize);
+
+		/*
+		 * We consumed some bytes, so let's see if we can process
+		 * any more incoming data.
+		 */
+		rshim_fifo_input(bd);
+
+		spin_unlock_irq(&bd->spinlock);
+
+		count -= readsize;
+		buffer += readsize;
+		rd_cnt += readsize;
+		pr_debug("fifo_read: transferred %zd bytes\n", readsize);
+	}
+
+	mutex_unlock(&bd->mutex);
+
+	pr_debug("fifo_read: returning %zd\n", rd_cnt);
+	return rd_cnt;
+}
+EXPORT_SYMBOL(rshim_fifo_read);
+
+static void rshim_fifo_output(struct rshim_backend *bd)
+{
+	int writesize, write_buf_next = 0;
+	int write_avail = WRITE_BUF_SIZE - write_buf_next;
+	int numchan = TMFIFO_MAX_CHAN;
+	int chan, chan_offset;
+
+	/* If we're already writing, we have nowhere to put data. */
+	if (bd->spin_flags & RSH_SFLG_WRITING)
+		return;
+
+	/* Walk through all the channels, sending as much data as possible. */
+	for (chan_offset = 0; chan_offset < numchan; chan_offset++) {
+		/*
+		 * Pick the current channel if not done, otherwise round-robin
+		 * to the next channel.
+		 */
+		if (bd->write_buf_pkt_rem > 0)
+			chan = bd->tx_chan;
+		else {
+			u16 cur_len;
+			union rshim_tmfifo_msg_hdr *hdr = &bd->msg_hdr;
+
+			chan = bd->tx_chan = (bd->tx_chan + 1) % numchan;
+			cur_len = write_cnt(bd, chan);
+
+			/*
+			 * Set up message header for console data which is byte
+			 * stream. Network packets already have the message
+			 * header included.
+			 */
+			if (chan == TMFIFO_CONS_CHAN) {
+				if (cur_len == 0)
+					continue;
+				hdr->data = 0;
+				hdr->type = VIRTIO_ID_CONSOLE;
+				hdr->len = htons(cur_len);
+			} else {
+				int pass1;
+
+				if (cur_len <
+					sizeof(union rshim_tmfifo_msg_hdr))
+					continue;
+
+				pass1 = write_cnt_to_end(bd, chan);
+				if (pass1 >= sizeof(*hdr)) {
+					hdr = (union rshim_tmfifo_msg_hdr *)
+						write_data_ptr(bd, chan);
+				} else {
+					memcpy(hdr, write_data_ptr(bd, chan),
+					       pass1);
+					memcpy((u8 *)hdr + pass1,
+					       bd->write_fifo[chan].data,
+					       sizeof(*hdr) - pass1);
+				}
+			}
+
+			bd->write_buf_pkt_rem = ntohs(hdr->len) + sizeof(*hdr);
+		}
+
+		/* Send out the packet header for the console data. */
+		if (chan == TMFIFO_CONS_CHAN &&
+		    bd->write_buf_pkt_rem > ntohs(bd->msg_hdr.len)) {
+			union rshim_tmfifo_msg_hdr *hdr = &bd->msg_hdr;
+			int left = bd->write_buf_pkt_rem - ntohs(hdr->len);
+			u8 *pos = (u8 *)hdr + sizeof(*hdr) - left;
+
+			writesize = min(write_avail, left);
+			memcpy(&bd->write_buf[write_buf_next], pos, writesize);
+			write_buf_next += writesize;
+			bd->write_buf_pkt_rem -= writesize;
+			write_avail -= writesize;
+
+			/*
+			 * Don't continue if no more space for the header.
+			 * It'll be picked up next time.
+			 */
+			if (left != writesize)
+				break;
+		}
+
+		writesize = min(write_avail, (int)write_cnt(bd, chan));
+		writesize = min(writesize, bd->write_buf_pkt_rem);
+
+		/*
+		 * The write size should be aligned to 8 bytes unless for the
+		 * last block, which will be padded at the end.
+		 */
+		if (bd->write_buf_pkt_rem != writesize)
+			writesize &= -8;
+
+		if (writesize > 0) {
+			int pass1;
+			int pass2;
+
+			pass1 = min(writesize,
+				    (int)write_cnt_to_end(bd, chan));
+			pass2 = writesize - pass1;
+
+			pr_debug("fifo_outproc: chan %d, writesize %d, next %d,"
+				 " head %d, tail %d\n",
+				 chan, writesize, write_buf_next,
+				 bd->write_fifo[chan].head,
+				 bd->write_fifo[chan].tail);
+
+			memcpy(&bd->write_buf[write_buf_next],
+			       write_data_ptr(bd, chan), pass1);
+			memcpy(&bd->write_buf[write_buf_next + pass1],
+			       bd->write_fifo[chan].data, pass2);
+
+			write_consume_bytes(bd, chan, writesize);
+			write_buf_next += writesize;
+			bd->write_buf_pkt_rem -= writesize;
+			/* Add padding at the end. */
+			if (bd->write_buf_pkt_rem == 0)
+				write_buf_next = (write_buf_next + 7) & -8;
+			write_avail = WRITE_BUF_SIZE - write_buf_next;
+
+			wake_up_interruptible_all(
+				&bd->write_fifo[chan].operable);
+			pr_debug("woke up writable chan %d\n", chan);
+		}
+	}
+
+	/* Drop the data if it is still booting. */
+	if (bd->is_boot_open)
+		return;
+
+	/* If we actually put anything in the buffer, send it. */
+	if (write_buf_next) {
+		bd->write(bd, RSH_DEV_TYPE_NET, (char *)bd->write_buf,
+			  write_buf_next);
+	}
+}
+
+int rshim_fifo_alloc(struct rshim_backend *bd)
+{
+	int i, allocfail = 0;
+
+	for (i = 0; i < TMFIFO_MAX_CHAN; i++) {
+		if (!bd->read_fifo[i].data)
+			bd->read_fifo[i].data =
+				kmalloc(READ_FIFO_SIZE, GFP_KERNEL);
+		allocfail |= bd->read_fifo[i].data == 0;
+
+		if (!bd->write_fifo[i].data)
+			bd->write_fifo[i].data =
+				kmalloc(WRITE_FIFO_SIZE, GFP_KERNEL);
+		allocfail |= bd->write_fifo[i].data == 0;
+	}
+
+	return allocfail;
+}
+EXPORT_SYMBOL(rshim_fifo_alloc);
+
+static void rshim_fifo_reset(struct rshim_backend *bd)
+{
+	int i;
+
+	bd->read_buf_bytes = 0;
+	bd->read_buf_pkt_rem = 0;
+	bd->read_buf_next = 0;
+	bd->read_buf_pkt_padding = 0;
+	bd->write_buf_pkt_rem = 0;
+	bd->rx_chan = bd->tx_chan = 0;
+
+	spin_lock_irq(&bd->spinlock);
+	bd->spin_flags &= ~(RSH_SFLG_WRITING |
+			    RSH_SFLG_READING);
+	for (i = 0; i < TMFIFO_MAX_CHAN; i++) {
+		read_reset(bd, i);
+		write_reset(bd, i);
+	}
+	spin_unlock_irq(&bd->spinlock);
+}
+
+void rshim_fifo_free(struct rshim_backend *bd)
+{
+	int i;
+
+	for (i = 0; i < TMFIFO_MAX_CHAN; i++) {
+		kfree(bd->read_fifo[i].data);
+		bd->read_fifo[i].data = NULL;
+		kfree(bd->write_fifo[i].data);
+		bd->write_fifo[i].data = NULL;
+	}
+
+	rshim_fifo_reset(bd);
+
+	bd->has_tm = 0;
+}
+EXPORT_SYMBOL(rshim_fifo_free);
+
+ssize_t rshim_fifo_write(struct rshim_backend *bd, const char *buffer,
+		       size_t count, int chan, bool nonblock,
+		       bool from_user)
+{
+	size_t wr_cnt = 0;
+
+	mutex_lock(&bd->mutex);
+
+	while (count) {
+		size_t writesize;
+		int pass1;
+		int pass2;
+
+		pr_debug("fifo_write, top of loop, remaining count %zd\n",
+			 count);
+
+		/*
+		 * We check this each time through the loop since the
+		 * device could get disconnected while we're waiting for
+		 * more space in the write buffer.
+		 */
+		if (!bd->has_tm) {
+			mutex_unlock(&bd->mutex);
+			pr_debug("fifo_write: returning %zd/ENODEV\n", wr_cnt);
+			return wr_cnt ? wr_cnt : -ENODEV;
+		}
+
+		if (bd->tmfifo_error) {
+			mutex_unlock(&bd->mutex);
+			pr_debug("fifo_write: returning %zd/%d\n", wr_cnt,
+				 bd->tmfifo_error);
+			return wr_cnt ? wr_cnt : bd->tmfifo_error;
+		}
+
+		if (write_full(bd, chan)) {
+			pr_debug("fifo_write: fifo full\n");
+			if (nonblock) {
+				mutex_unlock(&bd->mutex);
+				pr_debug("fifo_write: returning %zd/EAGAIN\n",
+					 wr_cnt);
+				return wr_cnt ? wr_cnt : -EAGAIN;
+			}
+
+			mutex_unlock(&bd->mutex);
+			pr_debug("fifo_write: waiting for writable chan %d\n",
+				 chan);
+			if (wait_event_interruptible(
+				     bd->write_fifo[chan].operable,
+					     !write_full(bd, chan))) {
+				pr_debug("fifo_write: returning %zd/ERESTARTSYS\n",
+					 wr_cnt);
+				return wr_cnt ? wr_cnt : -ERESTARTSYS;
+			}
+			mutex_lock(&bd->mutex);
+			/*
+			 * Since we dropped the mutex, we must make
+			 * sure our interface is still there before
+			 * we do anything else.
+			 */
+			continue;
+		}
+
+		spin_lock_irq(&bd->spinlock);
+
+		writesize = min(count, (size_t)write_space(bd, chan));
+		pass1 = min(writesize, (size_t)write_space_to_end(bd, chan));
+		pass2 = writesize - pass1;
+
+		spin_unlock_irq(&bd->spinlock);
+
+		pr_debug("fifo_write: writesize %zd, head %d, tail %d\n",
+			 writesize, bd->write_fifo[chan].head,
+			 bd->write_fifo[chan].tail);
+
+		if (!from_user) {
+			memcpy(write_space_ptr(bd, chan), buffer, pass1);
+			if (pass2) {
+				memcpy(bd->write_fifo[chan].data,
+				       buffer + pass1, pass2);
+			}
+		} else {
+			if (copy_from_user(write_space_ptr(bd, chan), buffer,
+				pass1) || (pass2 &&
+				copy_from_user(bd->write_fifo[chan].data,
+						buffer + pass1, pass2))) {
+				mutex_unlock(&bd->mutex);
+				pr_debug("fifo_write: returns %zd/EFAULT\n",
+					 wr_cnt);
+				return wr_cnt ? wr_cnt : -EFAULT;
+			}
+		}
+
+		spin_lock_irq(&bd->spinlock);
+
+		write_add_bytes(bd, chan, writesize);
+
+		/* We have some new bytes, let's see if we can write any. */
+		rshim_fifo_output(bd);
+
+		spin_unlock_irq(&bd->spinlock);
+
+		count -= writesize;
+		buffer += writesize;
+		wr_cnt += writesize;
+		pr_debug("fifo_write: transferred %zd bytes this pass\n",
+			 writesize);
+	}
+
+	mutex_unlock(&bd->mutex);
+
+	pr_debug("fifo_write: returning %zd\n", wr_cnt);
+	return wr_cnt;
+}
+EXPORT_SYMBOL(rshim_fifo_write);
+
+static int rshim_fifo_fsync(struct file *file, loff_t start, loff_t end,
+			    int datasync, int chan)
+{
+	struct rshim_backend *bd = file->private_data;
+
+	mutex_lock(&bd->mutex);
+
+	/*
+	 * To ensure that all of our data has actually made it to the
+	 * device, we first wait until the channel is empty, then we wait
+	 * until there is no outstanding write urb.
+	 */
+	while (!write_empty(bd, chan))
+		if (wait_event_interruptible(bd->write_fifo[chan].operable,
+					     write_empty(bd, chan))) {
+			mutex_unlock(&bd->mutex);
+			return -ERESTARTSYS;
+		}
+
+	while (bd->spin_flags & RSH_SFLG_WRITING)
+		if (wait_event_interruptible(bd->write_completed,
+					     !(bd->spin_flags &
+					       RSH_SFLG_WRITING))) {
+			mutex_unlock(&bd->mutex);
+			return -ERESTARTSYS;
+		}
+
+	mutex_unlock(&bd->mutex);
+
+	return 0;
+}
+
+static unsigned int rshim_fifo_poll(struct file *file, poll_table *wait,
+				  int chan)
+{
+	struct rshim_backend *bd = file->private_data;
+	unsigned int retval = 0;
+
+	mutex_lock(&bd->mutex);
+
+	poll_wait(file, &bd->read_fifo[chan].operable, wait);
+	poll_wait(file, &bd->write_fifo[chan].operable, wait);
+
+	spin_lock_irq(&bd->spinlock);
+
+	if (!read_empty(bd, chan))
+		retval |= POLLIN | POLLRDNORM;
+	if (!write_full(bd, chan))
+		retval |= POLLOUT | POLLWRNORM;
+	/*
+	 * We don't report POLLERR on the console so that it doesn't get
+	 * automatically disconnected when it fails, and so that you can
+	 * connect to it in the error state before rebooting the target.
+	 * This is inconsistent, but being consistent turns out to be very
+	 * annoying.  If someone tries to actually type on it, they'll
+	 * get an error.
+	 */
+	if (bd->tmfifo_error && chan != TMFIFO_CONS_CHAN)
+		retval |= POLLERR;
+	spin_unlock_irq(&bd->spinlock);
+
+	mutex_unlock(&bd->mutex);
+
+	pr_debug("poll chan %d file %p returns 0x%x\n", chan, file, retval);
+
+	return retval;
+}
+
+
+static int rshim_fifo_release(struct inode *inode, struct file *file,
+			      int chan)
+{
+	struct rshim_backend *bd = file->private_data;
+	struct module *owner;
+
+	mutex_lock(&bd->mutex);
+
+	if (chan == TMFIFO_CONS_CHAN) {
+		/*
+		 * If we aren't the last console file, nothing to do but
+		 * fix the reference count.
+		 */
+		bd->console_opens--;
+		if (bd->console_opens) {
+			mutex_unlock(&bd->mutex);
+			return 0;
+		}
+
+		/*
+		 * We've told the host to stop using the TM FIFO console,
+		 * but there may be a lag before it does.  Unless we
+		 * continue to read data from the console stream, the host
+		 * may spin forever waiting for the console to be drained
+		 * and not realize that it's time to stop using it.
+		 * Clearing the CONS_OPEN spin flag will discard any future
+		 * incoming console data, but if our input buffers are full
+		 * now, we might not be even reading from the hardware
+		 * FIFO.  To avoid problems, clear the buffers and call the
+		 * drainer so that it knows there's space.
+		 */
+		spin_lock_irq(&bd->spinlock);
+
+		bd->spin_flags &= ~RSH_SFLG_CONS_OPEN;
+
+		read_reset(bd, TMFIFO_CONS_CHAN);
+		write_reset(bd, TMFIFO_CONS_CHAN);
+
+		if (bd->has_tm)
+			rshim_fifo_input(bd);
+
+		spin_unlock_irq(&bd->spinlock);
+	}
+
+	if (chan == TMFIFO_CONS_CHAN)
+		bd->is_cons_open = 0;
+	else
+		bd->is_tm_open = 0;
+
+	if (!bd->is_tm_open && !bd->is_cons_open) {
+		if (bd->cancel)
+			bd->cancel(bd, RSH_DEV_TYPE_NET, false);
+
+		spin_lock_irq(&bd->spinlock);
+		bd->spin_flags &= ~RSH_SFLG_READING;
+		spin_unlock_irq(&bd->spinlock);
+	}
+
+	mutex_unlock(&bd->mutex);
+
+	rshim_lock();
+	owner = RSHIM_READ_ONCE(bd->owner);
+	kref_put(&bd->kref, bd->destroy);
+	module_put(owner);
+	rshim_unlock();
+
+	return 0;
+}
+
+/* TMFIFO file operations routines */
+
+static ssize_t rshim_tmfifo_read(struct file *file, char *user_buffer,
+				   size_t count, loff_t *ppos)
+{
+	struct rshim_backend *bd = file->private_data;
+
+	return rshim_fifo_read(bd, user_buffer, count, TMFIFO_NET_CHAN,
+			     file->f_flags & O_NONBLOCK, true);
+}
+
+static ssize_t rshim_tmfifo_write(struct file *file, const char *user_buffer,
+				size_t count, loff_t *ppos)
+{
+	struct rshim_backend *bd = file->private_data;
+
+	return rshim_fifo_write(bd, user_buffer, count, TMFIFO_NET_CHAN,
+			      file->f_flags & O_NONBLOCK, true);
+}
+
+static int rshim_tmfifo_fsync(struct file *file, loff_t start,
+			      loff_t end, int datasync)
+{
+	return rshim_fifo_fsync(file, start, end, datasync, TMFIFO_NET_CHAN);
+}
+
+static unsigned int rshim_tmfifo_poll(struct file *file, poll_table *wait)
+{
+	return rshim_fifo_poll(file, wait, TMFIFO_NET_CHAN);
+}
+
+static int rshim_tmfifo_release(struct inode *inode, struct file *file)
+{
+	return rshim_fifo_release(inode, file, TMFIFO_NET_CHAN);
+}
+
+static const struct file_operations rshim_tmfifo_fops = {
+	.owner = THIS_MODULE,
+	.read = rshim_tmfifo_read,
+	.write = rshim_tmfifo_write,
+	.fsync = rshim_tmfifo_fsync,
+	.poll = rshim_tmfifo_poll,
+	.release = rshim_tmfifo_release,
+};
+
+static int rshim_tmfifo_open(struct file *file)
+{
+	struct rshim_backend *bd = file->private_data;
+
+	file->f_op = &rshim_tmfifo_fops;
+
+	mutex_lock(&bd->mutex);
+
+	if (bd->is_tm_open) {
+		pr_debug("tmfifo_open: file already open\n");
+		mutex_unlock(&bd->mutex);
+		return -EBUSY;
+	}
+
+	bd->is_tm_open = 1;
+
+	spin_lock_irq(&bd->spinlock);
+
+	/* Call the drainer to do an initial read, if needed. */
+	rshim_fifo_input(bd);
+
+	spin_unlock_irq(&bd->spinlock);
+
+	mutex_unlock(&bd->mutex);
+
+	return 0;
+}
+
+/* Console file operations routines */
+
+static void rshim_work_handler(struct work_struct *work)
+{
+	struct rshim_backend *bd = container_of((struct delayed_work *) work,
+					      struct rshim_backend, work);
+
+	mutex_lock(&bd->mutex);
+
+	if (bd->keepalive && bd->has_rshim) {
+		bd->write_rshim(bd, RSHIM_CHANNEL, RSH_SCRATCHPAD1,
+				RSH_KEEPALIVE_MAGIC_NUM);
+		bd->keepalive = 0;
+	}
+
+	if (bd->boot_work_buf != NULL) {
+		bd->boot_work_buf_actual_len = rshim_write_delayed(bd,
+							RSH_DEV_TYPE_BOOT,
+							bd->boot_work_buf,
+							bd->boot_work_buf_len);
+		bd->boot_work_buf = NULL;
+		complete_all(&bd->boot_write_complete);
+	}
+
+	if (bd->is_boot_open) {
+		mutex_unlock(&bd->mutex);
+		return;
+	}
+
+	if (bd->has_fifo_work) {
+		int len;
+
+		len = rshim_write_delayed(bd, bd->fifo_work_devtype,
+					  bd->fifo_work_buf,
+					  bd->fifo_work_buf_len);
+		bd->has_fifo_work = 0;
+
+		spin_lock(&bd->spinlock);
+		bd->spin_flags &= ~RSH_SFLG_WRITING;
+		if (len == bd->fifo_work_buf_len) {
+			wake_up_interruptible_all(&bd->write_completed);
+			rshim_notify(bd, RSH_EVENT_FIFO_OUTPUT, 0);
+		} else {
+			pr_err("fifo_write: completed abnormally.\n");
+			rshim_notify(bd, RSH_EVENT_FIFO_ERR, -1);
+		}
+		spin_unlock(&bd->spinlock);
+	}
+
+	if (bd->has_cons_work) {
+		spin_lock_irq(&bd->spinlock);
+
+		/* FIFO output. */
+		rshim_fifo_output(bd);
+
+		/* FIFO input. */
+		rshim_fifo_input(bd);
+
+		spin_unlock_irq(&bd->spinlock);
+
+		bd->has_cons_work = 0;
+	}
+
+	if (!bd->has_reprobe && bd->is_cons_open) {
+		bd->has_cons_work = 1;
+		mod_timer(&bd->timer, jiffies + HZ / 10);
+	}
+
+	mutex_unlock(&bd->mutex);
+}
+
+static ssize_t rshim_console_read(struct file *file, char *user_buffer,
+				    size_t count, loff_t *ppos)
+{
+	struct rshim_backend *bd = file->private_data;
+
+	return rshim_fifo_read(bd, user_buffer, count, TMFIFO_CONS_CHAN,
+			     file->f_flags & O_NONBLOCK, true);
+}
+
+static ssize_t rshim_console_write(struct file *file, const char *user_buffer,
+				 size_t count, loff_t *ppos)
+{
+	struct rshim_backend *bd = file->private_data;
+
+	return rshim_fifo_write(bd, user_buffer, count, TMFIFO_CONS_CHAN,
+			      file->f_flags & O_NONBLOCK, true);
+}
+
+static int rshim_console_fsync(struct file *file, loff_t start,
+			       loff_t end, int datasync)
+{
+	return rshim_fifo_fsync(file, start, end, datasync, TMFIFO_CONS_CHAN);
+}
+
+static long rshim_console_unlocked_ioctl(struct file *file, unsigned int
+				       cmd, unsigned long arg)
+{
+	struct rshim_backend *bd = file->private_data;
+	int retval = 0;
+
+	mutex_lock(&bd->mutex);
+
+	switch (cmd) {
+	case TCGETS: {
+#ifdef TCGETS2
+		if (kernel_termios_to_user_termios_1(
+			(struct termios __user *)arg, &bd->cons_termios))
+#else
+		if (kernel_termios_to_user_termios(
+			(struct termios __user *)arg, &bd->cons_termios))
+#endif
+			retval = -EFAULT;
+		break;
+	}
+
+	case TCSETS:
+	case TCSETSW:
+	case TCSETSF: {
+#ifdef TCGETS2
+		if (user_termios_to_kernel_termios_1(
+			&bd->cons_termios, (struct termios __user *)arg))
+#else
+		if (user_termios_to_kernel_termios(
+			&bd->cons_termios, (struct termios __user *)arg))
+#endif
+			retval = -EFAULT;
+		break;
+	}
+
+	default:
+		retval = -EINVAL;
+		break;
+	}
+
+	mutex_unlock(&bd->mutex);
+
+	return retval;
+}
+
+static unsigned int rshim_console_poll(struct file *file, poll_table *wait)
+{
+	return rshim_fifo_poll(file, wait, TMFIFO_CONS_CHAN);
+}
+
+static int rshim_console_release(struct inode *inode, struct file *file)
+{
+	return rshim_fifo_release(inode, file, TMFIFO_CONS_CHAN);
+}
+
+static const struct file_operations rshim_console_fops = {
+	.owner = THIS_MODULE,
+	.read = rshim_console_read,
+	.write = rshim_console_write,
+	.fsync = rshim_console_fsync,
+	.unlocked_ioctl = rshim_console_unlocked_ioctl,
+	.poll = rshim_console_poll,
+	.release = rshim_console_release,
+};
+
+static int rshim_console_open(struct file *file)
+{
+	struct rshim_backend *bd = file->private_data;
+
+	file->f_op = &rshim_console_fops;
+
+	mutex_lock(&bd->mutex);
+
+	if (bd->is_cons_open) {
+		/*
+		 * The console is already open.  This is OK, but it means
+		 * there's no work to do other than updating the reference
+		 * count.
+		 */
+		bd->console_opens++;
+		mutex_unlock(&bd->mutex);
+		return 0;
+	}
+
+	bd->is_cons_open = 1;
+
+	spin_lock_irq(&bd->spinlock);
+
+	bd->spin_flags |= RSH_SFLG_CONS_OPEN;
+
+	spin_unlock_irq(&bd->spinlock);
+
+	if (!bd->has_cons_work) {
+		bd->has_cons_work = 1;
+		queue_delayed_work(rshim_wq, &bd->work, HZ / 10);
+	}
+
+	bd->console_opens++;
+	mutex_unlock(&bd->mutex);
+
+	return 0;
+}
+
+static int rshim_boot_done(struct rshim_backend *bd)
+{
+	if (bd->has_rshim && bd->has_tm) {
+		/* Clear any previous errors. */
+		bd->tmfifo_error = 0;
+
+		/*
+		 * If someone might be waiting for the device to come up,
+		 * tell them it's ready.
+		 */
+		if (bd->is_booting) {
+			bd->is_booting = 0;
+
+			pr_debug("signaling booting complete\n");
+			complete_all(&bd->booting_complete);
+#if RSH_RESET_MUTEX
+			complete_all(&bd->reset_complete);
+#endif
+		};
+
+		/* If the console device is open, start the worker. */
+		if (bd->is_cons_open && !bd->has_cons_work) {
+			bd->has_cons_work = 1;
+			pr_debug("probe: console_work submitted\n");
+			queue_delayed_work(rshim_wq, &bd->work, 0);
+		}
+
+		/* Tell the user this device is now attached. */
+		pr_info("%s now attached\n", rshim_dev_names[bd->dev_index]);
+	}
+
+	return 0;
+}
+
+/* Rshim file operations routines */
+
+static ssize_t rshim_rshim_read(struct file *file, char *user_buffer,
+			      size_t count, loff_t *ppos)
+{
+	struct rshim_backend *bd;
+	int retval = 0;
+	u64 buf;
+
+	/* rshim registers are all 8-byte aligned. */
+	if (count != 8 || (*ppos & 7) != 0)
+		return -EINVAL;
+
+	bd = file->private_data;
+
+	mutex_lock(&bd->mutex);
+	retval = bd->read_rshim(bd,
+				(*ppos >> 16) & 0xF, /* channel # */
+				*ppos & 0xFFFF,	 /* addr */
+				&buf);
+	mutex_unlock(&bd->mutex);
+
+	/* If the read was successful, copy the data to userspace */
+	if (!retval && copy_to_user(user_buffer, &buf, count))
+		return -EFAULT;
+
+	return retval ? retval : count;
+}
+
+static ssize_t rshim_rshim_write(struct file *file, const char *user_buffer,
+			       size_t count, loff_t *ppos)
+{
+	struct rshim_backend *bd;
+	int retval = 0;
+	u64 buf;
+
+	/* rshim registers are all 8-byte aligned. */
+	if (count != 8 || (*ppos & 7) != 0)
+		return -EINVAL;
+
+	/* Copy the data from userspace */
+	if (copy_from_user(&buf, user_buffer, count))
+		return -EFAULT;
+
+	bd = file->private_data;
+
+	mutex_lock(&bd->mutex);
+	retval = bd->write_rshim(bd,
+				 (*ppos >> 16) & 0xF, /* channel # */
+				 *ppos & 0xFFFF, /* addr */
+				 buf);
+	mutex_unlock(&bd->mutex);
+
+	return retval ? retval : count;
+}
+
+static int rshim_rshim_release(struct inode *inode, struct file *file)
+{
+	struct rshim_backend *bd = file->private_data;
+	struct module *owner;
+
+	rshim_lock();
+	owner = RSHIM_READ_ONCE(bd->owner);
+	kref_put(&bd->kref, bd->destroy);
+	module_put(owner);
+	rshim_unlock();
+
+	return 0;
+}
+
+static const struct file_operations rshim_rshim_fops = {
+	.owner = THIS_MODULE,
+	.read = rshim_rshim_read,
+	.write = rshim_rshim_write,
+	.release = rshim_rshim_release,
+	.llseek = default_llseek,
+};
+
+static int rshim_rshim_open(struct file *file)
+{
+	file->f_op = &rshim_rshim_fops;
+
+	return 0;
+}
+
+/* Misc file operations routines */
+
+static int
+rshim_misc_seq_show(struct seq_file *s, void *token)
+{
+	struct rshim_backend *bd = s->private;
+	int retval;
+	u64 value;
+
+	/* Boot mode. */
+	retval = bd->read_rshim(bd, RSHIM_CHANNEL, RSH_BOOT_CONTROL,
+				&value);
+	if (retval) {
+		pr_err("couldn't read rshim register\n");
+		return retval;
+	}
+	seq_printf(s, "BOOT_MODE %lld\n",
+		   value & RSH_BOOT_CONTROL__BOOT_MODE_MASK);
+
+	/* SW reset flag is always 0. */
+	seq_printf(s, "SW_RESET  %d\n", 0);
+
+	/* Display the driver name. */
+	seq_printf(s, "DRV_NAME  %s\n", bd->owner->name);
+
+	return 0;
+}
+
+static ssize_t rshim_misc_write(struct file *file, const char *user_buffer,
+				size_t count, loff_t *ppos)
+{
+	struct rshim_backend *bd;
+	int retval = 0, value;
+	char buf[64], key[32];
+
+	if (*ppos != 0 || count >= sizeof(buf))
+		return -EINVAL;
+
+	/* Copy the data from userspace */
+	if (copy_from_user(buf, user_buffer, count))
+		return -EFAULT;
+
+	if (sscanf(buf, "%s %x", key, &value) != 2)
+		return -EINVAL;
+
+	bd = ((struct seq_file *)file->private_data)->private;
+
+	if (strcmp(key, "BOOT_MODE") == 0) {
+		retval = bd->write_rshim(bd, RSHIM_CHANNEL, RSH_BOOT_CONTROL,
+				 value & RSH_BOOT_CONTROL__BOOT_MODE_MASK);
+	} else if (strcmp(key, "SW_RESET") == 0) {
+		if (value) {
+			if (!bd->has_reprobe) {
+				/* Detach, which shouldn't hold bd->mutex. */
+				rshim_notify(bd, RSH_EVENT_DETACH, 0);
+
+				mutex_lock(&bd->mutex);
+				/* Reset the TmFifo. */
+				rshim_fifo_reset(bd);
+				mutex_unlock(&bd->mutex);
+			}
+
+			retval = bd->write_rshim(bd, RSHIM_CHANNEL,
+					RSH_RESET_CONTROL,
+					RSH_RESET_CONTROL__RESET_CHIP_VAL_KEY);
+
+			if (!bd->has_reprobe) {
+				/* Attach. */
+				msleep_interruptible(1000);
+				mutex_lock(&bd->mutex);
+				rshim_notify(bd, RSH_EVENT_ATTACH, 0);
+				mutex_unlock(&bd->mutex);
+			}
+		}
+	} else
+		return -EINVAL;
+
+	return retval ? retval : count;
+}
+
+static int rshim_misc_release(struct inode *inode, struct file *file)
+{
+	struct rshim_backend *bd;
+	struct module *owner;
+	int retval;
+
+	/*
+	 * Note that since this got turned into a seq file by
+	 * rshim_misc_open(), our device pointer isn't in the usual spot
+	 * (the file's private data); that's used by the seq file
+	 * subsystem.
+	 */
+	bd = ((struct seq_file *)file->private_data)->private;
+
+	retval = single_release(inode, file);
+	if (retval)
+		return retval;
+
+	rshim_lock();
+	owner = RSHIM_READ_ONCE(bd->owner);
+	kref_put(&bd->kref, bd->destroy);
+	module_put(owner);
+	rshim_unlock();
+
+	return 0;
+}
+
+static const struct file_operations rshim_misc_fops = {
+	.owner = THIS_MODULE,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.write = rshim_misc_write,
+	.release = rshim_misc_release,
+};
+
+static int rshim_misc_open(struct file *file)
+{
+	struct rshim_backend *bd = file->private_data;
+	int retval;
+
+	/*
+	 * If file->private_data is non-NULL, seq_open (called by
+	 * single_open) thinks it's already a seq_file struct, and
+	 * scribbles over it!  Very bad.
+	 */
+	file->private_data = NULL;
+
+	file->f_op = &rshim_misc_fops;
+	retval = single_open(file, rshim_misc_seq_show, bd);
+
+	return retval;
+}
+
+/* Common file operations routines */
+
+static int rshim_open(struct inode *inode, struct file *file)
+{
+	struct rshim_backend *bd;
+	int subminor = iminor(inode);
+	int retval;
+
+	rshim_lock();
+
+	bd = rshim_devs[subminor / RSH_DEV_TYPES];
+	if (!bd) {
+		rshim_unlock();
+		return -ENODEV;
+	}
+
+	/* Add a reference to the owner. */
+	if (!try_module_get(bd->owner)) {
+		rshim_unlock();
+		return -ENODEV;
+	}
+
+	/* Increment our usage count for the device. */
+	kref_get(&bd->kref);
+
+	rshim_unlock();
+
+	file->private_data = bd;
+
+	switch (subminor % RSH_DEV_TYPES) {
+	case RSH_DEV_TYPE_BOOT:
+		retval = rshim_boot_open(file);
+		break;
+
+	case RSH_DEV_TYPE_RSHIM:
+		retval = rshim_rshim_open(file);
+		break;
+
+	case RSH_DEV_TYPE_CONSOLE:
+		retval = rshim_console_open(file);
+		break;
+
+	case RSH_DEV_TYPE_NET:
+		retval = rshim_tmfifo_open(file);
+		break;
+
+	case RSH_DEV_TYPE_MISC:
+		retval = rshim_misc_open(file);
+		break;
+
+	default:
+		retval = -ENODEV;
+		break;
+	}
+
+	/* If the minor open failed, drop the usage count. */
+	if (retval < 0) {
+		struct module *owner;
+
+		rshim_lock();
+		owner = RSHIM_READ_ONCE(bd->owner);
+		kref_put(&bd->kref, bd->destroy);
+		module_put(owner);
+		rshim_unlock();
+	}
+
+	return retval;
+}
+
+static const struct file_operations rshim_fops = {
+	.owner = THIS_MODULE,
+	.open =	rshim_open,
+};
+
+int rshim_tmfifo_sync(struct rshim_backend *bd)
+{
+	u64 word;
+	int i, retval, max_size, avail;
+	union rshim_tmfifo_msg_hdr hdr;
+
+	/* Get FIFO max size. */
+	retval = bd->read_rshim(bd, RSHIM_CHANNEL,
+				RSH_TM_HOST_TO_TILE_CTL, &word);
+	if (retval < 0) {
+		pr_err("read_rshim error %d\n", retval);
+		return retval;
+	}
+	max_size = (word >> RSH_TM_HOST_TO_TILE_CTL__MAX_ENTRIES_SHIFT)
+		   & RSH_TM_HOST_TO_TILE_CTL__MAX_ENTRIES_RMASK;
+
+	/* Calculate available size. */
+	retval = bd->read_rshim(bd, RSHIM_CHANNEL, RSH_TM_HOST_TO_TILE_STS,
+				&word);
+	if (retval < 0) {
+		pr_err("read_rshim error %d\n", retval);
+		return retval;
+	}
+	avail = max_size - (int)(word & RSH_TM_HOST_TO_TILE_STS__COUNT_MASK);
+
+	if (avail > TMFIFO_MAX_SYNC_WORDS)
+		avail = TMFIFO_MAX_SYNC_WORDS;
+
+	hdr.type = VIRTIO_ID_NET;
+	hdr.len = 0;
+	for (i = 0; i < avail; i++) {
+		retval = bd->write_rshim(bd, RSHIM_CHANNEL,
+					 RSH_TM_HOST_TO_TILE_STS, hdr.data);
+		if (retval < 0)
+			break;
+	}
+
+	return 0;
+}
+
+int rshim_notify(struct rshim_backend *bd, int event, int code)
+{
+	int i, rc = 0;
+	struct rshim_service *svc;
+
+	switch (event) {
+	case RSH_EVENT_FIFO_INPUT:
+		rshim_fifo_input(bd);
+		break;
+
+	case RSH_EVENT_FIFO_OUTPUT:
+		rshim_fifo_output(bd);
+		break;
+
+	case RSH_EVENT_FIFO_ERR:
+		rshim_fifo_err(bd, code);
+		break;
+
+	case RSH_EVENT_ATTACH:
+		rshim_boot_done(bd);
+
+		/* Sync-up the tmfifo if reprobe is not supported. */
+		if (!bd->has_reprobe && bd->has_rshim)
+			rshim_tmfifo_sync(bd);
+
+		rcu_read_lock();
+		for (i = 0; i < RSH_SVC_MAX; i++) {
+			svc = rcu_dereference(rshim_svc[i]);
+			if (svc != NULL && svc->create != NULL) {
+				rc = (*svc->create)(bd);
+				if (rc == -EEXIST)
+					rc = 0;
+				else if (rc) {
+					pr_err("Failed to attach svc %d\n", i);
+					break;
+				}
+			}
+		}
+		rcu_read_unlock();
+
+		spin_lock_irq(&bd->spinlock);
+		rshim_fifo_input(bd);
+		spin_unlock_irq(&bd->spinlock);
+		break;
+
+	case RSH_EVENT_DETACH:
+		for (i = 0; i < RSH_SVC_MAX; i++) {
+			/*
+			 * The svc->delete() could call into Linux kernel and
+			 * potentially trigger synchronize_rcu(). So it should
+			 * be outside of the rcu_read_lock(). Instead, a ref
+			 * counter is used here to avoid race condition between
+			 * svc deletion such as caused by kernel module unload.
+			 */
+			rcu_read_lock();
+			svc = rcu_dereference(rshim_svc[i]);
+			if (svc != NULL)
+				atomic_inc(&svc->ref);
+			rcu_read_unlock();
+
+			if (svc != NULL) {
+				(*svc->delete)(bd);
+				atomic_dec(&svc->ref);
+			}
+		}
+		bd->dev = NULL;
+		break;
+	}
+
+	return rc;
+}
+EXPORT_SYMBOL(rshim_notify);
+
+static int rshim_find_index(char *dev_name)
+{
+	int i, dev_index = -1;
+
+	/* First look for a match with a previous device name. */
+	for (i = 0; i < rshim_nr_devs; i++)
+		if (rshim_dev_names[i] &&
+		    !strcmp(dev_name, rshim_dev_names[i])) {
+			pr_debug("found match with previous at index %d\n", i);
+			dev_index = i;
+			break;
+		}
+
+	/* Then look for a never-used slot. */
+	if (dev_index < 0) {
+		for (i = 0; i < rshim_nr_devs; i++)
+			if (!rshim_dev_names[i]) {
+				pr_debug("found never-used slot %d\n", i);
+				dev_index = i;
+				break;
+			}
+	}
+
+	/* Finally look for a currently-unused slot. */
+	if (dev_index < 0) {
+		for (i = 0; i < rshim_nr_devs; i++)
+			if (!rshim_devs[i]) {
+				pr_debug("found unused slot %d\n", i);
+				dev_index = i;
+				break;
+			}
+	}
+
+	return dev_index;
+}
+
+struct rshim_backend *rshim_find(char *dev_name)
+{
+	int dev_index = rshim_find_index(dev_name);
+
+	/* If none of that worked, we fail. */
+	if (dev_index < 0) {
+		pr_err("couldn't find slot for new device %s\n", dev_name);
+		return NULL;
+	}
+
+	return rshim_devs[dev_index];
+}
+EXPORT_SYMBOL(rshim_find);
+
+/* House-keeping timer. */
+static void rshim_timer_func(struct timer_list *arg)
+{
+	struct rshim_backend *bd =
+	  container_of(arg, struct rshim_backend, timer);
+
+	u32 period = msecs_to_jiffies(rshim_keepalive_period);
+
+	if (bd->has_cons_work)
+		queue_delayed_work(rshim_wq, &bd->work, 0);
+
+	/* Request keepalive update and restart the ~300ms timer. */
+	if (time_after(jiffies, (unsigned long)bd->last_keepalive + period)) {
+		bd->keepalive = 1;
+		bd->last_keepalive = jiffies;
+		queue_delayed_work(rshim_wq, &bd->work, 0);
+	}
+	mod_timer(&bd->timer, jiffies + period);
+}
+
+static ssize_t rshim_path_show(struct device *cdev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct rshim_backend *bd = dev_get_drvdata(cdev);
+
+	if (bd == NULL)
+		return -ENODEV;
+	return snprintf(buf, PAGE_SIZE, "%s\n",
+			rshim_dev_names[bd->dev_index]);
+}
+
+static DEVICE_ATTR(rshim_path, 0444, rshim_path_show, NULL);
+
+static void
+rshim_load_modules(struct work_struct *work)
+{
+	request_module("rshim_net");
+}
+
+static DECLARE_DELAYED_WORK(rshim_load_modules_work, rshim_load_modules);
+
+/* Check whether backend is allowed to register or not. */
+static int rshim_access_check(struct rshim_backend *bd)
+{
+	int i, retval;
+	u64 value;
+
+	/* Write value 0 to RSH_SCRATCHPAD1. */
+	retval = bd->write_rshim(bd, RSHIM_CHANNEL, RSH_SCRATCHPAD1, 0);
+	if (retval < 0)
+		return -ENODEV;
+
+	/*
+	 * Poll RSH_SCRATCHPAD1 up to one second to check whether it's reset to
+	 * the keepalive magic value, which indicates another backend driver has
+	 * already attached to this target.
+	 */
+	for (i = 0; i < 10; i++) {
+		retval = bd->read_rshim(bd, RSHIM_CHANNEL, RSH_SCRATCHPAD1,
+					&value);
+		if (retval < 0)
+			return -ENODEV;
+
+		if (value == RSH_KEEPALIVE_MAGIC_NUM) {
+			pr_info("another backend already attached.\n");
+			return -EEXIST;
+		}
+
+		msleep(100);
+	}
+
+	return 0;
+}
+
+int rshim_register(struct rshim_backend *bd)
+{
+	int i, retval, dev_index;
+
+	if (bd->registered)
+		return 0;
+
+	if (backend_driver[0] && strcmp(backend_driver, bd->owner->name))
+		return -EACCES;
+
+	dev_index = rshim_find_index(bd->dev_name);
+	if (dev_index < 0)
+		return -ENODEV;
+
+	if (!bd->read_rshim || !bd->write_rshim) {
+		pr_err("read_rshim/write_rshim missing\n");
+		return -EINVAL;
+	}
+
+	retval = rshim_access_check(bd);
+	if (retval)
+		return retval;
+
+	if (!bd->write)
+		bd->write = rshim_write_default;
+	if (!bd->read)
+		bd->read = rshim_read_default;
+
+	kref_init(&bd->kref);
+	spin_lock_init(&bd->spinlock);
+#if RSH_RESET_MUTEX
+	init_completion(&bd->reset_complete);
+#endif
+	for (i = 0; i < TMFIFO_MAX_CHAN; i++) {
+		init_waitqueue_head(&bd->read_fifo[i].operable);
+		init_waitqueue_head(&bd->write_fifo[i].operable);
+	}
+
+	init_waitqueue_head(&bd->write_completed);
+	init_completion(&bd->booting_complete);
+	init_completion(&bd->boot_write_complete);
+	memcpy(&bd->cons_termios, &init_console_termios,
+	       sizeof(init_console_termios));
+	INIT_DELAYED_WORK(&bd->work, rshim_work_handler);
+
+	bd->dev_index = dev_index;
+	if (rshim_dev_names[dev_index] != bd->dev_name) {
+		kfree(rshim_dev_names[dev_index]);
+		rshim_dev_names[dev_index] = bd->dev_name;
+	}
+	rshim_devs[dev_index] = bd;
+
+	for (i = 0; i < RSH_DEV_TYPES; i++) {
+		struct device *cl_dev;
+		int err;
+		char devbuf[32];
+
+		cdev_init(&bd->cdevs[i], &rshim_fops);
+		bd->cdevs[i].owner = THIS_MODULE;
+		/*
+		 * FIXME: is this addition really legal, or should
+		 * we be using MKDEV?
+		 */
+		err = cdev_add(&bd->cdevs[i],
+			       rshim_dev_base +
+			       bd->dev_index * RSH_DEV_TYPES + i,
+			       1);
+		/*
+		 * We complain if this fails, but we don't return
+		 * an error; it really shouldn't happen, and it's
+		 * hard to go un-do the rest of the adds.
+		 */
+		if (err)
+			pr_err("rsh%d: couldn't add minor %d\n", dev_index, i);
+
+		cl_dev = device_create(rshim_class, NULL, rshim_dev_base +
+				       bd->dev_index * RSH_DEV_TYPES + i, NULL,
+				       "rshim%d!%s",
+				       bd->dev_index, rshim_dev_minor_names[i]);
+		if (IS_ERR(cl_dev)) {
+			pr_err("rsh%d: couldn't add dev %s, err %ld\n",
+			       dev_index,
+			       format_dev_t(devbuf, rshim_dev_base + dev_index *
+					    RSH_DEV_TYPES + i),
+			       PTR_ERR(cl_dev));
+		} else {
+			pr_debug("added class dev %s\n",
+				 format_dev_t(devbuf, rshim_dev_base +
+					      bd->dev_index *
+					      RSH_DEV_TYPES + i));
+		}
+
+		dev_set_drvdata(cl_dev, bd);
+		if (device_create_file(cl_dev, &dev_attr_rshim_path))
+			pr_err("could not create rshim_path file in sysfs\n");
+	}
+
+	for (i = 0; i < 2; i++) {
+		bd->boot_buf[i] = kmalloc(BOOT_BUF_SIZE, GFP_KERNEL);
+		if (!bd->boot_buf[i]) {
+			if (i == 1) {
+				kfree(bd->boot_buf[0]);
+				bd->boot_buf[0] = NULL;
+			}
+		}
+	}
+
+	timer_setup(&bd->timer, rshim_timer_func, 0);
+
+	bd->registered = 1;
+
+	/* Start the keepalive timer. */
+	bd->last_keepalive = jiffies;
+	mod_timer(&bd->timer, jiffies + 1);
+
+	schedule_delayed_work(&rshim_load_modules_work, 3 * HZ);
+
+	return 0;
+}
+EXPORT_SYMBOL(rshim_register);
+
+void rshim_deregister(struct rshim_backend *bd)
+{
+	int i;
+
+	if (!bd->registered)
+		return;
+
+	/* Stop the timer. */
+	del_timer_sync(&bd->timer);
+
+	for (i = 0; i < 2; i++)
+		kfree(bd->boot_buf[i]);
+
+	for (i = 0; i < RSH_DEV_TYPES; i++) {
+		cdev_del(&bd->cdevs[i]);
+		device_destroy(rshim_class,
+			       rshim_dev_base + bd->dev_index *
+			       RSH_DEV_TYPES + i);
+	}
+
+	rshim_devs[bd->dev_index] = NULL;
+	bd->registered = 0;
+}
+EXPORT_SYMBOL(rshim_deregister);
+
+int rshim_register_service(struct rshim_service *service)
+{
+	int i, retval = 0;
+	struct rshim_service *svc;
+
+	rshim_lock();
+
+	atomic_set(&service->ref, 0);
+
+	BUG_ON(service->type >= RSH_SVC_MAX);
+
+	if (!rshim_svc[service->type]) {
+		svc = kmalloc(sizeof(*svc), GFP_KERNEL);
+		if (svc) {
+			memcpy(svc, service, sizeof(*svc));
+			/*
+			 * Add memory barrir to make sure 'svc' is ready
+			 * before switching the pointer.
+			 */
+			smp_mb();
+
+			/*
+			 * rshim_svc[] is protected by RCU. References to it
+			 * should have rcu_read_lock() / rcu_dereference() /
+			 * rcu_read_lock().
+			 */
+			rcu_assign_pointer(rshim_svc[service->type], svc);
+
+			/* Attach the service to all backends. */
+			for (i = 0; i < rshim_nr_devs; i++) {
+				if (rshim_devs[i] != NULL) {
+					retval = svc->create(rshim_devs[i]);
+					if (retval && retval != -EEXIST)
+						break;
+				}
+			}
+		} else
+			retval = -ENOMEM;
+	} else
+		retval = -EEXIST;
+
+	rshim_unlock();
+
+	/* Deregister / cleanup the service in case of failures. */
+	if (retval && retval != -EEXIST)
+		rshim_deregister_service(service);
+
+	return retval;
+}
+EXPORT_SYMBOL(rshim_register_service);
+
+void rshim_deregister_service(struct rshim_service *service)
+{
+	int i;
+	struct rshim_service *svc = NULL;
+
+	BUG_ON(service->type >= RSH_SVC_MAX);
+
+	/*
+	 * Use synchronize_rcu() to make sure no more outstanding
+	 * references to the 'svc' pointer before releasing it.
+	 *
+	 * The reason to use RCU is that the rshim_svc pointer will be
+	 * accessed in rshim_notify() which could be called in interrupt
+	 * context and not suitable for mutex lock.
+	 */
+	rshim_lock();
+	if (rshim_svc[service->type]) {
+		svc = rshim_svc[service->type];
+
+		/* Delete the service from all backends. */
+		for (i = 0; i < rshim_nr_devs; i++)
+			if (rshim_devs[i] != NULL)
+				svc->delete(rshim_devs[i]);
+
+		rcu_assign_pointer(rshim_svc[service->type], NULL);
+	}
+	rshim_unlock();
+	if (svc != NULL) {
+		synchronize_rcu();
+
+		/* Make sure no more references to the svc pointer. */
+		while (atomic_read(&svc->ref) != 0)
+			msleep(100);
+		kfree(svc);
+	}
+}
+EXPORT_SYMBOL(rshim_deregister_service);
+
+static int __init rshim_init(void)
+{
+	int result, class_registered = 0;
+
+	/* Register our device class. */
+	rshim_class = class_create(THIS_MODULE, "rsh");
+	if (IS_ERR(rshim_class)) {
+		result = PTR_ERR(rshim_class);
+		goto error;
+	}
+	class_registered = 1;
+
+	/* Allocate major/minor numbers. */
+	result = alloc_chrdev_region(&rshim_dev_base, 0,
+				     rshim_nr_devs * RSH_DEV_TYPES,
+				     "rsh");
+	if (result < 0) {
+		pr_err("can't get rshim major\n");
+		goto error;
+	}
+
+	rshim_dev_names = kzalloc(rshim_nr_devs *
+				    sizeof(rshim_dev_names[0]), GFP_KERNEL);
+	rshim_devs = kcalloc(rshim_nr_devs, sizeof(rshim_devs[0]),
+			       GFP_KERNEL);
+
+	if (!rshim_dev_names || !rshim_devs) {
+		result = -ENOMEM;
+		goto error;
+	}
+
+	rshim_wq = create_workqueue("rshim");
+	if (!rshim_wq) {
+		result = -ENOMEM;
+		goto error;
+	}
+
+	return 0;
+
+error:
+	if (rshim_dev_base)
+		unregister_chrdev_region(rshim_dev_base,
+				 rshim_nr_devs * RSH_DEV_TYPES);
+	if (class_registered)
+		class_destroy(rshim_class);
+	kfree(rshim_dev_names);
+	kfree(rshim_devs);
+
+	return result;
+}
+
+static void __exit rshim_exit(void)
+{
+	int i;
+
+	flush_delayed_work(&rshim_load_modules_work);
+
+	/* Free the major/minor numbers. */
+	unregister_chrdev_region(rshim_dev_base,
+				 rshim_nr_devs * RSH_DEV_TYPES);
+
+	/* Destroy our device class. */
+	class_destroy(rshim_class);
+
+	/* Destroy our work queue. */
+	destroy_workqueue(rshim_wq);
+
+	for (i = 0; i < RSH_SVC_MAX; i++)
+		kfree(rshim_svc[i]);
+
+	for (i = 0; i < rshim_nr_devs; i++)
+		kfree(rshim_dev_names[i]);
+
+	kfree(rshim_dev_names);
+	kfree(rshim_devs);
+}
+
+module_init(rshim_init);
+module_exit(rshim_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mellanox Technologies");
+MODULE_VERSION("0.12");
diff --git a/drivers/soc/mellanox/host/rshim.h b/drivers/soc/mellanox/host/rshim.h
new file mode 100644
index 0000000..3ac3410
--- /dev/null
+++ b/drivers/soc/mellanox/host/rshim.h
@@ -0,0 +1,361 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright 2017 Mellanox Technologies. All Rights Reserved.
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful, but
+ *   WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
+ *   NON INFRINGEMENT.  See the GNU General Public License for
+ *   more details.
+ */
+
+#ifndef _RSHIM_H
+#define _RSHIM_H
+
+#include <linux/kernel.h>
+#include <linux/kref.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/termios.h>
+#include <linux/workqueue.h>
+#include <linux/device.h>
+#include <linux/cdev.h>
+
+#include "rshim_regs.h"
+
+/* ACCESS_ONCE() wrapper. */
+#define RSHIM_READ_ONCE(x)	READ_ONCE(x)
+
+/*
+ * This forces only one reset to occur at a time.  Once we've gotten
+ * more experience with this mode we'll probably remove the #define.
+ */
+#define RSH_RESET_MUTEX		1
+
+/* Spin flag values. */
+#define RSH_SFLG_READING	0x1  /* read is active. */
+#define RSH_SFLG_WRITING	0x2  /* write_urb is active. */
+#define RSH_SFLG_CONS_OPEN	0x4  /* console stream is open. */
+
+/*
+ * Buffer/FIFO sizes.  Note that the FIFO sizes must be powers of 2; also,
+ * the read and write buffers must be no larger than the corresponding
+ * FIFOs.
+ */
+#define READ_BUF_SIZE		2048
+#define WRITE_BUF_SIZE		2048
+#define READ_FIFO_SIZE		(4 * 1024)
+#define WRITE_FIFO_SIZE		(4 * 1024)
+#define BOOT_BUF_SIZE		(16 * 1024)
+
+/* Sub-device types. */
+enum {
+	RSH_DEV_TYPE_RSHIM,
+	RSH_DEV_TYPE_BOOT,
+	RSH_DEV_TYPE_CONSOLE,
+	RSH_DEV_TYPE_NET,
+	RSH_DEV_TYPE_MISC,
+	RSH_DEV_TYPES
+};
+
+/* Event types used in rshim_notify(). */
+enum {
+	RSH_EVENT_FIFO_INPUT,		/* fifo ready for input */
+	RSH_EVENT_FIFO_OUTPUT,		/* fifo ready for output */
+	RSH_EVENT_FIFO_ERR,		/* fifo error */
+	RSH_EVENT_ATTACH,		/* backend attaching */
+	RSH_EVENT_DETACH,		/* backend detaching */
+};
+
+/* RShim service types. */
+enum {
+	RSH_SVC_NET,			/* networking service */
+	RSH_SVC_MAX
+};
+
+/* TMFIFO message header. */
+union rshim_tmfifo_msg_hdr {
+	struct {
+		u8 type;		/* message type */
+		__be16 len;		/* payload length */
+		u8 unused[5];		/* reserved, set to 0 */
+	} __packed;
+	u64 data;
+};
+
+/* TMFIFO demux channels. */
+enum {
+	TMFIFO_CONS_CHAN,	/* Console */
+	TMFIFO_NET_CHAN,	/* Network */
+	TMFIFO_MAX_CHAN		/* Number of channels */
+};
+
+/* Various rshim definitions. */
+#define RSH_INT_VEC0_RTC__SWINT3_MASK 0x8
+
+#define RSH_BYTE_ACC_READ_TRIGGER 0x50000000
+#define RSH_BYTE_ACC_SIZE 0x10000000
+#define RSH_BYTE_ACC_PENDING 0x20000000
+
+
+#define BOOT_CHANNEL        RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_BOOT
+#define RSHIM_CHANNEL       RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_RSHIM
+#define UART0_CHANNEL       RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_UART0
+#define UART1_CHANNEL       RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_UART1
+
+#define RSH_BOOT_FIFO_SIZE   512
+
+/* FIFO structure. */
+struct rshim_fifo {
+	unsigned char *data;
+	unsigned int head;
+	unsigned int tail;
+	wait_queue_head_t operable;
+};
+
+/* RShim backend. */
+struct rshim_backend {
+	/* Device name. */
+	char *dev_name;
+
+	/* Backend owner. */
+	struct module *owner;
+
+	/* Pointer to the backend device. */
+	struct device *dev;
+
+	/* Pointer to the net device. */
+	void *net;
+
+	/* House-keeping Timer. */
+	struct timer_list timer;
+
+	/* Character device structure for each device. */
+	struct cdev cdevs[RSH_DEV_TYPES];
+
+	/*
+	 * The reference count for this structure.  This is incremented by
+	 * each open, and by the probe routine (thus, one reference for
+	 * each of the two interfaces).  It's decremented on each release,
+	 * and on each disconnect.
+	 */
+	struct kref kref;
+
+	/* State flags. */
+	u32 is_booting : 1;        /* Waiting for device to come back. */
+	u32 is_boot_open : 1;      /* Boot device is open. */
+	u32 is_tm_open : 1;        /* TM FIFO device is open. */
+	u32 is_cons_open : 1;      /* Console device is open. */
+	u32 is_in_boot_write : 1;  /* A thread is in boot_write(). */
+	u32 has_cons_work : 1;     /* Console worker thread running. */
+	u32 has_debug : 1;         /* Debug enabled for this device. */
+	u32 has_tm : 1;            /* TM FIFO found. */
+	u32 has_rshim : 1;         /* RSHIM found. */
+	u32 has_fifo_work : 1;     /* FIFO output to be done in worker. */
+	u32 has_reprobe : 1;       /* Reprobe support after SW reset. */
+	u32 drop : 1;              /* Drop the rest of the packet. */
+	u32 registered : 1;        /* Backend has been registered. */
+	u32 keepalive : 1;         /* A flag to update keepalive. */
+
+	/* Jiffies of last keepalive. */
+	u64 last_keepalive;
+
+	/* State flag bits from RSH_SFLG_xxx (see above). */
+	int spin_flags;
+
+	/* Total bytes in the read buffer. */
+	int read_buf_bytes;
+	/* Offset of next unread byte in the read buffer. */
+	int read_buf_next;
+	/* Bytes left in the current packet, or 0 if no current packet. */
+	int read_buf_pkt_rem;
+	/* Padded bytes in the read buffer. */
+	int read_buf_pkt_padding;
+
+	/* Bytes left in the current packet pending to write. */
+	int write_buf_pkt_rem;
+
+	/* Current message header. */
+	union rshim_tmfifo_msg_hdr msg_hdr;
+
+	/* Read FIFOs. */
+	struct rshim_fifo read_fifo[TMFIFO_MAX_CHAN];
+
+	/* Write FIFOs. */
+	struct rshim_fifo write_fifo[TMFIFO_MAX_CHAN];
+
+	/* Read buffer.  This is a DMA'able buffer. */
+	unsigned char *read_buf;
+	dma_addr_t read_buf_dma;
+
+	/* Write buffer.  This is a DMA'able buffer. */
+	unsigned char *write_buf;
+	dma_addr_t write_buf_dma;
+
+	/* Current Tx FIFO channel. */
+	int tx_chan;
+
+	/* Current Rx FIFO channel. */
+	int rx_chan;
+
+	/* First error encountered during read or write. */
+	int tmfifo_error;
+
+	/* Buffers used for boot writes.  Allocated at startup. */
+	char *boot_buf[2];
+
+	/*
+	 * This mutex is used to prevent the interface pointers and the
+	 * device pointer from disappearing while a driver entry point
+	 * is using them.  It's held throughout a read or write operation
+	 * (at least the parts of those operations which depend upon those
+	 * pointers) and is also held whenever those pointers are modified.
+	 * It also protects state flags, and booting_complete.
+	 */
+	struct mutex mutex;
+
+	/* We'll signal completion on this when FLG_BOOTING is turned off. */
+	struct completion booting_complete;
+
+#ifdef RSH_RESET_MUTEX
+	/* Signaled when a device is disconnected. */
+	struct completion reset_complete;
+#endif
+
+	/*
+	 * This wait queue supports fsync; it's woken up whenever an
+	 * outstanding USB write URB is done.  This will need to be more
+	 * complex if we start doing write double-buffering.
+	 */
+	wait_queue_head_t write_completed;
+
+	/* State for our outstanding boot write. */
+	struct completion boot_write_complete;
+
+	/*
+	 * This spinlock is used to protect items which must be updated by
+	 * URB completion handlers, since those can't sleep.  This includes
+	 * the read and write buffer pointers, as well as spin_flags.
+	 */
+	spinlock_t spinlock;
+
+	/* Current termios settings for the console. */
+	struct ktermios cons_termios;
+
+	/* Work queue entry. */
+	struct delayed_work	work;
+
+	/* Pending boot & fifo request for the worker. */
+	u8 *boot_work_buf;
+	u32 boot_work_buf_len;
+	u32 boot_work_buf_actual_len;
+	u8 *fifo_work_buf;
+	u32 fifo_work_buf_len;
+	int fifo_work_devtype;
+
+	/* Number of open console files. */
+	long console_opens;
+
+	/*
+	 * Our index in rshim_devs, which is also the high bits of our
+	 * minor number.
+	 */
+	int dev_index;
+
+	/* APIs provided by backend. */
+
+	/* API to write bulk data to RShim via the backend. */
+	ssize_t (*write)(struct rshim_backend *bd, int devtype,
+			 const char *buf, size_t count);
+
+	/* API to read bulk data from RShim via the backend. */
+	ssize_t (*read)(struct rshim_backend *bd, int devtype,
+			char *buf, size_t count);
+
+	/* API to cancel a read / write request (optional). */
+	void (*cancel)(struct rshim_backend *bd, int devtype, bool is_write);
+
+	/* API to destroy the backend. */
+	void (*destroy)(struct kref *kref);
+
+	/* API to read 8 bytes from RShim. */
+	int (*read_rshim)(struct rshim_backend *bd, int chan, int addr,
+			  u64 *value);
+
+	/* API to write 8 bytes to RShim. */
+	int (*write_rshim)(struct rshim_backend *bd, int chan, int addr,
+			   u64 value);
+};
+
+/* RShim service. */
+struct rshim_service {
+	/* Service type RSH_SVC_xxx. */
+	int type;
+
+	/* Reference number. */
+	atomic_t ref;
+
+	/* Create service. */
+	int (*create)(struct rshim_backend *bd);
+
+	/* Delete service. */
+	int (*delete)(struct rshim_backend *bd);
+
+	/* Notify service Rx is ready. */
+	void (*rx_notify)(struct rshim_backend *bd);
+};
+
+/* Global variables. */
+
+/* Global array to store RShim devices and names. */
+extern struct workqueue_struct *rshim_wq;
+
+/* Common APIs. */
+
+/* Register/unregister backend. */
+int rshim_register(struct rshim_backend *bd);
+void rshim_deregister(struct rshim_backend *bd);
+
+/* Register / deregister service. */
+int rshim_register_service(struct rshim_service *service);
+void rshim_deregister_service(struct rshim_service *service);
+
+/* Find backend by name. */
+struct rshim_backend *rshim_find(char *dev_name);
+
+/* RShim global lock. */
+void rshim_lock(void);
+void rshim_unlock(void);
+
+/* Event notification. */
+int rshim_notify(struct rshim_backend *bd, int event, int code);
+
+/*
+ * FIFO APIs.
+ *
+ * FIFO is demuxed into two channels, one for network interface
+ * (TMFIFO_NET_CHAN), one for console (TMFIFO_CONS_CHAN).
+ */
+
+/* Write / read some bytes to / from the FIFO via the backend. */
+ssize_t rshim_fifo_read(struct rshim_backend *bd, char *buffer,
+		      size_t count, int chan, bool nonblock,
+		      bool to_user);
+ssize_t rshim_fifo_write(struct rshim_backend *bd, const char *buffer,
+		       size_t count, int chan, bool nonblock,
+		       bool from_user);
+
+/* Alloc/free the FIFO. */
+int rshim_fifo_alloc(struct rshim_backend *bd);
+void rshim_fifo_free(struct rshim_backend *bd);
+
+/* Console APIs. */
+
+/* Enable early console. */
+int rshim_cons_early_enable(struct rshim_backend *bd);
+
+#endif /* _RSHIM_H */
diff --git a/drivers/soc/mellanox/host/rshim_net.c b/drivers/soc/mellanox/host/rshim_net.c
new file mode 100644
index 0000000..6d10497
--- /dev/null
+++ b/drivers/soc/mellanox/host/rshim_net.c
@@ -0,0 +1,834 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rshim_net.c - Mellanox RShim network host driver
+ *
+ * Copyright (c) 2017, Mellanox Technologies. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/moduleparam.h>
+#include <linux/platform_device.h>
+#include <linux/resource.h>
+#include <linux/slab.h>
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/virtio.h>
+#include <linux/virtio_config.h>
+#include <linux/virtio_ids.h>
+#include <linux/virtio_ring.h>
+#include <linux/virtio_net.h>
+#include <linux/cache.h>
+#include <linux/interrupt.h>
+#include <linux/version.h>
+#include <asm/byteorder.h>
+
+#include "rshim.h"
+
+/* Vring size. */
+#define RSH_NET_VRING_SIZE			1024
+
+/*
+ * Keepalive time in seconds. If configured, the link is considered down
+ * if no Rx activity within the configured time.
+ */
+static int rshim_net_keepalive;
+module_param(rshim_net_keepalive, int, 0644);
+MODULE_PARM_DESC(rshim_net_keepalive,
+		 "Keepalive time in seconds.");
+
+/* Use a timer for house-keeping. */
+static int rshim_net_timer_interval = HZ / 10;
+
+/* Flag to drain the current pending packet. */
+static bool rshim_net_draining_mode;
+
+/* Spin lock. */
+static DEFINE_SPINLOCK(rshim_net_spin_lock);
+
+/* Virtio ring size. */
+static int rshim_net_vring_size = RSH_NET_VRING_SIZE;
+module_param(rshim_net_vring_size, int, 0444);
+MODULE_PARM_DESC(rshim_net_vring_size, "Size of the vring.");
+
+/* Supported virtio-net features. */
+#define RSH_NET_FEATURES		((1 << VIRTIO_NET_F_MTU) | \
+					 (1 << VIRTIO_NET_F_MAC) | \
+					 (1 << VIRTIO_NET_F_STATUS))
+
+/* Default MAC. */
+static u8 rshim_net_default_mac[6] = {0x00, 0x1A, 0xCA, 0xFF, 0xFF, 0x02};
+module_param_array(rshim_net_default_mac, byte, NULL, 0);
+MODULE_PARM_DESC(rshim_net_default_mac, "default MAC address");
+
+#define VIRTIO_GET_FEATURES_RETURN_TYPE		u64
+#define VIRTIO_FINALIZE_FEATURES_RETURN_TYPE	int
+#define VIRTIO_NOTIFY_RETURN_TYPE	bool
+#define VIRTIO_NOTIFY_RETURN		{ return true; }
+
+/* MTU setting of the virtio-net interface. */
+#define RSH_NET_MTU			1500
+
+struct rshim_net;
+static void rshim_net_virtio_rxtx(struct virtqueue *vq, bool is_rx);
+static void rshim_net_update_activity(struct rshim_net *net, bool activity);
+
+/* Structure to maintain the ring state. */
+struct rshim_net_vring {
+	void *va;			/* virtual address */
+	struct virtqueue *vq;		/* virtqueue pointer */
+	struct vring_desc *desc;	/* current desc */
+	struct vring_desc *desc_head;	/* current desc head */
+	int cur_len;			/* processed len in current desc */
+	int rem_len;			/* remaining length to be processed */
+	int size;			/* vring size */
+	int align;			/* vring alignment */
+	int id;				/* vring id */
+	u32 pkt_len;			/* packet total length */
+	u16 next_avail;			/* next avail desc id */
+	union rshim_tmfifo_msg_hdr hdr;	/* header of the current packet */
+	struct rshim_net *net;		/* pointer back to the rshim_net */
+};
+
+/* Event types. */
+enum {
+	RSH_NET_RX_EVENT,		/* Rx event */
+	RSH_NET_TX_EVENT		/* Tx event */
+};
+
+/* Ring types (Rx & Tx). */
+enum {
+	RSH_NET_VRING_RX,		/* Rx ring */
+	RSH_NET_VRING_TX,		/* Tx ring */
+	RSH_NET_VRING_NUM
+};
+
+/* RShim net device structure */
+struct rshim_net {
+	struct virtio_device vdev;	/* virtual device */
+	struct mutex lock;
+	struct rshim_backend *bd;		/* backend */
+	u8 status;
+	u16 virtio_registered : 1;
+	u64 features;
+	int tx_fifo_size;		/* number of entries of the Tx FIFO */
+	int rx_fifo_size;		/* number of entries of the Rx FIFO */
+	unsigned long pend_events;	/* pending bits for deferred process */
+	struct work_struct work;	/* work struct for deferred process */
+	struct timer_list timer;	/* keepalive timer */
+	unsigned long rx_jiffies;	/* last Rx jiffies */
+	struct rshim_net_vring vrings[RSH_NET_VRING_NUM];
+	struct virtio_net_config config;	/* virtio config space */
+};
+
+/* Allocate vrings for the net device. */
+static int rshim_net_alloc_vrings(struct rshim_net *net)
+{
+	void *va;
+	int i, size;
+	struct rshim_net_vring *vring;
+	struct virtio_device *vdev = &net->vdev;
+
+	for (i = 0; i < ARRAY_SIZE(net->vrings); i++) {
+		vring = &net->vrings[i];
+		vring->net = net;
+		vring->size = rshim_net_vring_size;
+		vring->align = SMP_CACHE_BYTES;
+		vring->id = i;
+
+		size = PAGE_ALIGN(vring_size(vring->size, vring->align));
+		va = kzalloc(size, GFP_KERNEL);
+		if (!va) {
+			dev_err(vdev->dev.parent, "vring allocation failed\n");
+			return -EINVAL;
+		}
+
+		vring->va = va;
+	}
+
+	return 0;
+}
+
+/* Free vrings of the net device. */
+static void rshim_net_free_vrings(struct rshim_net *net)
+{
+	int i, size;
+	struct rshim_net_vring *vring;
+
+	for (i = 0; i < ARRAY_SIZE(net->vrings); i++) {
+		vring = &net->vrings[i];
+		size = PAGE_ALIGN(vring_size(vring->size, vring->align));
+		if (vring->va) {
+			kfree(vring->va);
+			vring->va = NULL;
+			if (vring->vq) {
+				vring_del_virtqueue(vring->vq);
+				vring->vq = NULL;
+			}
+		}
+	}
+}
+
+/* Work handler for Rx, Tx or activity monitoring. */
+static void rshim_net_work_handler(struct work_struct *work)
+{
+	struct virtqueue *vq;
+	struct rshim_net *net = container_of(work, struct rshim_net, work);
+
+	/* Tx. */
+	if (test_and_clear_bit(RSH_NET_TX_EVENT, &net->pend_events) &&
+		       net->virtio_registered) {
+		vq = net->vrings[RSH_NET_VRING_TX].vq;
+		if (vq)
+			rshim_net_virtio_rxtx(vq, false);
+	}
+
+	/* Rx. */
+	if (test_and_clear_bit(RSH_NET_RX_EVENT, &net->pend_events) &&
+		       net->virtio_registered) {
+		vq = net->vrings[RSH_NET_VRING_RX].vq;
+		if (vq)
+			rshim_net_virtio_rxtx(vq, true);
+	}
+
+	/* Keepalive check. */
+	if (rshim_net_keepalive &&
+	    time_after(jiffies, net->rx_jiffies +
+		       (unsigned long)rshim_net_keepalive * HZ)) {
+		mutex_lock(&net->lock);
+		rshim_net_update_activity(net, false);
+		mutex_unlock(&net->lock);
+	}
+}
+
+/* Nothing to do for now. */
+static void rshim_net_virtio_dev_release(struct device *dev)
+{
+}
+
+/* Get the next packet descriptor from the vring. */
+static inline struct vring_desc *
+rshim_net_virtio_get_next_desc(struct virtqueue *vq)
+{
+	unsigned int idx, head;
+	struct vring *vr = (struct vring *)virtqueue_get_vring(vq);
+	struct rshim_net_vring *vring = (struct rshim_net_vring *)vq->priv;
+
+	if (vring->next_avail == vr->avail->idx)
+		return NULL;
+
+	idx = vring->next_avail % vring->size;
+	head = vr->avail->ring[idx];
+	BUG_ON(head >= vring->size);
+	vring->next_avail++;
+	return &vr->desc[head];
+}
+
+/* Get the total length of a descriptor chain. */
+static inline u32 rshim_net_virtio_get_pkt_len(struct virtio_device *vdev,
+			struct vring_desc *desc, struct vring *vr)
+{
+	u32 len = 0, idx;
+
+	while (desc) {
+		len += virtio32_to_cpu(vdev, desc->len);
+		if (!(virtio16_to_cpu(vdev, desc->flags) & VRING_DESC_F_NEXT))
+			break;
+		idx = virtio16_to_cpu(vdev, desc->next);
+		desc = &vr->desc[idx];
+	}
+
+	return len;
+}
+
+/* House-keeping timer. */
+static void rshim_net_timer(struct timer_list *arg)
+{
+	struct rshim_net *net = container_of(arg, struct rshim_net, timer);
+
+	/*
+	 * Wake up Rx handler in case Rx event is missing or any leftover
+	 * bytes are stuck in the backend.
+	 */
+	test_and_set_bit(RSH_NET_RX_EVENT, &net->pend_events);
+
+	/*
+	 * Wake up Tx handler in case virtio has queued too many packets
+	 * and are waiting for buffer return.
+	 */
+	test_and_set_bit(RSH_NET_TX_EVENT, &net->pend_events);
+
+	schedule_work(&net->work);
+
+	mod_timer(&net->timer, jiffies + rshim_net_timer_interval);
+}
+
+static void rshim_net_release_cur_desc(struct virtio_device *vdev,
+				       struct rshim_net_vring *vring)
+{
+	int idx;
+	unsigned long flags;
+	struct vring *vr = (struct vring *)virtqueue_get_vring(vring->vq);
+
+	idx = vr->used->idx % vring->size;
+	vr->used->ring[idx].id = vring->desc_head - vr->desc;
+	vr->used->ring[idx].len =
+		cpu_to_virtio32(vdev, vring->pkt_len);
+
+	/*
+	 * Virtio could poll and check the 'idx' to decide
+	 * whether the desc is done or not. Add a memory
+	 * barrier here to make sure the update above completes
+	 * before updating the idx.
+	 */
+	mb();
+	vr->used->idx++;
+
+	vring->desc = NULL;
+
+	/* Notify upper layer. */
+	spin_lock_irqsave(&rshim_net_spin_lock, flags);
+	vring_interrupt(0, vring->vq);
+	spin_unlock_irqrestore(&rshim_net_spin_lock, flags);
+}
+
+/* Update the link activity. */
+static void rshim_net_update_activity(struct rshim_net *net, bool activity)
+{
+	if (activity) {
+		/* Bring up the link. */
+		if (!(net->config.status & VIRTIO_NET_S_LINK_UP)) {
+			net->config.status |= VIRTIO_NET_S_LINK_UP;
+			virtio_config_changed(&net->vdev);
+		}
+	} else {
+		/* Bring down the link. */
+		if (net->config.status & VIRTIO_NET_S_LINK_UP) {
+			int i;
+
+			net->config.status &= ~VIRTIO_NET_S_LINK_UP;
+			virtio_config_changed(&net->vdev);
+
+			/* Reset the ring state. */
+			for (i = 0; i < RSH_NET_VRING_NUM; i++) {
+				net->vrings[i].pkt_len =
+						sizeof(struct virtio_net_hdr);
+				net->vrings[i].cur_len = 0;
+				net->vrings[i].rem_len = 0;
+			}
+		}
+	}
+}
+
+/* Rx & Tx processing of a virtual queue. */
+static void rshim_net_virtio_rxtx(struct virtqueue *vq, bool is_rx)
+{
+	struct rshim_net_vring *vring = (struct rshim_net_vring *)vq->priv;
+	struct rshim_net *net = vring->net;
+	struct vring *vr = (struct vring *)virtqueue_get_vring(vq);
+	struct virtio_device *vdev = &net->vdev;
+	void *addr;
+	int len, idx, seg_len;
+	struct vring_desc *desc;
+
+	mutex_lock(&net->lock);
+
+	/* Get the current pending descriptor. */
+	desc = vring->desc;
+
+	/* Don't continue if booting. */
+	if (net->bd->is_boot_open) {
+		/* Drop the pending buffer. */
+		if (desc != NULL)
+			rshim_net_release_cur_desc(vdev, vring);
+		mutex_unlock(&net->lock);
+		return;
+	}
+
+	while (1) {
+		if (!desc) {
+			/* Don't process new packet in draining mode. */
+			if (RSHIM_READ_ONCE(rshim_net_draining_mode))
+				break;
+
+			/* Get the head desc of next packet. */
+			vring->desc_head = rshim_net_virtio_get_next_desc(vq);
+			if (!vring->desc_head) {
+				vring->desc = NULL;
+				mutex_unlock(&net->lock);
+				return;
+			}
+			desc = vring->desc_head;
+
+			/* Packet length is unknown yet. */
+			vring->pkt_len = 0;
+			vring->rem_len = sizeof(vring->hdr);
+		}
+
+		/* Beginning of a packet. */
+		if (vring->pkt_len == 0) {
+			if (is_rx) {
+				struct virtio_net_hdr *net_hdr;
+
+				/* Read the packet header. */
+				len = rshim_fifo_read(net->bd,
+					(void *)&vring->hdr +
+					sizeof(vring->hdr) - vring->rem_len,
+					vring->rem_len, TMFIFO_NET_CHAN, true,
+					false);
+				if (len > 0) {
+					vring->rem_len -= len;
+					if (vring->rem_len != 0)
+						continue;
+				} else
+					break;
+
+				/* Update activity. */
+				net->rx_jiffies = jiffies;
+				rshim_net_update_activity(net, true);
+
+				/* Skip the length 0 packet (keepalive). */
+				if (vring->hdr.len == 0) {
+					vring->rem_len = sizeof(vring->hdr);
+					continue;
+				}
+
+				/* Update total length. */
+				vring->pkt_len = ntohs(vring->hdr.len) +
+					sizeof(struct virtio_net_hdr);
+
+				/* Initialize the packet header. */
+				net_hdr = (struct virtio_net_hdr *)
+					phys_to_virt(virtio64_to_cpu(
+					vdev, desc->addr));
+				memset(net_hdr, 0, sizeof(*net_hdr));
+			} else {
+				/* Write packet header. */
+				if (vring->rem_len == sizeof(vring->hdr)) {
+					len = rshim_net_virtio_get_pkt_len(
+							vdev, desc, vr);
+					vring->hdr.data = 0;
+					vring->hdr.type = VIRTIO_ID_NET;
+					vring->hdr.len = htons(len -
+						sizeof(struct virtio_net_hdr));
+				}
+
+				len = rshim_fifo_write(net->bd,
+					(void *)&vring->hdr +
+					sizeof(vring->hdr) - vring->rem_len,
+					vring->rem_len, TMFIFO_NET_CHAN,
+					true, false);
+				if (len > 0) {
+					vring->rem_len -= len;
+					if (vring->rem_len != 0)
+						continue;
+				} else
+					break;
+
+				/* Update total length. */
+				vring->pkt_len = rshim_net_virtio_get_pkt_len(
+							vdev, desc, vr);
+			}
+
+			vring->cur_len = sizeof(struct virtio_net_hdr);
+			vring->rem_len = vring->pkt_len;
+		}
+
+		/* Check available space in this desc. */
+		len = virtio32_to_cpu(vdev, desc->len);
+		if (len > vring->rem_len)
+			len = vring->rem_len;
+
+		/* Check whether this desc is full or completed. */
+		if (vring->cur_len == len) {
+			vring->cur_len = 0;
+			vring->rem_len -= len;
+
+			/* Get the next desc on the chain. */
+			if (vring->rem_len > 0 &&
+			    (virtio16_to_cpu(vdev, desc->flags) &
+						VRING_DESC_F_NEXT)) {
+				idx = virtio16_to_cpu(vdev, desc->next);
+				desc = &vr->desc[idx];
+				continue;
+			}
+
+			/* Done with this chain. */
+			rshim_net_release_cur_desc(vdev, vring);
+
+			/* Clear desc and go back to the loop. */
+			desc = NULL;
+
+			continue;
+		}
+
+		addr = phys_to_virt(virtio64_to_cpu(vdev, desc->addr));
+
+		if (is_rx) {
+			seg_len = rshim_fifo_read(net->bd,
+					addr + vring->cur_len,
+					len - vring->cur_len,
+					TMFIFO_NET_CHAN, true, false);
+		} else {
+			seg_len = rshim_fifo_write(net->bd,
+					addr + vring->cur_len,
+					len - vring->cur_len,
+					TMFIFO_NET_CHAN, true, false);
+		}
+		if (seg_len > 0)
+			vring->cur_len += seg_len;
+		else {
+			/* Schedule the worker to speed up Tx. */
+			if (!is_rx) {
+				if (!test_and_set_bit(RSH_NET_TX_EVENT,
+				    &net->pend_events))
+					schedule_work(&net->work);
+			}
+			break;
+		}
+	}
+
+	/* Save the current desc. */
+	vring->desc = desc;
+
+	mutex_unlock(&net->lock);
+}
+
+/* The notify function is called when new buffers are posted. */
+static VIRTIO_NOTIFY_RETURN_TYPE rshim_net_virtio_notify(struct virtqueue *vq)
+{
+	struct rshim_net_vring *vring = (struct rshim_net_vring *)vq->priv;
+	struct rshim_net *net = vring->net;
+
+	/*
+	 * Virtio-net maintains vrings in pairs. Odd number ring for Rx
+	 * and even number ring for Tx.
+	 */
+	if (!(vring->id & 1)) {
+		/* Set the RX bit. */
+		if (!test_and_set_bit(RSH_NET_RX_EVENT, &net->pend_events))
+			schedule_work(&net->work);
+	} else {
+		/* Set the TX bit. */
+		if (!test_and_set_bit(RSH_NET_TX_EVENT, &net->pend_events))
+			schedule_work(&net->work);
+	}
+
+	VIRTIO_NOTIFY_RETURN;
+}
+
+/* Get the array of feature bits for this device. */
+static VIRTIO_GET_FEATURES_RETURN_TYPE rshim_net_virtio_get_features(
+	struct virtio_device *vdev)
+{
+	struct rshim_net *net = container_of(vdev, struct rshim_net, vdev);
+
+	return net->features;
+}
+
+/* Confirm device features to use. */
+static VIRTIO_FINALIZE_FEATURES_RETURN_TYPE rshim_net_virtio_finalize_features(
+	struct virtio_device *vdev)
+{
+	struct rshim_net *net = container_of(vdev, struct rshim_net, vdev);
+
+	net->features = vdev->features;
+	return 0;
+}
+
+/* Free virtqueues found by find_vqs(). */
+static void rshim_net_virtio_del_vqs(struct virtio_device *vdev)
+{
+	int i;
+	struct rshim_net_vring *vring;
+	struct virtqueue *vq;
+	struct rshim_net *net = container_of(vdev, struct rshim_net, vdev);
+
+	for (i = 0; i < ARRAY_SIZE(net->vrings); i++) {
+		vring = &net->vrings[i];
+
+		/* Release the pending packet. */
+		if (vring->desc != NULL)
+			rshim_net_release_cur_desc(vdev, vring);
+
+		vq = vring->vq;
+		if (vq) {
+			vring->vq = NULL;
+			vring_del_virtqueue(vq);
+		}
+	}
+}
+
+/* Create and initialize the virtual queues. */
+static int rshim_net_virtio_find_vqs(struct virtio_device *vdev,
+				     unsigned int nvqs,
+				     struct virtqueue *vqs[],
+				     vq_callback_t *callbacks[],
+				     const char * const names[],
+				     const bool *ctx,
+				     struct irq_affinity *desc)
+{
+	int i, ret = -EINVAL, size;
+	struct rshim_net_vring *vring;
+	struct virtqueue *vq;
+	struct rshim_net *net = container_of(vdev, struct rshim_net, vdev);
+
+	if (nvqs > ARRAY_SIZE(net->vrings))
+		return -EINVAL;
+
+	for (i = 0; i < nvqs; ++i) {
+		if (!names[i])
+			goto error;
+		vring = &net->vrings[i];
+
+		/* zero vring */
+		size = vring_size(vring->size, vring->align);
+		memset(vring->va, 0, size);
+
+		vq = vring_new_virtqueue(
+					 i,
+					 vring->size, vring->align, vdev,
+					 false, false, vring->va,
+					 rshim_net_virtio_notify,
+					 callbacks[i], names[i]);
+		if (!vq) {
+			dev_err(&vdev->dev, "vring_new_virtqueue failed\n");
+			ret = -ENOMEM;
+			goto error;
+		}
+
+		vq->priv = vring;
+		/*
+		 * Add barrier to make sure vq is ready before assigning to
+		 * vring.
+		 */
+		mb();
+		vring->vq = vq;
+		vqs[i] = vq;
+	}
+
+	return 0;
+
+error:
+	rshim_net_virtio_del_vqs(vdev);
+	return ret;
+}
+
+/* Read the status byte. */
+static u8 rshim_net_virtio_get_status(struct virtio_device *vdev)
+{
+	struct rshim_net *net = container_of(vdev, struct rshim_net, vdev);
+
+	return net->status;
+}
+
+/* Write the status byte. */
+static void rshim_net_virtio_set_status(struct virtio_device *vdev, u8 status)
+{
+	struct rshim_net *net = container_of(vdev, struct rshim_net, vdev);
+
+	net->status = status;
+}
+
+/* Reset the device. Not much here for now. */
+static void rshim_net_virtio_reset(struct virtio_device *vdev)
+{
+	struct rshim_net *net = container_of(vdev, struct rshim_net, vdev);
+
+	net->status = 0;
+}
+
+/* Read the value of a configuration field. */
+static void rshim_net_virtio_get(struct virtio_device *vdev,
+				 unsigned int offset,
+				 void *buf,
+				 unsigned int len)
+{
+	struct rshim_net *net = container_of(vdev, struct rshim_net, vdev);
+
+	if (offset + len > sizeof(net->config) || offset + len < len) {
+		dev_err(vdev->dev.parent, "virtio_get access out of bounds\n");
+		return;
+	}
+
+	memcpy(buf, (u8 *)&net->config + offset, len);
+}
+
+/* Write the value of a configuration field. */
+static void rshim_net_virtio_set(struct virtio_device *vdev,
+				 unsigned int offset,
+				 const void *buf,
+				 unsigned int len)
+{
+	struct rshim_net *net = container_of(vdev, struct rshim_net, vdev);
+
+	if (offset + len > sizeof(net->config) || offset + len < len) {
+		dev_err(vdev->dev.parent, "virtio_get access out of bounds\n");
+		return;
+	}
+
+	memcpy((u8 *)&net->config + offset, buf, len);
+}
+
+/* Virtio config operations. */
+static struct virtio_config_ops rshim_net_virtio_config_ops = {
+	.get_features = rshim_net_virtio_get_features,
+	.finalize_features = rshim_net_virtio_finalize_features,
+	.find_vqs = rshim_net_virtio_find_vqs,
+	.del_vqs = rshim_net_virtio_del_vqs,
+	.reset = rshim_net_virtio_reset,
+	.set_status = rshim_net_virtio_set_status,
+	.get_status = rshim_net_virtio_get_status,
+	.get = rshim_net_virtio_get,
+	.set = rshim_net_virtio_set,
+};
+
+/* Remove. */
+static int rshim_net_delete_dev(struct rshim_net *net)
+{
+	if (net) {
+		/* Stop the timer. */
+		del_timer_sync(&net->timer);
+
+		/* Cancel the pending work. */
+		cancel_work_sync(&net->work);
+
+		/* Unregister virtio. */
+		if (net->virtio_registered)
+			unregister_virtio_device(&net->vdev);
+
+		/* Free vring. */
+		rshim_net_free_vrings(net);
+
+		kfree(net);
+	}
+
+	return 0;
+}
+
+/* Rx ready. */
+void rshim_net_rx_notify(struct rshim_backend *bd)
+{
+	struct rshim_net *net = (struct rshim_net *)bd->net;
+
+	if (net) {
+		test_and_set_bit(RSH_NET_RX_EVENT, &net->pend_events);
+		schedule_work(&net->work);
+	}
+}
+
+/* Remove. */
+int rshim_net_delete(struct rshim_backend *bd)
+{
+	int ret = 0;
+
+	if (bd->net) {
+		ret = rshim_net_delete_dev((struct rshim_net *)bd->net);
+		bd->net = NULL;
+	}
+
+	return ret;
+}
+
+/* Init. */
+int rshim_net_create(struct rshim_backend *bd)
+{
+	struct rshim_net *net;
+	struct virtio_device *vdev;
+	int ret = -ENOMEM;
+
+	if (bd->net)
+		return -EEXIST;
+
+	net = kzalloc(sizeof(struct rshim_net), GFP_KERNEL);
+	if (!net)
+		return ret;
+
+	INIT_WORK(&net->work, rshim_net_work_handler);
+
+	timer_setup(&net->timer, rshim_net_timer, 0);
+	net->timer.function = rshim_net_timer;
+
+	net->features = RSH_NET_FEATURES;
+	net->config.mtu = RSH_NET_MTU;
+	memcpy(net->config.mac, rshim_net_default_mac,
+	       sizeof(rshim_net_default_mac));
+	/* Set MAC address to be unique even number. */
+	net->config.mac[5] += bd->dev_index * 2;
+
+	mutex_init(&net->lock);
+
+	vdev = &net->vdev;
+	vdev->id.device = VIRTIO_ID_NET;
+	vdev->config = &rshim_net_virtio_config_ops;
+	vdev->dev.parent = bd->dev;
+	vdev->dev.release = rshim_net_virtio_dev_release;
+	if (rshim_net_alloc_vrings(net))
+		goto err;
+
+	/* Register the virtio device. */
+	ret = register_virtio_device(vdev);
+	if (ret) {
+		dev_err(bd->dev, "register_virtio_device() failed\n");
+		goto err;
+	}
+	net->virtio_registered = 1;
+
+	mod_timer(&net->timer, jiffies + rshim_net_timer_interval);
+
+	net->bd = bd;
+	/* Add a barrier to keep the order of the two pointer assignments. */
+	mb();
+	bd->net = net;
+
+	/* Bring up the interface. */
+	mutex_lock(&net->lock);
+	rshim_net_update_activity(net, true);
+	mutex_unlock(&net->lock);
+
+	return 0;
+
+err:
+	rshim_net_delete_dev(net);
+	return ret;
+}
+
+struct rshim_service rshim_svc = {
+	.type = RSH_SVC_NET,
+	.create = rshim_net_create,
+	.delete = rshim_net_delete,
+	.rx_notify = rshim_net_rx_notify
+};
+
+static int __init rshim_net_init(void)
+{
+	return rshim_register_service(&rshim_svc);
+}
+
+static void __exit rshim_net_exit(void)
+{
+	/*
+	 * Wait 200ms, which should be good enough to drain the current
+	 * pending packet.
+	 */
+	rshim_net_draining_mode = true;
+	msleep(200);
+
+	return rshim_deregister_service(&rshim_svc);
+}
+
+module_init(rshim_net_init);
+module_exit(rshim_net_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mellanox Technologies");
+MODULE_VERSION("0.7");
diff --git a/drivers/soc/mellanox/host/rshim_pcie.c b/drivers/soc/mellanox/host/rshim_pcie.c
new file mode 100644
index 0000000..3fa7bd9
--- /dev/null
+++ b/drivers/soc/mellanox/host/rshim_pcie.c
@@ -0,0 +1,478 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rshim_pcie.c - Mellanox RShim PCIe host driver
+ *
+ * Copyright 2017 Mellanox Technologies. All Rights Reserved.
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful, but
+ *   WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
+ *   NON INFRINGEMENT.  See the GNU General Public License for
+ *   more details.
+ */
+
+#include <linux/pci.h>
+#include <linux/version.h>
+#include <linux/sched.h>
+#include <linux/sched/signal.h>
+
+#include "rshim.h"
+
+/* Disable RSim access. */
+static int rshim_disable;
+module_param(rshim_disable, int, 0444);
+MODULE_PARM_DESC(rshim_disable, "Disable rshim (obsoleted)");
+
+/** Our Vendor/Device IDs. */
+#define TILERA_VENDOR_ID					0x15b3
+#define BLUEFIELD_DEVICE_ID					0xc2d2
+
+/** The offset in BAR2 of the RShim region. */
+#define PCI_RSHIM_WINDOW_OFFSET					0x0
+
+/** The size the RShim region. */
+#define PCI_RSHIM_WINDOW_SIZE					0x100000
+
+/* Maximum number of devices this driver can handle */
+#define MAX_DEV_COUNT						16
+
+struct rshim_pcie {
+	/* RShim backend structure. */
+	struct rshim_backend	bd;
+
+	struct pci_dev *pci_dev;
+
+	/* RShim BAR size. */
+	uint64_t bar0_size;
+
+	/* Address of the RShim registers. */
+	u8 __iomem *rshim_regs;
+
+	/* Keep track of number of 8-byte word writes */
+	u8 write_count;
+};
+
+static struct rshim_pcie *instances[MAX_DEV_COUNT];
+
+#ifndef CONFIG_64BIT
+/* Wait until the RSH_BYTE_ACC_CTL pending bit is cleared */
+static int rshim_byte_acc_pending_wait(struct rshim_pcie *dev, int chan)
+{
+	u32 read_value;
+
+	do {
+		read_value = readl(dev->rshim_regs +
+			(RSH_BYTE_ACC_CTL | (chan << 16)));
+
+		if (signal_pending(current))
+			return -EINTR;
+
+	} while (read_value & RSH_BYTE_ACC_PENDING);
+
+	return 0;
+}
+
+/*
+ * RShim read/write methods for 32-bit systems
+ * Mechanism to do an 8-byte access to the Rshim using
+ * two 4-byte accesses through the Rshim Byte Access Widget.
+ */
+static int rshim_byte_acc_read(struct rshim_pcie *dev, int chan, int addr,
+				u64 *result)
+{
+	int retval;
+	u32 read_value;
+	u64 read_result;
+
+	/* Wait for RSH_BYTE_ACC_CTL pending bit to be cleared */
+	retval = rshim_byte_acc_pending_wait(dev, chan);
+	if (retval)
+		return retval;
+
+	/* Write control bits to RSH_BYTE_ACC_CTL */
+	writel(RSH_BYTE_ACC_SIZE, dev->rshim_regs +
+		(RSH_BYTE_ACC_CTL | (chan << 16)));
+
+	/* Write target address to RSH_BYTE_ACC_ADDR */
+	writel(addr, dev->rshim_regs + (RSH_BYTE_ACC_ADDR | (chan << 16)));
+
+	/* Write trigger bits to perform read */
+	writel(RSH_BYTE_ACC_READ_TRIGGER, dev->rshim_regs +
+		(RSH_BYTE_ACC_CTL | (chan << 16)));
+
+	/* Wait for RSH_BYTE_ACC_CTL pending bit to be cleared */
+	retval = rshim_byte_acc_pending_wait(dev, chan);
+	if (retval)
+		return retval;
+
+	/* Read RSH_BYTE_ACC_RDAT to read lower 32-bits of data */
+	read_value = readl(dev->rshim_regs +
+		(RSH_BYTE_ACC_RDAT | (chan << 16)));
+
+	read_result = (u64)read_value << 32;
+
+	/* Wait for RSH_BYTE_ACC_CTL pending bit to be cleared */
+	retval = rshim_byte_acc_pending_wait(dev, chan);
+	if (retval)
+		return retval;
+
+	/* Read RSH_BYTE_ACC_RDAT to read upper 32-bits of data */
+	read_value = readl(dev->rshim_regs +
+		(RSH_BYTE_ACC_RDAT | (chan << 16)));
+
+	read_result |= (u64)read_value;
+	*result = be64_to_cpu(read_result);
+
+	return 0;
+}
+
+static int rshim_byte_acc_write(struct rshim_pcie *dev, int chan, int addr,
+				u64 value)
+{
+	int retval;
+
+	/* Wait for RSH_BYTE_ACC_CTL pending bit to be cleared */
+	retval = rshim_byte_acc_pending_wait(dev, chan);
+	if (retval)
+		return retval;
+
+	/* Write control bits to RSH_BYTE_ACC_CTL */
+	writel(RSH_BYTE_ACC_SIZE, dev->rshim_regs +
+		(RSH_BYTE_ACC_CTL | (chan << 16)));
+
+	/* Write target address to RSH_BYTE_ACC_ADDR */
+	writel(addr, dev->rshim_regs + (RSH_BYTE_ACC_ADDR | (chan << 16)));
+
+	/* Write control bits to RSH_BYTE_ACC_CTL */
+	writel(RSH_BYTE_ACC_SIZE, dev->rshim_regs +
+		(RSH_BYTE_ACC_CTL | (chan << 16)));
+
+	/* Write lower 32 bits of data to TRIO_CR_GW_DATA */
+	writel((u32)(value >> 32), dev->rshim_regs +
+		(RSH_BYTE_ACC_WDAT | (chan << 16)));
+
+	/* Wait for RSH_BYTE_ACC_CTL pending bit to be cleared */
+	retval = rshim_byte_acc_pending_wait(dev, chan);
+	if (retval)
+		return retval;
+
+	/* Write upper 32 bits of data to TRIO_CR_GW_DATA */
+	writel((u32)(value), dev->rshim_regs +
+		(RSH_BYTE_ACC_WDAT | (chan << 16)));
+
+	return 0;
+}
+#endif /* CONFIG_64BIT */
+
+/* RShim read/write routines */
+static int rshim_pcie_read(struct rshim_backend *bd, int chan, int addr,
+				u64 *result)
+{
+	struct rshim_pcie *dev = container_of(bd, struct rshim_pcie, bd);
+	int retval = 0;
+
+	if (!bd->has_rshim)
+		return -ENODEV;
+
+	dev->write_count = 0;
+
+#ifndef CONFIG_64BIT
+	retval = rshim_byte_acc_read(dev, chan, addr, result);
+#else
+	*result = readq(dev->rshim_regs + (addr | (chan << 16)));
+#endif
+	return retval;
+}
+
+static int rshim_pcie_write(struct rshim_backend *bd, int chan, int addr,
+				u64 value)
+{
+	struct rshim_pcie *dev = container_of(bd, struct rshim_pcie, bd);
+	u64 result;
+	int retval = 0;
+
+	if (!bd->has_rshim)
+		return -ENODEV;
+
+	/*
+	 * We cannot stream large numbers of PCIe writes to the RShim's BAR.
+	 * Instead, we must write no more than 15 8-byte words before
+	 * doing a read from another register within the BAR,
+	 * which forces previous writes to drain.
+	 */
+	if (dev->write_count == 15) {
+		/* Add memory barrier to synchronize the order. */
+		mb();
+		rshim_pcie_read(bd, chan, RSH_SCRATCHPAD, &result);
+	}
+	dev->write_count++;
+#ifndef CONFIG_64BIT
+	retval = rshim_byte_acc_write(dev, chan, addr, value);
+#else
+	writeq(value, dev->rshim_regs + (addr | (chan << 16)));
+#endif
+
+	return retval;
+}
+
+static void rshim_pcie_delete(struct kref *kref)
+{
+	struct rshim_backend *bd;
+	struct rshim_pcie *dev;
+
+	bd = container_of(kref, struct rshim_backend, kref);
+	dev = container_of(bd, struct rshim_pcie, bd);
+
+	rshim_deregister(bd);
+	if (dev->pci_dev)
+		dev_set_drvdata(&dev->pci_dev->dev, NULL);
+	kfree(dev);
+}
+
+/* Probe routine */
+static int rshim_pcie_probe(struct pci_dev *pci_dev,
+			    const struct pci_device_id *id)
+{
+	struct rshim_pcie *dev;
+	struct rshim_backend *bd;
+	char *pcie_dev_name;
+	int index, retval, err = 0, allocfail = 0;
+	const int max_name_len = 20;
+
+	for (index = 0; index < MAX_DEV_COUNT; index++)
+		if (instances[index] == NULL)
+			break;
+	if (index == MAX_DEV_COUNT) {
+		pr_err("Driver cannot handle any more devices.\n");
+		return -ENODEV;
+	}
+
+	pcie_dev_name = kzalloc(max_name_len, GFP_KERNEL);
+	if (pcie_dev_name == NULL) {
+		err = -ENOMEM;
+		goto error;
+	}
+	retval = snprintf(pcie_dev_name, max_name_len,
+				"rshim_pcie%d", index);
+	if (WARN_ON_ONCE(retval >= max_name_len)) {
+		err = -EINVAL;
+		goto error;
+	}
+
+	pr_debug("Probing %s\n", pcie_dev_name);
+
+	rshim_lock();
+
+	/* Find the backend. */
+	bd = rshim_find(pcie_dev_name);
+	if (bd) {
+		kref_get(&bd->kref);
+		dev = container_of(bd, struct rshim_pcie, bd);
+	} else {
+		/* Get some memory for this device's driver state. */
+		dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+		if (dev == NULL) {
+			err = -ENOMEM;
+			rshim_unlock();
+			goto error;
+		}
+
+		instances[index] = dev;
+		bd = &dev->bd;
+		bd->has_rshim = 1;
+		bd->has_tm = 1;
+		bd->dev_name = pcie_dev_name;
+		bd->read_rshim = rshim_pcie_read;
+		bd->write_rshim = rshim_pcie_write;
+		bd->destroy = rshim_pcie_delete;
+		bd->owner = THIS_MODULE;
+		dev->write_count = 0;
+		mutex_init(&bd->mutex);
+	}
+
+	retval = rshim_fifo_alloc(bd);
+	if (retval) {
+		rshim_unlock();
+		dev_err(&pci_dev->dev, "Failed to allocate fifo\n");
+		err = -ENOMEM;
+		goto enable_failed;
+	}
+
+	allocfail |= rshim_fifo_alloc(bd);
+
+	if (!bd->read_buf) {
+		bd->read_buf = kzalloc(READ_BUF_SIZE,
+					   GFP_KERNEL);
+	}
+	allocfail |= bd->read_buf == 0;
+
+	if (!bd->write_buf) {
+		bd->write_buf = kzalloc(WRITE_BUF_SIZE,
+					    GFP_KERNEL);
+	}
+	allocfail |= bd->write_buf == 0;
+
+	if (allocfail) {
+		rshim_unlock();
+		pr_err("can't allocate buffers\n");
+		goto enable_failed;
+	}
+
+	rshim_unlock();
+
+	/* Enable the device. */
+	err = pci_enable_device(pci_dev);
+	if (err != 0) {
+		pr_err("Device enable failed with error %d\n", err);
+		goto enable_failed;
+	}
+
+	/* Initialize object */
+	dev->pci_dev = pci_dev;
+	dev_set_drvdata(&pci_dev->dev, dev);
+
+	dev->bar0_size = pci_resource_len(pci_dev, 0);
+
+	/* Fail if the BAR is unassigned. */
+	if (!dev->bar0_size) {
+		pr_err("BAR unassigned, run 'lspci -v'.\n");
+		err = -ENOMEM;
+		goto rshim_map_failed;
+	}
+
+	/* Map in the RShim registers. */
+	dev->rshim_regs = ioremap(pci_resource_start(pci_dev, 0) +
+				  PCI_RSHIM_WINDOW_OFFSET,
+				  PCI_RSHIM_WINDOW_SIZE);
+	if (dev->rshim_regs == NULL) {
+		dev_err(&pci_dev->dev, "Failed to map RShim registers\n");
+		err = -ENOMEM;
+		goto rshim_map_failed;
+	}
+
+	/* Enable PCI bus mastering. */
+	pci_set_master(pci_dev);
+
+	/*
+	 * Register rshim here since it needs to detect whether other backend
+	 * has already registered or not, which involves reading/writing rshim
+	 * registers and has assumption that the under layer is working.
+	 */
+	rshim_lock();
+	if (!bd->registered) {
+		retval = rshim_register(bd);
+		if (retval) {
+			rshim_unlock();
+			goto rshim_map_failed;
+		} else
+			pcie_dev_name = NULL;
+	}
+	rshim_unlock();
+
+	/* Notify that the device is attached */
+	mutex_lock(&bd->mutex);
+	retval = rshim_notify(bd, RSH_EVENT_ATTACH, 0);
+	mutex_unlock(&bd->mutex);
+	if (retval)
+		goto rshim_map_failed;
+
+	return 0;
+
+ rshim_map_failed:
+	pci_disable_device(pci_dev);
+ enable_failed:
+	rshim_lock();
+	kref_put(&bd->kref, rshim_pcie_delete);
+	rshim_unlock();
+ error:
+	kfree(pcie_dev_name);
+	return err;
+}
+
+/* Called via pci_unregister_driver() when the module is removed. */
+static void rshim_pcie_remove(struct pci_dev *pci_dev)
+{
+	struct rshim_pcie *dev = dev_get_drvdata(&pci_dev->dev);
+	int flush_wq;
+
+	if (!dev)
+		return;
+
+	/*
+	 * Reset TRIO_PCIE_INTFC_RX_BAR0_ADDR_MASK and TRIO_MAP_RSH_BASE.
+	 * Otherwise, upon host reboot, the two registers will retain previous
+	 * values that don't match the new BAR0 address that is assigned to
+	 * the PCIe ports, causing host MMIO access to RShim to fail.
+	 */
+	rshim_pcie_write(&dev->bd, (RSH_SWINT >> 16) & 0xF,
+		RSH_SWINT & 0xFFFF, RSH_INT_VEC0_RTC__SWINT3_MASK);
+
+	/* Clear the flags before unmapping rshim registers to avoid race. */
+	dev->bd.has_rshim = 0;
+	dev->bd.has_tm = 0;
+	/* Add memory barrier to synchronize the order. */
+	mb();
+
+	if (dev->rshim_regs)
+		iounmap(dev->rshim_regs);
+
+	rshim_notify(&dev->bd, RSH_EVENT_DETACH, 0);
+	mutex_lock(&dev->bd.mutex);
+	flush_wq = !cancel_delayed_work(&dev->bd.work);
+	if (flush_wq)
+		flush_workqueue(rshim_wq);
+	dev->bd.has_cons_work = 0;
+	kfree(dev->bd.read_buf);
+	kfree(dev->bd.write_buf);
+	rshim_fifo_free(&dev->bd);
+	mutex_unlock(&dev->bd.mutex);
+
+	rshim_lock();
+	kref_put(&dev->bd.kref, rshim_pcie_delete);
+	rshim_unlock();
+
+	pci_disable_device(pci_dev);
+	dev_set_drvdata(&pci_dev->dev, NULL);
+}
+
+static struct pci_device_id rshim_pcie_table[] = {
+	{ PCI_DEVICE(TILERA_VENDOR_ID, BLUEFIELD_DEVICE_ID), },
+	{ 0, }
+};
+MODULE_DEVICE_TABLE(pci, rshim_pcie_table);
+
+static struct pci_driver rshim_pcie_driver = {
+	.name = "rshim_pcie",
+	.probe = rshim_pcie_probe,
+	.remove = rshim_pcie_remove,
+	.id_table = rshim_pcie_table,
+};
+
+static int __init rshim_pcie_init(void)
+{
+	int result;
+
+	/* Register the driver */
+	result = pci_register_driver(&rshim_pcie_driver);
+	if (result)
+		pr_err("pci_register failed, error number %d\n", result);
+
+	return result;
+}
+
+static void __exit rshim_pcie_exit(void)
+{
+	/* Unregister the driver. */
+	pci_unregister_driver(&rshim_pcie_driver);
+}
+
+module_init(rshim_pcie_init);
+module_exit(rshim_pcie_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mellanox Technologies");
+MODULE_VERSION("0.6");
diff --git a/drivers/soc/mellanox/host/rshim_pcie_lf.c b/drivers/soc/mellanox/host/rshim_pcie_lf.c
new file mode 100644
index 0000000..08e2c15
--- /dev/null
+++ b/drivers/soc/mellanox/host/rshim_pcie_lf.c
@@ -0,0 +1,695 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rshim_pcie_lf.c - Mellanox RShim PCIe Livefish driver for x86 host
+ *
+ * Copyright 2017 Mellanox Technologies. All Rights Reserved.
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful, but
+ *   WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
+ *   NON INFRINGEMENT.  See the GNU General Public License for
+ *   more details.
+ */
+
+#include <linux/pci.h>
+#include <linux/version.h>
+#include <linux/sched.h>
+#include <linux/sched/signal.h>
+
+#include "rshim.h"
+
+/* Disable RSim access. */
+static int rshim_disable;
+module_param(rshim_disable, int, 0444);
+MODULE_PARM_DESC(rshim_disable, "Disable rshim (obsoleted)");
+
+/** Our Vendor/Device IDs. */
+#define TILERA_VENDOR_ID					0x15b3
+#define BLUEFIELD_DEVICE_ID					0x0211
+
+/* Maximum number of devices this driver can handle */
+#define MAX_DEV_COUNT						16
+
+/* Mellanox Address & Data Capabilities */
+#define MELLANOX_ADDR						0x58
+#define MELLANOX_DATA						0x5c
+#define MELLANOX_CAP_READ					0x1
+
+/* TRIO_CR_GATEWAY registers */
+#define TRIO_CR_GW_LOCK						0xe38a0
+#define TRIO_CR_GW_LOCK_CPY					0xe38a4
+#define TRIO_CR_GW_DATA_UPPER					0xe38ac
+#define TRIO_CR_GW_DATA_LOWER					0xe38b0
+#define TRIO_CR_GW_CTL						0xe38b4
+#define TRIO_CR_GW_ADDR_UPPER					0xe38b8
+#define TRIO_CR_GW_ADDR_LOWER					0xe38bc
+#define TRIO_CR_GW_LOCK_ACQUIRED				0x80000000
+#define TRIO_CR_GW_LOCK_RELEASE					0x0
+#define TRIO_CR_GW_BUSY						0x60000000
+#define TRIO_CR_GW_TRIGGER					0xe0000000
+#define TRIO_CR_GW_READ_4BYTE					0x6
+#define TRIO_CR_GW_WRITE_4BYTE					0x2
+
+/* Base RShim Address */
+#define RSH_BASE_ADDR						0x80000000
+#define RSH_CHANNEL1_BASE					0x80010000
+
+struct rshim_pcie {
+	/* RShim backend structure. */
+	struct rshim_backend	bd;
+
+	struct pci_dev *pci_dev;
+
+	/* Keep track of number of 8-byte word writes */
+	u8 write_count;
+};
+
+static struct rshim_pcie *instances[MAX_DEV_COUNT];
+
+/* Mechanism to access the CR space using hidden PCI capabilities */
+static int pci_cap_read(struct pci_dev *pci_dev, int offset,
+				u32 *result)
+{
+	int retval;
+
+	/*
+	 * Write target offset to MELLANOX_ADDR.
+	 * Set LSB to indicate a read operation.
+	 */
+	retval = pci_write_config_dword(pci_dev, MELLANOX_ADDR,
+				offset | MELLANOX_CAP_READ);
+	if (retval)
+		return retval;
+
+	/* Read result from MELLANOX_DATA */
+	retval = pci_read_config_dword(pci_dev, MELLANOX_DATA,
+				result);
+	if (retval)
+		return retval;
+
+	return 0;
+}
+
+static int pci_cap_write(struct pci_dev *pci_dev, int offset,
+				u32 value)
+{
+	int retval;
+
+	/* Write data to MELLANOX_DATA */
+	retval = pci_write_config_dword(pci_dev, MELLANOX_DATA,
+				value);
+	if (retval)
+		return retval;
+
+	/*
+	 * Write target offset to MELLANOX_ADDR.
+	 * Leave LSB clear to indicate a write operation.
+	 */
+	retval = pci_write_config_dword(pci_dev, MELLANOX_ADDR,
+				offset);
+	if (retval)
+		return retval;
+
+	return 0;
+}
+
+/* Acquire and release the TRIO_CR_GW_LOCK. */
+static int trio_cr_gw_lock_acquire(struct pci_dev *pci_dev)
+{
+	int retval;
+	u32 read_value;
+
+	/* Wait until TRIO_CR_GW_LOCK is free */
+	do {
+		retval = pci_cap_read(pci_dev, TRIO_CR_GW_LOCK,
+				&read_value);
+		if (retval)
+			return retval;
+		if (signal_pending(current))
+			return -EINTR;
+	} while (read_value & TRIO_CR_GW_LOCK_ACQUIRED);
+
+	/* Acquire TRIO_CR_GW_LOCK */
+	retval = pci_cap_write(pci_dev, TRIO_CR_GW_LOCK,
+				TRIO_CR_GW_LOCK_ACQUIRED);
+	if (retval)
+		return retval;
+
+	return 0;
+}
+
+static int trio_cr_gw_lock_release(struct pci_dev *pci_dev)
+{
+	int retval;
+
+	/* Release TRIO_CR_GW_LOCK */
+	retval = pci_cap_write(pci_dev, TRIO_CR_GW_LOCK,
+				TRIO_CR_GW_LOCK_RELEASE);
+
+	return retval;
+}
+
+/*
+ * Mechanism to access the RShim from the CR space using the
+ * TRIO_CR_GATEWAY.
+ */
+static int trio_cr_gw_read(struct pci_dev *pci_dev, int addr,
+				u32 *result)
+{
+	int retval;
+
+	/* Acquire TRIO_CR_GW_LOCK */
+	retval = trio_cr_gw_lock_acquire(pci_dev);
+	if (retval)
+		return retval;
+
+	/* Write addr to TRIO_CR_GW_ADDR_LOWER */
+	retval = pci_cap_write(pci_dev, TRIO_CR_GW_ADDR_LOWER,
+				addr);
+	if (retval)
+		return retval;
+
+	/* Set TRIO_CR_GW_READ_4BYTE */
+	retval = pci_cap_write(pci_dev, TRIO_CR_GW_CTL,
+				TRIO_CR_GW_READ_4BYTE);
+	if (retval)
+		return retval;
+
+	/* Trigger TRIO_CR_GW to read from addr */
+	retval = pci_cap_write(pci_dev, TRIO_CR_GW_LOCK,
+				TRIO_CR_GW_TRIGGER);
+	if (retval)
+		return retval;
+
+	/* Read 32-bit data from TRIO_CR_GW_DATA_LOWER */
+	retval = pci_cap_read(pci_dev, TRIO_CR_GW_DATA_LOWER,
+				result);
+	if (retval)
+		return retval;
+
+	/* Release TRIO_CR_GW_LOCK */
+	retval = trio_cr_gw_lock_release(pci_dev);
+	if (retval)
+		return retval;
+
+	return 0;
+}
+
+static int trio_cr_gw_write(struct pci_dev *pci_dev, int addr,
+				u32 value)
+{
+	int retval;
+
+	/* Acquire TRIO_CR_GW_LOCK */
+	retval = trio_cr_gw_lock_acquire(pci_dev);
+	if (retval)
+		return retval;
+
+	/* Write 32-bit data to TRIO_CR_GW_DATA_LOWER */
+	retval = pci_cap_write(pci_dev, TRIO_CR_GW_DATA_LOWER,
+				value);
+	if (retval)
+		return retval;
+
+	/* Write addr to TRIO_CR_GW_ADDR_LOWER */
+	retval = pci_cap_write(pci_dev, TRIO_CR_GW_ADDR_LOWER,
+				addr);
+	if (retval)
+		return retval;
+
+	/* Set TRIO_CR_GW_WRITE_4BYTE */
+	retval = pci_cap_write(pci_dev, TRIO_CR_GW_CTL,
+				TRIO_CR_GW_WRITE_4BYTE);
+	if (retval)
+		return retval;
+
+	/* Trigger CR gateway to write to RShim */
+	retval = pci_cap_write(pci_dev, TRIO_CR_GW_LOCK,
+				TRIO_CR_GW_TRIGGER);
+	if (retval)
+		return retval;
+
+	/* Release TRIO_CR_GW_LOCK */
+	retval = trio_cr_gw_lock_release(pci_dev);
+	if (retval)
+		return retval;
+
+	return 0;
+}
+
+/* Wait until the RSH_BYTE_ACC_CTL pending bit is cleared */
+static int rshim_byte_acc_pending_wait(struct pci_dev *pci_dev)
+{
+	int retval;
+	u32 read_value;
+
+	do {
+		retval = trio_cr_gw_read(pci_dev,
+			RSH_CHANNEL1_BASE + RSH_BYTE_ACC_CTL, &read_value);
+		if (retval)
+			return retval;
+		if (signal_pending(current))
+			return -EINTR;
+	} while (read_value & (RSH_CHANNEL1_BASE + RSH_BYTE_ACC_PENDING));
+
+	return 0;
+}
+
+/*
+ * Mechanism to do an 8-byte access to the Rshim using
+ * two 4-byte accesses through the Rshim Byte Access Widget.
+ */
+static int rshim_byte_acc_read(struct pci_dev *pci_dev, int addr,
+				u64 *result)
+{
+	int retval;
+	u32 read_value;
+	u64 read_result;
+
+	/* Wait for RSH_BYTE_ACC_CTL pending bit to be cleared */
+	retval = rshim_byte_acc_pending_wait(pci_dev);
+	if (retval)
+		return retval;
+
+	/* Write control bits to RSH_BYTE_ACC_CTL */
+	retval = trio_cr_gw_write(pci_dev, RSH_CHANNEL1_BASE + RSH_BYTE_ACC_CTL,
+				RSH_BYTE_ACC_SIZE);
+	if (retval)
+		return retval;
+
+	/* Write target address to RSH_BYTE_ACC_ADDR */
+	retval = trio_cr_gw_write(pci_dev, RSH_CHANNEL1_BASE +
+				  RSH_BYTE_ACC_ADDR, addr);
+	if (retval)
+		return retval;
+
+	/* Write trigger bits to perform read */
+	retval = trio_cr_gw_write(pci_dev, RSH_CHANNEL1_BASE + RSH_BYTE_ACC_CTL,
+				RSH_BYTE_ACC_READ_TRIGGER);
+	if (retval)
+		return retval;
+
+	/* Wait for RSH_BYTE_ACC_CTL pending bit to be cleared */
+	retval = rshim_byte_acc_pending_wait(pci_dev);
+	if (retval)
+		return retval;
+
+	/* Read RSH_BYTE_ACC_RDAT to read lower 32-bits of data */
+	retval = trio_cr_gw_read(pci_dev, RSH_CHANNEL1_BASE + RSH_BYTE_ACC_RDAT,
+				&read_value);
+	if (retval)
+		return retval;
+
+	read_result = (u64)read_value << 32;
+
+	/* Wait for RSH_BYTE_ACC_CTL pending bit to be cleared */
+	retval = rshim_byte_acc_pending_wait(pci_dev);
+	if (retval)
+		return retval;
+
+	/* Read RSH_BYTE_ACC_RDAT to read upper 32-bits of data */
+	retval = trio_cr_gw_read(pci_dev, RSH_CHANNEL1_BASE + RSH_BYTE_ACC_RDAT,
+				&read_value);
+	if (retval)
+		return retval;
+
+	read_result |= (u64)read_value;
+	*result = be64_to_cpu(read_result);
+
+	return 0;
+}
+
+static int rshim_byte_acc_write(struct pci_dev *pci_dev, int addr,
+				u64 value)
+{
+	int retval;
+
+	/* Wait for RSH_BYTE_ACC_CTL pending bit to be cleared */
+	retval = rshim_byte_acc_pending_wait(pci_dev);
+	if (retval)
+		return retval;
+
+	/* Write control bits to RSH_BYTE_ACC_CTL */
+	retval = trio_cr_gw_write(pci_dev, RSH_CHANNEL1_BASE + RSH_BYTE_ACC_CTL,
+				RSH_BYTE_ACC_SIZE);
+	if (retval)
+		return retval;
+
+	/* Write target address to RSH_BYTE_ACC_ADDR */
+	retval = trio_cr_gw_write(pci_dev, RSH_CHANNEL1_BASE +
+				  RSH_BYTE_ACC_ADDR, addr);
+	if (retval)
+		return retval;
+
+	/* Write control bits to RSH_BYTE_ACC_CTL */
+	retval = trio_cr_gw_write(pci_dev, RSH_CHANNEL1_BASE + RSH_BYTE_ACC_CTL,
+				RSH_BYTE_ACC_SIZE);
+	if (retval)
+		return retval;
+
+	/* Write lower 32 bits of data to TRIO_CR_GW_DATA */
+	retval = trio_cr_gw_write(pci_dev, RSH_CHANNEL1_BASE +
+				  RSH_BYTE_ACC_WDAT, (u32)(value >> 32));
+	if (retval)
+		return retval;
+
+	/* Wait for RSH_BYTE_ACC_CTL pending bit to be cleared */
+	retval = rshim_byte_acc_pending_wait(pci_dev);
+	if (retval)
+		return retval;
+
+	/* Write upper 32 bits of data to TRIO_CR_GW_DATA */
+	retval = trio_cr_gw_write(pci_dev, RSH_CHANNEL1_BASE +
+				  RSH_BYTE_ACC_WDAT, (u32)(value));
+	if (retval)
+		return retval;
+
+	return 0;
+}
+
+/*
+ * The RShim Boot FIFO has a holding register which can couple
+ * two consecutive 4-byte writes into a single 8-byte write
+ * before pushing the data into the FIFO.
+ * Hence the RShim Byte Access Widget is not necessary to write
+ * to the BOOT FIFO using 4-byte writes.
+ */
+static int rshim_boot_fifo_write(struct pci_dev *pci_dev, int addr,
+				u64 value)
+{
+	int retval;
+
+	/* Write lower 32 bits of data to RSH_BOOT_FIFO_DATA */
+	retval = trio_cr_gw_write(pci_dev, addr,
+				(u32)(value >> 32));
+	if (retval)
+		return retval;
+
+	/* Write upper 32 bits of data to RSH_BOOT_FIFO_DATA */
+	retval = trio_cr_gw_write(pci_dev, addr,
+				(u32)(value));
+	if (retval)
+		return retval;
+
+	return 0;
+}
+
+/* RShim read/write routines */
+static int rshim_pcie_read(struct rshim_backend *bd, int chan, int addr,
+				u64 *result)
+{
+	struct rshim_pcie *dev = container_of(bd, struct rshim_pcie, bd);
+	struct pci_dev *pci_dev = dev->pci_dev;
+	int retval;
+
+	if (!bd->has_rshim)
+		return -ENODEV;
+
+	dev->write_count = 0;
+
+	addr = RSH_BASE_ADDR + (addr | (chan << 16));
+	addr = be32_to_cpu(addr);
+
+	retval = rshim_byte_acc_read(pci_dev, addr, result);
+
+	return retval;
+}
+
+static int rshim_pcie_write(struct rshim_backend *bd, int chan, int addr,
+				u64 value)
+{
+	struct rshim_pcie *dev = container_of(bd, struct rshim_pcie, bd);
+	struct pci_dev *pci_dev = dev->pci_dev;
+	int retval;
+	u64 result;
+	bool is_boot_stream = (addr == RSH_BOOT_FIFO_DATA);
+
+	if (!bd->has_rshim)
+		return -ENODEV;
+
+	addr = RSH_BASE_ADDR + (addr | (chan << 16));
+	if (!is_boot_stream)
+		addr = be32_to_cpu(addr);
+
+	value = be64_to_cpu(value);
+
+	/*
+	 * We cannot stream large numbers of PCIe writes to the RShim.
+	 * Instead, we must write no more than 15 words before
+	 * doing a read from another register within the RShim,
+	 * which forces previous writes to drain.
+	 * Note that we allow a max write_count of 7 since each 8-byte
+	 * write is done using 2 4-byte writes in the boot fifo case.
+	 */
+	if (dev->write_count == 7) {
+		/* Add memory barrier to synchronize the order. */
+		mb();
+		rshim_pcie_read(bd, 1, RSH_SCRATCHPAD, &result);
+	}
+	dev->write_count++;
+
+	if (is_boot_stream)
+		retval = rshim_boot_fifo_write(pci_dev, addr, value);
+	else
+		retval = rshim_byte_acc_write(pci_dev, addr, value);
+
+	return retval;
+}
+
+static void rshim_pcie_delete(struct kref *kref)
+{
+	struct rshim_backend *bd;
+	struct rshim_pcie *dev;
+
+	bd = container_of(kref, struct rshim_backend, kref);
+	dev = container_of(bd, struct rshim_pcie, bd);
+
+	rshim_deregister(bd);
+	if (dev->pci_dev)
+		dev_set_drvdata(&dev->pci_dev->dev, NULL);
+	kfree(dev);
+}
+
+/* Probe routine */
+static int rshim_pcie_probe(struct pci_dev *pci_dev,
+				const struct pci_device_id *id)
+{
+	struct rshim_pcie *dev = NULL;
+	struct rshim_backend *bd = NULL;
+	char *pcie_dev_name;
+	int index, retval, err = 0, allocfail = 0;
+	const int max_name_len = 20;
+
+	for (index = 0; index < MAX_DEV_COUNT; index++)
+		if (instances[index] == NULL)
+			break;
+	if (index == MAX_DEV_COUNT) {
+		pr_err("Driver cannot handle any more devices.\n");
+		return -ENODEV;
+	}
+
+	pcie_dev_name = kzalloc(max_name_len, GFP_KERNEL);
+	if (pcie_dev_name == NULL)
+		return -ENOMEM;
+	retval = snprintf(pcie_dev_name, max_name_len,
+				"rshim_pcie%d", index);
+	if (WARN_ON_ONCE(retval >= max_name_len)) {
+		err = -EINVAL;
+		goto error;
+	}
+
+	pr_debug("Probing %s\n", pcie_dev_name);
+
+	rshim_lock();
+
+	/* Find the backend. */
+	bd = rshim_find(pcie_dev_name);
+	if (bd) {
+		kref_get(&bd->kref);
+		dev = container_of(bd, struct rshim_pcie, bd);
+	} else {
+		/* Get some memory for this device's driver state. */
+		dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+		if (dev == NULL) {
+			err = -ENOMEM;
+			rshim_unlock();
+			goto error;
+		}
+
+		instances[index] = dev;
+		bd = &dev->bd;
+		bd->has_rshim = 1;
+		bd->has_tm = 1;
+		bd->owner = THIS_MODULE;
+		bd->dev_name = pcie_dev_name;
+		bd->destroy = rshim_pcie_delete;
+		bd->read_rshim = rshim_pcie_read;
+		bd->write_rshim = rshim_pcie_write;
+		dev->write_count = 0;
+		mutex_init(&bd->mutex);
+	}
+
+	retval = rshim_fifo_alloc(bd);
+	if (retval) {
+		rshim_unlock();
+		pr_err("Failed to allocate fifo\n");
+		err = -ENOMEM;
+		goto enable_failed;
+	}
+
+	allocfail |= rshim_fifo_alloc(bd);
+
+	if (!bd->read_buf) {
+		bd->read_buf = kzalloc(READ_BUF_SIZE,
+					   GFP_KERNEL);
+	}
+	allocfail |= bd->read_buf == 0;
+
+	if (!bd->write_buf) {
+		bd->write_buf = kzalloc(WRITE_BUF_SIZE,
+					    GFP_KERNEL);
+	}
+	allocfail |= bd->write_buf == 0;
+
+	if (allocfail) {
+		rshim_unlock();
+		pr_err("can't allocate buffers\n");
+		goto enable_failed;
+	}
+
+	rshim_unlock();
+
+	/* Enable the device. */
+	err = pci_enable_device(pci_dev);
+	if (err != 0) {
+		pr_err("Device enable failed with error %d\n", err);
+		goto enable_failed;
+	}
+
+	/* Initialize object */
+	dev->pci_dev = pci_dev;
+	dev_set_drvdata(&pci_dev->dev, dev);
+
+	/* Enable PCI bus mastering. */
+	pci_set_master(pci_dev);
+
+	/*
+	 * Register rshim here since it needs to detect whether other backend
+	 * has already registered or not, which involves reading/writing rshim
+	 * registers and has assumption that the under layer is working.
+	 */
+	rshim_lock();
+	if (!bd->registered) {
+		retval = rshim_register(bd);
+		if (retval) {
+			pr_err("Backend register failed with error %d\n",
+				 retval);
+			rshim_unlock();
+			goto register_failed;
+		}
+	}
+	rshim_unlock();
+
+	/* Notify that the device is attached */
+	mutex_lock(&bd->mutex);
+	retval = rshim_notify(bd, RSH_EVENT_ATTACH, 0);
+	mutex_unlock(&bd->mutex);
+	if (retval)
+		goto register_failed;
+
+	return 0;
+
+register_failed:
+	pci_disable_device(pci_dev);
+
+enable_failed:
+	rshim_lock();
+	kref_put(&dev->bd.kref, rshim_pcie_delete);
+	rshim_unlock();
+error:
+	kfree(pcie_dev_name);
+
+	return err;
+}
+
+/* Called via pci_unregister_driver() when the module is removed. */
+static void rshim_pcie_remove(struct pci_dev *pci_dev)
+{
+	struct rshim_pcie *dev = dev_get_drvdata(&pci_dev->dev);
+	int retval, flush_wq;
+
+	/*
+	 * Reset TRIO_PCIE_INTFC_RX_BAR0_ADDR_MASK and TRIO_MAP_RSH_BASE.
+	 * Otherwise, upon host reboot, the two registers will retain previous
+	 * values that don't match the new BAR0 address that is assigned to
+	 * the PCIe ports, causing host MMIO access to RShim to fail.
+	 */
+	retval = rshim_pcie_write(&dev->bd, (RSH_SWINT >> 16) & 0xF,
+			RSH_SWINT & 0xFFFF, RSH_INT_VEC0_RTC__SWINT3_MASK);
+	if (retval)
+		pr_err("RShim write failed\n");
+
+	/* Clear the flags before deleting the backend. */
+	dev->bd.has_rshim = 0;
+	dev->bd.has_tm = 0;
+
+	rshim_notify(&dev->bd, RSH_EVENT_DETACH, 0);
+	mutex_lock(&dev->bd.mutex);
+	flush_wq = !cancel_delayed_work(&dev->bd.work);
+	if (flush_wq)
+		flush_workqueue(rshim_wq);
+	dev->bd.has_cons_work = 0;
+	kfree(dev->bd.read_buf);
+	kfree(dev->bd.write_buf);
+	rshim_fifo_free(&dev->bd);
+	mutex_unlock(&dev->bd.mutex);
+
+	rshim_lock();
+	kref_put(&dev->bd.kref, rshim_pcie_delete);
+	rshim_unlock();
+
+	pci_disable_device(pci_dev);
+	dev_set_drvdata(&pci_dev->dev, NULL);
+}
+
+static struct pci_device_id rshim_pcie_table[] = {
+	{ PCI_DEVICE(TILERA_VENDOR_ID, BLUEFIELD_DEVICE_ID), },
+	{ 0, }
+};
+MODULE_DEVICE_TABLE(pci, rshim_pcie_table);
+
+static struct pci_driver rshim_pcie_driver = {
+	.name = "rshim_pcie_lf",
+	.probe = rshim_pcie_probe,
+	.remove = rshim_pcie_remove,
+	.id_table = rshim_pcie_table,
+};
+
+static int __init rshim_pcie_init(void)
+{
+	int result;
+
+	/* Register the driver */
+	result = pci_register_driver(&rshim_pcie_driver);
+	if (result)
+		pr_err("pci_register failed, error number %d\n", result);
+
+	return result;
+}
+
+static void __exit rshim_pcie_exit(void)
+{
+	/* Unregister the driver. */
+	pci_unregister_driver(&rshim_pcie_driver);
+}
+
+module_init(rshim_pcie_init);
+module_exit(rshim_pcie_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mellanox Technologies");
+MODULE_VERSION("0.4");
diff --git a/drivers/soc/mellanox/host/rshim_regs.h b/drivers/soc/mellanox/host/rshim_regs.h
new file mode 100644
index 0000000..74f8e30
--- /dev/null
+++ b/drivers/soc/mellanox/host/rshim_regs.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, Mellanox Technologies. All rights reserved.
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+#ifndef __RSHIM_REGS_H__
+#define __RSHIM_REGS_H__
+
+#ifdef __ASSEMBLER__
+#define _64bit(x) x
+#else /* __ASSEMBLER__ */
+#ifdef __tile__
+#define _64bit(x) x ## UL
+#else /* __tile__ */
+#define _64bit(x) x ## ULL
+#endif /* __tile__ */
+#endif /* __ASSEMBLER */
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#else
+#include <stdint.h>
+#endif
+
+#ifndef __DOXYGEN__
+
+#define RSH_BOOT_FIFO_DATA 0x408
+
+#define RSH_BOOT_FIFO_COUNT 0x488
+#define RSH_BOOT_FIFO_COUNT__LENGTH 0x0001
+#define RSH_BOOT_FIFO_COUNT__BOOT_FIFO_COUNT_SHIFT 0
+#define RSH_BOOT_FIFO_COUNT__BOOT_FIFO_COUNT_WIDTH 10
+#define RSH_BOOT_FIFO_COUNT__BOOT_FIFO_COUNT_RESET_VAL 0
+#define RSH_BOOT_FIFO_COUNT__BOOT_FIFO_COUNT_RMASK 0x3ff
+#define RSH_BOOT_FIFO_COUNT__BOOT_FIFO_COUNT_MASK  0x3ff
+
+#define RSH_BOOT_CONTROL 0x528
+#define RSH_BOOT_CONTROL__LENGTH 0x0001
+#define RSH_BOOT_CONTROL__BOOT_MODE_SHIFT 0
+#define RSH_BOOT_CONTROL__BOOT_MODE_WIDTH 2
+#define RSH_BOOT_CONTROL__BOOT_MODE_RESET_VAL 0
+#define RSH_BOOT_CONTROL__BOOT_MODE_RMASK 0x3
+#define RSH_BOOT_CONTROL__BOOT_MODE_MASK  0x3
+#define RSH_BOOT_CONTROL__BOOT_MODE_VAL_NONE 0x0
+#define RSH_BOOT_CONTROL__BOOT_MODE_VAL_EMMC 0x1
+#define RSH_BOOT_CONTROL__BOOT_MODE_VAL_EMMC_LEGACY 0x3
+
+#define RSH_RESET_CONTROL 0x500
+#define RSH_RESET_CONTROL__LENGTH 0x0001
+#define RSH_RESET_CONTROL__RESET_CHIP_SHIFT 0
+#define RSH_RESET_CONTROL__RESET_CHIP_WIDTH 32
+#define RSH_RESET_CONTROL__RESET_CHIP_RESET_VAL 0
+#define RSH_RESET_CONTROL__RESET_CHIP_RMASK 0xffffffff
+#define RSH_RESET_CONTROL__RESET_CHIP_MASK  0xffffffff
+#define RSH_RESET_CONTROL__RESET_CHIP_VAL_KEY 0xca710001
+#define RSH_RESET_CONTROL__DISABLE_SHIFT 32
+#define RSH_RESET_CONTROL__DISABLE_WIDTH 1
+#define RSH_RESET_CONTROL__DISABLE_RESET_VAL 0
+#define RSH_RESET_CONTROL__DISABLE_RMASK 0x1
+#define RSH_RESET_CONTROL__DISABLE_MASK  _64bit(0x100000000)
+#define RSH_RESET_CONTROL__REQ_PND_SHIFT 33
+#define RSH_RESET_CONTROL__REQ_PND_WIDTH 1
+#define RSH_RESET_CONTROL__REQ_PND_RESET_VAL 0
+#define RSH_RESET_CONTROL__REQ_PND_RMASK 0x1
+#define RSH_RESET_CONTROL__REQ_PND_MASK  _64bit(0x200000000)
+
+#define RSH_SCRATCHPAD1 0xc20
+
+#define RSH_SCRATCH_BUF_CTL 0x600
+
+#define RSH_SCRATCH_BUF_DAT 0x610
+
+#define RSH_SEMAPHORE0 0x28
+
+#define RSH_SCRATCHPAD 0x20
+
+#define RSH_TM_HOST_TO_TILE_CTL 0xa30
+#define RSH_TM_HOST_TO_TILE_CTL__LENGTH 0x0001
+#define RSH_TM_HOST_TO_TILE_CTL__LWM_SHIFT 0
+#define RSH_TM_HOST_TO_TILE_CTL__LWM_WIDTH 8
+#define RSH_TM_HOST_TO_TILE_CTL__LWM_RESET_VAL 128
+#define RSH_TM_HOST_TO_TILE_CTL__LWM_RMASK 0xff
+#define RSH_TM_HOST_TO_TILE_CTL__LWM_MASK  0xff
+#define RSH_TM_HOST_TO_TILE_CTL__HWM_SHIFT 8
+#define RSH_TM_HOST_TO_TILE_CTL__HWM_WIDTH 8
+#define RSH_TM_HOST_TO_TILE_CTL__HWM_RESET_VAL 128
+#define RSH_TM_HOST_TO_TILE_CTL__HWM_RMASK 0xff
+#define RSH_TM_HOST_TO_TILE_CTL__HWM_MASK  0xff00
+#define RSH_TM_HOST_TO_TILE_CTL__MAX_ENTRIES_SHIFT 32
+#define RSH_TM_HOST_TO_TILE_CTL__MAX_ENTRIES_WIDTH 9
+#define RSH_TM_HOST_TO_TILE_CTL__MAX_ENTRIES_RESET_VAL 256
+#define RSH_TM_HOST_TO_TILE_CTL__MAX_ENTRIES_RMASK 0x1ff
+#define RSH_TM_HOST_TO_TILE_CTL__MAX_ENTRIES_MASK  _64bit(0x1ff00000000)
+
+#define RSH_TM_HOST_TO_TILE_STS 0xa28
+#define RSH_TM_HOST_TO_TILE_STS__LENGTH 0x0001
+#define RSH_TM_HOST_TO_TILE_STS__COUNT_SHIFT 0
+#define RSH_TM_HOST_TO_TILE_STS__COUNT_WIDTH 9
+#define RSH_TM_HOST_TO_TILE_STS__COUNT_RESET_VAL 0
+#define RSH_TM_HOST_TO_TILE_STS__COUNT_RMASK 0x1ff
+#define RSH_TM_HOST_TO_TILE_STS__COUNT_MASK  0x1ff
+
+#define RSH_TM_TILE_TO_HOST_STS 0xa48
+#define RSH_TM_TILE_TO_HOST_STS__LENGTH 0x0001
+#define RSH_TM_TILE_TO_HOST_STS__COUNT_SHIFT 0
+#define RSH_TM_TILE_TO_HOST_STS__COUNT_WIDTH 9
+#define RSH_TM_TILE_TO_HOST_STS__COUNT_RESET_VAL 0
+#define RSH_TM_TILE_TO_HOST_STS__COUNT_RMASK 0x1ff
+#define RSH_TM_TILE_TO_HOST_STS__COUNT_MASK  0x1ff
+
+#define RSH_TM_HOST_TO_TILE_DATA 0xa20
+
+#define RSH_TM_TILE_TO_HOST_DATA 0xa40
+
+#define RSH_MMIO_ADDRESS_SPACE__LENGTH 0x10000000000
+#define RSH_MMIO_ADDRESS_SPACE__STRIDE 0x8
+#define RSH_MMIO_ADDRESS_SPACE__OFFSET_SHIFT 0
+#define RSH_MMIO_ADDRESS_SPACE__OFFSET_WIDTH 16
+#define RSH_MMIO_ADDRESS_SPACE__OFFSET_RESET_VAL 0
+#define RSH_MMIO_ADDRESS_SPACE__OFFSET_RMASK 0xffff
+#define RSH_MMIO_ADDRESS_SPACE__OFFSET_MASK  0xffff
+#define RSH_MMIO_ADDRESS_SPACE__PROT_SHIFT 16
+#define RSH_MMIO_ADDRESS_SPACE__PROT_WIDTH 3
+#define RSH_MMIO_ADDRESS_SPACE__PROT_RESET_VAL 0
+#define RSH_MMIO_ADDRESS_SPACE__PROT_RMASK 0x7
+#define RSH_MMIO_ADDRESS_SPACE__PROT_MASK  0x70000
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_SHIFT 23
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_WIDTH 4
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_RESET_VAL 0
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_RMASK 0xf
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_MASK  0x7800000
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_BOOT 0x0
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_RSHIM 0x1
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_UART0 0x2
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_UART1 0x3
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_DIAG_UART 0x4
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_TYU 0x5
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_TYU_EXT1 0x6
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_TYU_EXT2 0x7
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_TYU_EXT3 0x8
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_TIMER 0x9
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_USB 0xa
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_GPIO 0xb
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_MMC 0xc
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_TIMER_EXT 0xd
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_WDOG_NS 0xe
+#define RSH_MMIO_ADDRESS_SPACE__CHANNEL_VAL_WDOG_SEC 0xf
+
+#define RSH_SWINT 0x318
+
+#define RSH_BYTE_ACC_CTL 0x490
+
+#define RSH_BYTE_ACC_WDAT 0x498
+
+#define RSH_BYTE_ACC_RDAT 0x4a0
+
+#define RSH_BYTE_ACC_ADDR 0x4a8
+
+#endif /* !defined(__DOXYGEN__) */
+#endif /* !defined(__RSHIM_REGS_H__) */
diff --git a/drivers/soc/mellanox/host/rshim_usb.c b/drivers/soc/mellanox/host/rshim_usb.c
new file mode 100644
index 0000000..aad6250
--- /dev/null
+++ b/drivers/soc/mellanox/host/rshim_usb.c
@@ -0,0 +1,1035 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * rshim_usb.c - Mellanox RShim USB host driver
+ *
+ * Copyright 2017 Mellanox Technologies. All Rights Reserved.
+ *
+ *   This program is free software; you can redistribute it and/or
+ *   modify it under the terms of the GNU General Public License
+ *   as published by the Free Software Foundation, version 2.
+ *
+ *   This program is distributed in the hope that it will be useful, but
+ *   WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE, GOOD TITLE or
+ *   NON INFRINGEMENT.  See the GNU General Public License for
+ *   more details.
+ */
+
+/*
+ * This source code was originally derived from:
+ *
+ *   USB Skeleton driver - 2.0
+ *
+ *   Copyright (C) 2001-2004 Greg Kroah-Hartman (greg@kroah.com)
+ *
+ *	This program is free software; you can redistribute it and/or
+ *	modify it under the terms of the GNU General Public License as
+ *	published by the Free Software Foundation, version 2.
+ *
+ * Some code was also lifted from the example drivers in "Linux Device
+ * Drivers" by Alessandro Rubini and Jonathan Corbet, published by
+ * O'Reilly & Associates.
+ */
+
+#include <linux/kernel.h>
+#include <linux/fs.h>
+#include <linux/cdev.h>
+#include <linux/errno.h>
+#include <linux/init.h>
+#include <linux/kref.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/poll.h>
+#include <linux/seq_file.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+#include <linux/version.h>
+#include <linux/uaccess.h>
+#include <linux/ioctl.h>
+#include <linux/termios.h>
+#include <linux/workqueue.h>
+#include <asm/termbits.h>
+#include <linux/circ_buf.h>
+
+#include "rshim.h"
+
+/* Disable RSim access. */
+static int rshim_disable;
+module_param(rshim_disable, int, 0444);
+MODULE_PARM_DESC(rshim_disable, "Disable rshim (obsoleted)");
+
+/* Our USB vendor/product IDs. */
+#define USB_TILERA_VENDOR_ID	0x22dc	 /* Tilera Corporation */
+#define USB_BLUEFIELD_PRODUCT_ID	0x0004	 /* Mellanox Bluefield */
+
+/* Number of retries for the tmfifo read/write path. */
+#define READ_RETRIES		5
+#define WRITE_RETRIES		5
+
+/* Structure to hold all of our device specific stuff. */
+struct rshim_usb {
+	/* RShim backend structure. */
+	struct rshim_backend bd;
+
+	/*
+	 * The USB device for this device.  We bump its reference count
+	 * when the first interface is probed, and drop the ref when the
+	 * last interface is disconnected.
+	 */
+	struct usb_device *udev;
+
+	/* The USB interfaces for this device. */
+	struct usb_interface *rshim_interface;
+
+	/* State for our outstanding boot write. */
+	struct urb *boot_urb;
+
+	/* Control data. */
+	u64 ctrl_data;
+
+	/* Interrupt data buffer.  This is a USB DMA'able buffer. */
+	u64 *intr_buf;
+	dma_addr_t intr_buf_dma;
+
+	/* Read/interrupt urb, retries, and mode. */
+	struct urb *read_or_intr_urb;
+	int read_or_intr_retries;
+	int read_urb_is_intr;
+
+	/* Write urb and retries. */
+	struct urb *write_urb;
+	int write_retries;
+
+	/* The address of the boot FIFO endpoint. */
+	u8 boot_fifo_ep;
+	/* The address of the tile-monitor FIFO interrupt endpoint. */
+	u8 tm_fifo_int_ep;
+	/* The address of the tile-monitor FIFO input endpoint. */
+	u8 tm_fifo_in_ep;
+	/* The address of the tile-monitor FIFO output endpoint. */
+	u8 tm_fifo_out_ep;
+};
+
+/* Table of devices that work with this driver */
+static struct usb_device_id rshim_usb_table[] = {
+	{ USB_DEVICE(USB_TILERA_VENDOR_ID, USB_BLUEFIELD_PRODUCT_ID) },
+	{ }					/* Terminating entry */
+};
+MODULE_DEVICE_TABLE(usb, rshim_usb_table);
+
+/* Random compatibility hacks. */
+
+/* Arguments to an urb completion handler. */
+#define URB_COMP_ARGS struct urb *urb
+
+static void rshim_usb_delete(struct kref *kref)
+{
+	struct rshim_backend *bd;
+	struct rshim_usb *dev;
+
+	bd = container_of(kref, struct rshim_backend, kref);
+	dev = container_of(bd, struct rshim_usb, bd);
+
+	rshim_deregister(bd);
+	kfree(dev);
+}
+
+/* Rshim read/write routines */
+
+static int rshim_usb_read_rshim(struct rshim_backend *bd, int chan, int addr,
+			      u64 *result)
+{
+	struct rshim_usb *dev = container_of(bd, struct rshim_usb, bd);
+	int retval;
+
+	if (!bd->has_rshim)
+		return -ENODEV;
+
+	/* Do a blocking control read and endian conversion. */
+	retval = usb_control_msg(dev->udev, usb_rcvctrlpipe(dev->udev, 0),
+				 0,  /* request */
+				 USB_RECIP_ENDPOINT | USB_TYPE_VENDOR |
+				 USB_DIR_IN,  /* request type */
+				 chan, /* value */
+				 addr, /* index */
+				 &dev->ctrl_data, 8, 2000);
+
+	/*
+	 * The RShim HW puts bytes on the wire in little-endian order
+	 * regardless of endianness settings either in the host or the ARM
+	 * cores.
+	 */
+	*result = le64_to_cpu(dev->ctrl_data);
+	if (retval == 8)
+		return 0;
+
+	/*
+	 * These are weird error codes, but we want to use something
+	 * the USB stack doesn't use so that we can identify short/long
+	 * reads.
+	 */
+	return retval >= 0 ? (retval > 8 ? -EBADE : -EBADR) : retval;
+}
+
+static int rshim_usb_write_rshim(struct rshim_backend *bd, int chan, int addr,
+			       u64 value)
+{
+	struct rshim_usb *dev = container_of(bd, struct rshim_usb, bd);
+	int retval;
+
+	if (!bd->has_rshim)
+		return -ENODEV;
+
+	/* Convert the word to little endian and do blocking control write. */
+	dev->ctrl_data = cpu_to_le64(value);
+	retval = usb_control_msg(dev->udev, usb_sndctrlpipe(dev->udev, 0),
+				 0,  /* request */
+				 USB_RECIP_ENDPOINT | USB_TYPE_VENDOR |
+				 USB_DIR_OUT,  /* request type */
+				 chan, /* value */
+				 addr, /* index */
+				 &dev->ctrl_data, 8, 2000);
+
+	if (retval == 8)
+		return 0;
+
+	/*
+	 * These are weird error codes, but we want to use something
+	 * the USB stack doesn't use so that we can identify short/long
+	 * writes.
+	 */
+	return retval >= 0 ? (retval > 8 ? -EBADE : -EBADR) : retval;
+}
+
+/* Boot routines */
+
+static void rshim_usb_boot_write_callback(URB_COMP_ARGS)
+{
+	struct rshim_usb *dev = urb->context;
+
+	if (urb->status == -ENOENT)
+		pr_debug("boot tx canceled, actual length %d\n",
+			 urb->actual_length);
+	else if (urb->status)
+		pr_debug("boot tx failed, status %d, actual length %d\n",
+			 urb->status, urb->actual_length);
+
+	complete_all(&dev->bd.boot_write_complete);
+}
+
+static ssize_t rshim_usb_boot_write(struct rshim_usb *dev, const char *buf,
+				  size_t count)
+{
+	struct rshim_backend *bd = &dev->bd;
+	int retval = 0;
+	size_t bytes_written = 0;
+
+	/* Create and fill an urb */
+	dev->boot_urb = usb_alloc_urb(0, GFP_KERNEL);
+	if (unlikely(!dev->boot_urb)) {
+		pr_debug("boot_write: couldn't allocate urb\n");
+		return -ENOMEM;
+	}
+	usb_fill_bulk_urb(dev->boot_urb, dev->udev,
+			  usb_sndbulkpipe(dev->udev, dev->boot_fifo_ep),
+			  (char *)buf, count, rshim_usb_boot_write_callback,
+			  dev);
+
+	/* Submit the urb. */
+	reinit_completion(&bd->boot_write_complete);
+	retval = usb_submit_urb(dev->boot_urb, GFP_KERNEL);
+	if (retval)
+		goto done;
+
+	/*
+	 * Wait until it's done. If anything goes wrong in the USB layer,
+	 * the callback function might never get called and cause stuck.
+	 * Here we release the mutex so user could use 'ctrl + c' to terminate
+	 * the current write. Once the boot file is opened again, the
+	 * outstanding urb will be canceled.
+	 *
+	 * Note: when boot stream starts to write, it will either run to
+	 * completion, or be interrupted by user. The urb callback function will
+	 * be called during this period. There are no other operations to affect
+	 * the boot stream. So unlocking the mutex is considered safe.
+	 */
+	mutex_unlock(&bd->mutex);
+	retval = wait_for_completion_interruptible(&bd->boot_write_complete);
+	mutex_lock(&bd->mutex);
+	if (retval) {
+		usb_kill_urb(dev->boot_urb);
+		bytes_written += dev->boot_urb->actual_length;
+		goto done;
+	}
+
+	if (dev->boot_urb->actual_length !=
+		dev->boot_urb->transfer_buffer_length) {
+		pr_debug("length mismatch, exp %d act %d stat %d\n",
+			 dev->boot_urb->transfer_buffer_length,
+			 dev->boot_urb->actual_length,
+			 dev->boot_urb->status);
+	}
+
+#ifdef RSH_USB_BMC
+	/*
+	 * The UHCI host controller on the BMC seems to
+	 * overestimate the amount of data it's
+	 * successfully sent when it sees a babble error.
+	 */
+	if (dev->boot_urb->status == -EOVERFLOW &&
+	    dev->boot_urb->actual_length >= 64) {
+		dev->boot_urb->actual_length -= 64;
+		pr_debug("saw babble, new length %d\n",
+		dev->boot_urb->actual_length);
+	}
+#endif
+
+	bytes_written = dev->boot_urb->actual_length;
+
+	if (dev->boot_urb->status == -ENOENT &&
+	    dev->boot_urb->transfer_buffer_length !=
+	    dev->boot_urb->actual_length) {
+		pr_debug("boot_write: urb canceled.\n");
+	} else {
+		if (dev->boot_urb->status) {
+			pr_debug("boot_write: urb failed, status %d\n",
+				 dev->boot_urb->status);
+		}
+		if (dev->boot_urb->status != -ENOENT && !retval)
+			retval = dev->boot_urb->status;
+	}
+
+done:
+	usb_free_urb(dev->boot_urb);
+	dev->boot_urb = NULL;
+
+	return bytes_written ? bytes_written : retval;
+}
+
+/* FIFO routines */
+
+static void rshim_usb_fifo_read_callback(URB_COMP_ARGS)
+{
+	struct rshim_usb *dev = urb->context;
+	struct rshim_backend *bd = &dev->bd;
+
+	spin_lock(&bd->spinlock);
+
+	pr_debug("usb_fifo_read_callback: %s urb completed, status %d, "
+		 "actual length %d, intr buf %d\n",
+		 dev->read_urb_is_intr ? "interrupt" : "read",
+		 urb->status, urb->actual_length, (int) *dev->intr_buf);
+
+	bd->spin_flags &= ~RSH_SFLG_READING;
+
+	if (urb->status == 0) {
+		/*
+		 * If a read completed, clear the number of bytes available
+		 * from the last interrupt, and set up the new buffer for
+		 * processing.  (If an interrupt completed, there's nothing
+		 * to do, since the number of bytes available was already
+		 * set by the I/O itself.)
+		 */
+		if (!dev->read_urb_is_intr) {
+			*dev->intr_buf = 0;
+			bd->read_buf_bytes = urb->actual_length;
+			bd->read_buf_next = 0;
+		}
+
+		/* Process any data we got, and launch another I/O if needed. */
+		rshim_notify(bd, RSH_EVENT_FIFO_INPUT, 0);
+	} else if (urb->status == -ENOENT) {
+		/*
+		 * The urb was explicitly cancelled.  The only time we
+		 * currently do this is when we close the stream.  If we
+		 * mark this as an error, tile-monitor --resume won't work,
+		 * so we just want to do nothing.
+		 */
+	} else if (urb->status == -ECONNRESET ||
+		   urb->status == -ESHUTDOWN) {
+		/*
+		 * The device went away.  We don't want to retry this, and
+		 * we expect things to get better, probably after a device
+		 * reset, but in the meantime, we should let upper layers
+		 * know there was a problem.
+		 */
+		rshim_notify(bd, RSH_EVENT_FIFO_ERR, urb->status);
+	} else if (dev->read_or_intr_retries < READ_RETRIES &&
+		   urb->actual_length == 0 &&
+		   (urb->status == -EPROTO || urb->status == -EILSEQ ||
+		    urb->status == -EOVERFLOW)) {
+		/*
+		 * We got an error which could benefit from being retried.
+		 * Just submit the same urb again.  Note that we don't
+		 * handle partial reads; it's hard, and we haven't really
+		 * seen them.
+		 */
+		int retval;
+
+		dev->read_or_intr_retries++;
+		retval = usb_submit_urb(urb, GFP_ATOMIC);
+		if (retval) {
+			pr_debug("fifo_read_callback: resubmitted urb but got error %d",
+				 retval);
+			/*
+			 * In this case, we won't try again; signal the
+			 * error to upper layers.
+			 */
+			rshim_notify(bd, RSH_EVENT_FIFO_ERR, retval);
+		} else {
+			bd->spin_flags |= RSH_SFLG_READING;
+		}
+	} else {
+		/*
+		 * We got some error we don't know how to handle, or we got
+		 * too many errors.  Either way we don't retry any more,
+		 * but we signal the error to upper layers.
+		 */
+		pr_err("fifo_read_callback: %s urb completed abnormally, "
+		       "error %d\n",
+		       dev->read_urb_is_intr ? "interrupt" : "read",
+		       urb->status);
+		rshim_notify(bd, RSH_EVENT_FIFO_ERR, urb->status);
+	}
+
+	spin_unlock(&bd->spinlock);
+}
+
+static void rshim_usb_fifo_read(struct rshim_usb *dev, char *buffer,
+			      size_t count)
+{
+	struct rshim_backend *bd = &dev->bd;
+
+	if ((int) *dev->intr_buf || bd->read_buf_bytes) {
+		/* We're doing a read. */
+
+		int retval;
+		struct urb *urb = dev->read_or_intr_urb;
+
+		usb_fill_bulk_urb(urb, dev->udev,
+				  usb_rcvbulkpipe(dev->udev,
+						  dev->tm_fifo_in_ep),
+				  buffer, count,
+				  rshim_usb_fifo_read_callback,
+				  dev);
+		urb->transfer_dma = dev->bd.read_buf_dma;
+		urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
+
+		dev->bd.spin_flags |= RSH_SFLG_READING;
+		dev->read_urb_is_intr = 0;
+		dev->read_or_intr_retries = 0;
+
+		/* Submit the urb. */
+		retval = usb_submit_urb(urb, GFP_ATOMIC);
+		if (retval) {
+			dev->bd.spin_flags &= ~RSH_SFLG_READING;
+			pr_debug("fifo_drain: failed submitting read "
+			      "urb, error %d", retval);
+		}
+		pr_debug("fifo_read_callback: resubmitted read urb\n");
+	} else {
+		/* We're doing an interrupt. */
+
+		int retval;
+		struct urb *urb = dev->read_or_intr_urb;
+
+		usb_fill_int_urb(urb, dev->udev,
+				 usb_rcvintpipe(dev->udev, dev->tm_fifo_int_ep),
+				 dev->intr_buf, sizeof(*dev->intr_buf),
+				 rshim_usb_fifo_read_callback,
+				 /*
+				  * FIXME: is 6 a good interval value?  That's
+				  * polling at 8000/(1 << 6) == 125 Hz.
+				  */
+				 dev, 6);
+		urb->transfer_dma = dev->intr_buf_dma;
+		urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
+
+		dev->bd.spin_flags |= RSH_SFLG_READING;
+		dev->read_urb_is_intr = 1;
+		dev->read_or_intr_retries = 0;
+
+		/* Submit the urb */
+		retval = usb_submit_urb(urb, GFP_ATOMIC);
+		if (retval) {
+			dev->bd.spin_flags &= ~RSH_SFLG_READING;
+			pr_debug("fifo_read_callback: failed submitting "
+			      "interrupt urb, error %d", retval);
+		}
+		pr_debug("fifo_read_callback: resubmitted interrupt urb\n");
+	}
+}
+
+static void rshim_usb_fifo_write_callback(URB_COMP_ARGS)
+{
+	struct rshim_usb *dev = urb->context;
+	struct rshim_backend *bd = &dev->bd;
+
+	spin_lock(&bd->spinlock);
+
+	pr_debug("fifo_write_callback: urb completed, status %d, "
+		 "actual length %d, intr buf %d\n",
+		 urb->status, urb->actual_length, (int) *dev->intr_buf);
+
+	bd->spin_flags &= ~RSH_SFLG_WRITING;
+
+	if (urb->status == 0) {
+		/* A write completed. */
+		wake_up_interruptible_all(&bd->write_completed);
+		rshim_notify(bd, RSH_EVENT_FIFO_OUTPUT, 0);
+	} else if (urb->status == -ENOENT) {
+		/*
+		 * The urb was explicitly cancelled.  The only time we
+		 * currently do this is when we close the stream.  If we
+		 * mark this as an error, tile-monitor --resume won't work,
+		 * so we just want to do nothing.
+		 */
+	} else if (urb->status == -ECONNRESET ||
+		   urb->status == -ESHUTDOWN) {
+		/*
+		 * The device went away.  We don't want to retry this, and
+		 * we expect things to get better, probably after a device
+		 * reset, but in the meantime, we should let upper layers
+		 * know there was a problem.
+		 */
+		rshim_notify(bd, RSH_EVENT_FIFO_ERR, urb->status);
+	} else if (dev->write_retries < WRITE_RETRIES &&
+		   urb->actual_length == 0 &&
+		   (urb->status == -EPROTO || urb->status == -EILSEQ ||
+		    urb->status == -EOVERFLOW)) {
+		/*
+		 * We got an error which could benefit from being retried.
+		 * Just submit the same urb again.  Note that we don't
+		 * handle partial writes; it's hard, and we haven't really
+		 * seen them.
+		 */
+		int retval;
+
+		dev->write_retries++;
+		retval = usb_submit_urb(urb, GFP_ATOMIC);
+		if (retval) {
+			pr_err("fifo_write_callback: resubmitted urb but "
+			       "got error %d\n", retval);
+			/*
+			 * In this case, we won't try again; signal the
+			 * error to upper layers.
+			 */
+			rshim_notify(bd, RSH_EVENT_FIFO_ERR, retval);
+		} else {
+			bd->spin_flags |= RSH_SFLG_WRITING;
+		}
+	} else {
+		/*
+		 * We got some error we don't know how to handle, or we got
+		 * too many errors.  Either way we don't retry any more,
+		 * but we signal the error to upper layers.
+		 */
+		pr_err("fifo_write_callback: urb completed abnormally, "
+		       "error %d\n", urb->status);
+		rshim_notify(bd, RSH_EVENT_FIFO_ERR, urb->status);
+	}
+
+	spin_unlock(&bd->spinlock);
+}
+
+static int rshim_usb_fifo_write(struct rshim_usb *dev, const char *buffer,
+			      size_t count)
+{
+	struct rshim_backend *bd = &dev->bd;
+	int retval;
+
+	WARN_ONCE(count % 8 != 0, "rshim write %d is not multiple of 8 bytes\n",
+		  (int)count);
+
+	/* Initialize the urb properly. */
+	usb_fill_bulk_urb(dev->write_urb, dev->udev,
+			  usb_sndbulkpipe(dev->udev,
+					  dev->tm_fifo_out_ep),
+			  (char *)buffer,
+			  count,
+			  rshim_usb_fifo_write_callback,
+			  dev);
+	dev->write_urb->transfer_dma = bd->write_buf_dma;
+	dev->write_urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
+	dev->write_retries = 0;
+
+	/* Send the data out the bulk port. */
+	retval = usb_submit_urb(dev->write_urb, GFP_ATOMIC);
+	if (retval) {
+		bd->spin_flags &= ~RSH_SFLG_WRITING;
+		pr_err("fifo_write: failed submitting write "
+		       "urb, error %d\n", retval);
+		return -1;
+	}
+
+	bd->spin_flags |= RSH_SFLG_WRITING;
+	return 0;
+}
+
+/* Probe routines */
+
+/* These make the endpoint test code in rshim_usb_probe() a lot cleaner. */
+#define is_in_ep(ep)   (((ep)->bEndpointAddress & USB_ENDPOINT_DIR_MASK) == \
+			USB_DIR_IN)
+#define is_bulk_ep(ep) (((ep)->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) == \
+			USB_ENDPOINT_XFER_BULK)
+#define is_int_ep(ep)  (((ep)->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK) == \
+			USB_ENDPOINT_XFER_INT)
+#define max_pkt(ep)    le16_to_cpu(ep->wMaxPacketSize)
+#define ep_addr(ep)    (ep->bEndpointAddress)
+
+static ssize_t rshim_usb_backend_read(struct rshim_backend *bd, int devtype,
+				    char *buf, size_t count)
+{
+	struct rshim_usb *dev = container_of(bd, struct rshim_usb, bd);
+
+	switch (devtype) {
+	case RSH_DEV_TYPE_NET:
+	case RSH_DEV_TYPE_CONSOLE:
+		rshim_usb_fifo_read(dev, buf, count);
+		return 0;
+
+	default:
+		pr_err("bad devtype %d\n", devtype);
+		return -EINVAL;
+	}
+}
+
+static ssize_t rshim_usb_backend_write(struct rshim_backend *bd, int devtype,
+				     const char *buf, size_t count)
+{
+	struct rshim_usb *dev = container_of(bd, struct rshim_usb, bd);
+
+	switch (devtype) {
+	case RSH_DEV_TYPE_NET:
+	case RSH_DEV_TYPE_CONSOLE:
+		return rshim_usb_fifo_write(dev, buf, count);
+
+	case RSH_DEV_TYPE_BOOT:
+		return rshim_usb_boot_write(dev, buf, count);
+
+	default:
+		pr_err("bad devtype %d\n", devtype);
+		return -EINVAL;
+	}
+}
+
+static void rshim_usb_backend_cancel_req(struct rshim_backend *bd, int devtype,
+				       bool is_write)
+{
+	struct rshim_usb *dev = container_of(bd, struct rshim_usb, bd);
+
+	switch (devtype) {
+	case RSH_DEV_TYPE_NET:
+	case RSH_DEV_TYPE_CONSOLE:
+		if (is_write)
+			usb_kill_urb(dev->write_urb);
+		else
+			usb_kill_urb(dev->read_or_intr_urb);
+		break;
+
+	case RSH_DEV_TYPE_BOOT:
+		usb_kill_urb(dev->boot_urb);
+		break;
+
+	default:
+		pr_err("bad devtype %d\n", devtype);
+		break;
+	}
+}
+
+static int rshim_usb_probe(struct usb_interface *interface,
+			 const struct usb_device_id *id)
+{
+	char *usb_dev_name;
+	int dev_name_len = 32;
+	struct rshim_usb *dev = NULL;
+	struct rshim_backend *bd;
+	struct usb_host_interface *iface_desc;
+	struct usb_endpoint_descriptor *ep;
+	int i;
+	int allocfail = 0;
+	int retval = -ENOMEM;
+
+	/*
+	 * Get our device pathname.  The usb_make_path interface uselessly
+	 * returns -1 if the output buffer is too small, instead of telling
+	 * us how big it needs to be, so we just start with a reasonable
+	 * size and double it until the name fits.
+	 */
+	while (1) {
+		usb_dev_name = kmalloc(dev_name_len, GFP_KERNEL);
+		if (!usb_dev_name)
+			goto error;
+		if (usb_make_path(interface_to_usbdev(interface), usb_dev_name,
+				  dev_name_len) >= 0)
+			break;
+		kfree(usb_dev_name);
+		dev_name_len *= 2;
+	}
+
+	pr_debug("probing %s\n", usb_dev_name);
+
+	/*
+	 * Now see if we've previously seen this device.  If so, we use the
+	 * same device number, otherwise we pick the first available one.
+	 */
+	rshim_lock();
+
+	/* Find the backend. */
+	bd = rshim_find(usb_dev_name);
+	if (bd) {
+		pr_debug("found previously allocated rshim_usb structure\n");
+		kref_get(&bd->kref);
+		dev = container_of(bd, struct rshim_usb, bd);
+		kfree(usb_dev_name);
+		usb_dev_name = NULL;
+	} else {
+		pr_debug("creating new rshim_usb structure\n");
+		dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+		if (dev == NULL) {
+			pr_err("couldn't get memory for new device\n");
+			rshim_unlock();
+			goto error;
+		}
+
+		bd = &dev->bd;
+		bd->dev_name = usb_dev_name;
+		bd->read = rshim_usb_backend_read;
+		bd->write = rshim_usb_backend_write;
+		bd->cancel = rshim_usb_backend_cancel_req;
+		bd->destroy = rshim_usb_delete;
+		bd->read_rshim = rshim_usb_read_rshim;
+		bd->write_rshim = rshim_usb_write_rshim;
+		bd->has_reprobe = 1;
+		bd->owner = THIS_MODULE;
+		mutex_init(&bd->mutex);
+	}
+
+	/*
+	 * This has to be done on the first probe, whether or not we
+	 * allocated a new rshim_usb structure, since it's always dropped
+	 * on the second disconnect.
+	 */
+	if (!bd->has_rshim && !bd->has_tm)
+		dev->udev = usb_get_dev(interface_to_usbdev(interface));
+
+	/*
+	 * It would seem more logical to allocate these above when we create
+	 * a new rshim_usb structure, but we don't want to do it until we've
+	 * upped the usb device reference count.
+	 */
+	allocfail |= rshim_fifo_alloc(bd);
+
+	if (!bd->read_buf)
+		bd->read_buf = usb_alloc_coherent(dev->udev, READ_BUF_SIZE,
+						   GFP_KERNEL,
+						   &bd->read_buf_dma);
+	allocfail |= bd->read_buf == 0;
+
+	if (!dev->intr_buf) {
+		dev->intr_buf = usb_alloc_coherent(dev->udev,
+						   sizeof(*dev->intr_buf),
+						   GFP_KERNEL,
+						   &dev->intr_buf_dma);
+		if (dev->intr_buf != NULL)
+			*dev->intr_buf = 0;
+	}
+	allocfail |= dev->intr_buf == 0;
+
+	if (!bd->write_buf) {
+		bd->write_buf = usb_alloc_coherent(dev->udev,
+						       WRITE_BUF_SIZE,
+						       GFP_KERNEL,
+						       &bd->write_buf_dma);
+	}
+	allocfail |= bd->write_buf == 0;
+
+	if (!dev->read_or_intr_urb)
+		dev->read_or_intr_urb = usb_alloc_urb(0, GFP_KERNEL);
+	allocfail |= dev->read_or_intr_urb == 0;
+
+	if (!dev->write_urb)
+		dev->write_urb = usb_alloc_urb(0, GFP_KERNEL);
+	allocfail |= dev->write_urb == 0;
+
+	if (allocfail) {
+		pr_err("can't allocate buffers or urbs\n");
+		rshim_unlock();
+		goto error;
+	}
+
+	rshim_unlock();
+
+	iface_desc = interface->cur_altsetting;
+
+	/* Make sure this is a vendor-specific interface class. */
+	if (iface_desc->desc.bInterfaceClass != 0xFF)
+		goto error;
+
+	/* See which interface this is, then save the correct data. */
+
+	mutex_lock(&bd->mutex);
+	if (iface_desc->desc.bInterfaceSubClass == 0) {
+		pr_debug("found rshim interface\n");
+		/*
+		 * We only expect one endpoint here, just make sure its
+		 * attributes match.
+		 */
+		if (iface_desc->desc.bNumEndpoints != 1) {
+			pr_err("wrong number of endpoints for rshim "
+			       "interface\n");
+			mutex_unlock(&bd->mutex);
+			goto error;
+		}
+		ep = &iface_desc->endpoint[0].desc;
+
+		/* We expect a bulk out endpoint. */
+		if (!is_bulk_ep(ep) || is_in_ep(ep)) {
+			mutex_unlock(&bd->mutex);
+			goto error;
+		}
+
+		bd->has_rshim = 1;
+		dev->rshim_interface = interface;
+		dev->boot_fifo_ep = ep_addr(ep);
+
+	} else if (iface_desc->desc.bInterfaceSubClass == 1) {
+		pr_debug("found tmfifo interface\n");
+		/*
+		 * We expect 3 endpoints here.  Since they're listed in
+		 * random order we have to use their attributes to figure
+		 * out which is which.
+		 */
+		if (iface_desc->desc.bNumEndpoints != 3) {
+			pr_err("wrong number of endpoints for tm "
+			       "interface\n");
+			mutex_unlock(&bd->mutex);
+			goto error;
+		}
+		dev->tm_fifo_in_ep = 0;
+		dev->tm_fifo_int_ep = 0;
+		dev->tm_fifo_out_ep = 0;
+
+		for (i = 0; i < iface_desc->desc.bNumEndpoints; i++) {
+			ep = &iface_desc->endpoint[i].desc;
+
+			if (is_in_ep(ep)) {
+				if (is_bulk_ep(ep)) {
+					/* Bulk in endpoint. */
+					dev->tm_fifo_in_ep = ep_addr(ep);
+				} else if (is_int_ep(ep)) {
+					/* Interrupt in endpoint. */
+					dev->tm_fifo_int_ep = ep_addr(ep);
+				}
+			} else {
+				if (is_bulk_ep(ep)) {
+					/* Bulk out endpoint. */
+					dev->tm_fifo_out_ep = ep_addr(ep);
+				}
+			}
+		}
+
+		if (!dev->tm_fifo_in_ep || !dev->tm_fifo_int_ep ||
+		    !dev->tm_fifo_out_ep) {
+			pr_err("could not find all required endpoints for "
+			       "tm interface\n");
+			mutex_unlock(&bd->mutex);
+			goto error;
+		}
+		bd->has_tm = 1;
+	} else {
+		mutex_unlock(&bd->mutex);
+		goto error;
+	}
+
+	/* Save our data pointer in this interface device. */
+	usb_set_intfdata(interface, dev);
+
+	if (!bd->dev)
+		bd->dev = &dev->udev->dev;
+
+	/*
+	 * Register rshim here since it needs to detect whether other backend
+	 * has already registered or not, which involves reading/writing rshim
+	 * registers and has assumption that the under layer is working.
+	 */
+	rshim_lock();
+	if (!bd->registered) {
+		retval = rshim_register(bd);
+		if (retval) {
+			rshim_unlock();
+			goto error;
+		}
+	}
+	rshim_unlock();
+
+	/* Notify that device is attached. */
+	retval = rshim_notify(&dev->bd, RSH_EVENT_ATTACH, 0);
+	mutex_unlock(&dev->bd.mutex);
+	if (retval)
+		goto error;
+
+	return 0;
+
+error:
+	if (dev) {
+		usb_free_urb(dev->read_or_intr_urb);
+		dev->read_or_intr_urb = NULL;
+		usb_free_urb(dev->write_urb);
+		dev->write_urb = NULL;
+
+		usb_free_coherent(dev->udev, READ_BUF_SIZE,
+				  dev->bd.read_buf, dev->bd.read_buf_dma);
+		dev->bd.read_buf = NULL;
+
+		usb_free_coherent(dev->udev, WRITE_BUF_SIZE,
+				  dev->bd.write_buf, dev->bd.write_buf_dma);
+		dev->bd.write_buf = NULL;
+
+		rshim_fifo_free(&dev->bd);
+
+		usb_free_coherent(dev->udev, sizeof(*dev->intr_buf),
+				  dev->intr_buf, dev->intr_buf_dma);
+		dev->intr_buf = NULL;
+
+		rshim_lock();
+		kref_put(&dev->bd.kref, rshim_usb_delete);
+		rshim_unlock();
+	}
+
+	kfree(usb_dev_name);
+	return retval;
+}
+
+static void rshim_usb_disconnect(struct usb_interface *interface)
+{
+	struct rshim_usb *dev;
+	struct rshim_backend *bd;
+	int flush_wq = 0;
+
+	dev = usb_get_intfdata(interface);
+	bd = &dev->bd;
+	usb_set_intfdata(interface, NULL);
+
+	rshim_notify(bd, RSH_EVENT_DETACH, 0);
+
+	/*
+	 * Clear this interface so we don't unregister our devices next
+	 * time.
+	 */
+	mutex_lock(&bd->mutex);
+
+	if (dev->rshim_interface == interface) {
+		bd->has_rshim = 0;
+		dev->rshim_interface = NULL;
+	} else {
+		/*
+		 * We have to get rid of any USB state, since it may be
+		 * tied to the USB device which is going to vanish as soon
+		 * as we get both disconnects.  We'll reallocate these
+		 * on the next probe.
+		 *
+		 * Supposedly the code which called us already killed any
+		 * outstanding URBs, but it doesn't hurt to be sure.
+		 */
+
+		/*
+		 * We must make sure the console worker isn't running
+		 * before we free all these resources, and particularly
+		 * before we decrement our usage count, below.  Most of the
+		 * time, if it's even enabled, it'll be scheduled to run at
+		 * some point in the future, and we can take care of that
+		 * by asking that it be canceled.
+		 *
+		 * However, it's possible that it's already started
+		 * running, but can't make progress because it's waiting
+		 * for the device mutex, which we currently have.  We
+		 * handle this case by clearing the bit that says it's
+		 * enabled.  The worker tests this bit as soon as it gets
+		 * the mutex, and if it's clear, it just returns without
+		 * rescheduling itself.  Note that if we didn't
+		 * successfully cancel it, we flush the work entry below,
+		 * after we drop the mutex, to be sure it's done before we
+		 * decrement the device usage count.
+		 *
+		 * XXX This might be racy; what if something else which
+		 * would enable the worker runs after we drop the mutex
+		 * but before the worker itself runs?
+		 */
+		flush_wq = !cancel_delayed_work(&bd->work);
+		bd->has_cons_work = 0;
+
+		usb_kill_urb(dev->read_or_intr_urb);
+		usb_free_urb(dev->read_or_intr_urb);
+		dev->read_or_intr_urb = NULL;
+		usb_kill_urb(dev->write_urb);
+		usb_free_urb(dev->write_urb);
+		dev->write_urb = NULL;
+
+		usb_free_coherent(dev->udev, READ_BUF_SIZE,
+				  bd->read_buf, bd->read_buf_dma);
+		bd->read_buf = NULL;
+
+		usb_free_coherent(dev->udev, sizeof(*dev->intr_buf),
+				  dev->intr_buf, dev->intr_buf_dma);
+		dev->intr_buf = NULL;
+
+		usb_free_coherent(dev->udev, WRITE_BUF_SIZE,
+				  bd->write_buf, bd->write_buf_dma);
+		bd->write_buf = NULL;
+
+		rshim_fifo_free(bd);
+	}
+
+	if (!bd->has_rshim && !bd->has_tm) {
+		usb_put_dev(dev->udev);
+		dev->udev = NULL;
+		pr_info("now disconnected\n");
+	} else {
+		pr_debug("partially disconnected\n");
+	}
+
+	mutex_unlock(&bd->mutex);
+
+	/* This can't be done while we hold the mutex; see comments above. */
+	if (flush_wq)
+		flush_workqueue(rshim_wq);
+
+	/* decrement our usage count */
+	rshim_lock();
+	kref_put(&bd->kref, rshim_usb_delete);
+	rshim_unlock();
+}
+
+static struct usb_driver rshim_usb_driver = {
+	.name = "rshim_usb",
+	.probe = rshim_usb_probe,
+	.disconnect = rshim_usb_disconnect,
+	.id_table = rshim_usb_table,
+};
+
+static int __init rshim_usb_init(void)
+{
+	int result;
+
+	/* Register this driver with the USB subsystem. */
+	result = usb_register(&rshim_usb_driver);
+	if (result)
+		pr_err("usb_register failed, error number %d\n", result);
+
+	return result;
+}
+
+static void __exit rshim_usb_exit(void)
+{
+	/* Deregister this driver with the USB subsystem. */
+	usb_deregister(&rshim_usb_driver);
+}
+
+module_init(rshim_usb_init);
+module_exit(rshim_usb_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Mellanox Technologies");
+MODULE_VERSION("0.6");
-- 
1.8.3.1
