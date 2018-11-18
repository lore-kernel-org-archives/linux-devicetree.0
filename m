From: Pawel Laszczak <pawell@cadence.com>
Subject: [RFC PATCH v2 14/15] usb:cdns3: Adds debugging function.
Date: Sun, 18 Nov 2018 10:09:10 +0000
Message-ID: <1542535751-16079-15-git-send-email-pawell@cadence.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542535751-16079-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

Patch implements some function used for debugging driver.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/cdns3/Makefile |   4 +-
 drivers/usb/cdns3/debug.c  | 128 +++++++++++++++++++++++++++++++++++++
 drivers/usb/cdns3/ep0.c    |   3 +
 drivers/usb/cdns3/gadget.c |  12 ++++
 drivers/usb/cdns3/gadget.h |  13 +++-
 5 files changed, 157 insertions(+), 3 deletions(-)
 create mode 100644 drivers/usb/cdns3/debug.c

diff --git a/drivers/usb/cdns3/Makefile b/drivers/usb/cdns3/Makefile
index bea6173bf37f..34e60d03c4ec 100644
--- a/drivers/usb/cdns3/Makefile
+++ b/drivers/usb/cdns3/Makefile
@@ -2,6 +2,6 @@ obj-$(CONFIG_USB_CDNS3)			+= cdns3.o
 obj-$(CONFIG_USB_CDNS3_PCI_WRAP)	+= cdns3-pci.o
 
 cdns3-y					:= core.o drd.o
-cdns3-$(CONFIG_USB_CDNS3_GADGET)	+= gadget.o ep0.o
-cdns3-$(CONFIG_USB_CDNS3_HOST)          += host.o
+cdns3-$(CONFIG_USB_CDNS3_GADGET)	+= gadget.o ep0.o debug.o
+cdns3-$(CONFIG_USB_CDNS3_HOST)		+= host.o
 cdns3-pci-y		 		:= cdns3-pci-wrap.o
