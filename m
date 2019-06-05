From: Pawel Laszczak <pawell@cadence.com>
Subject: [PATCH v7 6/6] usb:cdns3 Fix for stuck packets in on-chip OUT buffer.
Date: Wed, 5 Jun 2019 11:03:50 +0100
Message-ID: <1559729030-16390-7-git-send-email-pawell@cadence.com>
References: <1559729030-16390-1-git-send-email-pawell@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559729030-16390-1-git-send-email-pawell@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: gregkh@linuxfoundation.org, felipe.balbi@linux.intel.com, linux-usb@vger.kernel.org, hdegoede@redhat.com, heikki.krogerus@linux.intel.com, robh+dt@kernel.org, rogerq@ti.com, linux-kernel@vger.kernel.org, jbergsagel@ti.com, nsekhar@ti.com, nm@ti.com, sureshp@cadence.com, peter.chen@nxp.com, jpawar@cadence.com, kurahul@cadence.com, Pawel Laszczak <pawell@cadence.com>
List-Id: devicetree@vger.kernel.org

Controller for OUT endpoints has shared on-chip buffers for all incoming
packets, including ep0out. It's FIFO buffer, so packets must be handled
by DMA in correct order. If the first packet in the buffer will not be
handled, then the following packets directed for other endpoints and
functions will be blocked.

Additionally the packets directed to one endpoint can block entire on-chip
buffers. In this case transfer to other endpoints also will blocked.

To resolve this issue after raising the descriptor missing interrupt
driver prepares internal usb_request object and use it to arm DMA
transfer.

The problematic situation was observed in case when endpoint has
been enabled but no usb_request were queued. Driver try detects
such endpoints and will use this workaround only for these endpoint.

Driver use limited number of buffer. This number can be set by macro
CDNS_WA2_NUM_BUFFERS.

Such blocking situation was observed on ACM gadget. For this function
host send OUT data packet but ACM function is not prepared for
this packet. It's cause that buffer placed in on chip memory block
transfer to other endpoints.

Issue has been fixed for DEV_VER_V2 version of controller.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/cdns3/gadget.c | 330 ++++++++++++++++++++++++++++++++++++-
 drivers/usb/cdns3/gadget.h |  13 ++
 2 files changed, 341 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
index f3b22ec43c0a..30bcf972f848 100644
--- a/drivers/usb/cdns3/gadget.c
+++ b/drivers/usb/cdns3/gadget.c
@@ -28,6 +28,32 @@
  *
  * Issue has been fixed in DEV_VER_V3 version of controller.
  *
+ * Work around 2:
+ * Controller for OUT endpoints has shared on-chip buffers for all incoming
+ * packets, including ep0out. It's FIFO buffer, so packets must be handle by DMA
+ * in correct order. If the first packet in the buffer will not be handled,
+ * then the following packets directed for other endpoints and  functions
+ * will be blocked.
+ * Additionally the packets directed to one endpoint can block entire on-chip
+ * buffers. In this case transfer to other endpoints also will blocked.
+ *
+ * To resolve this issue after raising the descriptor missing interrupt
+ * driver prepares internal usb_request object and use it to arm DMA transfer.
+ *
+ * The problematic situation was observed in case when endpoint has been enabled
+ * but no usb_request were queued. Driver try detects such endpoints and will
+ * use this workaround only for these endpoint.
+ *
+ * Driver use limited number of buffer. This number can be set by macro
+ * CDNS3_WA2_NUM_BUFFERS.
+ *
+ * Such blocking situation was observed on ACM gadget. For this function
+ * host send OUT data packet but ACM function is not prepared for this packet.
+ * It's cause that buffer placed in on chip memory block transfer to other
+ * endpoints.
+ *
+ * Issue has been fixed in DEV_VER_V2 version of controller.
+ *
  */
 
 #include <linux/dma-mapping.h>
@@ -98,6 +124,17 @@ struct cdns3_aligned_buf *cdns3_next_align_buf(struct list_head *list)
 	return list_first_entry_or_null(list, struct cdns3_aligned_buf, list);
 }
 
