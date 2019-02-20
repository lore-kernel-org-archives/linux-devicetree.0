From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH v4 6/6] usb:cdns3 Fix for stuck packets in on-chip OUT
 buffer.
Date: Wed, 20 Feb 2019 15:17:08 +0200
Message-ID: <e8616274-b0a8-6e59-b6fa-a68fed58bad7@ti.com>
References: <1550173514-23573-1-git-send-email-pawell@cadence.com>
 <1550173514-23573-7-git-send-email-pawell@cadence.com>
 <67da432f-9c95-d644-65b5-dbc5b942d24c@ti.com>
 <BYAPR07MB47091C199971D677DE0FBB84DD7D0@BYAPR07MB4709.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR07MB47091C199971D677DE0FBB84DD7D0@BYAPR07MB4709.namprd07.prod.outlook.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Pawel Laszczak <pawell@cadence.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>, "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>, "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Pawel,

On 20/02/2019 13:18, Pawel Laszczak wrote:
> Hi Roger.
>>
>> On 14/02/2019 21:45, Pawel Laszczak wrote:
>>> Controller for OUT endpoints has shared on-chip buffers for all incoming
>>> packets, including ep0out. It's FIFO buffer, so packets must be handle
>>> by DMA in correct order. If the first packet in the buffer will not be
>>> handled, then the following packets directed for other endpoints and
>>> functions will be blocked.
>>>
>>> Additionally the packets directed to one endpoint can block entire on-chip
>>> buffers. In this case transfer to other endpoints also will blocked.
>>>
>>> To resolve this issue after raising the descriptor missing interrupt
>>> driver prepares internal usb_request object and use it to arm DMA
>>> transfer.
>>>
>>> The problematic situation was observed in case when endpoint has
>>> been enabled but no usb_request were queued. Driver try detects
>>> such endpoints and will use this workaround only for these endpoint.
>>>
>>> Driver use limited number of buffer. This number can be set by macro
>>> CDNS_WA2_NUM_BUFFERS.
>>>
>>> Such blocking situation was observed on ACM gadget. For this function
>>> host send OUT data packet but ACM function is not prepared for
>>> this packet. It's cause that buffer placed in on chip memory block
>>> transfer to other endpoints.
>>>
>>> It's limitation of controller but maybe this issues should be fixed in
>>> function driver.
>>>
>>> This work around can be disabled/enabled by means of quirk_internal_buffer
>>> module parameter. By default feature is enabled. It can has impact to
>>> transfer performance and in most case this feature can be disabled.
>>
>> How much is the performance impact?
> 
> I didn't check this, but performance will be decreased because driver has to 
> copy data from internally allocated buffer to usb_request->buff.
> 
>> You mentioned that the issue was observed only in the ACM case and
>> could be fixed in the function driver?
>> It seems pointless to enable an endpoint and not have any requests queued for it.
> 
> Yes, it’s true. The request in ACM class is send to Controller Driver when user read file associated 
> with ACM gadget. Problem exist because host send data to controller but USB controller 
> has not prepared buffer for this data by ACM class.
> 
>> Isn't fixing the ACM driver (if there is a real issue) a better approach than having
>> a workaround that affects performance of all other use cases?
> 
> Yes it should be better. But what ACM driver should do with unexpected data. I'm not sure if we 
> can simply delete them. 
> 
> The best solution would be to make modification in controller. In such case Controller shouldn't accept 
> packet but should send NAK. 

Yes, that should be standard behaviour. No?

>  
> One more thing. Workaround has implemented algorithm that decide for which endpoint it should be enabled.
> e.g for composite device MSC+NCM+ACM it should work only for ACM OUT endpoint.
> 

If ACM driver didn't queue the request for ACM OUT endpoint, why does the controller accept the data at all?
I didn't understand why we need a workaround for this. It should be standard behaviour to NAK data if
function driver didn't request for all endpoints.

Also I didn't understand why performance should be impacted to just NAK data.

cheers,
-roger