diff --git a/drivers/usb/cdns3/debug.c b/drivers/usb/cdns3/debug.c
new file mode 100644
index 000000000000..b9a779b35789
--- /dev/null
+++ b/drivers/usb/cdns3/debug.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Cadence USBSS DRD Driver.
+ *
+ * Copyright (C) 2018 Cadence.
+ *
+ * Author: Pawel Laszczak <pawell@cadence.com>
+ */
+
+#include "gadget.h"
+
+static char *cdns3_decode_ep_irq(u32 ep_sts, const char *ep_name)
+{
+	static char str[256];
+	int ret;
+
+	ret = sprintf(str, "IRQ for %s: %08x ", ep_name, ep_sts);
+
+	if (ep_sts & EP_STS_SETUP)
+		ret += sprintf(str + ret, "SETUP ");
+	if (ep_sts & EP_STS_IOC)
+		ret += sprintf(str + ret, "IOC ");
+	if (ep_sts & EP_STS_ISP)
+		ret += sprintf(str + ret, "ISP ");
+	if (ep_sts & EP_STS_DESCMIS)
+		ret += sprintf(str + ret, "DESCMIS ");
+	if (ep_sts & EP_STS_STREAMR)
+		ret += sprintf(str + ret, "STREAMR ");
+	if (ep_sts & EP_STS_MD_EXIT)
+		ret += sprintf(str + ret, "MD_EXIT ");
+	if (ep_sts & EP_STS_TRBERR)
+		ret += sprintf(str + ret, "TRBERR ");
+	if (ep_sts & EP_STS_NRDY)
+		ret += sprintf(str + ret, "NRDY ");
+	if (ep_sts & EP_STS_PRIME)
+		ret += sprintf(str + ret, "PRIME ");
+	if (ep_sts & EP_STS_SIDERR)
+		ret += sprintf(str + ret, "SIDERRT ");
+	if (ep_sts & EP_STS_OUTSMM)
+		ret += sprintf(str + ret, "OUTSMM ");
+	if (ep_sts & EP_STS_ISOERR)
+		ret += sprintf(str + ret, "ISOERR ");
+	if (ep_sts & EP_STS_IOT)
+		ret += sprintf(str + ret, "IOT ");
+
+	return str;
+}
+
+char *cdns3_decode_epx_irq(struct cdns3_endpoint *priv_ep)
+{
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+
+	return cdns3_decode_ep_irq(readl(&priv_dev->regs->ep_sts),
+				   priv_ep->name);
+}
+
+char *cdns3_decode_ep0_irq(struct cdns3_device *priv_dev, int dir)
+{
+	if (dir)
+		return cdns3_decode_ep_irq(readl(&priv_dev->regs->ep_sts),
+					   "ep0IN");
+	else
+		return cdns3_decode_ep_irq(readl(&priv_dev->regs->ep_sts),
+					   "ep0OUT");
+}
+
+void cdns3_dbg_setup(struct cdns3_device *priv_dev)
+{
+	struct usb_ctrlrequest *setup = priv_dev->setup;
+
+	dev_dbg(&priv_dev->dev,
+		"SETUP BRT: %02x BR: %02x V: %04x I: %04x L: %04x\n",
+		setup->bRequestType,
+		setup->bRequest,
+		le16_to_cpu(setup->wValue),
+		le16_to_cpu(setup->wIndex),
+		le16_to_cpu(setup->wLength));
+}
+
+/**
+ * Debug a transfer ring.
+ *
+ * Prints out all TRBs in the endpoint ring, even those after the Link TRB.
+ *.
+ */
+void cdns3_dbg_ring(struct cdns3_device *priv_dev,
+		    struct cdns3_endpoint *priv_ep)
+{
+	u64 addr = priv_ep->trb_pool_dma;
+	struct cdns3_trb *trb;
+	int i;
+
+	for (i = 0; i < TRBS_PER_SEGMENT; ++i) {
+		trb = &priv_ep->trb_pool[i];
+		dev_dbg(&priv_dev->dev, "@%016llx %08x %08x %08x\n", addr,
+			le32_to_cpu(trb->buffer),
+			le32_to_cpu(trb->length),
+			le32_to_cpu(trb->control));
+		addr += sizeof(*trb);
+	}
+}
+
+void cdns3_dbg_ring_ptrs(struct cdns3_device *priv_dev,
+			 struct cdns3_endpoint *priv_ep)
+{
+	struct cdns3_trb *trb;
+
+	trb = &priv_ep->trb_pool[priv_ep->dequeue];
+	dev_dbg(&priv_dev->dev,
+		"Ring deq index: %d, trb: %p (virt), 0x%llx (dma)\n",
+		priv_ep->dequeue, trb,
+		(unsigned long long)cdns3_trb_virt_to_dma(priv_ep, trb));
+
+	trb = &priv_ep->trb_pool[priv_ep->enqueue];
+	dev_dbg(&priv_dev->dev,
+		"Ring enq index: %d, trb: %p (virt), 0x%llx (dma)\n",
+		priv_ep->enqueue, trb,
+		(unsigned long long)cdns3_trb_virt_to_dma(priv_ep, trb));
+}
+
+void cdns3_dbg_ep_rings(struct cdns3_device *priv_dev,
+			struct cdns3_endpoint *priv_ep)
+{
+	dev_dbg(&priv_dev->dev, "Endpoint ring %s:\n", priv_ep->name);
+
+	cdns3_dbg_ring_ptrs(priv_dev, priv_ep);
+	cdns3_dbg_ring(priv_dev, priv_ep);
+}
diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
index 6f33d98f7684..8807cb02d7b7 100644
--- a/drivers/usb/cdns3/ep0.c
+++ b/drivers/usb/cdns3/ep0.c
@@ -605,12 +605,15 @@ void cdns3_check_ep0_interrupt_proceed(struct cdns3_device *priv_dev, int dir)
 	cdns3_select_ep(priv_dev, 0 | (dir ? USB_DIR_IN : USB_DIR_OUT));
 	ep_sts_reg = readl(&regs->ep_sts);
 