+/**
+ * cdns3_next_priv_request - returns next request from list
+ * @list: list containing requests
+ *
+ * Returns request or NULL if no requests in list
+ */
+struct cdns3_request *cdns3_next_priv_request(struct list_head *list)
+{
+	return list_first_entry_or_null(list, struct cdns3_request, list);
+}
+
 /**
  * select_ep - selects endpoint
  * @priv_dev:  extended gadget object
@@ -335,6 +372,246 @@ static int cdns3_start_all_request(struct cdns3_device *priv_dev,
 	return ret;
 }
 
+/*
+ * WA2: Set flag for all not ISOC OUT endpoints. If this flag is set
+ * driver try to detect whether endpoint need additional internal
+ * buffer for unblocking on-chip FIFO buffer. This flag will be cleared
+ * if before first DESCMISS interrupt the DMA will be armed.
+ */
+#define cdns3_wa2_enable_detection(priv_dev, ep_priv, reg) do { \
+	if (!priv_ep->dir && priv_ep->type != USB_ENDPOINT_XFER_ISOC) { \
+		priv_ep->flags |= EP_QUIRK_EXTRA_BUF_DET; \
+		(reg) |= EP_STS_EN_DESCMISEN; \
+	} } while (0)
+
+/**
+ * cdns3_wa2_descmiss_copy_data copy data from internal requests to
+ * request queued by class driver.
+ * @priv_ep: extended endpoint object
+ * @request: request object
+ */
+static void cdns3_wa2_descmiss_copy_data(struct cdns3_endpoint *priv_ep,
+					 struct usb_request *request)
+{
+	struct usb_request *descmiss_req;
+	struct cdns3_request *descmiss_priv_req;
+
+	while (!list_empty(&priv_ep->wa2_descmiss_req_list)) {
+		int chunk_end;
+		int length;
+
+		descmiss_priv_req =
+			cdns3_next_priv_request(&priv_ep->wa2_descmiss_req_list);
+		descmiss_req = &descmiss_priv_req->request;
+
+		/* driver can't touch pending request */
+		if (descmiss_priv_req->flags & REQUEST_PENDING)
+			break;
+
+		chunk_end = descmiss_priv_req->flags & REQUEST_INTERNAL_CH;
+		length = request->actual + descmiss_req->actual;
+
+		request->status = descmiss_req->status;
+
+		if (length <= request->length) {
+			memcpy(&((u8 *)request->buf)[request->actual],
+			       descmiss_req->buf,
+			       descmiss_req->actual);
+			request->actual = length;
+		} else {
+			/* It should never occures */
+			request->status = -ENOMEM;
+		}
+
+		list_del_init(&descmiss_priv_req->list);
+
+		kfree(descmiss_req->buf);
+		cdns3_gadget_ep_free_request(&priv_ep->endpoint, descmiss_req);
+		--priv_ep->wa2_counter;
+
+		if (!chunk_end)
+			break;
+	}
+}
+
+struct usb_request *cdns3_wa2_gadget_giveback(struct cdns3_device *priv_dev,
+					      struct cdns3_endpoint *priv_ep,
+					      struct cdns3_request *priv_req)
+{
+	if (priv_ep->flags & EP_QUIRK_EXTRA_BUF_EN &&
+	    priv_req->flags & REQUEST_INTERNAL) {
+		struct usb_request *req;
+
+		req = cdns3_next_request(&priv_ep->deferred_req_list);
+
+		priv_ep->descmis_req = NULL;
+
+		if (!req)
+			return NULL;
+
+		cdns3_wa2_descmiss_copy_data(priv_ep, req);
+		if (!(priv_ep->flags & EP_QUIRK_END_TRANSFER) &&
+		    req->length != req->actual) {
+			/* wait for next part of transfer */
+			return NULL;
+		}
+
+		if (req->status == -EINPROGRESS)
+			req->status = 0;
+
+		list_del_init(&req->list);
+		cdns3_start_all_request(priv_dev, priv_ep);
+		return req;
+	}
+
+	return &priv_req->request;
+}
+
+int cdns3_wa2_gadget_ep_queue(struct cdns3_device *priv_dev,
+			      struct cdns3_endpoint *priv_ep,
+			      struct cdns3_request *priv_req)
+{
+	int deferred = 0;
+
+	/*
+	 * If transfer was queued before DESCMISS appear than we
+	 * can disable handling of DESCMISS interrupt. Driver assumes that it
+	 * can disable special treatment for this endpoint.
+	 */
+	if (priv_ep->flags & EP_QUIRK_EXTRA_BUF_DET) {
+		u32 reg;
+
+		cdns3_select_ep(priv_dev, priv_ep->num | priv_ep->dir);
+		priv_ep->flags &= ~EP_QUIRK_EXTRA_BUF_DET;
+		reg = readl(&priv_dev->regs->ep_sts_en);
+		reg &= ~EP_STS_EN_DESCMISEN;
+		writel(reg, &priv_dev->regs->ep_sts_en);
+	}
+
+	if (priv_ep->flags & EP_QUIRK_EXTRA_BUF_EN) {
+		u8 pending_empty = list_empty(&priv_ep->pending_req_list);
+		u8 descmiss_empty = list_empty(&priv_ep->wa2_descmiss_req_list);
+
+		/*
+		 *  DESCMISS transfer has been finished, so data will be
+		 *  directly copied from internal allocated usb_request
+		 *  objects.
+		 */
+		if (pending_empty && !descmiss_empty &&
+		    !(priv_req->flags & REQUEST_INTERNAL)) {
+			cdns3_wa2_descmiss_copy_data(priv_ep,
+						     &priv_req->request);
+			list_add_tail(&priv_req->request.list,
+				      &priv_ep->pending_req_list);
+			cdns3_gadget_giveback(priv_ep, priv_req,
+					      priv_req->request.status);
+
+			/*
+			 * Intentionally driver returns positive value as
+			 * correct value. It informs that transfer has
+			 * been finished.
+			 */
+			return EINPROGRESS;
+		}
+
+		/*
+		 * Driver will wait for completion DESCMISS transfer,
+		 * before starts new, not DESCMISS transfer.
+		 */
+		if (!pending_empty && !descmiss_empty)
+			deferred = 1;
+
+		if (priv_req->flags & REQUEST_INTERNAL)
+			list_add_tail(&priv_req->list,
+				      &priv_ep->wa2_descmiss_req_list);
+	}
+
+	return deferred;
+}
+
+static void cdsn3_wa2_remove_old_request(struct cdns3_endpoint *priv_ep)
+{
+	struct cdns3_request *priv_req;
+
+	while (!list_empty(&priv_ep->wa2_descmiss_req_list)) {
+		u8 chain;
+
+		priv_req = cdns3_next_priv_request(&priv_ep->wa2_descmiss_req_list);
+		chain = !!(priv_req->flags & REQUEST_INTERNAL_CH);
+
+		kfree(priv_req->request.buf);
+		cdns3_gadget_ep_free_request(&priv_ep->endpoint,
+					     &priv_req->request);
+		list_del_init(&priv_req->list);
+		--priv_ep->wa2_counter;
+
+		if (!chain)
+			break;
+	}
+}
+
+/**
+ * cdns3_wa2_descmissing_packet - handles descriptor missing event.
+ * @priv_dev: extended gadget object
+ *
+ * This function is used only for WA2. For more information see Work around 2
+ * description.
+ */
+static void cdns3_wa2_descmissing_packet(struct cdns3_endpoint *priv_ep)
+{
+	struct cdns3_request *priv_req;
+	struct usb_request *request;
+
+	if (priv_ep->flags & EP_QUIRK_EXTRA_BUF_DET) {
+		priv_ep->flags &= ~EP_QUIRK_EXTRA_BUF_DET;
+		priv_ep->flags |= EP_QUIRK_EXTRA_BUF_EN;
+	}
+
+	cdns3_dbg(priv_ep->cdns3_dev, "WA2: Description Missing detected\n");
+
+	if (priv_ep->wa2_counter >= CDNS3_WA2_NUM_BUFFERS)
+		cdsn3_wa2_remove_old_request(priv_ep);
+
+	request = cdns3_gadget_ep_alloc_request(&priv_ep->endpoint,
+						GFP_ATOMIC);
+	if (!request)
+		goto err;
+
+	priv_req = to_cdns3_request(request);
+	priv_req->flags |= REQUEST_INTERNAL;
+
+	/* if this field is still assigned it indicate that transfer related
+	 * with this request has not been finished yet. Driver in this
+	 * case simply allocate next request and assign flag REQUEST_INTERNAL_CH
+	 * flag to previous one. It will indicate that current request is
+	 * part of the previous one.
+	 */
+	if (priv_ep->descmis_req)
+		priv_ep->descmis_req->flags |= REQUEST_INTERNAL_CH;
+
+	priv_req->request.buf = kzalloc(CDNS3_DESCMIS_BUF_SIZE,
+					GFP_ATOMIC);
+	priv_ep->wa2_counter++;
+
+	if (!priv_req->request.buf) {
+		cdns3_gadget_ep_free_request(&priv_ep->endpoint, request);
+		goto err;
+	}
+
+	priv_req->request.length = CDNS3_DESCMIS_BUF_SIZE;
+	priv_ep->descmis_req = priv_req;
+
+	__cdns3_gadget_ep_queue(&priv_ep->endpoint,
+				&priv_ep->descmis_req->request,
+				GFP_ATOMIC);
+
+	return;
+
+err:
+	dev_err(priv_ep->cdns3_dev->dev,
+		"Failed: No sufficient memory for DESCMIS\n");
+}
+
 /**
  * cdns3_gadget_giveback - call struct usb_request's ->complete callback
  * @priv_ep: The endpoint to whom the request belongs to
@@ -368,6 +645,13 @@ void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
 	priv_req->flags &= ~(REQUEST_PENDING | REQUEST_UNALIGNED);
 	trace_cdns3_gadget_giveback(priv_req);
 
+	if (priv_dev->dev_ver < DEV_VER_V2) {
+		request = cdns3_wa2_gadget_giveback(priv_dev, priv_ep,
+						    priv_req);
+		if (!request)
+			return;
+	}
+
 	if (request->complete) {
 		spin_unlock(&priv_dev->lock);
 		usb_gadget_giveback_request(&priv_ep->endpoint,
@@ -920,8 +1204,25 @@ static int cdns3_check_ep_interrupt_proceed(struct cdns3_endpoint *priv_ep)
 		}
 	}
 
-	if ((ep_sts_reg & EP_STS_IOC) || (ep_sts_reg & EP_STS_ISP))
+	if ((ep_sts_reg & EP_STS_IOC) || (ep_sts_reg & EP_STS_ISP)) {
+		if (priv_ep->flags & EP_QUIRK_EXTRA_BUF_EN) {
+			if (ep_sts_reg & EP_STS_ISP)
+				priv_ep->flags |= EP_QUIRK_END_TRANSFER;
+			else
+				priv_ep->flags &= ~EP_QUIRK_END_TRANSFER;
+		}
+
 		cdns3_transfer_completed(priv_dev, priv_ep);
+	}
+
+	/*
+	 * WA2: this condition should only be meet when
+	 * priv_ep->flags & EP_QUIRK_EXTRA_BUF_DET or
+	 * priv_ep->flags & EP_QUIRK_EXTRA_BUF_EN.
+	 * In other cases this interrupt will be disabled/
+	 */
+	if (ep_sts_reg & EP_STS_DESCMIS && priv_dev->dev_ver < DEV_VER_V2)
+		cdns3_wa2_descmissing_packet(priv_ep);
 
 	return 0;
 }