> Cheers,
> Pawel
>>
>>>
>>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>>> ---
>>>  drivers/usb/cdns3/gadget.c | 273 ++++++++++++++++++++++++++++++++++++-
>>>  drivers/usb/cdns3/gadget.h |   7 +
>>>  2 files changed, 278 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
>>> index 7f7f24ee3c4b..5dfbe6e1421c 100644
>>> --- a/drivers/usb/cdns3/gadget.c
>>> +++ b/drivers/usb/cdns3/gadget.c
>>> @@ -27,6 +27,37 @@
>>>   * If (((Dequeue Ptr (i.e. EP_TRADDR) == Enqueue Ptr-1) or
>>>   *	(Dequeue Ptr (i.e. EP_TRADDR) == Enqueue Ptr))
>>>   *		and (DRBL==1 and (not EP0)))
>>> + *
>>> + * Work around 2:
>>> + * Controller for OUT endpoints has shared on-chip buffers for all incoming
>>> + * packets, including ep0out. It's FIFO buffer, so packets must be handle by DMA
>>> + * in correct order. If the first packet in the buffer will not be handled,
>>> + * then the following packets directed for other endpoints and  functions
>>> + * will be blocked.
>>> + * Additionally the packets directed to one endpoint can block entire on-chip
>>> + * buffers. In this case transfer to other endpoints also will blocked.
>>> + *
>>> + * To resolve this issue after raising the descriptor missing interrupt
>>> + * driver prepares internal usb_request object and use it to arm DMA transfer.
>>> + *
>>> + * The problematic situation was observed in case when endpoint has been enabled
>>> + * but no usb_request were queued. Driver try detects such endpoints and will
>>> + * use this workaround only for these endpoint.
>>> + *
>>> + * Driver use limited number of buffer. This number can be set by macro
>>> + * CDNS_WA2_NUM_BUFFERS.
>>> + *
>>> + * Such blocking situation was observed on ACM gadget. For this function
>>> + * host send OUT data packet but ACM function is not prepared for this packet.
>>> + * It's cause that buffer placed in on chip memory block transfer to other
>>> + * endpoints.
>>> + *
>>> + * It's limitation of controller but maybe this issues should be fixed in
>>> + * function driver.
>>> + *
>>> + * This work around can be disabled/enabled by means of quirk_internal_buffer
>>> + * module parameter. By default feature is enabled. It can has impact to
>>> + * transfer performance and in most case this feature can be disabled.
>>>   */
>>>
>>>  #include <linux/dma-mapping.h>
>>> @@ -42,6 +73,14 @@ static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
>>>  				   struct usb_request *request,
>>>  				   gfp_t gfp_flags);
>>>
>>> +/*
>>> + * Parameter allows to disable/enable handling of work around 2 feature.
>>> + * By default this value is enabled.
>>> + */
>>> +static bool quirk_internal_buffer = 1;
>>> +module_param(quirk_internal_buffer, bool, 0644);
>>> +MODULE_PARM_DESC(quirk_internal_buffer, "Disable/enable WA2 algorithm");
>>> +
>>>  /**
>>>   * cdns3_handshake - spin reading  until handshake completes or fails
>>>   * @ptr: address of device controller register to be read
>>> @@ -105,6 +144,17 @@ struct usb_request *cdns3_next_request(struct list_head *list)
>>>  	return list_first_entry_or_null(list, struct usb_request, list);
>>>  }
>>>
>>> +/**
>>> + * cdns3_next_priv_request - returns next request from list
>>> + * @list: list containing requests
>>> + *
>>> + * Returns request or NULL if no requests in list
>>> + */
>>> +struct cdns3_request *cdns3_next_priv_request(struct list_head *list)
>>> +{
>>> +	return list_first_entry_or_null(list, struct cdns3_request, list);
>>> +}
>>> +
>>>  /**
>>>   * select_ep - selects endpoint
>>>   * @priv_dev:  extended gadget object
>>> @@ -384,6 +434,53 @@ static int cdns3_start_all_request(struct cdns3_device *priv_dev,
>>>  	return ret;
>>>  }
>>>
>>> +/**
>>> + * cdns3_descmiss_copy_data copy data from internal requests to request queued
>>> + * by class driver.
>>> + * @priv_ep: extended endpoint object
>>> + * @request: request object
>>> + */
>>> +static void cdns3_descmiss_copy_data(struct cdns3_endpoint *priv_ep,
>>> +				     struct usb_request *request)
>>> +{
>>> +	struct usb_request *descmiss_req;
>>> +	struct cdns3_request *descmiss_priv_req;
>>> +
>>> +	while (!list_empty(&priv_ep->descmiss_req_list)) {
>>> +		int chunk_end;
>>> +		int length;
>>> +
>>> +		descmiss_priv_req =
>>> +			cdns3_next_priv_request(&priv_ep->descmiss_req_list);
>>> +		descmiss_req = &descmiss_priv_req->request;
>>> +
>>> +		/* driver can't touch pending request */
>>> +		if (descmiss_priv_req->flags & REQUEST_PENDING)
>>> +			break;
>>> +
>>> +		chunk_end = descmiss_priv_req->flags & REQUEST_INTERNAL_CH;
>>> +		length = request->actual + descmiss_req->actual;
>>> +
>>> +		if (length <= request->length) {
>>> +			memcpy(&((u8 *)request->buf)[request->actual],
>>> +			       descmiss_req->buf,
>>> +			       descmiss_req->actual);
>>> +			request->actual = length;
>>> +		} else {
>>> +			/* It should never occures */
>>> +			request->status = -ENOMEM;
>>> +		}
>>> +
>>> +		list_del_init(&descmiss_priv_req->list);
>>> +
>>> +		kfree(descmiss_req->buf);
>>> +		cdns3_gadget_ep_free_request(&priv_ep->endpoint, descmiss_req);
>>> +
>>> +		if (!chunk_end)
>>> +			break;
>>> +	}
>>> +}
>>> +
>>>  /**
>>>   * cdns3_gadget_giveback - call struct usb_request's ->complete callback
>>>   * @priv_ep: The endpoint to whom the request belongs to
>>> @@ -412,6 +509,32 @@ void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
>>>  	priv_req->flags &= ~REQUEST_PENDING;
>>>  	trace_cdns3_gadget_giveback(priv_req);
>>>
>>> +	/* WA2: */
>>> +	if (priv_ep->flags & EP_QUIRK_EXTRA_BUF_EN &&
>>> +	    priv_req->flags & REQUEST_INTERNAL) {
>>> +		struct usb_request *req;
>>> +
>>> +		req = cdns3_next_request(&priv_ep->deferred_req_list);
>>> +		request = req;
>>> +		priv_ep->descmis_req = NULL;
>>> +
>>> +		if (!req)
>>> +			return;
>>> +
>>> +		cdns3_descmiss_copy_data(priv_ep, req);
>>> +		if (!(priv_ep->flags & EP_QUIRK_END_TRANSFER) &&
>>> +		    req->length != req->actual) {
>>> +			/* wait for next part of transfer */
>>> +			return;
>>> +		}
>>> +
>>> +		if (req->status == -EINPROGRESS)
>>> +			req->status = 0;
>>> +
>>> +		list_del_init(&req->list);
>>> +		cdns3_start_all_request(priv_dev, priv_ep);
>>> +	}
>>> +
>>>  	/* Start all not pending request */
>>>  	if (priv_ep->flags & EP_RING_FULL)
>>>  		cdns3_start_all_request(priv_dev, priv_ep);
>>> @@ -774,6 +897,59 @@ void cdns3_rearm_transfer(struct cdns3_endpoint *priv_ep, u8 rearm)
>>>  	}
>>>  }
>>>
>>> +/**
>>> + * cdns3_descmissing_packet - handles descriptor missing event.
>>> + * @priv_dev: extended gadget object
>>> + *
>>> + * This function is used only for WA2. For more information see Work around 2
>>> + * description.
>>> + */
>>> +static int cdns3_descmissing_packet(struct cdns3_endpoint *priv_ep)
>>> +{
>>> +	struct cdns3_request *priv_req;
>>> +	struct usb_request *request;
>>> +
>>> +	if (priv_ep->flags & EP_QUIRK_EXTRA_BUF_DET) {
>>> +		priv_ep->flags &= ~EP_QUIRK_EXTRA_BUF_DET;
>>> +		priv_ep->flags |= EP_QUIRK_EXTRA_BUF_EN;
>>> +	}
>>> +
>>> +	cdns3_dbg(priv_ep->cdns3_dev, "WA2: Description Missing detected\n");
>>> +
>>> +	request = cdns3_gadget_ep_alloc_request(&priv_ep->endpoint,
>>> +						GFP_ATOMIC);
>>> +	if (!request)
>>> +		return -ENOMEM;
>>> +
>>> +	priv_req = to_cdns3_request(request);
>>> +	priv_req->flags |= REQUEST_INTERNAL;
>>> +
>>> +	/* if this field is still assigned it indicate that transfer related
>>> +	 * with this request has not been finished yet. Driver in this
>>> +	 * case simply allocate next request and assign flag REQUEST_INTERNAL_CH
>>> +	 * flag to previous one. It will indicate that current request is
>>> +	 * part of the previous one.
>>> +	 */
>>> +	if (priv_ep->descmis_req)
>>> +		priv_ep->descmis_req->flags |= REQUEST_INTERNAL_CH;
>>> +
>>> +	priv_req->request.buf = kzalloc(CDNS3_DESCMIS_BUF_SIZE,
>>> +					GFP_ATOMIC);
>>> +	if (!priv_req) {
>>> +		cdns3_gadget_ep_free_request(&priv_ep->endpoint, request);
>>> +		return -ENOMEM;
>>> +	}
>>> +
>>> +	priv_req->request.length = CDNS3_DESCMIS_BUF_SIZE;
>>> +	priv_ep->descmis_req = priv_req;
>>> +
>>> +	__cdns3_gadget_ep_queue(&priv_ep->endpoint,
>>> +				&priv_ep->descmis_req->request,
>>> +				GFP_ATOMIC);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>>  /**
>>>   * cdns3_check_ep_interrupt_proceed - Processes interrupt related to endpoint
>>>   * @priv_ep: endpoint object
>>> @@ -807,8 +983,31 @@ static int cdns3_check_ep_interrupt_proceed(struct cdns3_endpoint *priv_ep)
>>>  			cdns3_rearm_transfer(priv_ep, priv_ep->wa1_set);
>>>  	}
>>>
>>> -	if ((ep_sts_reg & EP_STS_IOC) || (ep_sts_reg & EP_STS_ISP))
>>> +	if ((ep_sts_reg & EP_STS_IOC) || (ep_sts_reg & EP_STS_ISP)) {
>>> +		if (priv_ep->flags & EP_QUIRK_EXTRA_BUF_EN) {
>>> +			if (ep_sts_reg & EP_STS_ISP)
>>> +				priv_ep->flags |= EP_QUIRK_END_TRANSFER;
>>> +			else
>>> +				priv_ep->flags &= ~EP_QUIRK_END_TRANSFER;
>>> +		}
>>> +
>>>  		cdns3_transfer_completed(priv_dev, priv_ep);
>>> +	}
>>> +
>>> +	/*
>>> +	 * WA2: this condition should only be meet when
>>> +	 * priv_ep->flags & EP_QUIRK_EXTRA_BUF_DET or
>>> +	 * priv_ep->flags & EP_QUIRK_EXTRA_BUF_EN.
>>> +	 * In other cases this interrupt will be disabled/
>>> +	 */
>>> +	if (ep_sts_reg & EP_STS_DESCMIS) {
>>> +		int err;
>>> +
>>> +		err = cdns3_descmissing_packet(priv_ep);
>>> +		if (err)
>>> +			dev_err(priv_dev->dev,
>>> +				"Failed: No sufficient memory for DESCMIS\n");
>>> +	}
>>>
>>>  	return 0;
>>>  }
>>> @@ -1241,13 +1440,26 @@ static int cdns3_gadget_ep_enable(struct usb_ep *ep,
>>>  	/* enable interrupt for selected endpoint */
>>>  	cdns3_set_register_bit(&priv_dev->regs->ep_ien,
>>>  			       BIT(cdns3_ep_addr_to_index(bEndpointAddress)));
>>> +	/*
>>> +	 * WA2: Set flag for all not ISOC OUT endpoints. If this flag is set
>>> +	 * driver try to detect whether endpoint need additional internal
>>> +	 * buffer for unblocking on-chip FIFO buffer. This flag will be cleared
>>> +	 * if before first DESCMISS interrupt the DMA will be armed.
>>> +	 */
>>> +	if (quirk_internal_buffer) {
>>> +		if (!priv_ep->dir && priv_ep->type != USB_ENDPOINT_XFER_ISOC) {
>>> +			priv_ep->flags |= EP_QUIRK_EXTRA_BUF_DET;
>>> +			reg |= EP_STS_EN_DESCMISEN;
>>> +		}
>>> +	}
>>>
>>>  	writel(reg, &priv_dev->regs->ep_sts_en);
>>>
>>>  	cdns3_set_register_bit(&priv_dev->regs->ep_cfg, EP_CFG_ENABLE);
>>>
>>>  	ep->desc = desc;
>>> -	priv_ep->flags &= ~(EP_PENDING_REQUEST | EP_STALL);
>>> +	priv_ep->flags &= ~(EP_PENDING_REQUEST | EP_STALL |
>>> +			    EP_QUIRK_EXTRA_BUF_EN);
>>>  	priv_ep->flags |= EP_ENABLED | EP_UPDATE_EP_TRBADDR;
>>>  	priv_ep->wa1_set = 0;
>>>  	priv_ep->enqueue = 0;
>>> @@ -1272,6 +1484,7 @@ static int cdns3_gadget_ep_enable(struct usb_ep *ep,
>>>  static int cdns3_gadget_ep_disable(struct usb_ep *ep)
>>>  {
>>>  	struct cdns3_endpoint *priv_ep;
>>> +	struct cdns3_request *priv_req;
>>>  	struct cdns3_device *priv_dev;
>>>  	struct usb_request *request;
>>>  	unsigned long flags;
>>> @@ -1308,6 +1521,14 @@ static int cdns3_gadget_ep_disable(struct usb_ep *ep)
>>>  				      -ESHUTDOWN);
>>>  	}
>>>
>>> +	while (!list_empty(&priv_ep->descmiss_req_list)) {
>>> +		priv_req = cdns3_next_priv_request(&priv_ep->descmiss_req_list);
>>> +
>>> +		kfree(priv_req->request.buf);
>>> +		cdns3_gadget_ep_free_request(&priv_ep->endpoint,
>>> +					     &priv_req->request);
>>> +	}
>>> +
>>>  	while (!list_empty(&priv_ep->deferred_req_list)) {
>>>  		request = cdns3_next_request(&priv_ep->deferred_req_list);
>>>
>>> @@ -1348,6 +1569,53 @@ static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
>>>  	priv_req = to_cdns3_request(request);
>>>  	trace_cdns3_ep_queue(priv_req);
>>>
>>> +	/*
>>> +	 * WA2: if transfer was queued before DESCMISS appear than we
>>> +	 * can disable handling of DESCMISS interrupt. Driver assumes that it
>>> +	 * can disable special treatment for this endpoint.
>>> +	 */
>>> +	if (priv_ep->flags & EP_QUIRK_EXTRA_BUF_DET) {
>>> +		u32 reg;
>>> +
>>> +		cdns3_select_ep(priv_dev, priv_ep->num | priv_ep->dir);
>>> +		priv_ep->flags &= ~EP_QUIRK_EXTRA_BUF_DET;
>>> +		reg = readl(&priv_dev->regs->ep_sts_en);
>>> +		reg &= ~EP_STS_EN_DESCMISEN;
>>> +		writel(reg, &priv_dev->regs->ep_sts_en);
>>> +	}
>>> +
>>> +	/* WA2 */
>>> +	if (priv_ep->flags & EP_QUIRK_EXTRA_BUF_EN) {
>>> +		u8 pending_empty = list_empty(&priv_ep->pending_req_list);
>>> +		u8 descmiss_empty = list_empty(&priv_ep->descmiss_req_list);
>>> +
>>> +		/*
>>> +		 *  DESCMISS transfer has been finished, so data will be
>>> +		 *  directly copied from internal allocated usb_request
>>> +		 *  objects.
>>> +		 */
>>> +		if (pending_empty && !descmiss_empty &&
>>> +		    !(priv_req->flags & REQUEST_INTERNAL)) {
>>> +			cdns3_descmiss_copy_data(priv_ep, request);
>>> +			list_add_tail(&request->list,
>>> +				      &priv_ep->pending_req_list);
>>> +			cdns3_gadget_giveback(priv_ep, priv_req,
>>> +					      request->status);
>>> +			return ret;
>>> +		}
>>> +
>>> +		/*
>>> +		 * WA2 driver will wait for completion DESCMISS transfer,
>>> +		 * before starts new, not DESCMISS transfer.
>>> +		 */
>>> +		if (!pending_empty && !descmiss_empty)
>>> +			deferred = 1;
>>> +
>>> +		if (priv_req->flags & REQUEST_INTERNAL)
>>> +			list_add_tail(&priv_req->list,
>>> +				      &priv_ep->descmiss_req_list);
>>> +	}
>>> +
>>>  	ret = usb_gadget_map_request_by_dev(priv_dev->sysdev, request,
>>>  					    usb_endpoint_dir_in(ep->desc));
>>>  	if (ret)
>>> @@ -1782,6 +2050,7 @@ static int cdns3_init_eps(struct cdns3_device *priv_dev)
>>>
>>>  		INIT_LIST_HEAD(&priv_ep->pending_req_list);
>>>  		INIT_LIST_HEAD(&priv_ep->deferred_req_list);
>>> +		INIT_LIST_HEAD(&priv_ep->descmiss_req_list);
>>>  	}
>>>
>>>  	return 0;
>>> diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
>>> index 817f8ae7a4da..8de733b315e9 100644
>>> --- a/drivers/usb/cdns3/gadget.h
>>> +++ b/drivers/usb/cdns3/gadget.h
>>> @@ -1000,6 +1000,7 @@ struct cdns3_device;
>>>   * @endpoint: usb endpoint
>>>   * @pending_req_list: list of requests queuing on transfer ring.
>>>   * @deferred_req_list: list of requests waiting for queuing on transfer ring.
>>> + * @descmiss_req_list: list of requests internally allocated by driver (WA2).
>>>   * @trb_pool: transfer ring - array of transaction buffers
>>>   * @trb_pool_dma: dma address of transfer ring
>>>   * @cdns3_dev: device associated with this endpoint
>>> @@ -1026,6 +1027,7 @@ struct cdns3_endpoint {
>>>  	struct usb_ep		endpoint;
>>>  	struct list_head	pending_req_list;
>>>  	struct list_head	deferred_req_list;
>>> +	struct list_head	descmiss_req_list;
>>>
>>>  	struct cdns3_trb	*trb_pool;
>>>  	dma_addr_t		trb_pool_dma;
>>> @@ -1041,6 +1043,9 @@ struct cdns3_endpoint {
>>>  #define EP_PENDING_REQUEST	BIT(5)
>>>  #define EP_RING_FULL		BIT(6)
>>>  #define EP_CLAIMED		BIT(7)
>>> +#define EP_QUIRK_EXTRA_BUF_DET	BIT(8)
>>> +#define EP_QUIRK_EXTRA_BUF_EN	BIT(9)
>>> +#define EP_QUIRK_END_TRANSFER	BIT(10)
>>>
>>>  	u32			flags;
>>>
>>> @@ -1074,6 +1079,7 @@ struct cdns3_endpoint {
>>>   * @start_trb: number of the first TRB in transfer ring
>>>   * @end_trb: number of the last TRB in transfer ring
>>>   * @flags: flag specifying special usage of request
>>> + * @list: used by internally allocated request to add to descmiss_req_list.
>>>   */
>>>  struct cdns3_request {
>>>  	struct usb_request	request;
>>> @@ -1086,6 +1092,7 @@ struct cdns3_request {
>>>  #define REQUEST_INTERNAL_CH	BIT(2)
>>>  #define REQUEST_ZLP		BIT(3)
>>>  	u32			flags;
>>> +	struct list_head	list;
>>>  };
>>>
>>>  #define to_cdns3_request(r) (container_of(r, struct cdns3_request, request))
>>>
>>
>> --
>> Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>> Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
