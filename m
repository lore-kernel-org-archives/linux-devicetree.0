From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [RFC PATCH v2 10/15] usb:cdns3: Ep0 operations part of the API
Date: Sun, 2 Dec 2018 10:34:54 +0000
Message-ID: <BYAPR07MB47091013A58927991F7E2C1DDDAD0@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-11-git-send-email-pawell@cadence.com>
 <5BFEA6D2.9010906@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5BFEA6D2.9010906@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org


>> Patch implements related to default endpoint callback functions
>> defined in usb_ep_ops object
>>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> ---
>>  drivers/usb/cdns3/ep0.c    | 191 ++++++++++++++++++++++++++++++++++++-
>>  drivers/usb/cdns3/gadget.c |   8 ++
>>  drivers/usb/cdns3/gadget.h |  10 ++
>>  3 files changed, 207 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
>> index ca1795467155..d05169e73631 100644
>> --- a/drivers/usb/cdns3/ep0.c
>> +++ b/drivers/usb/cdns3/ep0.c
>> @@ -18,11 +18,185 @@ static struct usb_endpoint_descriptor cdns3_gadget_=
ep0_desc =3D {
>>  	.bmAttributes =3D	USB_ENDPOINT_XFER_CONTROL,
>>  };
>>
>> +/**
>> + * cdns3_ep0_run_transfer - Do transfer on default endpoint hardware
>> + * @priv_dev: extended gadget object
>> + * @dma_addr: physical address where data is/will be stored
>> + * @length: data length
>> + * @erdy: set it to 1 when ERDY packet should be sent -
>> + *        exit from flow control state
>> + */
>> +static void cdns3_ep0_run_transfer(struct cdns3_device *priv_dev,
>> +				   dma_addr_t dma_addr,
>> +				   unsigned int length, int erdy)
>> +{
>> +	struct cdns3_usb_regs __iomem *regs =3D priv_dev->regs;
>> +
>> +	priv_dev->trb_ep0->buffer =3D TRB_BUFFER(dma_addr);
>> +	priv_dev->trb_ep0->length =3D TRB_LEN(length);
>> +	priv_dev->trb_ep0->control =3D TRB_CYCLE | TRB_IOC | TRB_TYPE(TRB_NORM=
AL);
>> +
>> +	cdns3_select_ep(priv_dev,
>> +			priv_dev->ep0_data_dir ? USB_DIR_IN : USB_DIR_OUT);
>> +
>> +	writel(EP_STS_TRBERR, &regs->ep_sts);
>> +	writel(EP_TRADDR_TRADDR(priv_dev->trb_ep0_dma), &regs->ep_traddr);
>> +
>> +	dev_dbg(&priv_dev->dev, "//Ding Dong ep0%s\n",
>> +		priv_dev->ep0_data_dir ? "IN" : "OUT");
>> +
>> +	/* TRB should be prepared before starting transfer */
>> +	writel(EP_CMD_DRDY, &regs->ep_cmd);
>> +
>> +	if (erdy)
>> +		writel(EP_CMD_ERDY, &priv_dev->regs->ep_cmd);
>> +}
>> +
>>  static void cdns3_prepare_setup_packet(struct cdns3_device *priv_dev)
>>  {
>>  	//TODO: Implements this function
>>  }
>>
>> +static void cdns3_set_hw_configuration(struct cdns3_device *priv_dev)
>
>Is this going to be used only for ep0?
>If yes then let's have ep0 in the name.
>If not then this function should be in gadget.c

It going to be used only in ep0.c file but general it's related to all non-=
control endpoints.=20

The controller has one strange limitation, namely endpoints configuration i=
n controller=20
can be set only once. and this function inform control about this.

II think that, will be better to move this function to gadget.c then adding=
 ep0 to name.
