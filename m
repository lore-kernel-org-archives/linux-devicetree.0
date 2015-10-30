From: Sinan Kaya <okaya@codeaurora.org>
Subject: [PATCH 2/2] dma: add Qualcomm Technologies HIDMA channel driver
Date: Thu, 29 Oct 2015 23:08:13 -0400
Message-ID: <1446174501-8870-2-git-send-email-okaya@codeaurora.org>
References: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446174501-8870-1-git-send-email-okaya@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: dmaengine@vger.kernel.org, timur@codeaurora.org, cov@codeaurora.org, jcm@redhat.com
Cc: Sinan Kaya <okaya@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds support for hidma engine. The driver
consists of two logical blocks. The DMA engine interface
and the low-level interface. This version of the driver
does not support virtualization on this release and only
memcpy interface support is included.

Signed-off-by: Sinan Kaya <okaya@codeaurora.org>
---
 .../devicetree/bindings/dma/qcom_hidma.txt         |   18 +
 drivers/dma/Kconfig                                |   11 +
 drivers/dma/Makefile                               |    4 +
 drivers/dma/qcom_hidma.c                           | 1717 ++++++++++++++++++++
 drivers/dma/qcom_hidma.h                           |   44 +
 drivers/dma/qcom_hidma_ll.c                        | 1132 +++++++++++++
 6 files changed, 2926 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/qcom_hidma.txt
 create mode 100644 drivers/dma/qcom_hidma.c
 create mode 100644 drivers/dma/qcom_hidma.h
 create mode 100644 drivers/dma/qcom_hidma_ll.c

diff --git a/Documentation/devicetree/bindings/dma/qcom_hidma.txt b/Documentation/devicetree/bindings/dma/qcom_hidma.txt
new file mode 100644
index 0000000..9a01635
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/qcom_hidma.txt
@@ -0,0 +1,18 @@
+Qualcomm Technologies HIDMA Channel driver
+
+Required properties:
+- compatible: must contain "qcom,hidma"
+- reg: Addresses for the transfer and event channel
+- interrupts: Should contain the event interrupt
+- desc-count: Number of asynchronous requests this channel can handle
+- event-channel: The HW event channel completions will be delivered.
+Example:
+
+	hidma_24: hidma@0x5c050000 {
+		compatible = "qcom,hidma";
+		reg = <0 0x5c050000 0x0 0x1000>,
+		      <0 0x5c0b0000 0x0 0x1000>;
+		interrupts = <0 389 0>;
+		desc-count = <10>;
+		event-channel = /bits/ 8 <4>;
+	};
diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index 76a5a5e..2645185 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -512,6 +512,17 @@ config QCOM_HIDMA_MGMT
 	  OS would run QCOM_HIDMA driver and the hypervisor would run
 	  the QCOM_HIDMA_MGMT driver.
 
+config QCOM_HIDMA
+	tristate "Qualcomm Technologies HIDMA support"
+	select DMA_ENGINE
+	select DMA_VIRTUAL_CHANNELS
+	help
+	  Enable support for the Qualcomm Technologies HIDMA controller.
+	  The HIDMA controller supports optimized buffer copies
+	  (user to kernel, kernel to kernel, etc.).  It only supports
+	  memcpy/memset interfaces. The core is not intended for general
+	  purpose slave DMA.
+
 config XILINX_VDMA
 	tristate "Xilinx AXI VDMA Engine"
 	depends on (ARCH_ZYNQ || MICROBLAZE)
diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
index 3d25ffd..5665df2 100644
--- a/drivers/dma/Makefile
+++ b/drivers/dma/Makefile
@@ -53,6 +53,10 @@ obj-$(CONFIG_PL330_DMA) += pl330.o
 obj-$(CONFIG_PPC_BESTCOMM) += bestcomm/
 obj-$(CONFIG_PXA_DMA) += pxa_dma.o
 obj-$(CONFIG_QCOM_BAM_DMA) += qcom_bam_dma.o
+obj-$(CONFIG_QCOM_HIDMA) +=  qcom_hdma.o
+qcom_hdma-objs        := qcom_hidma_ll.o qcom_hidma.o
+
+
 obj-$(CONFIG_QCOM_HIDMA_MGMT) += qcom_hidma_mgmt.o
 obj-$(CONFIG_RENESAS_DMA) += sh/
 obj-$(CONFIG_SIRF_DMA) += sirf-dma.o
