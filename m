From: Pawel Laszczak <pawell@cadence.com>
Subject: [RFC PATCH v2 13/15] usb:cdns3: Adds transfer related function.
Date: Sun, 18 Nov 2018 10:09:09 +0000
Message-ID: <1542535751-16079-14-git-send-email-pawell@cadence.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542535751-16079-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, adouglas@cadence.com, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, pjez@cadence.com, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

Patch implements a set of function handling transfer on none-default
endpoints. For handling transfer controller use cdns3_trb structure.
Each transfer request block (TRB) contains data buffer address,
length and some control bits. Each transfer can consist of many trbs.
Such group of trbs is called transfer descriptors (TD).
Each endpoint has own array of trbs that make up a transfer ring.
The last element on ring is reserved and is set as Link TRB that
point to the first TRB.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/cdns3/gadget.c | 235 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 233 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index 0202ff5f6c90..911d9b8c1c8f 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -239,6 +239,45 @@ void cdns3_gadget_unconfig(struct cdns3_device *priv_dev)
 	priv_dev->out_mem_is_allocated = 0;
 }
 
+/**
+ * cdns3_ep_inc_trb - increment a trb index.
+ * @index: Pointer to the TRB index to increment.
+ * @cs: Cycle state
+ *
+ * The index should never point to the link TRB. After incrementing,
+ * if it is point to the link TRB, wrap around to the beginning and revert
+ * cycle state bit The
+ * link TRB is always at the last TRB entry.
+ */
+static void cdns3_ep_inc_trb(int *index, u8 *cs)
+{
+	(*index)++;
+	if (*index == (TRBS_PER_SEGMENT - 1)) {
+		*index = 0;
+		*cs ^=  1;
+	}
+}
+
+/**
+ * cdns3_ep_inc_enq - increment endpoint's enqueue pointer
+ * @priv_ep: The endpoint whose enqueue pointer we're incrementing
+ */
+static void cdns3_ep_inc_enq(struct cdns3_endpoint *priv_ep)
+{
+	priv_ep->free_trbs--;
+	cdns3_ep_inc_trb(&priv_ep->enqueue, &priv_ep->pcs);
+}
+
+/**
+ * cdns3_ep_inc_deq - increment endpoint's dequeue pointer
+ * @priv_ep: The endpoint whose dequeue pointer we're incrementing
+ */
+static void cdns3_ep_inc_deq(struct cdns3_endpoint *priv_ep)
+{
+	priv_ep->free_trbs++;
+	cdns3_ep_inc_trb(&priv_ep->dequeue, &priv_ep->ccs);
+}
+
 void cdns3_enable_l1(struct cdns3_device *priv_dev, int enable)
 {
 	if (enable)
@@ -278,7 +317,27 @@ void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
 			   struct cdns3_request *priv_req,
 			   int status)
 {
-	//TODO: Implements this function.
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	struct usb_request *request = &priv_req->request;
+
+	list_del_init(&request->list);
+	if (request->status == -EINPROGRESS)
+		request->status = status;
+
+	usb_gadget_unmap_request_by_dev(priv_dev->sysdev, request,
+					priv_ep->dir);
+
+	priv_req->on_ring = 0;
+
+	if (request->complete) {
+		spin_unlock(&priv_dev->lock);
+		usb_gadget_giveback_request(&priv_ep->endpoint,
+					    request);
+		spin_lock(&priv_dev->lock);
+	}
+
+	if (request->buf == priv_dev->zlp_buf)
+		cdns3_gadget_ep_free_request(&priv_ep->endpoint, request);
 }
 
 /**
@@ -290,13 +349,185 @@ void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
 int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
 			  struct usb_request *request)
 {
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	struct cdns3_request *priv_req;
+	struct cdns3_trb *trb;
+	dma_addr_t trb_dma;
+	int sg_iter = 0;
+	u32 first_pcs;
+	int  num_trb;
+	int address;
+	int pcs;
+
+	if (!request)
+		return -EINVAL;
+
+	num_trb = request->num_sgs ? request->num_sgs : 1;
+
+	if (num_trb > priv_ep->free_trbs)
+		return -EINVAL;
+
+	priv_req = to_cdns3_request(request);
+	address = priv_ep->endpoint.desc->bEndpointAddress;
+
+	if (priv_req->on_ring)
+		goto arm;
+
+	priv_ep->flags |= EP_PENDING_REQUEST;
+	trb_dma = request->dma;
+
+	/* must allocate buffer aligned to 8 */
+	if ((request->dma % ADDR_MODULO_8)) {
+		if (request->length <= CDNS3_UNALIGNED_BUF_SIZE) {
+			memcpy(priv_ep->aligned_buff, request->buf,
+			       request->length);
+			trb_dma = priv_ep->aligned_dma_addr;
+		} else {
+			return -ENOMEM;
+		}
+	}
+
+	trb = priv_ep->trb_pool + priv_ep->enqueue;
+	priv_req->trb = trb;
+	priv_req->start_trb = priv_ep->enqueue;
+
+	//prepare ring
+	if ((priv_ep->enqueue + num_trb)  >= (TRBS_PER_SEGMENT - 1)) {
+		/*updating C bt in  Link TRB before starting DMA*/
+		struct cdns3_trb *link_trb = priv_ep->trb_pool +
+					     (TRBS_PER_SEGMENT - 1);
+		link_trb->control = ((priv_ep->pcs) ? TRB_CYCLE : 0) |
+				    TRB_TYPE(TRB_LINK) | TRB_CHAIN |
+				    TRB_TOGGLE;
+	}
+
+	first_pcs = priv_ep->pcs ? TRB_CYCLE : 0;
+
+	do {
+	/* fill TRB */
+		trb->buffer = TRB_BUFFER(request->num_sgs == 0
+				? trb_dma : request->sg[sg_iter].dma_address);
+
+		trb->length = TRB_BURST_LEN(16) |
+		    TRB_LEN(request->num_sgs == 0 ?
+				request->length : request->sg[sg_iter].length);
+
+		trb->control = TRB_TYPE(TRB_NORMAL);
+		pcs = priv_ep->pcs ? TRB_CYCLE : 0;
+
+		/*
+		 * first trb should be prepared as last to avoid processing
+		 *  transfer to early
+		 */
+		if (sg_iter == request->num_sgs && sg_iter != 0)
+			trb->control |= pcs | TRB_IOC | TRB_ISP;
+		else if (sg_iter != 0)
+			trb->control |= pcs;
+
+		++sg_iter;
+		++trb;
+		cdns3_ep_inc_enq(priv_ep);
+	} while (sg_iter < request->num_sgs);
+
+	trb = priv_req->trb;
+
+	/* give the TD to the consumer*/
+	if (sg_iter == 1)
+		trb->control |= first_pcs | TRB_IOC | TRB_ISP;
+	else
+		trb->control |= first_pcs;
+
+	priv_req->on_ring = 1;
+arm:
+	/* arm transfer on selected endpoint */
+	cdns3_select_ep(priv_ep->cdns3_dev, address);
+
+	/*
+	 * For DMULT mode we can set address to transfer ring only once after
+	 * enabling endpoint.
+	 */
+	if (priv_ep->flags & EP_UPDATE_EP_TRBADDR) {
+		writel(EP_TRADDR_TRADDR(priv_ep->trb_pool_dma),
+		       &priv_dev->regs->ep_traddr);
+		priv_ep->flags &= ~EP_UPDATE_EP_TRBADDR;
+	}
+
+	if (priv_dev->hw_configured_flag) {
+		/*clearing TRBERR before seting DRDY*/
+		writel(EP_STS_TRBERR, &priv_dev->regs->ep_sts);
+		/* memory barrier*/
+		wmb();
+		dev_dbg(&priv_dev->dev, "//Ding Dong %s ep_trbaddr %08x\n",
+			priv_ep->name, readl(&priv_dev->regs->ep_traddr));
+		writel(EP_CMD_DRDY, &priv_dev->regs->ep_cmd);
+	}
+
 	return 0;
 }
 