+	dev_dbg(&priv_dev->dev, "%s\n", cdns3_decode_ep0_irq(priv_dev, dir));
+
 	__pending_setup_status_handler(priv_dev);
 
 	if ((ep_sts_reg & EP_STS_SETUP) && dir == 0) {
 		struct usb_ctrlrequest *setup = priv_dev->setup;
 
 		writel(EP_STS_SETUP | EP_STS_IOC | EP_STS_ISP, &regs->ep_sts);
+		cdns3_dbg_setup(priv_dev);
 
 		priv_dev->ep0_data_dir = setup->bRequestType & USB_DIR_IN;
 		cdns3_ep0_setup_phase(priv_dev);
diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 911d9b8c1c8f..97bdb292eaf2 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -122,6 +122,14 @@ void cdns3_select_ep(struct cdns3_device *priv_dev, u32 ep)
 	writel(ep, &priv_dev->regs->ep_sel);
 }
 
+dma_addr_t cdns3_trb_virt_to_dma(struct cdns3_endpoint *priv_ep,
+				 struct cdns3_trb *trb)
+{
+	u32 offset = (char *)trb - (char *)priv_ep->trb_pool;
+
+	return priv_ep->trb_pool_dma + offset;
+}
+
 /**
  * cdns3_allocate_trb_pool - Allocates TRB's pool for selected endpoint
  * @priv_ep:  endpoint object
@@ -438,6 +446,8 @@ int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 		trb->control |= first_pcs;
 
 	priv_req->on_ring = 1;
+
+	cdns3_dbg_ep_rings(priv_dev, priv_ep);
 arm:
 	/* arm transfer on selected endpoint */
 	cdns3_select_ep(priv_ep->cdns3_dev, address);
@@ -547,6 +557,8 @@ static int cdns3_check_ep_interrupt_proceed(struct cdns3_endpoint *priv_ep)
 	cdns3_select_ep(priv_dev, priv_ep->endpoint.address);
 	ep_sts_reg = readl(&regs->ep_sts);
 
+	dev_dbg(&priv_dev->dev, "%s\n", cdns3_decode_epx_irq(priv_ep));
+
 	if (ep_sts_reg & EP_STS_TRBERR)
 		writel(EP_STS_TRBERR, &regs->ep_sts);
 
diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
index db8c6cb9f2a5..db5ab6b6c969 100644
--- a/drivers/usb/cdns3/gadget.h
+++ b/drivers/usb/cdns3/gadget.h
@@ -1089,5 +1089,16 @@ struct usb_request *cdns3_gadget_ep_alloc_request(struct usb_ep *ep,
 void cdns3_gadget_ep_free_request(struct usb_ep *ep,
 				  struct usb_request *request);
 int cdns3_gadget_ep_dequeue(struct usb_ep *ep, struct usb_request *request);
-
+dma_addr_t cdns3_trb_virt_to_dma(struct cdns3_endpoint *priv_ep,
+				 struct cdns3_trb *trb);
+
+char *cdns3_decode_epx_irq(struct cdns3_endpoint *priv_ep);
+char *cdns3_decode_ep0_irq(struct cdns3_device *priv_dev, int dir);
+void cdns3_dbg_ring(struct cdns3_device *priv_dev,
+		    struct cdns3_endpoint *priv_ep);
+void cdns3_dbg_ring_ptrs(struct cdns3_device *priv_dev,
+			 struct cdns3_endpoint *priv_ep);
+void cdns3_dbg_ep_rings(struct cdns3_device *priv_dev,
+			struct cdns3_endpoint *priv_ep);
+void cdns3_dbg_setup(struct cdns3_device *priv_dev);
 #endif /* __LINUX_CDNS3_GADGET */
-- 
2.17.1