diff --git a/drivers/dma/qcom_hidma.c b/drivers/dma/qcom_hidma.c
new file mode 100644
index 0000000..2a92305
--- /dev/null
+++ b/drivers/dma/qcom_hidma.c
@@ -0,0 +1,1717 @@
+/*
+ * Qualcomm Technologies HIDMA DMA engine interface
+ *
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
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
+/*
+ * Copyright (C) Freescale Semicondutor, Inc. 2007, 2008.
+ * Copyright (C) Semihalf 2009
+ * Copyright (C) Ilya Yanok, Emcraft Systems 2010
+ * Copyright (C) Alexander Popov, Promcontroller 2014
+ *
+ * Written by Piotr Ziecik <kosmo@semihalf.com>. Hardware description
+ * (defines, structures and comments) was taken from MPC5121 DMA driver
+ * written by Hongjun Chen <hong-jun.chen@freescale.com>.
+ *
+ * Approved as OSADL project by a majority of OSADL members and funded
+ * by OSADL membership fees in 2009;  for details see www.osadl.org.
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms of the GNU General Public License as published by the Free
+ * Software Foundation; either version 2 of the License, or (at your option)
+ * any later version.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program; if not, write to the Free Software Foundation, Inc., 59
+ * Temple Place - Suite 330, Boston, MA  02111-1307, USA.
+ *
+ * The full GNU General Public License is included in this distribution in the
+ * file called COPYING.
+ */
+
+/* Linux Foundation elects GPLv2 license only.
+ */
+
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <asm/dma.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/of_dma.h>
+#include <linux/property.h>
+#include <linux/delay.h>
+#include <linux/highmem.h>
+#include <linux/io.h>
+#include <linux/sched.h>
+#include <linux/wait.h>
+#include <linux/acpi.h>
+#include <linux/irq.h>
+#include <linux/debugfs.h>
+#include <linux/atomic.h>
+#include <linux/pm_runtime.h>
+#include "dmaengine.h"
+#include "qcom_hidma.h"
+
+/* Default idle time is 2 seconds. This parameter can
+ * be overridden by changing the following
+ * /sys/bus/platform/devices/QCOM8061:<xy>/power/autosuspend_delay_ms
+ * during kernel boot.
+ */
+#define AUTOSUSPEND_TIMEOUT		2000
+#define HIDMA_DEFAULT_DESCRIPTOR_COUNT	16
+#define MODULE_NAME			"hidma"
+
+#define HIDMA_RUNTIME_GET(dmadev)				\
+do {								\
+	atomic_inc(&(dmadev)->pm_counter);			\
+	TRC_PM((dmadev)->ddev.dev,				\
+		"%s:%d pm_runtime_get %d\n", __func__, __LINE__,\
+		atomic_read(&(dmadev)->pm_counter));		\
+	pm_runtime_get_sync((dmadev)->ddev.dev);		\
+} while (0)
+
+#define HIDMA_RUNTIME_SET(dmadev)				\
+do {								\
+	atomic_dec(&(dmadev)->pm_counter);			\
+	TRC_PM((dmadev)->ddev.dev,				\
+		"%s:%d pm_runtime_put_autosuspend:%d\n",	\
+		__func__, __LINE__,				\
+		atomic_read(&(dmadev)->pm_counter));		\
+	pm_runtime_mark_last_busy((dmadev)->ddev.dev);		\
+	pm_runtime_put_autosuspend((dmadev)->ddev.dev);		\
+} while (0)
+
+struct hidma_test_sync {
+	atomic_t			counter;
+	wait_queue_head_t		wq;
+};
+
+struct hidma_dev {
+	u8				evridx;
+	u32				nr_descriptors;
+
+	void				*lldev;
+	void				__iomem *dev_trca;
+	void				__iomem *dev_evca;
+	int (*self_test)(struct hidma_dev *device);
+	struct dentry			*debugfs;
+	struct dentry			*stats;
+
+	/* used to protect the pending channel list*/
+	spinlock_t			lock;
+	dma_addr_t			dev_trca_phys;
+	struct dma_device		ddev;
+	struct tasklet_struct		tasklet;
+
+	resource_size_t			dev_trca_size;
+	dma_addr_t			dev_evca_phys;
+	resource_size_t			dev_evca_size;
+
+	struct hidma_test_sync		test_result;
+	atomic_t			pm_counter;
+};
+
+struct hidma_chan {
+	bool				paused;
+	bool				allocated;
+	char				name[16];
+	u32				dma_sig;
+
+	/*
+	 * active descriptor on this channel
+	 * It is used by the DMA complete notification to
+	 * locate the descriptor that initiated the transfer.
+	 */
+	struct dentry			*debugfs;
+	struct dentry			*stats;
+	struct hidma_dev		*dmadev;
+
+	struct dma_chan			chan;
+	struct list_head		free;
+	struct list_head		prepared;
+	struct list_head		active;
+	struct list_head		completed;
+
+	/* Lock for this structure */
+	spinlock_t			lock;
+};
+
+struct hidma_desc {
+	struct dma_async_tx_descriptor	desc;
+	/* link list node for this channel*/
+	struct list_head		node;
+	u32				tre_ch;
+};
+
+static inline
+struct hidma_dev *to_hidma_dev(struct dma_device *dmadev)
+{
+	return container_of(dmadev, struct hidma_dev, ddev);
+}
+
+static inline
+struct hidma_dev *to_hidma_dev_from_lldev(void *_lldev)
+{
+	return container_of(_lldev, struct hidma_dev, lldev);
+}
+
+static inline
+struct hidma_chan *to_hidma_chan(struct dma_chan *dmach)
+{
+	return container_of(dmach, struct hidma_chan, chan);
+}
+
+static inline struct hidma_desc *
+to_hidma_desc(struct dma_async_tx_descriptor *t)
+{
+	return container_of(t, struct hidma_desc, desc);
+}
+
+static void hidma_free(struct hidma_dev *dmadev)
+{
+	dev_dbg(dmadev->ddev.dev, "free dmadev\n");
+	INIT_LIST_HEAD(&dmadev->ddev.channels);
+}
+
+static unsigned int debug_pm;
+module_param(debug_pm, uint, 0644);
+MODULE_PARM_DESC(debug_pm,
+		 "debug runtime power management transitions (default: 0)");
+
+#define TRC_PM(...) do {			\
+		if (debug_pm)			\
+			dev_info(__VA_ARGS__);	\
+	} while (0)
+
+/* process completed descriptors */
+static void hidma_process_completed(struct hidma_dev *mdma)
+{
+	dma_cookie_t last_cookie = 0;
+	struct hidma_chan *mchan;
+	struct hidma_desc *mdesc;
+	struct dma_async_tx_descriptor *desc;
+	unsigned long irqflags;
+	LIST_HEAD(list);
+	struct dma_chan *dmach = NULL;
+
+	list_for_each_entry(dmach, &mdma->ddev.channels,
+			device_node) {
+		mchan = to_hidma_chan(dmach);
+
+		/* Get all completed descriptors */
+		spin_lock_irqsave(&mchan->lock, irqflags);
+		if (!list_empty(&mchan->completed))
+			list_splice_tail_init(&mchan->completed, &list);
+		spin_unlock_irqrestore(&mchan->lock, irqflags);
+
+		if (list_empty(&list))
+			continue;
+
+		/* Execute callbacks and run dependencies */
+		list_for_each_entry(mdesc, &list, node) {
+			desc = &mdesc->desc;
+
+			spin_lock_irqsave(&mchan->lock, irqflags);
+			dma_cookie_complete(desc);
+			spin_unlock_irqrestore(&mchan->lock, irqflags);
+
+			if (desc->callback &&
+				(hidma_ll_status(mdma->lldev, mdesc->tre_ch)
+				== DMA_COMPLETE))
+				desc->callback(desc->callback_param);
+
+			last_cookie = desc->cookie;
+			dma_run_dependencies(desc);
+		}
+
+		/* Free descriptors */
+		spin_lock_irqsave(&mchan->lock, irqflags);
+		list_splice_tail_init(&list, &mchan->free);
+		spin_unlock_irqrestore(&mchan->lock, irqflags);
+	}
+}
+
+/*
+ * Execute all queued DMA descriptors.
+ * This function is called either on the first transfer attempt in tx_submit
+ * or from the callback routine when one transfer is finished. It can only be
+ * called from a single location since both of places check active list to be
+ * empty and will immediately fill the active list while lock is held.
+ *
+ * Following requirements must be met while calling hidma_execute():
+ *	a) mchan->lock is locked,
+ *	b) mchan->active list contains multiple entries.
+ *	c) pm protected
+ */
+static int hidma_execute(struct hidma_chan *mchan)
+{
+	struct hidma_dev *mdma = mchan->dmadev;
+	int rc;
+
+	if (!hidma_ll_isenabled(mdma->lldev))
+		return -ENODEV;
+
+	/* Start the transfer */
+	if (!list_empty(&mchan->active))
+		rc = hidma_ll_start(mdma->lldev);
+
+	return 0;
+}
+
+/*
+ * Called once for each submitted descriptor.
+ * PM is locked once for each descriptor that is currently
+ * in execution.
+ */
+static void hidma_callback(void *data)
+{
+	struct hidma_desc *mdesc = data;
+	struct hidma_chan *mchan = to_hidma_chan(mdesc->desc.chan);
+	unsigned long irqflags;
+	struct dma_device *ddev = mchan->chan.device;
+	struct hidma_dev *dmadev = to_hidma_dev(ddev);
+	bool queued = false;
+
+	dev_dbg(dmadev->ddev.dev, "callback: data:0x%p\n", data);
+
+	spin_lock_irqsave(&mchan->lock, irqflags);
+
+	if (mdesc->node.next) {
+		/* Delete from the active list, add to completed list */
+		list_move_tail(&mdesc->node, &mchan->completed);
+		queued = true;
+	}
+	spin_unlock_irqrestore(&mchan->lock, irqflags);
+
+	hidma_process_completed(dmadev);
+
+	if (queued)
+		HIDMA_RUNTIME_SET(dmadev);
+}
+
+static int hidma_chan_init(struct hidma_dev *dmadev, u32 dma_sig)
+{
+	struct hidma_chan *mchan;
+	struct dma_device *ddev;
+
+	mchan = devm_kzalloc(dmadev->ddev.dev, sizeof(*mchan), GFP_KERNEL);
+	if (!mchan) {
+		dev_err(dmadev->ddev.dev, "chaninit: out of memory\n");
+		return -ENOMEM;
+	}
+
+	ddev = &dmadev->ddev;
+	mchan->dma_sig = dma_sig;
+	mchan->dmadev = dmadev;
+	mchan->chan.device = ddev;
+	dma_cookie_init(&mchan->chan);
+
+	INIT_LIST_HEAD(&mchan->free);
+	INIT_LIST_HEAD(&mchan->prepared);
+	INIT_LIST_HEAD(&mchan->active);
+	INIT_LIST_HEAD(&mchan->completed);
+
+	spin_lock_init(&mchan->lock);
+	list_add_tail(&mchan->chan.device_node, &ddev->channels);
+	dmadev->ddev.chancnt++;
+	return 0;
+}
+
+static void hidma_issue_pending(struct dma_chan *dmach)
+{
+}
+
+static enum dma_status hidma_tx_status(struct dma_chan *dmach,
+					dma_cookie_t cookie,
+					struct dma_tx_state *txstate)
+{
+	enum dma_status ret;
+	unsigned long irqflags;
+	struct hidma_chan *mchan = to_hidma_chan(dmach);
+
+	spin_lock_irqsave(&mchan->lock, irqflags);
+	if (mchan->paused)
+		ret = DMA_PAUSED;
+	else
+		ret = dma_cookie_status(dmach, cookie, txstate);
+	spin_unlock_irqrestore(&mchan->lock, irqflags);
+
+	return ret;
+}
+
+/*
+ * Submit descriptor to hardware.
+ * Lock the PM for each descriptor we are sending.
+ */
+static dma_cookie_t hidma_tx_submit(struct dma_async_tx_descriptor *txd)
+{
+	struct hidma_chan *mchan = to_hidma_chan(txd->chan);
+	struct hidma_dev *dmadev = mchan->dmadev;
+	struct hidma_desc *mdesc;
+	unsigned long irqflags;
+	dma_cookie_t cookie;
+
+	if (!hidma_ll_isenabled(dmadev->lldev))
+		return -ENODEV;
+
+	HIDMA_RUNTIME_GET(dmadev);
+	mdesc = container_of(txd, struct hidma_desc, desc);
+	spin_lock_irqsave(&mchan->lock, irqflags);
+
+	/* Move descriptor to active */
+	list_move_tail(&mdesc->node, &mchan->active);
+
+	/* Update cookie */
+	cookie = dma_cookie_assign(txd);
+
+	hidma_ll_queue_request(dmadev->lldev, mdesc->tre_ch);
+	hidma_execute(mchan);
+
+	spin_unlock_irqrestore(&mchan->lock, irqflags);
+
+	return cookie;
+}
+
+static int hidma_alloc_chan_resources(struct dma_chan *dmach)
+{
+	struct hidma_chan *mchan = to_hidma_chan(dmach);
+	struct hidma_dev *dmadev = mchan->dmadev;
+	int rc = 0;
+	struct hidma_desc *mdesc, *tmp;
+	unsigned long irqflags;
+	LIST_HEAD(descs);
+	u32 i;
+
+	if (mchan->allocated)
+		return 0;
+
+	/* Alloc descriptors for this channel */
+	for (i = 0; i < dmadev->nr_descriptors; i++) {
+		mdesc = kzalloc(sizeof(struct hidma_desc), GFP_KERNEL);
+		if (!mdesc) {
+			dev_err(dmadev->ddev.dev, "Memory allocation error. ");
+			rc = -ENOMEM;
+			break;
+		}
+		dma_async_tx_descriptor_init(&mdesc->desc, dmach);
+		mdesc->desc.flags = DMA_CTRL_ACK;
+		mdesc->desc.tx_submit = hidma_tx_submit;
+
+		rc = hidma_ll_request(dmadev->lldev,
+				mchan->dma_sig, "DMA engine", hidma_callback,
+				mdesc, &mdesc->tre_ch);
+		if (rc != 1) {
+			dev_err(dmach->device->dev,
+				"channel alloc failed at %u\n", i);
+			kfree(mdesc);
+			break;
+		}
+		list_add_tail(&mdesc->node, &descs);
+	}
+
+	if (rc != 1) {
+		/* return the allocated descriptors */
+		list_for_each_entry_safe(mdesc, tmp, &descs, node) {
+			hidma_ll_free(dmadev->lldev, mdesc->tre_ch);
+			kfree(mdesc);
+		}
+		return rc;
+	}
+
+	spin_lock_irqsave(&mchan->lock, irqflags);
+	list_splice_tail_init(&descs, &mchan->free);
+	mchan->allocated = true;
+	spin_unlock_irqrestore(&mchan->lock, irqflags);
+	dev_dbg(dmadev->ddev.dev,
+		"allocated channel for %u\n", mchan->dma_sig);
+	return rc;
+}
+
+static void hidma_free_chan_resources(struct dma_chan *dmach)
+{
+	struct hidma_chan *mchan = to_hidma_chan(dmach);
+	struct hidma_dev *mdma = mchan->dmadev;
+	struct hidma_desc *mdesc, *tmp;
+	unsigned long irqflags;
+	LIST_HEAD(descs);
+
+	if (!list_empty(&mchan->prepared) ||
+		!list_empty(&mchan->active) ||
+		!list_empty(&mchan->completed)) {
+		/* We have unfinished requests waiting.
+		 * Terminate the request from the hardware.
+		 */
+		hidma_cleanup_pending_tre(mdma->lldev, 0x77, 0x77);
+
+		/* Give enough time for completions to be called. */
+		msleep(100);
+	}
+
+	spin_lock_irqsave(&mchan->lock, irqflags);
+	/* Channel must be idle */
+	BUG_ON(!list_empty(&mchan->prepared));
+	BUG_ON(!list_empty(&mchan->active));
+	BUG_ON(!list_empty(&mchan->completed));
+
+	/* Move data */
+	list_splice_tail_init(&mchan->free, &descs);
+
+	/* Free descriptors */
+	list_for_each_entry_safe(mdesc, tmp, &descs, node) {
+		hidma_ll_free(mdma->lldev, mdesc->tre_ch);
+		list_del(&mdesc->node);
+		kfree(mdesc);
+	}
+
+	mchan->allocated = 0;
+	spin_unlock_irqrestore(&mchan->lock, irqflags);
+	dev_dbg(mdma->ddev.dev, "freed channel for %u\n", mchan->dma_sig);
+}
+
+
+static struct dma_async_tx_descriptor *
+hidma_prep_dma_memcpy(struct dma_chan *dmach, dma_addr_t dma_dest,
+			dma_addr_t dma_src, size_t len, unsigned long flags)
+{
+	struct hidma_chan *mchan = to_hidma_chan(dmach);
+	struct hidma_desc *mdesc = NULL;
+	struct hidma_dev *mdma = mchan->dmadev;
+	unsigned long irqflags;
+
+	dev_dbg(mdma->ddev.dev,
+		"memcpy: chan:%p dest:%pad src:%pad len:%zu\n", mchan,
+		&dma_dest, &dma_src, len);
+
+	/* Get free descriptor */
+	spin_lock_irqsave(&mchan->lock, irqflags);
+	if (!list_empty(&mchan->free)) {
+		mdesc = list_first_entry(&mchan->free, struct hidma_desc, node);
+		list_del(&mdesc->node);
+	}
+	spin_unlock_irqrestore(&mchan->lock, irqflags);
+
+	if (!mdesc)
+		return NULL;
+
+	hidma_ll_set_transfer_params(mdma->lldev, mdesc->tre_ch,
+			dma_src, dma_dest, len, flags);
+
+	/* Place descriptor in prepared list */
+	spin_lock_irqsave(&mchan->lock, irqflags);
+	list_add_tail(&mdesc->node, &mchan->prepared);
+	spin_unlock_irqrestore(&mchan->lock, irqflags);
+
+	return &mdesc->desc;
+}
+
+static int hidma_terminate_all(struct dma_chan *chan)
+{
+	struct hidma_dev *dmadev;
+	LIST_HEAD(head);
+	unsigned long irqflags;
+	LIST_HEAD(list);
+	struct hidma_desc *tmp, *mdesc = NULL;
+	int rc = 0;
+	struct hidma_chan *mchan;
+
+	mchan = to_hidma_chan(chan);
+	dmadev = to_hidma_dev(mchan->chan.device);
+	dev_dbg(dmadev->ddev.dev, "terminateall: chan:0x%p\n", mchan);
+
+	HIDMA_RUNTIME_GET(dmadev);
+	/* give completed requests a chance to finish */
+	hidma_process_completed(dmadev);
+
+	spin_lock_irqsave(&mchan->lock, irqflags);
+	list_splice_init(&mchan->active, &list);
+	list_splice_init(&mchan->prepared, &list);
+	list_splice_init(&mchan->completed, &list);
+	spin_unlock_irqrestore(&mchan->lock, irqflags);
+
+	/* this suspends the existing transfer */
+	rc = hidma_ll_pause(dmadev->lldev);
+	if (rc) {
+		dev_err(dmadev->ddev.dev, "channel did not pause\n");
+		goto out;
+	}
+
+	/* return all user requests */
+	list_for_each_entry_safe(mdesc, tmp, &list, node) {
+		struct dma_async_tx_descriptor	*txd = &mdesc->desc;
+		dma_async_tx_callback callback = mdesc->desc.callback;
+		void *param = mdesc->desc.callback_param;
+		enum dma_status status;
+
+		dma_descriptor_unmap(txd);
+
+		status = hidma_ll_status(dmadev->lldev, mdesc->tre_ch);
+		/*
+		 * The API requires that no submissions are done from a
+		 * callback, so we don't need to drop the lock here
+		 */
+		if (callback && (status == DMA_COMPLETE))
+			callback(param);
+
+		dma_run_dependencies(txd);
+
+		/* move myself to free_list */
+		list_move(&mdesc->node, &mchan->free);
+	}
+
+	/* reinitialize the hardware */
+	rc = hidma_ll_setup(dmadev->lldev);
+
+out:
+	HIDMA_RUNTIME_SET(dmadev);
+	return rc;
+}
+
+static int hidma_pause(struct dma_chan *chan)
+{
+	struct hidma_chan *mchan;
+	struct hidma_dev *dmadev;
+
+	mchan = to_hidma_chan(chan);
+	dmadev = to_hidma_dev(mchan->chan.device);
+	dev_dbg(dmadev->ddev.dev, "pause: chan:0x%p\n", mchan);
+
+	HIDMA_RUNTIME_GET(dmadev);
+	if (!mchan->paused) {
+		if (hidma_ll_pause(dmadev->lldev))
+			dev_warn(dmadev->ddev.dev, "channel did not stop\n");
+		mchan->paused = true;
+	}
+	HIDMA_RUNTIME_SET(dmadev);
+	return 0;
+}
+
+static int hidma_resume(struct dma_chan *chan)
+{
+	struct hidma_chan *mchan;
+	struct hidma_dev *dmadev;
+	int rc = 0;
+
+	mchan = to_hidma_chan(chan);
+	dmadev = to_hidma_dev(mchan->chan.device);
+	dev_dbg(dmadev->ddev.dev, "resume: chan:0x%p\n", mchan);
+
+	HIDMA_RUNTIME_GET(dmadev);
+	if (mchan->paused) {
+		rc = hidma_ll_resume(dmadev->lldev);
+		if (!rc)
+			mchan->paused = false;
+		else
+			dev_err(dmadev->ddev.dev,
+					"failed to resume the channel");
+	}
+	HIDMA_RUNTIME_SET(dmadev);
+	return rc;
+}
+
+static void hidma_selftest_complete(void *arg)
+{
+	struct hidma_dev *dmadev = arg;
+
+	atomic_inc(&dmadev->test_result.counter);
+	wake_up_interruptible(&dmadev->test_result.wq);
+	dev_dbg(dmadev->ddev.dev, "self test transfer complete :%d\n",
+		atomic_read(&dmadev->test_result.counter));
+}
+
+/*
+ * Perform a transaction to verify the HW works.
+ */
+static int hidma_selftest_sg(struct hidma_dev *dmadev,
+			struct dma_chan *dma_chanptr, u64 size,
+			unsigned long flags)
+{
+	dma_addr_t src_dma, dest_dma, dest_dma_it;
+	u8 *dest_buf;
+	u32 i, j = 0;
+	dma_cookie_t cookie;
+	struct dma_async_tx_descriptor *tx;
+	int err = 0;
+	int ret;
+	struct hidma_chan *hidma_chan;
+	struct sg_table sg_table;
+	struct scatterlist	*sg;
+	int nents = 10, count;
+	bool free_channel = 1;
+	u8 *src_buf;
+	int map_count;
+
+	atomic_set(&dmadev->test_result.counter, 0);
+
+	if (!dma_chanptr)
+		return -ENOMEM;
+
+	if (hidma_alloc_chan_resources(dma_chanptr) < 1)
+		return -ENODEV;
+
+	if (!dma_chanptr->device || !dmadev->ddev.dev) {
+		hidma_free_chan_resources(dma_chanptr);
+		return -ENODEV;
+	}
+
+	ret = sg_alloc_table(&sg_table, nents, GFP_KERNEL);
+	if (ret) {
+		err = ret;
+		goto sg_table_alloc_failed;
+	}
+
+	for_each_sg(sg_table.sgl, sg, nents, i) {
+		int alloc_sz = round_up(size, nents) / nents;
+		void *cpu_addr = kmalloc(alloc_sz, GFP_KERNEL);
+
+		if (!cpu_addr) {
+			err = -ENOMEM;
+			goto sg_buf_alloc_failed;
+		}
+
+		dev_dbg(dmadev->ddev.dev, "set sg buf[%d] :%p\n", i, cpu_addr);
+		sg_set_buf(sg, cpu_addr, alloc_sz);
+	}
+
+	dest_buf = kmalloc(round_up(size, nents), GFP_KERNEL);
+	if (!dest_buf) {
+		err = -ENOMEM;
+		goto dst_alloc_failed;
+	}
+	dev_dbg(dmadev->ddev.dev, "dest:%p\n", dest_buf);
+
+	/* Fill in src buffer */
+	count = 0;
+	for_each_sg(sg_table.sgl, sg, nents, i) {
+		src_buf = sg_virt(sg);
+		dev_dbg(dmadev->ddev.dev,
+			"set src[%d, %d, %p] = %d\n", i, j, src_buf, count);
+
+		for (j = 0; j < sg_dma_len(sg); j++)
+			src_buf[j] = count++;
+	}
+
+	/* dma_map_sg cleans and invalidates the cache in arm64 when
+	 * DMA_TO_DEVICE is selected for src. That's why, we need to do
+	 * the mapping after the data is copied.
+	 */
+	map_count = dma_map_sg(dmadev->ddev.dev, sg_table.sgl, nents,
+				DMA_TO_DEVICE);
+	if (!map_count) {
+		err =  -EINVAL;
+		goto src_map_failed;
+	}
+
+	dest_dma = dma_map_single(dmadev->ddev.dev, dest_buf,
+				size, DMA_FROM_DEVICE);
+
+	err = dma_mapping_error(dmadev->ddev.dev, dest_dma);
+	if (err)
+		goto dest_map_failed;
+
+	/* check scatter gather list contents */
+	for_each_sg(sg_table.sgl, sg, map_count, i)
+		dev_dbg(dmadev->ddev.dev,
+			"[%d/%d] src va=%p, iova = %pa len:%d\n",
+			i, map_count, sg_virt(sg), &sg_dma_address(sg),
+			sg_dma_len(sg));
+
+	dest_dma_it = dest_dma;
+	for_each_sg(sg_table.sgl, sg, map_count, i) {
+		src_buf = sg_virt(sg);
+		src_dma = sg_dma_address(sg);
+		dev_dbg(dmadev->ddev.dev, "src_dma: %pad dest_dma:%pad\n",
+			&src_dma, &dest_dma_it);
+
+		tx = hidma_prep_dma_memcpy(dma_chanptr, dest_dma_it, src_dma,
+					sg_dma_len(sg), flags);
+		if (!tx) {
+			dev_err(dmadev->ddev.dev,
+				"Self-test prep_dma_memcpy failed, disabling\n");
+			err = -ENODEV;
+			goto prep_memcpy_failed;
+		}
+
+		tx->callback_param = dmadev;
+		tx->callback = hidma_selftest_complete;
+		cookie = tx->tx_submit(tx);
+		dest_dma_it += sg_dma_len(sg);
+	}
+
+	hidma_issue_pending(dma_chanptr);
+
+	/*
+	 * It is assumed that the hardware can move the data within 1s
+	 * and signal the OS of the completion
+	 */
+	ret = wait_event_interruptible_timeout(dmadev->test_result.wq,
+		atomic_read(&dmadev->test_result.counter) == (map_count),
+				msecs_to_jiffies(10000));
+
+	if (ret <= 0) {
+		dev_err(dmadev->ddev.dev,
+			"Self-test sg copy timed out, disabling\n");
+		err = -ENODEV;
+		goto tx_status;
+	}
+	dev_dbg(dmadev->ddev.dev,
+		"Self-test complete signal received\n");
+
+	if (hidma_tx_status(dma_chanptr, cookie, NULL) !=
+				DMA_COMPLETE) {
+		dev_err(dmadev->ddev.dev,
+			"Self-test sg status not complete, disabling\n");
+		err = -ENODEV;
+		goto tx_status;
+	}
+
+	dma_sync_single_for_cpu(dmadev->ddev.dev, dest_dma, size,
+				DMA_FROM_DEVICE);
+
+	hidma_chan = to_hidma_chan(dma_chanptr);
+	count = 0;
+	for_each_sg(sg_table.sgl, sg, map_count, i) {
+		src_buf = sg_virt(sg);
+		if (memcmp(src_buf, &dest_buf[count], sg_dma_len(sg)) == 0) {
+			count += sg_dma_len(sg);
+			continue;
+		}
+
+		for (j = 0; j < sg_dma_len(sg); j++) {
+			if (src_buf[j] != dest_buf[count]) {
+				dev_dbg(dmadev->ddev.dev,
+				"[%d, %d] (%p) src :%x dest (%p):%x cnt:%d\n",
+					i, j, &src_buf[j], src_buf[j],
+					&dest_buf[count], dest_buf[count],
+					count);
+				dev_err(dmadev->ddev.dev,
+				 "Self-test copy failed compare, disabling\n");
+				err = -EFAULT;
+				return err;
+				goto compare_failed;
+			}
+			count++;
+		}
+	}
+
+	/*
+	 * do not release the channel
+	 * we want to consume all the channels on self test
+	 */
+	free_channel = 0;
+
+compare_failed:
+tx_status:
+prep_memcpy_failed:
+	dma_unmap_single(dmadev->ddev.dev, dest_dma, size,
+			 DMA_FROM_DEVICE);
+dest_map_failed:
+	dma_unmap_sg(dmadev->ddev.dev, sg_table.sgl, nents,
+			DMA_TO_DEVICE);
+
+src_map_failed:
+	kfree(dest_buf);
+
+dst_alloc_failed:
+sg_buf_alloc_failed:
+	for_each_sg(sg_table.sgl, sg, nents, i) {
+		if (sg_virt(sg))
+			kfree(sg_virt(sg));
+	}
+	sg_free_table(&sg_table);
+sg_table_alloc_failed:
+	if (free_channel)
+		hidma_free_chan_resources(dma_chanptr);
+
+	return err;
+}
+
+/*
+ * Perform a streaming transaction to verify the HW works.
+ */
+static int hidma_selftest_streaming(struct hidma_dev *dmadev,
+			struct dma_chan *dma_chanptr, u64 size,
+			unsigned long flags)
+{
+	dma_addr_t src_dma, dest_dma;
+	u8 *dest_buf, *src_buf;
+	u32 i;
+	dma_cookie_t cookie;
+	struct dma_async_tx_descriptor *tx;
+	int err = 0;
+	int ret;
+	struct hidma_chan *hidma_chan;
+	bool free_channel = 1;
+
+	atomic_set(&dmadev->test_result.counter, 0);
+
+	if (!dma_chanptr)
+		return -ENOMEM;
+
+	if (hidma_alloc_chan_resources(dma_chanptr) < 1)
+		return -ENODEV;
+
+	if (!dma_chanptr->device || !dmadev->ddev.dev) {
+		hidma_free_chan_resources(dma_chanptr);
+		return -ENODEV;
+	}
+
+	src_buf = kmalloc(size, GFP_KERNEL);
+	if (!src_buf) {
+		err = -ENOMEM;
+		goto src_alloc_failed;
+	}
+
+	dest_buf = kmalloc(size, GFP_KERNEL);
+	if (!dest_buf) {
+		err = -ENOMEM;
+		goto dst_alloc_failed;
+	}
+
+	dev_dbg(dmadev->ddev.dev, "src: %p dest:%p\n", src_buf, dest_buf);
+
+	/* Fill in src buffer */
+	for (i = 0; i < size; i++)
+		src_buf[i] = (u8)i;
+
+	/* dma_map_single cleans and invalidates the cache in arm64 when
+	 * DMA_TO_DEVICE is selected for src. That's why, we need to do
+	 * the mapping after the data is copied.
+	 */
+	src_dma = dma_map_single(dmadev->ddev.dev, src_buf,
+				 size, DMA_TO_DEVICE);
+
+	err = dma_mapping_error(dmadev->ddev.dev, src_dma);
+	if (err)
+		goto src_map_failed;
+
+	dest_dma = dma_map_single(dmadev->ddev.dev, dest_buf,
+				size, DMA_FROM_DEVICE);
+
+	err = dma_mapping_error(dmadev->ddev.dev, dest_dma);
+	if (err)
+		goto dest_map_failed;
+	dev_dbg(dmadev->ddev.dev, "src_dma: %pad dest_dma:%pad\n", &src_dma,
+		&dest_dma);
+	tx = hidma_prep_dma_memcpy(dma_chanptr, dest_dma, src_dma,
+					size,
+					flags);
+	if (!tx) {
+		dev_err(dmadev->ddev.dev,
+			"Self-test prep_dma_memcpy failed, disabling\n");
+		err = -ENODEV;
+		goto prep_memcpy_failed;
+	}
+
+	tx->callback_param = dmadev;
+	tx->callback = hidma_selftest_complete;
+	cookie = tx->tx_submit(tx);
+	hidma_issue_pending(dma_chanptr);
+
+	/*
+	 * It is assumed that the hardware can move the data within 1s
+	 * and signal the OS of the completion
+	 */
+	ret = wait_event_interruptible_timeout(dmadev->test_result.wq,
+				atomic_read(&dmadev->test_result.counter) == 1,
+				msecs_to_jiffies(10000));
+
+	if (ret <= 0) {
+		dev_err(dmadev->ddev.dev,
+			"Self-test copy timed out, disabling\n");
+		err = -ENODEV;
+		goto tx_status;
+	}
+	dev_dbg(dmadev->ddev.dev, "Self-test complete signal received\n");
+
+	if (hidma_tx_status(dma_chanptr, cookie, NULL) !=
+				DMA_COMPLETE) {
+		dev_err(dmadev->ddev.dev,
+			"Self-test copy timed out, disabling\n");
+		err = -ENODEV;
+		goto tx_status;
+	}
+
+	dma_sync_single_for_cpu(dmadev->ddev.dev, dest_dma, size,
+				DMA_FROM_DEVICE);
+
+	hidma_chan = to_hidma_chan(dma_chanptr);
+	if (memcmp(src_buf, dest_buf, size)) {
+		for (i = 0; i < size/4; i++) {
+			if (((u32 *)src_buf)[i] != ((u32 *)(dest_buf))[i]) {
+				dev_dbg(dmadev->ddev.dev,
+					"[%d] src data:%x dest data:%x\n",
+					i, ((u32 *)src_buf)[i],
+					((u32 *)(dest_buf))[i]);
+				break;
+			}
+		}
+		dev_err(dmadev->ddev.dev,
+			"Self-test copy failed compare, disabling\n");
+		err = -EFAULT;
+		goto compare_failed;
+	}
+
+	/*
+	 * do not release the channel
+	 * we want to consume all the channels on self test
+	 */
+	free_channel = 0;
+
+compare_failed:
+tx_status:
+prep_memcpy_failed:
+	dma_unmap_single(dmadev->ddev.dev, dest_dma, size,
+			 DMA_FROM_DEVICE);
+dest_map_failed:
+	dma_unmap_single(dmadev->ddev.dev, src_dma, size,
+			DMA_TO_DEVICE);
+
+src_map_failed:
+	kfree(dest_buf);
+
+dst_alloc_failed:
+	kfree(src_buf);
+
+src_alloc_failed:
+	if (free_channel)
+		hidma_free_chan_resources(dma_chanptr);
+
+	return err;
+}
+
+/*
+ * Perform a coherent transaction to verify the HW works.
+ */
+static int hidma_selftest_one_coherent(struct hidma_dev *dmadev,
+			struct dma_chan *dma_chanptr, u64 size,
+			unsigned long flags)
+{
+	dma_addr_t src_dma, dest_dma;
+	u8 *dest_buf, *src_buf;
+	u32 i;
+	dma_cookie_t cookie;
+	struct dma_async_tx_descriptor *tx;
+	int err = 0;
+	int ret;
+	struct hidma_chan *hidma_chan;
+	bool free_channel = true;
+
+	atomic_set(&dmadev->test_result.counter, 0);
+
+	if (!dma_chanptr)
+		return -ENOMEM;
+
+	if (hidma_alloc_chan_resources(dma_chanptr) < 1)
+		return -ENODEV;
+
+	if (!dma_chanptr->device || !dmadev->ddev.dev) {
+		hidma_free_chan_resources(dma_chanptr);
+		return -ENODEV;
+	}
+
+	src_buf = dma_alloc_coherent(dmadev->ddev.dev, size,
+				&src_dma, GFP_KERNEL);
+	if (!src_buf) {
+		err = -ENOMEM;
+		goto src_alloc_failed;
+	}
+
+	dest_buf = dma_alloc_coherent(dmadev->ddev.dev, size,
+				&dest_dma, GFP_KERNEL);
+	if (!dest_buf) {
+		err = -ENOMEM;
+		goto dst_alloc_failed;
+	}
+
+	dev_dbg(dmadev->ddev.dev, "src: %p dest:%p\n", src_buf, dest_buf);
+
+	/* Fill in src buffer */
+	for (i = 0; i < size; i++)
+		src_buf[i] = (u8)i;
+
+	dev_dbg(dmadev->ddev.dev, "src_dma: %pad dest_dma:%pad\n", &src_dma,
+		&dest_dma);
+	tx = hidma_prep_dma_memcpy(dma_chanptr, dest_dma, src_dma,
+					size,
+					flags);
+	if (!tx) {
+		dev_err(dmadev->ddev.dev,
+			"Self-test prep_dma_memcpy failed, disabling\n");
+		err = -ENODEV;
+		goto prep_memcpy_failed;
+	}
+
+	tx->callback_param = dmadev;
+	tx->callback = hidma_selftest_complete;
+	cookie = tx->tx_submit(tx);
+	hidma_issue_pending(dma_chanptr);
+
+	/*
+	 * It is assumed that the hardware can move the data within 1s
+	 * and signal the OS of the completion
+	 */
+	ret = wait_event_interruptible_timeout(dmadev->test_result.wq,
+				atomic_read(&dmadev->test_result.counter) == 1,
+				msecs_to_jiffies(10000));
+
+	if (ret <= 0) {
+		dev_err(dmadev->ddev.dev,
+			"Self-test copy timed out, disabling\n");
+		err = -ENODEV;
+		goto tx_status;
+	}
+	dev_dbg(dmadev->ddev.dev, "Self-test complete signal received\n");
+
+	if (hidma_tx_status(dma_chanptr, cookie, NULL) !=
+				DMA_COMPLETE) {
+		dev_err(dmadev->ddev.dev,
+			"Self-test copy timed out, disabling\n");
+		err = -ENODEV;
+		goto tx_status;
+	}
+
+	hidma_chan = to_hidma_chan(dma_chanptr);
+	if (memcmp(src_buf, dest_buf, size)) {
+		for (i = 0; i < size/4; i++) {
+			if (((u32 *)src_buf)[i] != ((u32 *)(dest_buf))[i]) {
+				dev_dbg(dmadev->ddev.dev,
+					"[%d] src data:%x dest data:%x\n",
+					i, ((u32 *)src_buf)[i],
+					((u32 *)(dest_buf))[i]);
+				break;
+			}
+		}
+		dev_err(dmadev->ddev.dev,
+			"Self-test copy failed compare, disabling\n");
+		err = -EFAULT;
+		goto compare_failed;
+	}
+
+	/*
+	 * do not release the channel
+	 * we want to consume all the channels on self test
+	 */
+	free_channel = 0;
+
+compare_failed:
+tx_status:
+prep_memcpy_failed:
+	dma_free_coherent(dmadev->ddev.dev, size, dest_buf, dest_dma);
+
+dst_alloc_failed:
+	dma_free_coherent(dmadev->ddev.dev, size, src_buf, src_dma);
+
+src_alloc_failed:
+	if (free_channel)
+		hidma_free_chan_resources(dma_chanptr);
+
+	return err;
+}
+
+static int hidma_selftest_all(struct hidma_dev *dmadev,
+				bool req_coherent, bool req_sg)
+{
+	int rc = -ENODEV, i = 0;
+	struct dma_chan **dmach_ptr = NULL;
+	u32 max_channels = 0;
+	u64 sizes[] = {PAGE_SIZE - 1, PAGE_SIZE, PAGE_SIZE + 1, 2801, 13295};
+	int count = 0;
+	u32 j;
+	u64 size;
+	int failed = 0;
+	struct dma_chan *dmach = NULL;
+
+	list_for_each_entry(dmach, &dmadev->ddev.channels,
+			device_node) {
+		max_channels++;
+	}
+
+	dmach_ptr = kcalloc(max_channels, sizeof(*dmach_ptr), GFP_KERNEL);
+	if (!dmach_ptr) {
+		rc = -ENOMEM;
+		goto failed_exit;
+	}
+
+	for (j = 0; j < sizeof(sizes)/sizeof(sizes[0]); j++) {
+		size = sizes[j];
+		count = 0;
+		dev_dbg(dmadev->ddev.dev, "test start for size:%llx\n", size);
+		list_for_each_entry(dmach, &dmadev->ddev.channels,
+				device_node) {
+			dmach_ptr[count] = dmach;
+			if (req_coherent)
+				rc = hidma_selftest_one_coherent(dmadev,
+					dmach, size,
+					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+			else if (req_sg)
+				rc = hidma_selftest_sg(dmadev,
+					dmach, size,
+					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+			else
+				rc = hidma_selftest_streaming(dmadev,
+					dmach, size,
+					DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
+			if (rc) {
+				failed = 1;
+				break;
+			}
+			dev_dbg(dmadev->ddev.dev,
+				"self test passed for ch:%d\n", count);
+			count++;
+		}
+
+		/*
+		 * free the channels where the test passed
+		 * Channel resources are freed for a test that fails.
+		 */
+		for (i = 0; i < count; i++)
+			hidma_free_chan_resources(dmach_ptr[i]);
+
+		if (failed)
+			break;
+	}
+
+failed_exit:
+	kfree(dmach_ptr);
+
+	return rc;
+}
+
+static int hidma_test_mapsingle(struct device *dev)
+{
+	u32 buf_size = 256;
+	char *src;
+	int ret = -ENOMEM;
+	dma_addr_t dma_src;
+
+	src = kmalloc(buf_size, GFP_KERNEL);
+	if (!src) {
+		dev_err(dev, "mapsingle: kmalloc failed ret:%d\n", ret);
+		return -ENOMEM;
+	}
+	strcpy(src, "hello world");
+
+	dma_src = dma_map_single(dev, src, buf_size, DMA_TO_DEVICE);
+	dev_dbg(dev, "mapsingle: src:%p src_dma:%pad\n", src, &dma_src);
+
+	ret = dma_mapping_error(dev, dma_src);
+	if (ret) {
+		dev_err(dev, "dma_mapping_error with ret:%d\n", ret);
+		ret = -ENOMEM;
+	} else {
+		phys_addr_t phys;
+
+		phys = dma_to_phys(dev, dma_src);
+		if (strcmp(__va(phys), "hello world") != 0) {
+			dev_err(dev, "memory content mismatch\n");
+			ret = -EINVAL;
+		} else {
+			dev_dbg(dev, "mapsingle:dma_map_single works\n");
+		}
+		dma_unmap_single(dev, dma_src, buf_size, DMA_TO_DEVICE);
+	}
+	kfree(src);
+	return ret;
+}
+
+/*
+ * Self test all DMA channels.
+ */
+static int hidma_memcpy_self_test(struct hidma_dev *device)
+{
+	int rc;
+
+	hidma_test_mapsingle(device->ddev.dev);
+
+	/* streaming test */
+	rc = hidma_selftest_all(device, false, false);
+	if (rc)
+		return rc;
+	dev_dbg(device->ddev.dev, "streaming self test passed\n");
+
+	/* coherent test */
+	rc = hidma_selftest_all(device, true, false);
+	if (rc)
+		return rc;
+
+	dev_dbg(device->ddev.dev, "coherent self test passed\n");
+
+	/* scatter gather test */
+	rc = hidma_selftest_all(device, false, true);
+	if (rc)
+		return rc;
+
+	dev_dbg(device->ddev.dev, "scatter gather self test passed\n");
+	return 0;
+}
+
+static irqreturn_t hidma_chirq_handler(int chirq, void *arg)
+{
+	void **lldev_ptr = arg;
+	irqreturn_t ret;
+	struct hidma_dev *dmadev = to_hidma_dev_from_lldev(lldev_ptr);
+
+	HIDMA_RUNTIME_GET(dmadev);
+	ret = hidma_ll_inthandler(chirq, *lldev_ptr);
+	HIDMA_RUNTIME_SET(dmadev);
+
+	return ret;
+}
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+
+#define SIER_CHAN_SHOW(chan, name) \
+		seq_printf(s, #name "=%u\n", chan->name)
+
+/**
+ * hidma_chan_stats: display HIDMA channel statistics
+ *
+ * Display the statistics for the current HIDMA virtual channel device.
+ */
+static int hidma_chan_stats(struct seq_file *s, void *unused)
+{
+	struct hidma_chan *mchan = s->private;
+	struct hidma_desc *mdesc;
+	struct hidma_dev *dmadev = mchan->dmadev;
+
+	HIDMA_RUNTIME_GET(dmadev);
+	SIER_CHAN_SHOW(mchan, paused);
+	SIER_CHAN_SHOW(mchan, dma_sig);
+	seq_puts(s, "prepared\n");
+	list_for_each_entry(mdesc, &mchan->prepared, node)
+		hidma_ll_chstats(s, mchan->dmadev->lldev, mdesc->tre_ch);
+
+	seq_puts(s, "active\n");
+		list_for_each_entry(mdesc, &mchan->active, node)
+			hidma_ll_chstats(s, mchan->dmadev->lldev,
+				mdesc->tre_ch);
+
+	seq_puts(s, "completed\n");
+		list_for_each_entry(mdesc, &mchan->completed, node)
+			hidma_ll_chstats(s, mchan->dmadev->lldev,
+				mdesc->tre_ch);
+
+	hidma_ll_devstats(s, mchan->dmadev->lldev);
+	HIDMA_RUNTIME_SET(dmadev);
+	return 0;
+}
+
+/**
+ * hidma_dma_info: display HIDMA device info
+ *
+ * Display the info for the current HIDMA device.
+ */
+static int hidma_dma_info(struct seq_file *s, void *unused)
+{
+	struct hidma_dev *dmadev = s->private;
+	struct dma_device *dma = &dmadev->ddev;
+
+	seq_printf(s, "nr_descriptors=%d\n", dmadev->nr_descriptors);
+	seq_printf(s, "dev_trca=%p\n", &dmadev->dev_trca);
+	seq_printf(s, "dev_trca_phys=%pa\n", &dmadev->dev_trca_phys);
+	seq_printf(s, "dev_trca_size=%pa\n", &dmadev->dev_trca_size);
+	seq_printf(s, "dev_evca=%p\n", &dmadev->dev_evca);
+	seq_printf(s, "dev_evca_phys=%pa\n", &dmadev->dev_evca_phys);
+	seq_printf(s, "dev_evca_size=%pa\n", &dmadev->dev_evca_size);
+	seq_printf(s, "self_test=%u\n",
+		atomic_read(&dmadev->test_result.counter));
+
+	seq_printf(s, "copy%s%s%s%s%s%s%s%s%s%s%s\n",
+		dma_has_cap(DMA_PQ, dma->cap_mask) ? " pq" : "",
+		dma_has_cap(DMA_PQ_VAL, dma->cap_mask) ? " pq_val" : "",
+		dma_has_cap(DMA_XOR, dma->cap_mask) ? " xor" : "",
+		dma_has_cap(DMA_XOR_VAL, dma->cap_mask) ? " xor_val" : "",
+		dma_has_cap(DMA_INTERRUPT, dma->cap_mask) ? " intr" : "",
+		dma_has_cap(DMA_SG, dma->cap_mask) ? " sg" : "",
+		dma_has_cap(DMA_ASYNC_TX, dma->cap_mask) ? " async" : "",
+		dma_has_cap(DMA_SLAVE, dma->cap_mask) ? " slave" : "",
+		dma_has_cap(DMA_CYCLIC, dma->cap_mask) ? " cyclic" : "",
+		dma_has_cap(DMA_INTERLEAVE, dma->cap_mask) ? " intl" : "",
+		dma_has_cap(DMA_MEMCPY, dma->cap_mask) ? " memcpy" : "");
+
+	return 0;
+}
+
+
+static int hidma_chan_stats_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, hidma_chan_stats, inode->i_private);
+}
+
+static int hidma_dma_info_open(struct inode *inode, struct file *file)
+{
+	return single_open(file, hidma_dma_info, inode->i_private);
+}
+
+static const struct file_operations hidma_chan_fops = {
+	.open = hidma_chan_stats_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+static const struct file_operations hidma_dma_fops = {
+	.open = hidma_dma_info_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+
+static void hidma_debug_uninit(struct hidma_dev *dmadev)
+{
+	struct list_head *position = NULL;
+
+	/* walk through the virtual channel list */
+	list_for_each(position, &dmadev->ddev.channels) {
+		struct hidma_chan *chan;
+
+		chan = list_entry(position, struct hidma_chan,
+				chan.device_node);
+		debugfs_remove(chan->stats);
+		debugfs_remove(chan->debugfs);
+	}
+
+	debugfs_remove(dmadev->stats);
+	debugfs_remove(dmadev->debugfs);
+}
+
+static int hidma_debug_init(struct hidma_dev *dmadev)
+{
+	int rc = 0;
+	int chidx = 0;
+	struct list_head *position = NULL;
+
+	dmadev->debugfs = debugfs_create_dir(dev_name(dmadev->ddev.dev), NULL);
+	if (!dmadev->debugfs) {
+		rc = -ENODEV;
+		return rc;
+	}
+
+	/* walk through the virtual channel list */
+	list_for_each(position, &dmadev->ddev.channels) {
+		struct hidma_chan *chan;
+
+		chan = list_entry(position, struct hidma_chan,
+				chan.device_node);
+		sprintf(chan->name, "chan%d", chidx);
+		chan->debugfs = debugfs_create_dir(chan->name,
+						dmadev->debugfs);
+		if (!chan->debugfs) {
+			rc = -ENOMEM;
+			goto cleanup;
+		}
+		chan->stats = debugfs_create_file("stats", S_IRUGO,
+				chan->debugfs, chan,
+				&hidma_chan_fops);
+		if (!chan->stats) {
+			rc = -ENOMEM;
+			goto cleanup;
+		}
+		chidx++;
+	}
+
+	dmadev->stats = debugfs_create_file("stats", S_IRUGO,
+			dmadev->debugfs, dmadev,
+			&hidma_dma_fops);
+	if (!dmadev->stats) {
+		rc = -ENOMEM;
+		goto cleanup;
+	}
+
+	return 0;
+cleanup:
+	hidma_debug_uninit(dmadev);
+	return rc;
+}
+#else
+static void hidma_debug_uninit(struct hidma_dev *dmadev)
+{
+}
+static int hidma_debug_init(struct hidma_dev *dmadev)
+{
+	return 0;
+}
+#endif
+
+static int hidma_probe(struct platform_device *pdev)
+{
+	struct hidma_dev *dmadev;
+	int rc = 0, i;
+	struct resource *trca_resource;
+	struct resource *evca_resource;
+	int chirq;
+
+	pm_runtime_set_autosuspend_delay(&pdev->dev, AUTOSUSPEND_TIMEOUT);
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_active(&pdev->dev);
+	pm_runtime_enable(&pdev->dev);
+
+	trca_resource = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!trca_resource) {
+		dev_err(&pdev->dev, "TRCA mem resource not found\n");
+		rc = -ENODEV;
+		goto resource_get_failed;
+	}
+
+	evca_resource = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (!evca_resource) {
+		dev_err(&pdev->dev, "EVCA mem resource not found\n");
+		rc = -ENODEV;
+		goto resource_get_failed;
+	}
+
+	/* This driver only handles the channel IRQs.
+	 * Common IRQ is handled by the management driver.
+	 */
+	chirq = platform_get_irq(pdev, 0);
+	if (chirq < 0) {
+		dev_err(&pdev->dev, "chirq resources not found\n");
+		rc = -ENODEV;
+		goto chirq_get_failed;
+	}
+
+	dev_dbg(&pdev->dev, "probe: starting\n");
+	dev_dbg(&pdev->dev, "We have %d resources\n", pdev->num_resources);
+
+	for (i = 0; i < pdev->num_resources; i++) {
+		dev_dbg(&pdev->dev, "[%d] resource: %pR\n", i,
+			&pdev->resource[i]);
+	}
+
+	dmadev = devm_kzalloc(&pdev->dev, sizeof(*dmadev), GFP_KERNEL);
+	if (!dmadev) {
+		dev_err(&pdev->dev, "probe: kzalloc failed\n");
+		rc = -ENOMEM;
+		goto device_alloc_failed;
+	}
+
+	INIT_LIST_HEAD(&dmadev->ddev.channels);
+	spin_lock_init(&dmadev->lock);
+	dmadev->ddev.dev = &pdev->dev;
+	HIDMA_RUNTIME_GET(dmadev);
+
+	dma_cap_set(DMA_MEMCPY, dmadev->ddev.cap_mask);
+	/* Apply default dma_mask if needed */
+	if (!pdev->dev.dma_mask) {
+		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
+		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(64);
+	}
+
+	dmadev->dev_evca_phys = evca_resource->start;
+	dmadev->dev_evca_size = resource_size(evca_resource);
+
+	dev_dbg(&pdev->dev, "dev_evca_phys:%pa\n", &dmadev->dev_evca_phys);
+	dev_dbg(&pdev->dev, "dev_evca_size:%pa\n", &dmadev->dev_evca_size);
+
+	dmadev->dev_evca = devm_ioremap_resource(&pdev->dev,
+						evca_resource);
+	if (IS_ERR(dmadev->dev_evca)) {
+		dev_err(&pdev->dev, "can't map i/o memory at %pa\n",
+			&dmadev->dev_evca_phys);
+		rc = -ENOMEM;
+		goto remap_evca_failed;
+	}
+	dev_dbg(&pdev->dev, "qcom_hidma: mapped EVCA %pa to %p\n",
+		&dmadev->dev_evca_phys, dmadev->dev_evca);
+
+	dmadev->dev_trca_phys = trca_resource->start;
+	dmadev->dev_trca_size = resource_size(trca_resource);
+
+	dev_dbg(&pdev->dev, "dev_trca_phys:%pa\n", &dmadev->dev_trca_phys);
+	dev_dbg(&pdev->dev, "dev_trca_size:%pa\n", &dmadev->dev_trca_size);
+
+	dmadev->dev_trca = devm_ioremap_resource(&pdev->dev,
+						trca_resource);
+	if (IS_ERR(dmadev->dev_trca)) {
+		dev_err(&pdev->dev, "can't map i/o memory at %pa\n",
+			&dmadev->dev_trca_phys);
+		rc = -ENOMEM;
+		goto remap_trca_failed;
+	}
+	dev_dbg(&pdev->dev, "qcom_hidma: mapped TRCA %pa to %p\n",
+		&dmadev->dev_trca_phys, dmadev->dev_trca);
+
+	init_waitqueue_head(&dmadev->test_result.wq);
+	dmadev->self_test = hidma_memcpy_self_test;
+	dmadev->ddev.device_prep_dma_memcpy = hidma_prep_dma_memcpy;
+	dmadev->ddev.device_alloc_chan_resources =
+		hidma_alloc_chan_resources;
+	dmadev->ddev.device_free_chan_resources = hidma_free_chan_resources;
+	dmadev->ddev.device_tx_status = hidma_tx_status;
+	dmadev->ddev.device_issue_pending = hidma_issue_pending;
+	dmadev->ddev.device_pause = hidma_pause;
+	dmadev->ddev.device_resume = hidma_resume;
+	dmadev->ddev.device_terminate_all = hidma_terminate_all;
+	dmadev->ddev.copy_align = 8;
+	dmadev->nr_descriptors = HIDMA_DEFAULT_DESCRIPTOR_COUNT;
+
+	device_property_read_u32(&pdev->dev, "desc-count",
+				&dmadev->nr_descriptors);
+
+	if (device_property_read_u8(&pdev->dev, "event-channel",
+				&dmadev->evridx)) {
+		dev_err(&pdev->dev, "probe:can't find the event channel id\n");
+		goto evridx_failed;
+	}
+
+	/* Set DMA mask to 64 bits. */
+	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
+	if (rc) {
+		dev_warn(&pdev->dev, "unable to set coherent mask to 64");
+		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	}
+	if (rc)
+		dev_warn(&pdev->dev, "unable to set coherent mask to 32");
+
+	rc = hidma_ll_init(&dmadev->lldev, dmadev->ddev.dev,
+				dmadev->nr_descriptors, dmadev->dev_trca,
+				dmadev->dev_evca, dmadev->evridx);
+	if (rc) {
+		dev_err(&pdev->dev, "probe:channel core init failed\n");
+		goto ll_init_failed;
+	}
+
+	rc = devm_request_irq(&pdev->dev, chirq, hidma_chirq_handler, 0,
+			      "qcom-hidma", &dmadev->lldev);
+	if (rc) {
+		dev_err(&pdev->dev, "chirq registration failed: %d\n", chirq);
+		goto chirq_request_failed;
+	}
+
+	dev_dbg(&pdev->dev, "initializing DMA channels\n");
+	INIT_LIST_HEAD(&dmadev->ddev.channels);
+	rc = hidma_chan_init(dmadev, 0);
+	if (rc) {
+		dev_err(&pdev->dev, "probe:channel init failed\n");
+		goto channel_init_failed;
+	}
+	dev_dbg(&pdev->dev, "HI-DMA engine driver starting self test\n");
+	rc = dmadev->self_test(dmadev);
+	if (rc) {
+		dev_err(&pdev->dev, "probe: self test failed: %d\n", rc);
+		goto self_test_failed;
+	}
+	dev_info(&pdev->dev, "probe: self test succeeded.\n");
+
+	dev_dbg(&pdev->dev, "calling dma_async_device_register\n");
+	rc = dma_async_device_register(&dmadev->ddev);
+	if (rc) {
+		dev_err(&pdev->dev,
+			"probe: failed to register slave DMA: %d\n", rc);
+		goto device_register_failed;
+	}
+	dev_dbg(&pdev->dev, "probe: dma_async_device_register done\n");
+
+	rc = hidma_debug_init(dmadev);
+	if (rc) {
+		dev_err(&pdev->dev,
+			"probe: failed to init debugfs: %d\n", rc);
+		goto debug_init_failed;
+	}
+
+	dev_info(&pdev->dev, "HI-DMA engine driver registration complete\n");
+	platform_set_drvdata(pdev, dmadev);
+	HIDMA_RUNTIME_SET(dmadev);
+	return 0;
+
+debug_init_failed:
+device_register_failed:
+self_test_failed:
+channel_init_failed:
+chirq_request_failed:
+	hidma_ll_uninit(dmadev->lldev);
+ll_init_failed:
+evridx_failed:
+remap_trca_failed:
+remap_evca_failed:
+	if (dmadev)
+		hidma_free(dmadev);
+device_alloc_failed:
+chirq_get_failed:
+resource_get_failed:
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_sync_suspend(&pdev->dev);
+	TRC_PM(&pdev->dev,
+		"%s:%d pm_runtime_put_autosuspend\n", __func__, __LINE__);
+	return rc;
+}
+
+static int hidma_remove(struct platform_device *pdev)
+{
+	struct hidma_dev *dmadev = platform_get_drvdata(pdev);
+
+	dev_dbg(&pdev->dev, "removing\n");
+	HIDMA_RUNTIME_GET(dmadev);
+	hidma_debug_uninit(dmadev);
+
+	dma_async_device_unregister(&dmadev->ddev);
+	hidma_ll_uninit(dmadev->lldev);
+	hidma_free(dmadev);
+
+	dev_info(&pdev->dev, "HI-DMA engine removed\n");
+	pm_runtime_put_sync_suspend(&pdev->dev);
+	TRC_PM(&pdev->dev,
+		"%s:%d pm_runtime_put_sync_suspend\n", __func__, __LINE__);
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
+#if IS_ENABLED(CONFIG_ACPI)
+static const struct acpi_device_id hidma_acpi_ids[] = {
+	{"QCOM8061"},
+	{},
+};
+#endif
+
+static const struct of_device_id hidma_match[] = {
+	{ .compatible = "qcom,hidma", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, hidma_match);
+
+static struct platform_driver hidma_driver = {
+	.probe = hidma_probe,
+	.remove = hidma_remove,
+	.driver = {
+		.name = MODULE_NAME,
+		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(hidma_match),
+		.acpi_match_table = ACPI_PTR(hidma_acpi_ids),
+	},
+};
+
+static int __init hidma_init(void)
+{
+	return platform_driver_register(&hidma_driver);
+}
+late_initcall(hidma_init);
+
+static void __exit hidma_exit(void)
+{
+	platform_driver_unregister(&hidma_driver);
+}
+module_exit(hidma_exit);
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/qcom_hidma.h b/drivers/dma/qcom_hidma.h
new file mode 100644
index 0000000..0ab8314
--- /dev/null
+++ b/drivers/dma/qcom_hidma.h
@@ -0,0 +1,44 @@
+/*
+ * Qualcomm Technologies HIDMA data structures
+ *
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
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
+#ifndef QCOM_HIDMA_H
+#define QCOM_HIDMA_H
+
+struct hidma_lldev;
+struct hidma_llchan;
+struct seq_file;
+
+int hidma_ll_request(void *llhndl, u32 dev_id, const char *dev_name,
+			void (*callback)(void *data), void *data, u32 *tre_ch);
+
+void hidma_ll_free(void *llhndl, u32 tre_ch);
+enum dma_status hidma_ll_status(void *llhndl, u32 tre_ch);
+bool hidma_ll_isenabled(void *llhndl);
+int hidma_ll_queue_request(void *llhndl, u32 tre_ch);
+int hidma_ll_start(void *llhndl);
+int hidma_ll_pause(void *llhndl);
+int hidma_ll_resume(void *llhndl);
+void hidma_ll_set_transfer_params(void *llhndl, u32 tre_ch,
+	dma_addr_t src, dma_addr_t dest, u32 len, u32 flags);
+int hidma_ll_setup(struct hidma_lldev *lldev);
+int hidma_ll_init(void **llhndl, struct device *dev, u32 max_channels,
+			void __iomem *trca, void __iomem *evca,
+			u8 evridx);
+int hidma_ll_uninit(void *llhndl);
+irqreturn_t hidma_ll_inthandler(int irq, void *arg);
+void hidma_ll_chstats(struct seq_file *s, void *llhndl, u32 tre_ch);
+void hidma_ll_devstats(struct seq_file *s, void *llhndl);
+void hidma_cleanup_pending_tre(void *llhndl, u8 err_info, u8 err_code);
+#endif
diff --git a/drivers/dma/qcom_hidma_ll.c b/drivers/dma/qcom_hidma_ll.c
new file mode 100644
index 0000000..0188afd
--- /dev/null
+++ b/drivers/dma/qcom_hidma_ll.c
@@ -0,0 +1,1132 @@
+/*
+ * Qualcomm Technologies HIDMA DMA engine low level code
+ *
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
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
+#include <linux/dmaengine.h>
+#include <linux/slab.h>
+#include <linux/interrupt.h>
+#include <linux/mm.h>
+#include <linux/highmem.h>
+#include <linux/dma-mapping.h>
+#include <linux/delay.h>
+#include <linux/debugfs.h>
+#include <linux/atomic.h>
+#include "qcom_hidma.h"
+
+#define TRE_SIZE			32 /* each TRE is 32 bytes  */
+#define EVRE_SIZE			16 /* each EVRE is 16 bytes */
+
+#define TRCA_CTRLSTS_OFFSET		0x0
+#define TRCA_RING_LOW_OFFSET		0x8
+#define TRCA_RING_HIGH_OFFSET		0xC
+#define TRCA_RING_LEN_OFFSET		0x10
+#define TRCA_READ_PTR_OFFSET		0x18
+#define TRCA_WRITE_PTR_OFFSET		0x20
+#define TRCA_DOORBELL_OFFSET		0x400
+
+#define EVCA_CTRLSTS_OFFSET		0x0
+#define EVCA_INTCTRL_OFFSET		0x4
+#define EVCA_RING_LOW_OFFSET		0x8
+#define EVCA_RING_HIGH_OFFSET		0xC
+#define EVCA_RING_LEN_OFFSET		0x10
+#define EVCA_READ_PTR_OFFSET		0x18
+#define EVCA_WRITE_PTR_OFFSET		0x20
+#define EVCA_DOORBELL_OFFSET		0x400
+
+#define EVCA_IRQ_STAT_OFFSET		0x100
+#define EVCA_IRQ_CLR_OFFSET		0x108
+#define EVCA_IRQ_EN_OFFSET		0x110
+
+#define TRE_CFG_IDX			0
+#define TRE_LEN_IDX			1
+#define TRE_SRC_LOW_IDX		2
+#define TRE_SRC_HI_IDX			3
+#define TRE_DEST_LOW_IDX		4
+#define TRE_DEST_HI_IDX		5
+
+#define EVRE_CFG_IDX			0
+#define EVRE_LEN_IDX			1
+#define EVRE_DEST_LOW_IDX		2
+#define EVRE_DEST_HI_IDX		3
+
+#define EVRE_ERRINFO_BIT_POS		24
+#define EVRE_CODE_BIT_POS		28
+
+#define EVRE_ERRINFO_MASK		0xF
+#define EVRE_CODE_MASK			0xF
+
+#define CH_CONTROL_MASK		0xFF
+#define CH_STATE_MASK			0xFF
+#define CH_STATE_BIT_POS		0x8
+
+#define MAKE64(high, low) (((u64)(high) << 32) | (low))
+
+#define IRQ_EV_CH_EOB_IRQ_BIT_POS	0
+#define IRQ_EV_CH_WR_RESP_BIT_POS	1
+#define IRQ_EV_CH_RESET_ERR_BIT_POS	5
+#define IRQ_TR_CH_TRE_RD_RSP_ER_BIT_POS 9
+#define IRQ_TR_CH_DATA_RD_ER_BIT_POS	10
+#define IRQ_TR_CH_DATA_WR_ER_BIT_POS	11
+#define IRQ_TR_CH_RESET_ERROR		13
+#define IRQ_TR_CH_INVALID_TRE_BIT_POS	14
+
+#define	ENABLE_IRQS (BIT(IRQ_EV_CH_EOB_IRQ_BIT_POS) | \
+		BIT(IRQ_EV_CH_WR_RESP_BIT_POS) | \
+		BIT(IRQ_EV_CH_RESET_ERR_BIT_POS) |		 \
+		BIT(IRQ_TR_CH_TRE_RD_RSP_ER_BIT_POS) |	 \
+		BIT(IRQ_TR_CH_DATA_RD_ER_BIT_POS) |		 \
+		BIT(IRQ_TR_CH_DATA_WR_ER_BIT_POS) |		 \
+		BIT(IRQ_TR_CH_RESET_ERROR)	|		\
+		BIT(IRQ_TR_CH_INVALID_TRE_BIT_POS))
+
+enum ch_command {
+	CH_DISABLE = 0,
+	CH_ENABLE = 1,
+	CH_SUSPEND = 2,
+	CH_RESET = 9,
+};
+
+enum ch_state {
+	CH_DISABLED = 0,
+	CH_ENABLED = 1,
+	CH_RUNNING = 2,
+	CH_SUSPENDED = 3,
+	CH_STOPPED = 4,
+	CH_ERROR = 5,
+	CH_IN_RESET = 9,
+};
+
+enum tre_type {
+	TRE_MEMCPY = 3,
+	TRE_MEMSET = 4,
+};
+
+enum evre_type {
+	EVRE_DMA_COMPLETE = 0x23,
+	EVRE_IMM_DATA = 0x24,
+};
+
+enum err_code {
+	EVRE_STATUS_COMPLETE = 1,
+	EVRE_STATUS_ERROR = 4,
+};
+
+struct hidma_tx_status {
+	u8 err_info;			/* error record in this transfer    */
+	u8 err_code;			/* completion code		    */
+};
+
+struct hidma_lldev {
+	bool initialized;		/* initialized flag               */
+	u8 trch_state;			/* trch_state of the device	  */
+	u8 evch_state;			/* evch_state of the device	  */
+	u8 evridx;			/* event channel to notify	  */
+	u32 nr_tres;			/* max number of configs          */
+	spinlock_t lock;		/* reentrancy                     */
+	struct hidma_tre *trepool;	/* trepool of user configs */
+	struct device *dev;		/* device			  */
+	void __iomem *trca;		/* Transfer Channel address       */
+	void __iomem *evca;		/* Event Channel address          */
+	struct hidma_tre
+		**pending_tre_list;	/* Pointers to pending TREs	  */
+	struct hidma_tx_status
+		*tx_status_list;	/* Pointers to pending TREs status*/
+	s32 pending_tre_count;		/* Number of TREs pending	  */
+
+	void *tre_ring;		/* TRE ring			  */
+	dma_addr_t tre_ring_handle;	/* TRE ring to be shared with HW  */
+	u32 tre_ring_size;		/* Byte size of the ring	  */
+	u32 tre_processed_off;		/* last processed TRE		   */
+
+	void *evre_ring;		/* EVRE ring			   */
+	dma_addr_t evre_ring_handle;	/* EVRE ring to be shared with HW  */
+	u32 evre_ring_size;		/* Byte size of the ring	  */
+	u32 evre_processed_off;	/* last processed EVRE		   */
+
+	u32 tre_write_offset;           /* TRE write location              */
+};
+
+struct hidma_tre {
+	atomic_t allocated;		/* if this channel is allocated	    */
+	bool queued;			/* flag whether this is pending     */
+	u16 status;			/* status			    */
+	u32 chidx;			/* index of the tre	    */
+	u32 dma_sig;			/* signature of the tre	    */
+	const char *dev_name;		/* name of the device		    */
+	void (*callback)(void *data);	/* requester callback		    */
+	void *data;			/* Data associated with this channel*/
+	struct hidma_lldev *lldev;	/* lldma device pointer		    */
+	u32 tre_local[TRE_SIZE / sizeof(u32) + 1]; /* TRE local copy        */
+	struct tasklet_struct task;	/* task delivering notifications    */
+	u32 tre_index;			/* the offset where this was written*/
+	u32 int_flags;			/* interrupt flags*/
+};
+
+void hidma_ll_free(void *llhndl, u32 tre_ch)
+{
+	struct hidma_lldev *lldev = llhndl;
+	struct hidma_tre *tre;
+
+	if (unlikely(tre_ch >= lldev->nr_tres)) {
+		dev_err(lldev->dev, "invalid TRE number in free:%d", tre_ch);
+		return;
+	}
+
+	tre = &lldev->trepool[tre_ch];
+	if (unlikely(atomic_read(&tre->allocated) != true)) {
+		dev_err(lldev->dev, "trying to free an unused TRE:%d",
+			tre_ch);
+		return;
+	}
+
+	atomic_set(&tre->allocated, 0);
+	dev_dbg(lldev->dev, "free_dma: allocated:%d tre_ch:%d\n",
+		atomic_read(&tre->allocated), tre_ch);
+}
+EXPORT_SYMBOL_GPL(hidma_ll_free);
+
+int hidma_ll_request(void *llhndl, u32 dma_sig, const char *dev_name,
+			void (*callback)(void *data), void *data, u32 *tre_ch)
+{
+	u32 i;
+	struct hidma_lldev *lldev = llhndl;
+	struct hidma_tre *tre = NULL;
+	u32 *tre_local;
+
+	if (unlikely(!tre_ch) || unlikely(!lldev))
+		return -EINVAL;
+
+	/* need to have at least one empty spot in the queue */
+	for (i = 0; i < lldev->nr_tres - 1; i++) {
+		if (atomic_add_unless(&lldev->trepool[i].allocated, 1, 1))
+			break;
+	}
+
+	if (i == (lldev->nr_tres - 1))
+		return -ENOMEM;
+
+	tre = &lldev->trepool[i];
+	tre->dma_sig = dma_sig;
+	tre->dev_name = dev_name;
+	tre->callback = callback;
+	tre->data = data;
+	tre->chidx = i;
+	tre->status = 0;
+	tre->queued = 0;
+	lldev->tx_status_list[i].err_code = 0;
+	tre->lldev = lldev;
+	tre_local = &tre->tre_local[0];
+	tre_local[TRE_CFG_IDX] = TRE_MEMCPY;
+	tre_local[TRE_CFG_IDX] |= ((lldev->evridx & 0xFF) << 8);
+	tre_local[TRE_CFG_IDX] |= BIT(16);	/* set IEOB */
+	*tre_ch = i;
+	if (callback)
+		callback(data);
+	return 1;
+}
+EXPORT_SYMBOL_GPL(hidma_ll_request);
+
+/*
+ * Multiple TREs may be queued and waiting in the
+ * pending queue.
+ */
+static void hidma_ll_tre_complete(unsigned long arg)
+{
+	struct hidma_tre *tre = (struct hidma_tre *)arg;
+
+	/* call the user if it has been read by the hardware*/
+	if (tre->callback)
+		tre->callback(tre->data);
+}
+
+/*
+ * Called to handle the interrupt for the channel.
+ * Return a positive number if TRE or EVRE were consumed on this run.
+ * Return a positive number if there are pending TREs or EVREs.
+ * Return 0 if there is nothing to consume or no pending TREs/EVREs found.
+ */
+static int hidma_handle_tre_completion(struct hidma_lldev *lldev)
+{
+	struct hidma_tre *tre;
+	u32 evre_write_off;
+	u32 evre_ring_size = lldev->evre_ring_size;
+	u32 tre_ring_size = lldev->tre_ring_size;
+	u32 num_completed = 0, tre_iterator, evre_iterator;
+	unsigned long flags;
+
+	evre_write_off = readl_relaxed(lldev->evca + EVCA_WRITE_PTR_OFFSET);
+	tre_iterator = lldev->tre_processed_off;
+	evre_iterator = lldev->evre_processed_off;
+
+	if ((evre_write_off > evre_ring_size) ||
+		((evre_write_off % EVRE_SIZE) != 0)) {
+		dev_err(lldev->dev, "HW reports invalid EVRE write offset\n");
+		return 0;
+	}
+
+	/* By the time control reaches here the number of EVREs and TREs
+	 * may not match. Only consume the ones that hardware told us.
+	 */
+	while ((evre_iterator != evre_write_off)) {
+		u32 *current_evre = lldev->evre_ring + evre_iterator;
+		u32 cfg;
+		u8 err_info;
+
+		spin_lock_irqsave(&lldev->lock, flags);
+		tre = lldev->pending_tre_list[tre_iterator / TRE_SIZE];
+		if (!tre) {
+			spin_unlock_irqrestore(&lldev->lock, flags);
+			dev_warn(lldev->dev,
+				"tre_index [%d] and tre out of sync\n",
+				tre_iterator / TRE_SIZE);
+			tre_iterator += TRE_SIZE;
+			if (tre_iterator >= tre_ring_size)
+				tre_iterator -= tre_ring_size;
+			evre_iterator += EVRE_SIZE;
+			if (evre_iterator >= evre_ring_size)
+				evre_iterator -= evre_ring_size;
+
+			continue;
+		}
+		lldev->pending_tre_list[tre->tre_index] = NULL;
+
+		/* Keep track of pending TREs that SW is expecting to receive
+		 * from HW. We got one now. Decrement our counter.
+		 */
+		lldev->pending_tre_count--;
+		if (lldev->pending_tre_count < 0) {
+			dev_warn(lldev->dev,
+				"tre count mismatch on completion");
+			lldev->pending_tre_count = 0;
+		}
+
+		spin_unlock_irqrestore(&lldev->lock, flags);
+
+		cfg = current_evre[EVRE_CFG_IDX];
+		err_info = (cfg >> EVRE_ERRINFO_BIT_POS);
+		err_info = err_info & EVRE_ERRINFO_MASK;
+		lldev->tx_status_list[tre->chidx].err_info = err_info;
+		lldev->tx_status_list[tre->chidx].err_code =
+			(cfg >> EVRE_CODE_BIT_POS) & EVRE_CODE_MASK;
+		tre->queued = 0;
+
+		tasklet_schedule(&tre->task);
+
+		tre_iterator += TRE_SIZE;
+		if (tre_iterator >= tre_ring_size)
+			tre_iterator -= tre_ring_size;
+		evre_iterator += EVRE_SIZE;
+		if (evre_iterator >= evre_ring_size)
+			evre_iterator -= evre_ring_size;
+
+		/* Read the new event descriptor written by the HW.
+		 * As we are processing the delivered events, other events
+		 * get queued to the SW for processing.
+		 */
+		evre_write_off =
+			readl_relaxed(lldev->evca + EVCA_WRITE_PTR_OFFSET);
+		num_completed++;
+	}
+
+	if (num_completed) {
+		u32 evre_read_off = (lldev->evre_processed_off +
+				EVRE_SIZE * num_completed);
+		u32 tre_read_off = (lldev->tre_processed_off +
+				TRE_SIZE * num_completed);
+
+		evre_read_off = evre_read_off % evre_ring_size;
+		tre_read_off = tre_read_off % tre_ring_size;
+
+		writel(evre_read_off, lldev->evca + EVCA_DOORBELL_OFFSET);
+
+		/* record the last processed tre offset */
+		lldev->tre_processed_off = tre_read_off;
+		lldev->evre_processed_off = evre_read_off;
+	}
+
+	return num_completed;
+}
+
+void hidma_cleanup_pending_tre(void *llhndl, u8 err_info, u8 err_code)
+{
+	u32 tre_iterator;
+	struct hidma_tre *tre;
+	struct hidma_lldev *lldev = llhndl;
+	u32 tre_ring_size = lldev->tre_ring_size;
+	int num_completed = 0;
+	u32 tre_read_off;
+	unsigned long flags;
+
+	tre_iterator = lldev->tre_processed_off;
+	while (lldev->pending_tre_count) {
+		int tre_index = tre_iterator / TRE_SIZE;
+
+		spin_lock_irqsave(&lldev->lock, flags);
+		tre = lldev->pending_tre_list[tre_index];
+		if (!tre) {
+			spin_unlock_irqrestore(&lldev->lock, flags);
+			tre_iterator += TRE_SIZE;
+			if (tre_iterator >= tre_ring_size)
+				tre_iterator -= tre_ring_size;
+			continue;
+		}
+		lldev->pending_tre_list[tre_index] = NULL;
+		lldev->pending_tre_count--;
+		if (lldev->pending_tre_count < 0) {
+			dev_warn(lldev->dev,
+				"tre count mismatch on completion");
+			lldev->pending_tre_count = 0;
+		}
+		spin_unlock_irqrestore(&lldev->lock, flags);
+
+		lldev->tx_status_list[tre->chidx].err_info = err_info;
+		lldev->tx_status_list[tre->chidx].err_code = err_code;
+		tre->queued = 0;
+
+		tasklet_schedule(&tre->task);
+
+		tre_iterator += TRE_SIZE;
+		if (tre_iterator >= tre_ring_size)
+			tre_iterator -= tre_ring_size;
+
+		num_completed++;
+	}
+	tre_read_off = (lldev->tre_processed_off +
+			TRE_SIZE * num_completed);
+
+	tre_read_off = tre_read_off % tre_ring_size;
+
+	/* record the last processed tre offset */
+	lldev->tre_processed_off = tre_read_off;
+}
+EXPORT_SYMBOL_GPL(hidma_cleanup_pending_tre);
+
+static int hidma_ll_reset(struct hidma_lldev *lldev)
+{
+	u32 val;
+	int count;
+
+	val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
+	val = val & ~(CH_CONTROL_MASK << 16);
+	val = val | (CH_RESET << 16);
+	writel_relaxed(val, lldev->trca + TRCA_CTRLSTS_OFFSET);
+
+	/* wait until the reset is performed */
+	wmb();
+
+	/* Delay 10ms after reset to allow DMA logic to quiesce.*/
+	for (count = 0; count < 10; count++) {
+		val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
+		lldev->trch_state = (val >> CH_STATE_BIT_POS)
+					& CH_STATE_MASK;
+		if (lldev->trch_state == CH_DISABLED)
+			break;
+		mdelay(1);
+	}
+	val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
+	lldev->trch_state = (val >> CH_STATE_BIT_POS) & CH_STATE_MASK;
+	if (lldev->trch_state != CH_DISABLED) {
+		dev_err(lldev->dev,
+			"transfer channel did not reset\n");
+		return -ENODEV;
+	}
+
+	val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
+	val = val & ~(CH_CONTROL_MASK << 16);
+	val = val | (CH_RESET << 16);
+	writel_relaxed(val, lldev->evca + EVCA_CTRLSTS_OFFSET);
+
+	/* wait until the reset is performed */
+	wmb();
+
+	/* Delay 10ms after reset to allow DMA logic to quiesce.*/
+	for (count = 0; count < 10; count++) {
+		val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
+		lldev->evch_state = (val >> CH_STATE_BIT_POS)
+					& CH_STATE_MASK;
+		if (lldev->evch_state == CH_DISABLED)
+			break;
+		mdelay(1);
+	}
+	val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
+	lldev->evch_state = (val >> CH_STATE_BIT_POS) & CH_STATE_MASK;
+	if (lldev->evch_state != CH_DISABLED) {
+		dev_err(lldev->dev,
+			"event channel did not reset\n");
+		return -ENODEV;
+	}
+
+	/* ensure that both channels are disabled before leaving*/
+	mb();
+	lldev->trch_state = CH_DISABLED;
+	lldev->evch_state = CH_DISABLED;
+	return 0;
+}
+
+static void hidma_ll_enable_irq(struct hidma_lldev *lldev, u32 irq_bits)
+{
+	writel_relaxed(irq_bits, lldev->evca + EVCA_IRQ_EN_OFFSET);
+	dev_dbg(lldev->dev, "enableirq\n");
+}
+
+/*
+ * The interrupt handler for HIDMA will try to consume as many pending
+ * EVRE from the event queue as possible. Each EVRE has an associated
+ * TRE that holds the user interface parameters. EVRE reports the
+ * result of the transaction. Hardware guarantees ordering between EVREs
+ * and TREs. We use last processed offset to figure out which TRE is
+ * associated with which EVRE. If two TREs are consumed by HW, the EVREs
+ * are in order in the event ring.
+ * This handler will do a one pass for consuming EVREs. Other EVREs may
+ * be delivered while we are working. It will try to consume incoming
+ * EVREs one more time and return.
+ * For unprocessed EVREs, hardware will trigger another interrupt until
+ * all the interrupt bits are cleared.
+ */
+static void hidma_ll_int_handler_internal(struct hidma_lldev *lldev)
+{
+	u32 status;
+	u32 enable;
+	u32 cause;
+	int repeat = 2;
+	unsigned long timeout;
+
+	status = readl_relaxed(lldev->evca + EVCA_IRQ_STAT_OFFSET);
+	enable = readl_relaxed(lldev->evca + EVCA_IRQ_EN_OFFSET);
+	cause = status & enable;
+
+	if ((cause & (1<<IRQ_EV_CH_RESET_ERR_BIT_POS))
+		|| (cause & (1<<IRQ_TR_CH_RESET_ERROR))) {
+		u8 err_code = EVRE_STATUS_ERROR;
+		u8 err_info = 0xFE;
+
+		/* Clear out pending interrupts */
+		writel(cause, lldev->evca + EVCA_IRQ_CLR_OFFSET);
+
+		hidma_cleanup_pending_tre(lldev, err_info, err_code);
+		dev_err(lldev->dev,
+			"The channel is terminated(%x).Hardware reset needed\n",
+			cause);
+		return;
+	}
+
+	if ((cause & (BIT(IRQ_TR_CH_INVALID_TRE_BIT_POS))) ||
+			(cause & BIT(IRQ_TR_CH_TRE_RD_RSP_ER_BIT_POS)) ||
+			(cause & BIT(IRQ_EV_CH_WR_RESP_BIT_POS)) ||
+			(cause & BIT(IRQ_TR_CH_DATA_RD_ER_BIT_POS)) ||
+			(cause & BIT(IRQ_TR_CH_DATA_WR_ER_BIT_POS))) {
+		u8 err_code = EVRE_STATUS_ERROR;
+		u8 err_info = 0xFF;
+
+		/* Clear out pending interrupts */
+		writel(cause, lldev->evca + EVCA_IRQ_CLR_OFFSET);
+
+		dev_err(lldev->dev,
+			"error 0x%x, resetting...\n", cause);
+
+		hidma_cleanup_pending_tre(lldev, err_info, err_code);
+
+		/* reset the channel for recovery */
+		if (hidma_ll_setup(lldev)) {
+			dev_err(lldev->dev,
+				"channel reinitialize failed after error\n");
+			return;
+		}
+		hidma_ll_enable_irq(lldev, ENABLE_IRQS);
+		return;
+	}
+
+	/* Try to consume as many EVREs as possible.
+	 * skip this loop if the interrupt is spurious.
+	 */
+	while (cause && repeat) {
+		unsigned long start = jiffies;
+
+		/* This timeout should be sufficent for core to finish */
+		timeout = start + msecs_to_jiffies(500);
+
+		while (lldev->pending_tre_count) {
+			hidma_handle_tre_completion(lldev);
+			if (time_is_before_jiffies(timeout)) {
+				dev_warn(lldev->dev,
+					"ISR timeout %lx vs. %lx from %lx [%d]\n",
+					jiffies, timeout, start,
+					lldev->pending_tre_count);
+				break;
+			}
+		}
+
+		/* We consumed TREs or there are pending TREs or EVREs. */
+		writel_relaxed(cause, lldev->evca + EVCA_IRQ_CLR_OFFSET);
+
+		/* Another interrupt might have arrived while we are
+		 * processing this one. Read the new cause.
+		 */
+		status = readl_relaxed(lldev->evca + EVCA_IRQ_STAT_OFFSET);
+		enable = readl_relaxed(lldev->evca + EVCA_IRQ_EN_OFFSET);
+		cause = status & enable;
+
+		repeat--;
+	}
+}
+
+
+static int hidma_ll_enable(struct hidma_lldev *lldev)
+{
+	u32 val;
+
+	val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
+	val &= ~(CH_CONTROL_MASK << 16);
+	val |= (CH_ENABLE << 16);
+
+	writel_relaxed(val, lldev->evca + EVCA_CTRLSTS_OFFSET);
+
+	/* wait until channel is enabled */
+	wmb();
+
+	mdelay(1);
+
+	val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
+	lldev->evch_state = (val >> CH_STATE_BIT_POS) & CH_STATE_MASK;
+	if ((lldev->evch_state != CH_ENABLED) &&
+		(lldev->evch_state != CH_RUNNING)) {
+		dev_err(lldev->dev,
+			"event channel did not get enabled\n");
+		return -ENODEV;
+	}
+
+	val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
+	val = val & ~(CH_CONTROL_MASK << 16);
+	val = val | (CH_ENABLE << 16);
+	writel_relaxed(val, lldev->trca + TRCA_CTRLSTS_OFFSET);
+
+	/* wait until channel is enabled */
+	wmb();
+
+	mdelay(1);
+
+	val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
+	lldev->trch_state = (val >> CH_STATE_BIT_POS) & CH_STATE_MASK;
+	if ((lldev->trch_state != CH_ENABLED) &&
+		(lldev->trch_state != CH_RUNNING)) {
+		dev_err(lldev->dev,
+			"transfer channel did not get enabled\n");
+		return -ENODEV;
+	}
+
+	/* ensure that both channels are enabled before leaving*/
+	mb();
+
+	lldev->trch_state = CH_ENABLED;
+	lldev->evch_state = CH_ENABLED;
+
+	return 0;
+}
+
+int hidma_ll_resume(void *llhndl)
+{
+	return hidma_ll_enable((struct hidma_lldev *)llhndl);
+}
+EXPORT_SYMBOL_GPL(hidma_ll_resume);
+
+static int hidma_ll_hw_start(void *llhndl)
+{
+	int rc = 0;
+	struct hidma_lldev *lldev = llhndl;
+	unsigned long irqflags;
+
+	spin_lock_irqsave(&lldev->lock, irqflags);
+	writel_relaxed(lldev->tre_write_offset,
+			lldev->trca + TRCA_DOORBELL_OFFSET);
+	spin_unlock_irqrestore(&lldev->lock, irqflags);
+
+	return rc;
+}
+
+bool hidma_ll_isenabled(void *llhndl)
+{
+	struct hidma_lldev *lldev = llhndl;
+	u32 val;
+
+	val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
+	lldev->trch_state = (val >> CH_STATE_BIT_POS) & CH_STATE_MASK;
+	val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
+	lldev->evch_state = (val >> CH_STATE_BIT_POS) & CH_STATE_MASK;
+
+	/* both channels have to be enabled before calling this function*/
+	if (((lldev->trch_state == CH_ENABLED) ||
+		(lldev->trch_state == CH_RUNNING)) &&
+		((lldev->evch_state == CH_ENABLED) ||
+			(lldev->evch_state == CH_RUNNING)))
+		return true;
+
+	dev_dbg(lldev->dev, "channels are not enabled or are in error state");
+	return false;
+}
+EXPORT_SYMBOL_GPL(hidma_ll_isenabled);
+
+int hidma_ll_queue_request(void *llhndl, u32 tre_ch)
+{
+	struct hidma_lldev *lldev = llhndl;
+	struct hidma_tre *tre;
+	int rc = 0;
+	unsigned long flags;
+
+	tre = &lldev->trepool[tre_ch];
+
+	/* copy the TRE into its location in the TRE ring */
+	spin_lock_irqsave(&lldev->lock, flags);
+	tre->tre_index = lldev->tre_write_offset / TRE_SIZE;
+	lldev->pending_tre_list[tre->tre_index] = tre;
+	memcpy(lldev->tre_ring + lldev->tre_write_offset, &tre->tre_local[0],
+		TRE_SIZE);
+	lldev->tx_status_list[tre->chidx].err_code = 0;
+	lldev->tx_status_list[tre->chidx].err_info = 0;
+	tre->queued = 1;
+	lldev->pending_tre_count++;
+	lldev->tre_write_offset = (lldev->tre_write_offset + TRE_SIZE)
+				% lldev->tre_ring_size;
+	spin_unlock_irqrestore(&lldev->lock, flags);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(hidma_ll_queue_request);
+
+int hidma_ll_start(void *llhndl)
+{
+	return hidma_ll_hw_start(llhndl);
+}
+EXPORT_SYMBOL_GPL(hidma_ll_start);
+
+/*
+ * Note that even though we stop this channel
+ * if there is a pending transaction in flight
+ * it will complete and follow the callback.
+ * This request will prevent further requests
+ * to be made.
+ */
+int hidma_ll_pause(void *llhndl)
+{
+	struct hidma_lldev *lldev = llhndl;
+	u32 val;
+	int count;
+
+	val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
+	lldev->evch_state = (val >> CH_STATE_BIT_POS) & CH_STATE_MASK;
+	val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
+	lldev->trch_state = (val >> CH_STATE_BIT_POS) & CH_STATE_MASK;
+
+	/* already suspended by this OS */
+	if ((lldev->trch_state == CH_SUSPENDED) ||
+		(lldev->evch_state == CH_SUSPENDED))
+		return 0;
+
+	/* already stopped by the manager */
+	if ((lldev->trch_state == CH_STOPPED) ||
+		(lldev->evch_state == CH_STOPPED))
+		return 0;
+
+	val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
+	val = val & ~(CH_CONTROL_MASK << 16);
+	val = val | (CH_SUSPEND << 16);
+	writel_relaxed(val, lldev->trca + TRCA_CTRLSTS_OFFSET);
+
+	/* start the wait right after the suspend is confirmed */
+	wmb();
+
+	/* Delay 10ms after reset to allow DMA logic to quiesce.*/
+	for (count = 0; count < 10; count++) {
+		val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
+		lldev->trch_state = (val >> CH_STATE_BIT_POS)
+					& CH_STATE_MASK;
+		if (lldev->trch_state == CH_SUSPENDED)
+			break;
+		mdelay(1);
+	}
+	val = readl_relaxed(lldev->trca + TRCA_CTRLSTS_OFFSET);
+	lldev->trch_state = (val >> CH_STATE_BIT_POS) & CH_STATE_MASK;
+	if (lldev->trch_state != CH_SUSPENDED)
+		return -ENODEV;
+
+	val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
+	val = val & ~(CH_CONTROL_MASK << 16);
+	val = val | (CH_SUSPEND << 16);
+	writel_relaxed(val, lldev->evca + EVCA_CTRLSTS_OFFSET);
+
+	/* start the wait right after the suspend is confirmed */
+	wmb();
+
+	/* Delay 10ms after reset to allow DMA logic to quiesce.*/
+	for (count = 0; count < 10; count++) {
+		val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
+		lldev->evch_state = (val >> CH_STATE_BIT_POS)
+					& CH_STATE_MASK;
+		if (lldev->evch_state == CH_SUSPENDED)
+			break;
+		mdelay(1);
+	}
+	val = readl_relaxed(lldev->evca + EVCA_CTRLSTS_OFFSET);
+	lldev->evch_state = (val >> CH_STATE_BIT_POS) & CH_STATE_MASK;
+	if (lldev->evch_state != CH_SUSPENDED)
+		return -ENODEV;
+
+	/* ensure that both channels are suspended before leaving*/
+	mb();
+
+	lldev->trch_state = CH_SUSPENDED;
+	lldev->evch_state = CH_SUSPENDED;
+	dev_dbg(lldev->dev, "stop\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hidma_ll_pause);
+
+void hidma_ll_set_transfer_params(void *llhndl, u32 tre_ch,
+	dma_addr_t src, dma_addr_t dest, u32 len, u32 flags)
+{
+	struct hidma_lldev *lldev = llhndl;
+	struct hidma_tre *tre;
+	u32 *tre_local;
+
+	if (unlikely(tre_ch >= lldev->nr_tres)) {
+		dev_err(lldev->dev,
+			"invalid TRE number in transfer params:%d", tre_ch);
+		return;
+	}
+
+	tre = &lldev->trepool[tre_ch];
+	if (unlikely(atomic_read(&tre->allocated) != true)) {
+		dev_err(lldev->dev,
+			"trying to set params on an unused TRE:%d", tre_ch);
+		return;
+	}
+
+	tre_local = &tre->tre_local[0];
+	tre_local[TRE_LEN_IDX] = len;
+	tre_local[TRE_SRC_LOW_IDX] = lower_32_bits(src);
+	tre_local[TRE_SRC_HI_IDX] = upper_32_bits(src);
+	tre_local[TRE_DEST_LOW_IDX] = lower_32_bits(dest);
+	tre_local[TRE_DEST_HI_IDX] = upper_32_bits(dest);
+	tre->int_flags = flags;
+
+	dev_dbg(lldev->dev, "transferparams: tre_ch:%d %pap->%pap len:%u\n",
+		tre_ch, &src, &dest, len);
+}
+EXPORT_SYMBOL_GPL(hidma_ll_set_transfer_params);
+
+/* Called during initialization and after an error condition
+ * to restore hardware state.
+ */
+int hidma_ll_setup(struct hidma_lldev *lldev)
+{
+	int rc;
+	u64 addr;
+	u32 val;
+	u32 nr_tres = lldev->nr_tres;
+
+	lldev->pending_tre_count = 0;
+	lldev->tre_processed_off = 0;
+	lldev->evre_processed_off = 0;
+	lldev->tre_write_offset = 0;
+
+	/* disable interrupts */
+	hidma_ll_enable_irq(lldev, 0);
+
+	/* clear all pending interrupts */
+	val = readl_relaxed(lldev->evca + EVCA_IRQ_STAT_OFFSET);
+	writel_relaxed(val, lldev->evca + EVCA_IRQ_CLR_OFFSET);
+
+	rc = hidma_ll_reset(lldev);
+	if (rc)
+		return rc;
+
+	/* Clear all pending interrupts again.
+	 * Otherwise, we observe reset complete interrupts.
+	 */
+	val = readl_relaxed(lldev->evca + EVCA_IRQ_STAT_OFFSET);
+	writel_relaxed(val, lldev->evca + EVCA_IRQ_CLR_OFFSET);
+
+	/* disable interrupts again after reset */
+	hidma_ll_enable_irq(lldev, 0);
+
+	addr = lldev->tre_ring_handle;
+	writel_relaxed(lower_32_bits(addr),
+			lldev->trca + TRCA_RING_LOW_OFFSET);
+	writel_relaxed(upper_32_bits(addr),
+			lldev->trca + TRCA_RING_HIGH_OFFSET);
+	writel_relaxed(lldev->tre_ring_size,
+			lldev->trca + TRCA_RING_LEN_OFFSET);
+
+	addr = lldev->evre_ring_handle;
+	writel_relaxed(lower_32_bits(addr),
+			lldev->evca + EVCA_RING_LOW_OFFSET);
+	writel_relaxed(upper_32_bits(addr),
+			lldev->evca + EVCA_RING_HIGH_OFFSET);
+	writel_relaxed(EVRE_SIZE * nr_tres,
+			lldev->evca + EVCA_RING_LEN_OFFSET);
+
+	/* support IRQ only for now */
+	val = readl_relaxed(lldev->evca + EVCA_INTCTRL_OFFSET);
+	val = val & ~(0xF);
+	val = val | 0x1;
+	writel_relaxed(val, lldev->evca + EVCA_INTCTRL_OFFSET);
+
+	/* clear all pending interrupts and enable them*/
+	writel_relaxed(ENABLE_IRQS, lldev->evca + EVCA_IRQ_CLR_OFFSET);
+	hidma_ll_enable_irq(lldev, ENABLE_IRQS);
+
+	rc = hidma_ll_enable(lldev);
+	if (rc)
+		return rc;
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(hidma_ll_setup);
+
+int hidma_ll_init(void **lldevp, struct device *dev, u32 nr_tres,
+			void __iomem *trca, void __iomem *evca,
+			u8 evridx)
+{
+	u32 required_bytes;
+	struct hidma_lldev *lldev;
+	int rc;
+	u32 i;
+
+	if (!lldevp || !trca || !evca || !dev || !nr_tres)
+		return -EINVAL;
+
+	/* need at least four TREs */
+	if (nr_tres < 4)
+		return -EINVAL;
+
+	/* need an extra space */
+	nr_tres += 1;
+
+	lldev = devm_kzalloc(dev, sizeof(struct hidma_lldev), GFP_KERNEL);
+	if (!lldev)
+		return -ENOMEM;
+
+	lldev->evca = evca;
+	lldev->trca = trca;
+	lldev->dev = dev;
+	required_bytes = sizeof(struct hidma_tre) * nr_tres;
+	lldev->trepool = devm_kzalloc(lldev->dev, required_bytes, GFP_KERNEL);
+	if (!lldev->trepool)
+		return -ENOMEM;
+
+	required_bytes = sizeof(lldev->pending_tre_list[0]) * nr_tres;
+	lldev->pending_tre_list = devm_kzalloc(dev, required_bytes, GFP_KERNEL);
+	if (!lldev->pending_tre_list)
+		return -ENOMEM;
+
+	required_bytes = sizeof(lldev->tx_status_list[0]) * nr_tres;
+	lldev->tx_status_list = devm_kzalloc(dev, required_bytes, GFP_KERNEL);
+	if (!lldev->tx_status_list)
+		return -ENOMEM;
+
+	lldev->tre_ring = dmam_alloc_coherent(dev, (TRE_SIZE + 1) * nr_tres,
+					&lldev->tre_ring_handle, GFP_KERNEL);
+	if (!lldev->tre_ring)
+		return -ENOMEM;
+
+	memset(lldev->tre_ring, 0, (TRE_SIZE + 1) * nr_tres);
+	lldev->tre_ring_size = TRE_SIZE * nr_tres;
+	lldev->nr_tres = nr_tres;
+
+	/* the TRE ring has to be TRE_SIZE aligned */
+	if (!IS_ALIGNED(lldev->tre_ring_handle, TRE_SIZE)) {
+		u8  tre_ring_shift;
+
+		tre_ring_shift = lldev->tre_ring_handle % TRE_SIZE;
+		tre_ring_shift = TRE_SIZE - tre_ring_shift;
+		lldev->tre_ring_handle += tre_ring_shift;
+		lldev->tre_ring += tre_ring_shift;
+	}
+
+	lldev->evre_ring = dmam_alloc_coherent(dev, (EVRE_SIZE + 1) * nr_tres,
+					&lldev->evre_ring_handle, GFP_KERNEL);
+	if (!lldev->evre_ring)
+		return -ENOMEM;
+
+	memset(lldev->evre_ring, 0, (EVRE_SIZE + 1) * nr_tres);
+	lldev->evre_ring_size = EVRE_SIZE * nr_tres;
+
+	/* the EVRE ring has to be EVRE_SIZE aligned */
+	if (!IS_ALIGNED(lldev->evre_ring_handle, EVRE_SIZE)) {
+		u8  evre_ring_shift;
+
+		evre_ring_shift = lldev->evre_ring_handle % EVRE_SIZE;
+		evre_ring_shift = EVRE_SIZE - evre_ring_shift;
+		lldev->evre_ring_handle += evre_ring_shift;
+		lldev->evre_ring += evre_ring_shift;
+	}
+	lldev->nr_tres = nr_tres;
+	lldev->evridx = evridx;
+
+	rc = hidma_ll_setup(lldev);
+	if (rc)
+		return rc;
+
+	spin_lock_init(&lldev->lock);
+	for (i = 0; i < nr_tres; i++)
+		tasklet_init(&lldev->trepool[i].task, hidma_ll_tre_complete,
+				(unsigned long)&lldev->trepool[i]);
+	lldev->initialized = 1;
+	*lldevp = lldev;
+	hidma_ll_enable_irq(lldev, ENABLE_IRQS);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hidma_ll_init);
+
+int hidma_ll_uninit(void *llhndl)
+{
+	struct hidma_lldev *lldev = llhndl;
+	int rc = 0;
+	u32 val;
+
+	if (!lldev)
+		return -ENODEV;
+
+	if (lldev->initialized) {
+		u32 required_bytes;
+		u32 i;
+
+		lldev->initialized = 0;
+
+		required_bytes = sizeof(struct hidma_tre) * lldev->nr_tres;
+		for (i = 0; i < lldev->nr_tres; i++)
+			tasklet_kill(&lldev->trepool[i].task);
+		memset(lldev->trepool, 0, required_bytes);
+		lldev->trepool = NULL;
+		lldev->pending_tre_count = 0;
+		lldev->tre_write_offset = 0;
+
+		rc = hidma_ll_reset(lldev);
+
+		/* Clear all pending interrupts again.
+		 * Otherwise, we observe reset complete interrupts.
+		 */
+		val = readl_relaxed(lldev->evca + EVCA_IRQ_STAT_OFFSET);
+		writel_relaxed(val, lldev->evca + EVCA_IRQ_CLR_OFFSET);
+		hidma_ll_enable_irq(lldev, 0);
+	}
+	return rc;
+}
+EXPORT_SYMBOL_GPL(hidma_ll_uninit);
+
+irqreturn_t hidma_ll_inthandler(int chirq, void *arg)
+{
+	struct hidma_lldev *lldev = arg;
+
+	hidma_ll_int_handler_internal(lldev);
+	return IRQ_HANDLED;
+}
+EXPORT_SYMBOL_GPL(hidma_ll_inthandler);
+
+enum dma_status hidma_ll_status(void *llhndl, u32 tre_ch)
+{
+	struct hidma_lldev *lldev = llhndl;
+	enum dma_status ret = DMA_ERROR;
+	unsigned long flags;
+	u8 err_code;
+
+	spin_lock_irqsave(&lldev->lock, flags);
+	err_code = lldev->tx_status_list[tre_ch].err_code;
+
+	if (err_code & EVRE_STATUS_COMPLETE)
+		ret = DMA_COMPLETE;
+	else if (err_code & EVRE_STATUS_ERROR)
+		ret = DMA_ERROR;
+	else
+		ret = DMA_IN_PROGRESS;
+	spin_unlock_irqrestore(&lldev->lock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hidma_ll_status);
+
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+#define HIDMA_CHAN_SHOW(chan, name) \
+		seq_printf(s, #name "=0x%x\n", chan->name)
+
+#define HIDMA_DEVICE_SHOW(device, name) \
+		seq_printf(s, #name "=0x%x\n", device->name)
+
+void hidma_ll_chstats(struct seq_file *s, void *llhndl, u32 tre_ch)
+{
+	struct hidma_lldev *lldev = llhndl;
+	struct hidma_tre *tre;
+	u32 length;
+	dma_addr_t src_start;
+	dma_addr_t dest_start;
+	u32 *tre_local;
+
+	if (unlikely(tre_ch >= lldev->nr_tres)) {
+		dev_err(lldev->dev, "invalid TRE number in chstats:%d",
+			tre_ch);
+		return;
+	}
+	tre = &lldev->trepool[tre_ch];
+	seq_printf(s, "------Channel %d -----\n", tre_ch);
+	seq_printf(s, "allocated=%d\n", atomic_read(&tre->allocated));
+	HIDMA_CHAN_SHOW(tre, queued);
+	seq_printf(s, "err_info=0x%x\n",
+		   lldev->tx_status_list[tre->chidx].err_info);
+	seq_printf(s, "err_code=0x%x\n",
+		   lldev->tx_status_list[tre->chidx].err_code);
+	HIDMA_CHAN_SHOW(tre, status);
+	HIDMA_CHAN_SHOW(tre, chidx);
+	HIDMA_CHAN_SHOW(tre, dma_sig);
+	seq_printf(s, "dev_name=%s\n", tre->dev_name);
+	seq_printf(s, "callback=%p\n", tre->callback);
+	seq_printf(s, "data=%p\n", tre->data);
+	HIDMA_CHAN_SHOW(tre, tre_index);
+
+	tre_local = &tre->tre_local[0];
+	src_start = tre_local[TRE_SRC_LOW_IDX];
+	src_start = ((u64)(tre_local[TRE_SRC_HI_IDX]) << 32) + src_start;
+	dest_start = tre_local[TRE_DEST_LOW_IDX];
+	dest_start += ((u64)(tre_local[TRE_DEST_HI_IDX]) << 32);
+	length = tre_local[TRE_LEN_IDX];
+
+	seq_printf(s, "src=%pap\n", &src_start);
+	seq_printf(s, "dest=%pap\n", &dest_start);
+	seq_printf(s, "length=0x%x\n", length);
+}
+EXPORT_SYMBOL_GPL(hidma_ll_chstats);
+
+void hidma_ll_devstats(struct seq_file *s, void *llhndl)
+{
+	struct hidma_lldev *lldev = llhndl;
+
+	seq_puts(s, "------Device -----\n");
+	HIDMA_DEVICE_SHOW(lldev, initialized);
+	HIDMA_DEVICE_SHOW(lldev, trch_state);
+	HIDMA_DEVICE_SHOW(lldev, evch_state);
+	HIDMA_DEVICE_SHOW(lldev, evridx);
+	HIDMA_DEVICE_SHOW(lldev, nr_tres);
+	seq_printf(s, "trca=%p\n", lldev->trca);
+	seq_printf(s, "tre_ring=%p\n", lldev->tre_ring);
+	seq_printf(s, "tre_ring_handle=%pap\n", &lldev->tre_ring_handle);
+	HIDMA_DEVICE_SHOW(lldev, tre_ring_size);
+	HIDMA_DEVICE_SHOW(lldev, tre_processed_off);
+	seq_printf(s, "pending_tre_count=%d\n", lldev->pending_tre_count);
+	seq_printf(s, "evca=%p\n", lldev->evca);
+	seq_printf(s, "evre_ring=%p\n", lldev->evre_ring);
+	seq_printf(s, "evre_ring_handle=%pap\n", &lldev->evre_ring_handle);
+	HIDMA_DEVICE_SHOW(lldev, evre_ring_size);
+	HIDMA_DEVICE_SHOW(lldev, evre_processed_off);
+	HIDMA_DEVICE_SHOW(lldev, tre_write_offset);
+}
+EXPORT_SYMBOL_GPL(hidma_ll_devstats);
+#endif
-- 
Qualcomm Technologies, Inc. on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
