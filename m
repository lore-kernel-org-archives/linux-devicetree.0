From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [RFC PATCH v2 09/15] usb:cdns3: EpX operations part of the API
Date: Sat, 1 Dec 2018 13:30:37 +0000
Message-ID: <BYAPR07MB47099386E89C4551D808EFA9DDAC0@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-10-git-send-email-pawell@cadence.com>
 <5BFE8E12.9080307@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5BFE8E12.9080307@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

Hi
>> Patch implements callback functions for non-default endpoints
>> defined in usb_ep_ops object.
>>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> ---
>>  drivers/usb/cdns3/ep0.c    |  18 ++
>>  drivers/usb/cdns3/gadget.c | 442 ++++++++++++++++++++++++++++++++++++-
>>  drivers/usb/cdns3/gadget.h |   3 +
>>  3 files changed, 461 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
>> index c08d02665f9d..ca1795467155 100644
>> --- a/drivers/usb/cdns3/ep0.c
>> +++ b/drivers/usb/cdns3/ep0.c
>> @@ -23,6 +23,24 @@ static void cdns3_prepare_setup_packet(struct cdns3_d=
evice *priv_dev)
>>  	//TODO: Implements this function
>>  }
>>
>> +/**
>> + * cdns3_gadget_ep_set_wedge Set wedge on selected endpoint
>> + * @ep: endpoint object
>> + *
>> + * Returns 0
>> + */
>> +int cdns3_gadget_ep_set_wedge(struct usb_ep *ep)
>> +{
>> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
>> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
>> +
>> +	dev_dbg(&priv_dev->dev, "Wedge for %s\n", ep->name);
>> +	cdns3_gadget_ep_set_halt(ep, 1);
>> +	priv_ep->flags |=3D EP_WEDGE;
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * cdns3_ep0_config - Configures default endpoint
>>   * @priv_dev: extended gadget object
>> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
>> index 702a05faa664..1f2a434486dc 100644
>> --- a/drivers/usb/cdns3/gadget.c
>> +++ b/drivers/usb/cdns3/gadget.c
>> @@ -58,6 +58,19 @@ void cdns3_set_register_bit(void __iomem *ptr, u32 ma=
sk)
>>  	writel(mask, ptr);
>>  }
>>
>> +/**
>> + * cdns3_next_request - returns next request from list
>> + * @list: list containing requests
>> + *
>> + * Returns request or NULL if no requests in list
>> + */
>> +struct usb_request *cdns3_next_request(struct list_head *list)
>> +{
>> +	if (list_empty(list))
>> +		return NULL;
>> +	return list_first_entry(list, struct usb_request, list);
>> +}
>> +
>>  /**
>>   * select_ep - selects endpoint
>>   * @priv_dev:  extended gadget object
>> @@ -73,6 +86,53 @@ void cdns3_select_ep(struct cdns3_device *priv_dev, u=
32 ep)
>>  	writel(ep, &priv_dev->regs->ep_sel);
>>  }
>>
>> +/**
>> + * cdns3_allocate_trb_pool - Allocates TRB's pool for selected endpoint
>> + * @priv_ep:  endpoint object
>> + *
>> + * Function will return 0 on success or -ENOMEM on allocation error
>> + */
>> +static int cdns3_allocate_trb_pool(struct cdns3_endpoint *priv_ep)
>> +{
>> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
>> +	struct cdns3_trb *link_trb;
>> +
>> +	if (!priv_ep->trb_pool) {
>> +		priv_ep->trb_pool =3D dma_zalloc_coherent(priv_dev->sysdev,
>> +							TRB_RIGN_SIZE,
>
>TRB_RING_SIZE
>
>> +							&priv_ep->trb_pool_dma,
>> +							GFP_DMA);
>> +		if (!priv_ep->trb_pool)
>> +			return -ENOMEM;
>> +	} else {
>> +		memset(priv_ep->trb_pool, 0, TRB_RIGN_SIZE);
>
>here too.
>
>> +	}
>> +
>> +	if (!priv_ep->aligned_buff) {
>> +		priv_ep->aligned_buff =3D dma_alloc_coherent(priv_dev->sysdev,
>> +							   CDNS3_UNALIGNED_BUF_SIZE,
>
>CDNS3_ALIGNED_BUF_SIZE
>
>> +							   &priv_ep->aligned_dma_addr,
>> +							   GFP_DMA);
>> +		if (!priv_ep->aligned_buff) {
>> +			dma_free_coherent(priv_dev->sysdev,
>> +					  TRB_RIGN_SIZE,
>> +					  priv_ep->trb_pool,
>> +					  priv_ep->trb_pool_dma);
>> +			priv_ep->trb_pool =3D NULL;
>> +
>> +			return -ENOMEM;
>> +		}
>> +	}
>> +
>> +	/* Initialize the last TRB as Link TRB */
>> +	link_trb =3D (priv_ep->trb_pool + TRBS_PER_SEGMENT - 1);
>> +	link_trb->buffer =3D TRB_BUFFER(priv_ep->trb_pool_dma);
>> +	link_trb->control =3D TRB_CYCLE | TRB_TYPE(TRB_LINK) |
>> +			    TRB_CHAIN | TRB_TOGGLE;
>> +
>> +	return 0;
>> +}
>> +
>>  static void cdns3_free_trb_pool(struct cdns3_endpoint *priv_ep)
>>  {
>>  	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
>> @@ -92,6 +152,73 @@ static void cdns3_free_trb_pool(struct cdns3_endpoin=
t *priv_ep)
>>  	}
>>  }
>>
>> +/**
>> + * cdns3_data_flush - flush data at onchip buffer
>> + * @priv_ep: endpoint object
>> + *
>> + * Endpoint must be selected before call to this function
>> + *
>> + * Returns zero on success or negative value on failure
>> + */
>> +static int cdns3_data_flush(struct cdns3_endpoint *priv_ep)
>> +{
>> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
>> +
>> +	writel(EP_CMD_DFLUSH, &priv_dev->regs->ep_cmd);
>> +
>> +	/* wait for DFLUSH cleared */
>> +	return cdns3_handshake(&priv_dev->regs->ep_cmd, EP_CMD_DFLUSH, 0, 100)=
;
>> +}
>> +
>> +/**
>> + * cdns3_ep_stall_flush - Stalls and flushes selected endpoint
>> + * @priv_ep: endpoint object
>> + *
>> + * Endpoint must be selected before call to this function
>> + */
>> +static void cdns3_ep_stall_flush(struct cdns3_endpoint *priv_ep)
>> +{
>> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
>> +
>> +	writel(EP_CMD_DFLUSH | EP_CMD_ERDY | EP_CMD_SSTALL,
>> +	       &priv_dev->regs->ep_cmd);
>> +
>> +	/* wait for DFLUSH cleared */
>> +	cdns3_handshake(&priv_dev->regs->ep_cmd, EP_CMD_DFLUSH, 0, 100);
>> +	priv_ep->flags |=3D EP_STALL;
>> +}
>> +
>> +/**
>> + * cdns3_gadget_giveback - call struct usb_request's ->complete callbac=
k
>> + * @priv_ep: The endpoint to whom the request belongs to
>> + * @priv_req: The request we're giving back
>> + * @status: completion code for the request
>> + *
>> + * Must be called with controller's lock held and interrupts disabled. =
This
>> + * function will unmap @req and call its ->complete() callback to notif=
y upper
>> + * layers that it has completed.
>> + */
>> +void cdns3_gadget_giveback(struct cdns3_endpoint *priv_ep,
>> +			   struct cdns3_request *priv_req,
>> +			   int status)
>> +{
>> +	//TODO: Implements this function.
>> +}
>> +
>> +/**
>> + * cdns3_ep_run_transfer - start transfer on no-default endpoint hardwa=
re
>> + * @priv_ep: endpoint object
>> + *
>> + * Returns zero on success or negative value on failure
>> + */
>> +int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
>> +			  struct usb_request *request)
>> +{
>> +	//TODO: Implements this function.
>> +
>> +	return 0;
>> +}
>> +
>>  /**
>>   * cdns3_irq_handler - irq line interrupt handler
>>   * @cdns: cdns3 instance
>> @@ -170,6 +297,318 @@ static struct usb_ep *cdns3_gadget_match_ep(struct=
 usb_gadget *gadget,
>>  	return &priv_ep->endpoint;
>>  }
>>
>> +/**
>> + * cdns3_gadget_ep_enable Enable endpoint
>> + * @ep: endpoint object
>> + * @desc: endpoint descriptor
>> + *
>> + * Returns 0 on success, error code elsewhere
>> + */
>> +static int cdns3_gadget_ep_enable(struct usb_ep *ep,
>> +				  const struct usb_endpoint_descriptor *desc)
>> +{
>> +	struct cdns3_endpoint *priv_ep;
>> +	struct cdns3_device *priv_dev;
>> +	unsigned long flags;
>> +	int ret;
>> +	u32 reg;
>> +
>> +	priv_ep =3D ep_to_cdns3_ep(ep);
>> +	priv_dev =3D priv_ep->cdns3_dev;
>> +
>> +	if (!ep || !desc || desc->bDescriptorType !=3D USB_DT_ENDPOINT) {
>> +		dev_err(&priv_dev->dev, "usbss: invalid parameters\n");
>
>dev_dbg()?
>
>Gadget driver will be more verbose.
>
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!desc->wMaxPacketSize) {
>> +		dev_err(&priv_dev->dev, "usbss: missing wMaxPacketSize\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (dev_WARN_ONCE(&priv_dev->dev, priv_ep->flags & EP_ENABLED,
>> +			  "%s is already enabled\n", priv_ep->name))
>> +		return 0;
>> +
>> +	ret =3D cdns3_allocate_trb_pool(priv_ep);
>> +	if (ret)
>> +		return ret;
>
>Why not allocate the TRB pool once for all endpoints at gadget init?
>
>you don't seem to be calling cdns3_allocate_trb_pool() in cdns3_gadget_ep_=
disable().

I allocate memory when endpoint is enabled and free in cdns3_gadget_udc_sto=
p.
Memory is allocated only once and only for endpoint that are used  by funct=
ion.=20
This solution  allows to saves some memory.=20

>> +
>> +	dev_dbg(&priv_dev->dev, "Enabling endpoint: %s\n", ep->name);
>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>> +	cdns3_select_ep(priv_dev, desc->bEndpointAddress);
>> +	writel(EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
>> +
>> +	ret =3D cdns3_handshake(&priv_dev->regs->ep_cmd,
>> +			      EP_CMD_CSTALL | EP_CMD_EPRST, 0, 100);
>> +
>> +	cdns3_set_register_bit(&priv_dev->regs->ep_cfg, EP_CFG_ENABLE);
>> +
>> +	ep->desc =3D desc;
>> +	priv_ep->flags &=3D ~(EP_PENDING_REQUEST | EP_STALL);
>> +	priv_ep->flags |=3D EP_ENABLED | EP_UPDATE_EP_TRBADDR;
>> +	priv_ep->enqueue =3D 0;
>> +	priv_ep->dequeue =3D 0;
>> +	reg =3D readl(&priv_dev->regs->ep_sts);
>> +	priv_ep->pcs =3D !!EP_STS_CCS(reg);
>> +	priv_ep->ccs =3D !!EP_STS_CCS(reg);
>> +	/* one TRB is reserved for link TRB used in DMULT mode*/
>> +	priv_ep->free_trbs =3D TRBS_PER_SEGMENT - 1;
>> +
>> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
>> +	return 0;
>> +}
>> +
>> +/**
>> + * cdns3_gadget_ep_disable Disable endpoint
>> + * @ep: endpoint object
>> + *
>> + * Returns 0 on success, error code elsewhere
>> + */
>> +static int cdns3_gadget_ep_disable(struct usb_ep *ep)
>> +{
>> +	struct cdns3_endpoint *priv_ep;
>> +	struct cdns3_device *priv_dev;
>> +	unsigned long flags;
>> +	int ret =3D 0;
>> +	struct usb_request *request;
>> +	u32 ep_cfg;
>> +
>> +	if (!ep) {
>> +		pr_debug("usbss: invalid parameters\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	priv_ep =3D ep_to_cdns3_ep(ep);
>> +	priv_dev =3D priv_ep->cdns3_dev;
>> +
>> +	if (dev_WARN_ONCE(&priv_dev->dev, !(priv_ep->flags & EP_ENABLED),
>> +			  "%s is already disabled\n", priv_ep->name))
>> +		return 0;
>> +
>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>> +	if (!priv_dev->start_gadget) {
>> +		dev_dbg(&priv_dev->dev,
>> +			"Disabling endpoint at disconnection: %s\n", ep->name);
>
>This flag is looking very tricky.
>What do you mean by "disabling at disconnection"?

start_gadget fag and this  fragment has been removed.

>
>> +		spin_unlock_irqrestore(&priv_dev->lock, flags);
>> +		return 0;
>
>EP is not yet disabled and we're returning 0. This will cause an unbalance=
.
>I'd avoid that flag altogether.
>
>> +	}
>> +
>> +	dev_dbg(&priv_dev->dev, "Disabling endpoint: %s\n", ep->name);
>> +
>> +	cdns3_select_ep(priv_dev, ep->desc->bEndpointAddress);
>> +	ret =3D cdns3_data_flush(priv_ep);
>> +	while (!list_empty(&priv_ep->request_list)) {
>> +		request =3D cdns3_next_request(&priv_ep->request_list);
>> +
>> +		cdns3_gadget_giveback(priv_ep, to_cdns3_request(request),
>> +				      -ESHUTDOWN);
>> +	}
>> +
>> +	ep_cfg =3D readl(&priv_dev->regs->ep_cfg);
>> +	ep_cfg &=3D ~EP_CFG_ENABLE;
>> +	writel(ep_cfg, &priv_dev->regs->ep_cfg);
>> +	ep->desc =3D NULL;
>> +	priv_ep->flags &=3D ~EP_ENABLED;
>> +
>> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * cdns3_gadget_ep_alloc_request Allocates request
>> + * @ep: endpoint object associated with request
>> + * @gfp_flags: gfp flags
>> + *
>> + * Returns allocated request address, NULL on allocation error
>> + */
>> +struct usb_request *cdns3_gadget_ep_alloc_request(struct usb_ep *ep,
>> +						  gfp_t gfp_flags)
>> +{
>> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
>> +	struct cdns3_request *priv_req;
>> +
>> +	priv_req =3D kzalloc(sizeof(*priv_req), gfp_flags);
>> +	if (!priv_req)
>> +		return NULL;
>> +
>> +	priv_req->priv_ep =3D priv_ep;
>> +
>> +	return &priv_req->request;
>> +}
>> +
>> +/**
>> + * cdns3_gadget_ep_free_request Free memory occupied by request
>> + * @ep: endpoint object associated with request
>> + * @request: request to free memory
>> + */
>> +void cdns3_gadget_ep_free_request(struct usb_ep *ep,
>> +				  struct usb_request *request)
>> +{
>> +	struct cdns3_request *priv_req =3D to_cdns3_request(request);
>> +
>> +	kfree(priv_req);
>> +}
>> +
>> +/**
>> + * cdns3_gadget_ep_queue Transfer data on endpoint
>> + * @ep: endpoint object
>> + * @request: request object
>> + * @gfp_flags: gfp flags
>> + *
>> + * Returns 0 on success, error code elsewhere
>> + */
>> +static int __cdns3_gadget_ep_queue(struct usb_ep *ep,
>> +				   struct usb_request *request,
>> +				   gfp_t gfp_flags)
>> +{
>> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
>> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
>> +	int ret =3D 0;
>> +
>> +	request->actual =3D 0;
>> +	request->status =3D -EINPROGRESS;
>> +
>> +	dev_dbg(&priv_dev->dev, "Queuing to endpoint: %s\n", priv_ep->name);
>> +
>> +	ret =3D usb_gadget_map_request_by_dev(priv_dev->sysdev, request,
>> +					    usb_endpoint_dir_in(ep->desc));
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!cdns3_ep_run_transfer(priv_ep, request))
>> +		list_add_tail(&request->list, &priv_ep->request_list);
>
>how about catching the return value if cdns3_ep_run_transfer() fails?

Function has two incorrect situations that can occur. The first one is for =
request equal NULL
and the second is when endpoint hasn't sufficient free TRBs for transfer.
The first condition I will move to cdns3_gadget_ep_queue function.=20

For second case, the good solution is to keep such request in software queu=
e.=20
Driver can send these latter when sufficient number of TRBs will be free in=
 transfer ring.=20
>>=20
>> +	return ret;
>> +}
>> +
>> +static int cdns3_gadget_ep_queue(struct usb_ep *ep, struct usb_request =
*request,
>> +				 gfp_t gfp_flags)
>> +{
>> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
>> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
>> +	struct usb_request *zlp_request;
>> +	unsigned long flags;
>> +	int ret;
>> +
>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>> +	ret =3D __cdns3_gadget_ep_queue(ep, request, gfp_flags);
>> +
>> +	if (ret =3D=3D 0 && request->zero && request->length &&
>> +	    (request->length % ep->maxpacket =3D=3D 0)) {
>> +		zlp_request =3D cdns3_gadget_ep_alloc_request(ep, GFP_ATOMIC);
>> +		zlp_request->buf =3D priv_dev->zlp_buf;
>> +		zlp_request->length =3D 0;
>> +
>> +		dev_dbg(&priv_dev->dev, "Queuing ZLP for endpoint: %s\n",
>> +			priv_ep->name);
>> +		ret =3D __cdns3_gadget_ep_queue(ep, zlp_request, gfp_flags);
>
>Who is going to free this zlp_request?

It's freeing in cdns3_gadget_giveback and it looks like:

	if (request->buf =3D=3D priv_dev->zlp_buf)
		cdns3_gadget_ep_free_request(&priv_ep->endpoint, request);
=20
>
>> +	}
>> +
>> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
>> +	return ret;
>> +}
>> +
>> +/**
>> + * cdns3_gadget_ep_dequeue Remove request from transfer queue
>> + * @ep: endpoint object associated with request
>> + * @request: request object
>> + *
>> + * Returns 0 on success, error code elsewhere
>> + */
>> +int cdns3_gadget_ep_dequeue(struct usb_ep *ep,
>> +			    struct usb_request *request)
>> +{
>> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
>> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
>> +	struct usb_request *req, *req_temp;
>> +	unsigned long flags;
>> +	int ret =3D 0;
>> +
>> +	if (!ep || !request || !ep->desc)
>> +		return -EINVAL;
>> +
>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>> +	dev_dbg(&priv_dev->dev, "Dequeue from %s\n", ep->name);
>> +
>> +	cdns3_select_ep(priv_dev, ep->desc->bEndpointAddress);
>> +	if (priv_dev->start_gadget)
>> +		ret =3D cdns3_data_flush(priv_ep);
>> +
>> +	list_for_each_entry_safe(req, req_temp, &priv_ep->request_list, list) =
{
>> +		if (request =3D=3D req) {
>> +			cdns3_gadget_giveback(priv_ep,
>> +					      to_cdns3_request(request),
>> +					      -ECONNRESET);
>> +			break;
>> +		}
>> +	}
>> +
>> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
>> +	return ret;
>> +}
>> +
>> +/**
>> + * cdns3_gadget_ep_set_halt Sets/clears stall on selected endpoint
>> + * @ep: endpoint object to set/clear stall on
>> + * @value: 1 for set stall, 0 for clear stall
>> + *
>> + * Returns 0 on success, error code elsewhere
>> + */
>> +int cdns3_gadget_ep_set_halt(struct usb_ep *ep, int value)
>> +{
>> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
>> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
>> +	unsigned long flags;
>> +	int ret =3D 0;
>> +
>> +	if (!(priv_ep->flags & EP_ENABLED))
>> +		return -EPERM;
>> +
>> +	/* if actual transfer is pending defer setting stall on this endpoint =
*/
>> +	if ((priv_ep->flags & EP_PENDING_REQUEST) && value) {
>> +		priv_ep->flags |=3D EP_STALL;
>> +		return 0;
>> +	}
>> +
>> +	dev_dbg(&priv_dev->dev, "Halt endpoint %s\n", priv_ep->name);
>> +
>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>
>How about grabbing the lock before checking for priv->ep->flags?
Ok, I will do it.
>
>> +
>> +	cdns3_select_ep(priv_dev, ep->desc->bEndpointAddress);
>> +	if (value) {
>> +		cdns3_ep_stall_flush(priv_ep);
>> +	} else {
>> +		priv_ep->flags &=3D ~EP_WEDGE;
>> +		writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
>> +
>> +		/* wait for EPRST cleared */
>> +		ret =3D cdns3_handshake(&priv_dev->regs->ep_cmd,
>> +				      EP_CMD_EPRST, 0, 100);
>
>if there was an error we shouldn't be clearing the EP_STALL right
>and leave the pending flag?
Yes, I will add such condition, but generally I do not expect such behavior=
.=20
Additionally I will add dev_err().=20
>
>> +		priv_ep->flags &=3D ~EP_STALL;
>> +	}
>> +
>> +	priv_ep->flags &=3D ~EP_PENDING_REQUEST;
>> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
>> +
>> +	return ret;
>> +}
>> +
>> +extern const struct usb_ep_ops cdns3_gadget_ep0_ops;
>> +
>> +static const struct usb_ep_ops cdns3_gadget_ep_ops =3D {
>> +	.enable =3D cdns3_gadget_ep_enable,
>> +	.disable =3D cdns3_gadget_ep_disable,
>> +	.alloc_request =3D cdns3_gadget_ep_alloc_request,
>> +	.free_request =3D cdns3_gadget_ep_free_request,
>> +	.queue =3D cdns3_gadget_ep_queue,
>> +	.dequeue =3D cdns3_gadget_ep_dequeue,
>> +	.set_halt =3D cdns3_gadget_ep_set_halt,
>> +	.set_wedge =3D cdns3_gadget_ep_set_wedge,
>> +};
>> +
>>  /**
>>   * cdns3_gadget_get_frame Returns number of actual ITP frame
>>   * @gadget: gadget object
>> @@ -365,8 +804,7 @@ static int cdns3_init_ep(struct cdns3_device *priv_d=
ev)
>>  		usb_ep_set_maxpacket_limit(&priv_ep->endpoint,
>>  					   ENDPOINT_MAX_PACKET_LIMIT);
>>  		priv_ep->endpoint.max_streams =3D ENDPOINT_MAX_STREAMS;
>> -		//TODO: Add implementation of cdns3_gadget_ep_ops
>> -		//priv_ep->endpoint.ops =3D &cdns3_gadget_ep_ops;
>> +		priv_ep->endpoint.ops =3D &cdns3_gadget_ep_ops;
>>  		if (ep_dir)
>>  			priv_ep->endpoint.caps.dir_in =3D 1;
>>  		else
>> diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
>> index 3b0d4d2e4831..a4be288b34cb 100644
>> --- a/drivers/usb/cdns3/gadget.h
>> +++ b/drivers/usb/cdns3/gadget.h
>> @@ -1072,4 +1072,7 @@ void cdns3_set_register_bit(void __iomem *ptr, u32=
 mask);
>>  int cdns3_init_ep0(struct cdns3_device *priv_dev);
>>  void cdns3_ep0_config(struct cdns3_device *priv_dev);
>>  void cdns3_select_ep(struct cdns3_device *priv_dev, u32 ep);
>> +int cdns3_gadget_ep_set_wedge(struct usb_ep *ep);
>> +int cdns3_gadget_ep_set_halt(struct usb_ep *ep, int value);
>> +
>>  #endif /* __LINUX_CDNS3_GADGET */
>>
Cheers=20
Pawel