>
>> +{
>> +	struct cdns3_endpoint *priv_ep;
>> +	struct usb_request *request;
>> +	struct usb_ep *ep;
>> +	int result =3D 0;
>> +
>> +	if (priv_dev->hw_configured_flag)
>> +		return;
>> +
>> +	writel(USB_CONF_CFGSET, &priv_dev->regs->usb_conf);
>> +	writel(EP_CMD_ERDY | EP_CMD_REQ_CMPL, &priv_dev->regs->ep_cmd);
>> +
>> +	cdns3_set_register_bit(&priv_dev->regs->usb_conf,
>> +			       USB_CONF_U1EN | USB_CONF_U2EN);
>
>Shouldn't U1/U2 be enabled only if the USB_DEVICE_U1_ENABLE/USB_DEVICE_U2_=
ENABLE
>device request was received?

These bits only inform the controller that it should enter to U1/U2 only if=
 host asks for such a transition.

Device to force transition to U1/U2 must use other bits.=20

>> +
>> +	/* wait until configuration set */
>> +	result =3D cdns3_handshake(&priv_dev->regs->usb_sts,
>> +				 USB_STS_CFGSTS_MASK, 1, 100);
>> +
>> +	priv_dev->hw_configured_flag =3D 1;
>> +	cdns3_enable_l1(priv_dev, 1);
>> +
>> +	list_for_each_entry(ep, &priv_dev->gadget.ep_list, ep_list) {
>> +		if (ep->enabled) {
>> +			priv_ep =3D ep_to_cdns3_ep(ep);
>> +			request =3D cdns3_next_request(&priv_ep->request_list);
>> +			if (request)
>> +				cdns3_ep_run_transfer(priv_ep, request);
>
>why are you starting transfers in a function that is supposed to set hw co=
nfiguration only.

Because we can't start transfer before configuring endpoints in hardware.=20
Also we can't configure each endpoint separately  in cdns3_gadget_ep_enable=
 because=20
USB_CONF_CFGSET can be set only once. It's the reason why transfer are defe=
rred.=20
It is disadvantage of this controller witch causes some problems.=20
>
>> +		}
>> +	}
>> +}
>> +
>> +/**
>> + * cdns3_gadget_ep0_enable
>> + * Function shouldn't be called by gadget driver,
>> + * endpoint 0 is allways active
>> + */
>> +static int cdns3_gadget_ep0_enable(struct usb_ep *ep,
>> +				   const struct usb_endpoint_descriptor *desc)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * cdns3_gadget_ep0_disable
>> + * Function shouldn't be called by gadget driver,
>> + * endpoint 0 is allways active
>> + */
>> +static int cdns3_gadget_ep0_disable(struct usb_ep *ep)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +/**
>> + * cdns3_gadget_ep0_set_halt
>> + * @ep: pointer to endpoint zero object
>> + * @value: 1 for set stall, 0 for clear stall
>> + *
>> + * Returns 0
>> + */
>> +static int cdns3_gadget_ep0_set_halt(struct usb_ep *ep, int value)
>> +{
>> +	/* TODO */
>> +	return 0;
>> +}
>> +
>> +/**
>> + * cdns3_gadget_ep0_queue Transfer data on endpoint zero
>> + * @ep: pointer to endpoint zero object
>> + * @request: pointer to request object
>> + * @gfp_flags: gfp flags
>> + *
>> + * Returns 0 on success, error code elsewhere
>> + */
>> +static int cdns3_gadget_ep0_queue(struct usb_ep *ep,
>> +				  struct usb_request *request,
>> +				  gfp_t gfp_flags)
>> +{
>> +	struct cdns3_endpoint *priv_ep =3D ep_to_cdns3_ep(ep);
>> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
>> +	unsigned long flags;
>> +	int erdy_sent =3D 0;
>> +	int ret =3D 0;
>> +
>> +	dev_dbg(&priv_dev->dev, "Queue to Ep0%s L: %d\n",
>> +		priv_dev->ep0_data_dir ? "IN" : "OUT",
>> +		request->length);
>> +
>> +	/* send STATUS stage */
>> +	if (request->length =3D=3D 0 && request->zero =3D=3D 0) {
>
>Is this check sufficient to know STATUS stage?
>It might be normal for vendor specific control request to have
>request->length =3D 0 and request->zero =3D 0.

It's sufficient. =20
cdns3_gadget_ep0_queue is invoked by gadget driver only for DATA stage=20
or deferred STATUS stage (e.g during SET_CONFIGURATION request).=20
In DATA stage driver shall send a number of date specified in SETUP packet
and it should not be zero.=20
If wLength in SETUP packet is 0 then we don't have DATA stage, only SETUP a=
nd STATUS stage

>
>
>> +		spin_lock_irqsave(&priv_dev->lock, flags);
>> +		cdns3_select_ep(priv_dev, 0x00);
>> +
>> +		erdy_sent =3D !priv_dev->hw_configured_flag;
>> +		cdns3_set_hw_configuration(priv_dev);
>
>What if we're still busy with DATA stage of previous ep0_queue?
>
>if (!list_empty(&priv_ep->request_list)) should be done as the first thing=
 in this function.
>
The SETUP hast to be handled. If the previous one has not been finished the=
n controller
driver must abort the previous one and start handling the new one.
I know, and I can't find code responsible for this behavior.
I will add some protection against such situation.=20

>> +
>> +		if (!erdy_sent)
>> +			writel(EP_CMD_ERDY | EP_CMD_REQ_CMPL,
>> +			       &priv_dev->regs->ep_cmd);
>> +
>> +		cdns3_prepare_setup_packet(priv_dev);
>> +		request->actual =3D 0;
>> +		priv_dev->status_completion_no_call =3D true;
>> +		priv_dev->pending_status_request =3D request;
>> +		spin_unlock_irqrestore(&priv_dev->lock, flags);
>> +
>> +		/*
>> +		 * Since there is no completion interrupt for status stage,
>> +		 * it needs to call ->completion in software after
>> +		 * ep0_queue is back.
>> +		 */
>> +		queue_work(system_freezable_wq, &priv_dev->pending_status_wq);
>> +		return 0;
>> +	}
>> +
>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>> +	if (!list_empty(&priv_ep->request_list)) {
>> +		dev_err(&priv_dev->dev,
>> +			"can't handle multiple requests for ep0\n");
>> +		spin_unlock_irqrestore(&priv_dev->lock, flags);
>> +		return -EOPNOTSUPP;
>
>-EBUSY?
>
>> +	}
>> +
>> +	ret =3D usb_gadget_map_request_by_dev(priv_dev->sysdev, request,
>> +					    priv_dev->ep0_data_dir);
>> +	if (ret) {
>> +		spin_unlock_irqrestore(&priv_dev->lock, flags);
>> +		dev_err(&priv_dev->dev, "failed to map request\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	priv_dev->ep0_request =3D request;
>> +	list_add_tail(&request->list, &priv_ep->request_list);
>> +	cdns3_ep0_run_transfer(priv_dev, request->dma, request->length, 1);
>> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
>> +
>> +	return ret;
>> +}
>> +
>>  /**
>>   * cdns3_gadget_ep_set_wedge Set wedge on selected endpoint
>>   * @ep: endpoint object
>> @@ -41,6 +215,17 @@ int cdns3_gadget_ep_set_wedge(struct usb_ep *ep)
>>  	return 0;
>>  }
>>
>> +const struct usb_ep_ops cdns3_gadget_ep0_ops =3D {
>> +	.enable =3D cdns3_gadget_ep0_enable,
>> +	.disable =3D cdns3_gadget_ep0_disable,
>> +	.alloc_request =3D cdns3_gadget_ep_alloc_request,
>> +	.free_request =3D cdns3_gadget_ep_free_request,
>> +	.queue =3D cdns3_gadget_ep0_queue,
>> +	.dequeue =3D cdns3_gadget_ep_dequeue,
>> +	.set_halt =3D cdns3_gadget_ep0_set_halt,
>> +	.set_wedge =3D cdns3_gadget_ep_set_wedge,
>> +};
>> +
>>  /**
>>   * cdns3_ep0_config - Configures default endpoint
>>   * @priv_dev: extended gadget object
>> @@ -62,6 +247,9 @@ void cdns3_ep0_config(struct cdns3_device *priv_dev)
>>  		priv_dev->ep0_request =3D NULL;
>>  	}
>>
>> +	priv_dev->u1_allowed =3D 0;
>> +	priv_dev->u2_allowed =3D 0;
>> +
>
>where do you set these?

In function cdns3_ep0_feature_handle_device in patch 12.=20
It was stupid  idea to split this driver into series of patches.=20
I thought that it was  required for such big driver.=20
The next will be posted as single patch.=20
>
>>  	priv_dev->gadget.ep0->maxpacket =3D max_packet_size;
>>  	cdns3_gadget_ep0_desc.wMaxPacketSize =3D cpu_to_le16(max_packet_size);
>>
>> @@ -106,8 +294,7 @@ int cdns3_init_ep0(struct cdns3_device *priv_dev)
>>  	sprintf(ep0->name, "ep0");
>>
>>  	/* fill linux fields */
>> -	//TODO: implements cdns3_gadget_ep0_ops object
>> -	//ep0->endpoint.ops =3D &cdns3_gadget_ep0_ops;
>> +	ep0->endpoint.ops =3D &cdns3_gadget_ep0_ops;
>>  	ep0->endpoint.maxburst =3D 1;
>>  	usb_ep_set_maxpacket_limit(&ep0->endpoint, ENDPOINT0_MAX_PACKET_LIMIT)=
;
>>  	ep0->endpoint.address =3D 0;
>> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
>> index 1f2a434486dc..c965da16c0c8 100644
>> --- a/drivers/usb/cdns3/gadget.c
>> +++ b/drivers/usb/cdns3/gadget.c
>> @@ -188,6 +188,14 @@ static void cdns3_ep_stall_flush(struct cdns3_endpo=
int *priv_ep)
>>  	priv_ep->flags |=3D EP_STALL;
>>  }
>>
>
>> +void cdns3_enable_l1(struct cdns3_device *priv_dev, int enable)
>
>Some comment might help as to what L1 is.

I even had to check what it meant.

>From controller specification:=20
"
After receiving Extended Token packet, the USBSS-DEV answers with:
- ACK handshake when accepts transition to the Sleep state (L1 mode is turn=
ed on by setting
L1EN in USB_CONF) or
- NYET handshake when is not ready to make transition to the Sleep state (L=
1 mode is turned
off (default) by setting L1DS in USB_CONF )
- STALL handshake when doesn't recognize requested link state (bLinkState v=
alue). The only
supported bLinkState value is "0001" (Sleep state).
If L1 mode is enabled, then the status bit 'L1ENS' in 'USB_STS' is asserted=
."