@@ -1492,6 +1793,9 @@ static int cdns3_gadget_ep_enable(struct usb_ep *ep,
 	cdns3_set_register_bit(&priv_dev->regs->ep_ien,
 			       BIT(cdns3_ep_addr_to_index(bEndpointAddress)));
 
+	if (priv_dev->dev_ver < DEV_VER_V2)
+		cdns3_wa2_enable_detection(priv_dev, priv_ep, reg);
+
 	writel(reg, &priv_dev->regs->ep_sts_en);
 
 	/*
@@ -1510,7 +1814,7 @@ static int cdns3_gadget_ep_enable(struct usb_ep *ep,
 
 	ep->desc = desc;
 	priv_ep->flags &= ~(EP_PENDING_REQUEST | EP_STALL |
-			    EP_QUIRK_ISO_OUT_EN);
+			    EP_QUIRK_ISO_OUT_EN | EP_QUIRK_EXTRA_BUF_EN);
 	priv_ep->flags |= EP_ENABLED | EP_UPDATE_EP_TRBADDR;
 	priv_ep->wa1_set = 0;
 	priv_ep->enqueue = 0;
@@ -1535,6 +1839,7 @@ static int cdns3_gadget_ep_enable(struct usb_ep *ep,
 static int cdns3_gadget_ep_disable(struct usb_ep *ep)
 {
 	struct cdns3_endpoint *priv_ep;
+	struct cdns3_request *priv_req;
 	struct cdns3_device *priv_dev;
 	struct usb_request *request;
 	unsigned long flags;
@@ -1587,6 +1892,16 @@ static int cdns3_gadget_ep_disable(struct usb_ep *ep)
 				      -ESHUTDOWN);
 	}
 
+	while (!list_empty(&priv_ep->wa2_descmiss_req_list)) {
+		priv_req = cdns3_next_priv_request(&priv_ep->wa2_descmiss_req_list);
+
+		kfree(priv_req->request.buf);
+		cdns3_gadget_ep_free_request(&priv_ep->endpoint,
+					     &priv_req->request);
+		list_del_init(&priv_req->list);
+		--priv_ep->wa2_counter;
+	}
+
 	while (!list_empty(&priv_ep->deferred_req_list)) {
 		request = cdns3_next_request(&priv_ep->deferred_req_list);
 
@@ -1594,6 +1909,8 @@ static int cdns3_gadget_ep_disable(struct usb_ep *ep)
 				      -ESHUTDOWN);
 	}
 
+	priv_ep->descmis_req = NULL;
+
 	ep->desc = NULL;
 	priv_ep->flags &= ~EP_ENABLED;
 
@@ -1624,6 +1941,14 @@ static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
 	priv_req = to_cdns3_request(request);
 	trace_cdns3_ep_queue(priv_req);
 
+	if (priv_dev->dev_ver < DEV_VER_V2) {
+		ret = cdns3_wa2_gadget_ep_queue(priv_dev, priv_ep,
+						priv_req);
+
+		if (ret == EINPROGRESS)
+			return 0;
+	}
+
 	ret = cdns3_prepare_aligned_request_buf(priv_req);
 	if (ret < 0)
 		return ret;
@@ -2081,6 +2406,7 @@ static int cdns3_init_eps(struct cdns3_device *priv_dev)
 
 		INIT_LIST_HEAD(&priv_ep->pending_req_list);
 		INIT_LIST_HEAD(&priv_ep->deferred_req_list);
+		INIT_LIST_HEAD(&priv_ep->wa2_descmiss_req_list);
 	}
 
 	return 0;
diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
index bab0cbbe13f4..3f7b3a624a1a 100644
--- a/drivers/usb/cdns3/gadget.h
+++ b/drivers/usb/cdns3/gadget.h
@@ -1072,6 +1072,7 @@ struct cdns3_trb {
 #define CDNS3_EP_ISO_SS_BURST		3
 #define CDNS3_MAX_NUM_DESCMISS_BUF	32
 #define CDNS3_DESCMIS_BUF_SIZE		2048	/* Bytes */
+#define CDNS3_WA2_NUM_BUFFERS		128
 /*-------------------------------------------------------------------------*/
 /* Used structs */
 
@@ -1082,11 +1083,15 @@ struct cdns3_device;
  * @endpoint: usb endpoint
  * @pending_req_list: list of requests queuing on transfer ring.
  * @deferred_req_list: list of requests waiting for queuing on transfer ring.
+ * @wa2_descmiss_req_list: list of requests internally allocated by driver.
  * @trb_pool: transfer ring - array of transaction buffers
  * @trb_pool_dma: dma address of transfer ring
  * @cdns3_dev: device associated with this endpoint
  * @name: a human readable name e.g. ep1out
  * @flags: specify the current state of endpoint
+ * @descmis_req: internal transfer object used for getting data from on-chip
+ *     buffer. It can happen only if function driver doesn't send usb_request
+ *     object on time.
  * @dir: endpoint direction
  * @num: endpoint number (1 - 15)
  * @type: set to bmAttributes & USB_ENDPOINT_XFERTYPE_MASK
@@ -1103,6 +1108,8 @@ struct cdns3_endpoint {
 	struct usb_ep		endpoint;
 	struct list_head	pending_req_list;
 	struct list_head	deferred_req_list;
+	struct list_head	wa2_descmiss_req_list;
+	int			wa2_counter;
 
 	struct cdns3_trb	*trb_pool;
 	dma_addr_t		trb_pool_dma;
@@ -1120,8 +1127,13 @@ struct cdns3_endpoint {
 #define EP_CLAIMED		BIT(7)
 #define EP_DEFERRED_DRDY	BIT(8)
 #define EP_QUIRK_ISO_OUT_EN	BIT(9)
+#define EP_QUIRK_EXTRA_BUF_DET	BIT(10)
+#define EP_QUIRK_EXTRA_BUF_EN	BIT(11)
+#define EP_QUIRK_END_TRANSFER	BIT(12)
 	u32			flags;
 
+	struct cdns3_request	*descmis_req;
+
 	u8			dir;
 	u8			num;
 	u8			type;
@@ -1169,6 +1181,7 @@ struct cdns3_aligned_buf {
  * @aligned_buf: object holds information about aligned buffer associated whit
  *               this endpoint
  * @flags: flag specifying special usage of request
+ * @list: used by internally allocated request to add to wa2_descmiss_req_list.
  */
 struct cdns3_request {
 	struct usb_request		request;
-- 
2.17.1