+static bool cdns3_request_handled(struct cdns3_endpoint *priv_ep,
+				  struct cdns3_request *ss_request)
+{
+	int current_index;
+	struct cdns3_device *priv_dev = priv_ep->cdns3_dev;
+	struct cdns3_trb *trb = ss_request->trb;
+
+	cdns3_select_ep(priv_dev, priv_ep->endpoint.desc->bEndpointAddress);
+	current_index = (readl(&priv_dev->regs->ep_traddr) -
+			 priv_ep->trb_pool_dma) / TRB_SIZE;
+
+	trb = &priv_ep->trb_pool[ss_request->start_trb];
+
+	if ((trb->control  & TRB_CYCLE) != priv_ep->ccs)
+		return false;
+
+	/**
+	 * case where ep_traddr point to last trb in ring (link trb)
+	 * and dequeue pointer already has been changed to first trb
+	 */
+	if ((current_index == (TRBS_PER_SEGMENT - 1)) && !priv_ep->dequeue)
+		return false;
+
+	if (ss_request->start_trb != current_index)
+		return true;
+
+	return false;
+}
+
 static void cdns3_transfer_completed(struct cdns3_device *priv_dev,
 				     struct cdns3_endpoint *priv_ep)
 {
-	//TODO: Implements this function.
+	struct usb_request *request, *request_temp;
+	struct cdns3_request *priv_req;
+	struct cdns3_trb *trb;
+
+	list_for_each_entry_safe(request, request_temp,
+				 &priv_ep->request_list, list) {
+		priv_req = to_cdns3_request(request);
+
+		if (!cdns3_request_handled(priv_ep, priv_req))
+			return;
+
+		if (request->dma % ADDR_MODULO_8 &&
+		    priv_ep->dir == USB_DIR_OUT)
+			memcpy(request->buf, priv_ep->aligned_buff,
+			       request->length);
+
+		trb = priv_ep->trb_pool + priv_ep->dequeue;
+
+		if (trb != priv_req->trb)
+			dev_warn(&priv_dev->dev, "request_trb=0x%p, queue_trb=0x%p\n",
+				 priv_req->trb, trb);
+
+		request->actual = TRB_LEN(le32_to_cpu(trb->length));
+
+		priv_ep->free_trbs++;
+		cdns3_ep_inc_deq(priv_ep);
+
+		cdns3_gadget_giveback(priv_ep, priv_req, 0);
+	}
+
+	priv_ep->flags &= ~EP_PENDING_REQUEST;
 }
 
 /**
-- 
2.17.1