So I think that the name of function should look like:=20
cdns3_allow_enable_l1

I will add comment to function and change the name.
>
>> +{
>> +	if (enable)
>> +		writel(USB_CONF_L1EN, &priv_dev->regs->usb_conf);
>> +	else
>> +		writel(USB_CONF_L1DS, &priv_dev->regs->usb_conf);
>> +}
>> +
>>  /**
>>   * cdns3_gadget_giveback - call struct usb_request's ->complete callbac=
k
>>   * @priv_ep: The endpoint to whom the request belongs to
>> diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
>> index a4be288b34cb..224f6b830bc9 100644
>> --- a/drivers/usb/cdns3/gadget.h
>> +++ b/drivers/usb/cdns3/gadget.h
>> @@ -1068,11 +1068,21 @@ struct cdns3_device {
>>  	struct usb_request		*pending_status_request;
>>  };
>>
>> +int cdns3_handshake(void __iomem *ptr, u32 mask, u32 done, int usec);
>>  void cdns3_set_register_bit(void __iomem *ptr, u32 mask);
>>  int cdns3_init_ep0(struct cdns3_device *priv_dev);
>>  void cdns3_ep0_config(struct cdns3_device *priv_dev);
>>  void cdns3_select_ep(struct cdns3_device *priv_dev, u32 ep);
>> +void cdns3_enable_l1(struct cdns3_device *priv_dev, int enable);
>> +struct usb_request *cdns3_next_request(struct list_head *list);
>> +int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
>> +			  struct usb_request *request);
>>  int cdns3_gadget_ep_set_wedge(struct usb_ep *ep);
>>  int cdns3_gadget_ep_set_halt(struct usb_ep *ep, int value);
>> +struct usb_request *cdns3_gadget_ep_alloc_request(struct usb_ep *ep,
>> +						  gfp_t gfp_flags);
>> +void cdns3_gadget_ep_free_request(struct usb_ep *ep,
>> +				  struct usb_request *request);
>> +int cdns3_gadget_ep_dequeue(struct usb_ep *ep, struct usb_request *requ=
est);
>>
>>  #endif /* __LINUX_CDNS3_GADGET */
>>
>
>cheers,
>-roger
>
>--
>Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
>Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
