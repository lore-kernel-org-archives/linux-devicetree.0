From: Pawel Laszczak <pawell@cadence.com>
Subject: RE: [RFC PATCH v2 12/15] usb:cdns3: Adds enumeration related
 function.
Date: Sun, 2 Dec 2018 16:39:52 +0000
Message-ID: <BYAPR07MB470933EB8113360DB8FCF7F5DDAD0@BYAPR07MB4709.namprd07.prod.outlook.com>
References: <1542535751-16079-1-git-send-email-pawell@cadence.com>
 <1542535751-16079-13-git-send-email-pawell@cadence.com>
 <5BFEB92C.9060903@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5BFEB92C.9060903@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Roger Quadros <rogerq@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org

>On 18/11/18 12:09, Pawel Laszczak wrote:
>> Patch implements a set of function related to enumeration process.
>> Some standard requests are handled on controller driver level and
>> other are delegated to gadget core driver.
>> All class requests are delegated to gadget core driver.
>>
>> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
>> ---
>>  drivers/usb/cdns3/ep0.c    | 491 ++++++++++++++++++++++++++++++++++++-
>>  drivers/usb/cdns3/gadget.c | 119 +++++++++
>>  drivers/usb/cdns3/gadget.h |   4 +
>>  3 files changed, 610 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/usb/cdns3/ep0.c b/drivers/usb/cdns3/ep0.c
>> index eb92fd234bd7..6f33d98f7684 100644
>> --- a/drivers/usb/cdns3/ep0.c
>> +++ b/drivers/usb/cdns3/ep0.c
>> @@ -10,6 +10,7 @@
>>   *	    Peter Chen <peter.chen@nxp.com>
>>   */
>>
>> +#include <linux/usb/composite.h>
>>  #include "gadget.h"
>>
>>  static struct usb_endpoint_descriptor cdns3_gadget_ep0_desc =3D {
>> @@ -52,9 +53,31 @@ static void cdns3_ep0_run_transfer(struct cdns3_devic=
e *priv_dev,
>>  		writel(EP_CMD_ERDY, &priv_dev->regs->ep_cmd);
>>  }
>>
>> +/**
>> + * cdns3_ep0_delegate_req - Returns status of handling setup packet
>> + * Setup is handled by gadget driver
>> + * @priv_dev: extended gadget object
>> + * @ctrl_req: pointer to received setup packet
>> + *
>> + * Returns zero on success or negative value on failure
>> + */
>> +static int cdns3_ep0_delegate_req(struct cdns3_device *priv_dev,
>> +				  struct usb_ctrlrequest *ctrl_req)
>> +{
>> +	int ret;
>> +
>> +	spin_unlock(&priv_dev->lock);
>> +	priv_dev->setup_pending =3D 1;
>> +	ret =3D priv_dev->gadget_driver->setup(&priv_dev->gadget, ctrl_req);
>> +	priv_dev->setup_pending =3D 0;
>
>Why is setup_pending flag being set and cleared?

This flag is checking during handling DESCMISS interrupt. If this flag is s=
et=20
then driver not start DMA for SETUP packet waiting in on-chip buffer.
>
>> +	spin_lock(&priv_dev->lock);
>> +	return ret;
>> +}
>> +
>>  static void cdns3_prepare_setup_packet(struct cdns3_device *priv_dev)
>>  {
>> -	//TODO: Implements this function
>> +	priv_dev->ep0_data_dir =3D 0;
>> +	cdns3_ep0_run_transfer(priv_dev, priv_dev->setup_dma, 8, 0);
>
>why hardcode to 8?
>Don't vendor specific requests have different lengths?

SETUP packet always has 8 bytes.=20
I will change this to sizeof(struct struct usb_ctrlrequest). It says more.
>
>>  }
>>
>>  static void cdns3_set_hw_configuration(struct cdns3_device *priv_dev)
>> @@ -90,9 +113,431 @@ static void cdns3_set_hw_configuration(struct cdns3=
_device *priv_dev)
>>  	}
>>  }
>>
>> +/**
>> + * cdns3_req_ep0_set_configuration - Handling of SET_CONFIG standard US=
B request
>> + * @priv_dev: extended gadget object
>> + * @ctrl_req: pointer to received setup packet
>> + *
>> + * Returns 0 if success, 0x7FFF on deferred status stage, error code on=
 error
>
>what is this magic number 0x7fff?

We will have USB_GADGET_DELAYED_STATUS instead 0x7FFF;
>
>> + */
>> +static int cdns3_req_ep0_set_configuration(struct cdns3_device *priv_de=
v,
>> +					   struct usb_ctrlrequest *ctrl_req)
>> +{
>> +	enum usb_device_state device_state =3D priv_dev->gadget.state;
>> +	struct cdns3_endpoint *priv_ep, *temp_ep;
>> +	u32 config =3D le16_to_cpu(ctrl_req->wValue);
>> +	int result =3D 0;
>> +
>> +	switch (device_state) {
>> +	case USB_STATE_ADDRESS:
>> +		/* Configure non-control EPs */
>> +		list_for_each_entry_safe(priv_ep, temp_ep,
>> +					 &priv_dev->ep_match_list,
>> +					 ep_match_pending_list)
>> +			cdns3_ep_config(priv_ep);
>
>Why configure here? They should be configured at ep_enable. no?
>And you don't need to maintain a ep_match/pending_list.

It's a little tricky.=20
We need to configure all endpoint on SET_CONFIGURATION request.=20
After reset we can set only once CFGSET bit in usb_conf register.
We don't need to enable endpoint, but we need set all other parameters.  =20
Not all endpoints are enabled before SET_CONFIGURATION, but
most of them, or even all are claimed during loading function by means=20
of usb_ep_autoconfig.=20

After setting CFGSET bit we can't change configuration of any endpoint.=20
We can only enable or disable them.=20
>> +
>> +		result =3D cdns3_ep0_delegate_req(priv_dev, ctrl_req);
>> +
>> +		if (result)
>> +			return result;
>> +
>> +		if (config) {
>
>What if result is USB_GADGET_DELAYED_STATUS?
It's handled be cdns3_ep0_setup_phase when this function return USB_GADGET_=
DELAYED_STATUS

>
>> +			cdns3_set_hw_configuration(priv_dev);
>
>usb_gadget_set_state(USB_STATE_CONFIGURED) ?
It is set in set_config in composite driver.
I think that it is sufficient.=20
>
>> +		} else {
>> +			cdns3_gadget_unconfig(priv_dev);
>> +			usb_gadget_set_state(&priv_dev->gadget,
>> +					     USB_STATE_ADDRESS);
>> +		}
>> +		break;
>> +	case USB_STATE_CONFIGURED:
>> +		result =3D cdns3_ep0_delegate_req(priv_dev, ctrl_req);
>> +
>> +		if (!config && !result) {
>> +			cdns3_gadget_unconfig(priv_dev);
>> +			usb_gadget_set_state(&priv_dev->gadget,
>> +					     USB_STATE_ADDRESS);
>> +		}
>> +		break;
>> +	default:
>> +		result =3D -EINVAL;
>> +	}
>> +
>> +	return result;
>> +}
>> +
>> +/**
>> + * cdns3_req_ep0_set_address - Handling of SET_ADDRESS standard USB req=
uest
>> + * @priv_dev: extended gadget object
>> + * @ctrl_req: pointer to received setup packet
>> + *
>> + * Returns 0 if success, error code on error
>> + */
>> +static int cdns3_req_ep0_set_address(struct cdns3_device *priv_dev,
>> +				     struct usb_ctrlrequest *ctrl_req)
>> +{
>> +	enum usb_device_state device_state =3D priv_dev->gadget.state;
>> +	u32 reg;
>> +	u32 addr;
>> +
>> +	addr =3D le16_to_cpu(ctrl_req->wValue);
>> +
>> +	if (addr > DEVICE_ADDRESS_MAX) {
>
>If DEVICE_ADDRESS_MAX comes from USB spec it must be in ch9.h.
>Maybe add something like
>
>#define	USB_DEVICE_MAX_ADDRESS	127
>
Yes, it should, but I didn't see such macro definition in ch9.h.
I will add change this to USB_DEVICE_MAX_ADDRESS.=20

>> +		dev_err(&priv_dev->dev,
>> +			"Device address (%d) cannot be greater than %d\n",
>> +			addr, DEVICE_ADDRESS_MAX);
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (device_state =3D=3D USB_STATE_CONFIGURED) {
>> +		dev_err(&priv_dev->dev, "USB device already configured\n");
>
>Message is misleading. How about "can't set_address from configured state"
>
Sounds better.=20
>> +		return -EINVAL;
>> +	}
>> +
>> +	reg =3D readl(&priv_dev->regs->usb_cmd);
>> +
>> +	writel(reg | USB_CMD_FADDR(addr) | USB_CMD_SET_ADDR,
>> +	       &priv_dev->regs->usb_cmd);
>> +
>> +	usb_gadget_set_state(&priv_dev->gadget,
>> +			     (addr ? USB_STATE_ADDRESS : USB_STATE_DEFAULT));
>> +
>> +	cdns3_prepare_setup_packet(priv_dev);
>
>why call this here? This should be done after the current ep0 request is c=
omplete.

It only arm DMA for next SETUP packet.=20
It's allow to eliminate one extra DESCMISS interrupt. This interrupt is=20
generated when packet is in on-chip buffer and DMA is not started.=20

Additionally, all OUT endpoints have common shared FIFO buffer. It's the re=
ason why data from=20
This on-chip buffers should be copied to system memory ASAP. Each delay bef=
ore=20
getting  packet  from this FIFO has impact on performance.

>> +
>> +	writel(EP_CMD_ERDY | EP_CMD_REQ_CMPL, &priv_dev->regs->ep_cmd);
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * cdns3_req_ep0_get_status - Handling of GET_STATUS standard USB reque=
st
>> + * @priv_dev: extended gadget object
>> + * @ctrl_req: pointer to received setup packet
>> + *
>> + * Returns 0 if success, error code on error
>> + */
>> +static int cdns3_req_ep0_get_status(struct cdns3_device *priv_dev,
>> +				    struct usb_ctrlrequest *ctrl)
>> +{
>> +	__le16 *response_pkt;
>> +	u16 usb_status =3D 0;
>> +	u32 recip;
>> +	u32 reg;
>> +
>> +	recip =3D ctrl->bRequestType & USB_RECIP_MASK;
>> +
>> +	switch (recip) {
>> +	case USB_RECIP_DEVICE:
>> +		/* self powered */
>> +		usb_status |=3D priv_dev->gadget.is_selfpowered;
>
>if (prv_devgadget.is_selfpowered)
>	usb_stats |=3D BIT(USB_DEVICE_SELF_POWERED);
>
Ok,
 I don't understand why, but I see such solution in MTU3 driver

In musb it is used in such way:=20
result[0] =3D musb->g.is_selfpowered << USB_DEVICE_SELF_POWERED;

>> +
>> +		if (priv_dev->gadget.speed !=3D USB_SPEED_SUPER)
>
>You should check controller speed directly instead.
>
>> +			break;
>> +
>> +		reg =3D readl(&priv_dev->regs->usb_sts);
>> +
>> +		if (priv_dev->u1_allowed)
>> +			usb_status |=3D BIT(USB_DEV_STAT_U1_ENABLED);
>> +
>> +		if (priv_dev->u2_allowed)
>> +			usb_status |=3D BIT(USB_DEV_STAT_U2_ENABLED);
>> +
>> +		if (priv_dev->wake_up_flag)
>> +			usb_status |=3D BIT(USB_DEVICE_REMOTE_WAKEUP);
>
>Remote wakeup is not SS specific. So needs to go before the SS check.
Yes, sure.
>
>> +		break;
>> +	case USB_RECIP_INTERFACE:
>> +		return cdns3_ep0_delegate_req(priv_dev, ctrl);
>> +	case USB_RECIP_ENDPOINT:
>> +		/* check if endpoint is stalled */
>> +		cdns3_select_ep(priv_dev, ctrl->wIndex);
>> +		if (EP_STS_STALL(readl(&priv_dev->regs->ep_sts)))
>> +			usb_status =3D  BIT(USB_ENDPOINT_HALT);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	response_pkt =3D (__le16 *)priv_dev->setup;
>> +	*response_pkt =3D cpu_to_le16(usb_status);
>> +
>> +	cdns3_ep0_run_transfer(priv_dev, priv_dev->setup_dma,
>> +			       sizeof(*response_pkt), 1);
>> +	return 0;
>> +}
>> +
>> +static int cdns3_ep0_feature_handle_device(struct cdns3_device *priv_de=
v,
>> +					   struct usb_ctrlrequest *ctrl,
>> +					   int set)
>> +{
>> +	enum usb_device_state state;
>> +	enum usb_device_speed speed;
>> +	int ret =3D 0;
>> +	u32 wValue;
>> +	u32 wIndex;
>> +	u16 tmode;
>> +
>> +	wValue =3D le16_to_cpu(ctrl->wValue);
>> +	wIndex =3D le16_to_cpu(ctrl->wIndex);
>> +	state =3D priv_dev->gadget.state;
>> +	speed =3D priv_dev->gadget.speed;
>> +
>> +	switch (ctrl->wValue) {
>> +	case USB_DEVICE_REMOTE_WAKEUP:
>> +		priv_dev->wake_up_flag =3D !!set;
>> +		break;
>> +	case USB_DEVICE_U1_ENABLE:
>> +		if (state !=3D USB_STATE_CONFIGURED || speed !=3D USB_SPEED_SUPER)
>> +			return -EINVAL;
>> +
>> +		priv_dev->u1_allowed =3D !!set;
>> +		break;
>> +	case USB_DEVICE_U2_ENABLE:
>> +		if (state !=3D USB_STATE_CONFIGURED || speed !=3D USB_SPEED_SUPER)
>> +			return -EINVAL;
>> +
>> +		priv_dev->u2_allowed =3D !!set;
>> +		break;
>> +	case USB_DEVICE_LTM_ENABLE:
>> +		ret =3D -EINVAL;
>> +		break;
>> +	case USB_DEVICE_TEST_MODE:
>> +		if (state !=3D USB_STATE_CONFIGURED || speed > USB_SPEED_HIGH)
>> +			return -EINVAL;
>> +
>> +		tmode =3D le16_to_cpu(ctrl->wIndex);
>> +
>> +		if (!set || (tmode & 0xff) !=3D 0)
>> +			return -EINVAL;
>> +
>> +		switch (tmode >> 8) {
>> +		case TEST_J:
>> +		case TEST_K:
>> +		case TEST_SE0_NAK:
>> +		case TEST_PACKET:
>> +			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
>> +					       USB_CMD_STMODE |
>> +					       USB_STS_TMODE_SEL(tmode - 1));
>> +			break;
>> +		default:
>> +			ret =3D -EINVAL;
>> +		}
>> +		break;
>> +	default:
>> +		ret =3D -EINVAL;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int cdns3_ep0_feature_handle_intf(struct cdns3_device *priv_dev,
>> +					 struct usb_ctrlrequest *ctrl,
>> +					 int set)
>> +{
>> +	u32 wValue;
>> +	int ret =3D 0;
>> +
>> +	wValue =3D le16_to_cpu(ctrl->wValue);
>> +
>> +	switch (wValue) {
>> +	case USB_INTRF_FUNC_SUSPEND:
>> +		break;
>> +	default:
>> +		ret =3D -EINVAL;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int cdns3_ep0_feature_handle_endpoint(struct cdns3_device *priv_=
dev,
>> +					     struct usb_ctrlrequest *ctrl,
>> +					     int set)
>> +{
>> +	struct cdns3_endpoint *priv_ep;
>> +	int ret =3D 0;
>> +	u8 index;
>> +
>> +	if (!(ctrl->wIndex &  ~USB_DIR_IN))
>> +		return 0;
>
>Why is this check?

Whether  endpoint in wIndex is different then 0. I use this=20
value in next line and it must be greater than 0. =20
>
>> +
>> +	index =3D cdns3_ep_addr_to_index(ctrl->wIndex);
>> +	priv_ep =3D priv_dev->eps[index];
>> +
>> +	cdns3_select_ep(priv_dev, ctrl->wIndex);
>> +
>> +	if (le16_to_cpu(ctrl->wValue) !=3D USB_ENDPOINT_HALT)
>> +		return -EINVAL;
>
>This check should be done first before you try to decode wIndex.
I understand that you mean that it doesn't make sense doing anything when e=
ndpoint is halted.=20
>
>> +
>> +	if (set) {
>> +		writel(EP_CMD_SSTALL, &priv_dev->regs->ep_cmd);
>> +		priv_ep->flags |=3D EP_STALL;
>> +	} else {
>> +		struct usb_request *request;
>> +
>> +		if (priv_dev->eps[index]->flags & EP_WEDGE) {
>> +			cdns3_select_ep(priv_dev, 0x00);
>> +			return 0;
>> +		}
>> +
>> +		writel(EP_CMD_CSTALL | EP_CMD_EPRST, &priv_dev->regs->ep_cmd);
>> +
>> +		/* wait for EPRST cleared */
>> +		ret =3D cdns3_handshake(&priv_dev->regs->ep_cmd,
>> +				      EP_CMD_EPRST, 0, 100);
>> +		if (ret)
>> +			return -EINVAL;
>> +
>> +		priv_ep->flags &=3D ~EP_STALL;
>> +
>> +		request =3D cdns3_next_request(&priv_ep->request_list);
>> +		if (request)
>> +			cdns3_ep_run_transfer(priv_ep, request);
>> +	}
>> +	return ret;
>> +}
>> +
>> +/**
>> + * cdns3_req_ep0_handle_feature -
>> + * Handling of GET/SET_FEATURE standard USB request
>> + *
>> + * @priv_dev: extended gadget object
>> + * @ctrl_req: pointer to received setup packet
>> + * @set: must be set to 1 for SET_FEATURE request
>> + *
>> + * Returns 0 if success, error code on error
>> + */
>> +static int cdns3_req_ep0_handle_feature(struct cdns3_device *priv_dev,
>> +					struct usb_ctrlrequest *ctrl,
>> +					int set)
>> +{
>> +	int ret =3D 0;
>> +	u32 recip;
>> +
>> +	recip =3D ctrl->bRequestType & USB_RECIP_MASK;
>> +
>> +	switch (recip) {
>> +	case USB_RECIP_DEVICE:
>> +		ret =3D cdns3_ep0_feature_handle_device(priv_dev, ctrl, set);
>> +		break;
>> +	case USB_RECIP_INTERFACE:
>> +		ret =3D cdns3_ep0_feature_handle_intf(priv_dev, ctrl, set);
>> +		break;
>> +	case USB_RECIP_ENDPOINT:
>> +		ret =3D cdns3_ep0_feature_handle_endpoint(priv_dev, ctrl, set);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (!ret)
>> +		writel(EP_CMD_ERDY | EP_CMD_REQ_CMPL, &priv_dev->regs->ep_cmd);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * cdns3_req_ep0_set_sel - Handling of SET_SEL standard USB request
>> + * @priv_dev: extended gadget object
>> + * @ctrl_req: pointer to received setup packet
>> + *
>> + * Returns 0 if success, error code on error
>> + */
>> +static int cdns3_req_ep0_set_sel(struct cdns3_device *priv_dev,
>> +				 struct usb_ctrlrequest *ctrl_req)
>> +{
>> +	if (priv_dev->gadget.state < USB_STATE_ADDRESS)
>> +		return -EINVAL;
>> +
>> +	if (ctrl_req->wLength !=3D 6) {
>> +		dev_err(&priv_dev->dev, "Set SEL should be 6 bytes, got %d\n",
>> +			ctrl_req->wLength);
>> +		return -EINVAL;
>> +	}
>> +
>> +	priv_dev->ep0_data_dir =3D 0;
>> +	cdns3_ep0_run_transfer(priv_dev, priv_dev->setup_dma, 6, 1);
>> +	return 0;
>> +}
>> +
>> +/**
>> + * cdns3_req_ep0_set_isoch_delay -
>> + * Handling of GET_ISOCH_DELAY standard USB request
>> + * @priv_dev: extended gadget object
>> + * @ctrl_req: pointer to received setup packet
>> + *
>> + * Returns 0 if success, error code on error
>> + */
>> +static int cdns3_req_ep0_set_isoch_delay(struct cdns3_device *priv_dev,
>> +					 struct usb_ctrlrequest *ctrl_req)
>> +{
>> +	if (ctrl_req->wIndex || ctrl_req->wLength)
>> +		return -EINVAL;
>> +
>> +	priv_dev->isoch_delay =3D ctrl_req->wValue;
>> +	writel(EP_CMD_ERDY | EP_CMD_REQ_CMPL, &priv_dev->regs->ep_cmd);
>> +	return 0;
>> +}
>> +
>> +/**
>> + * cdns3_ep0_standard_request - Handling standard USB requests
>> + * @priv_dev: extended gadget object
>> + * @ctrl_req: pointer to received setup packet
>> + *
>> + * Returns 0 if success, error code on error
>> + */
>> +static int cdns3_ep0_standard_request(struct cdns3_device *priv_dev,
>> +				      struct usb_ctrlrequest *ctrl_req)
>> +{
>> +	int ret;
>> +
>> +	switch (ctrl_req->bRequest) {
>> +	case USB_REQ_SET_ADDRESS:
>> +		ret =3D cdns3_req_ep0_set_address(priv_dev, ctrl_req);
>> +		break;
>> +	case USB_REQ_SET_CONFIGURATION:
>> +		ret =3D cdns3_req_ep0_set_configuration(priv_dev, ctrl_req);
>> +		break;
>> +	case USB_REQ_GET_STATUS:
>> +		ret =3D cdns3_req_ep0_get_status(priv_dev, ctrl_req);
>> +		break;
>> +	case USB_REQ_CLEAR_FEATURE:
>> +		ret =3D cdns3_req_ep0_handle_feature(priv_dev, ctrl_req, 0);
>> +		break;
>> +	case USB_REQ_SET_FEATURE:
>> +		ret =3D cdns3_req_ep0_handle_feature(priv_dev, ctrl_req, 1);
>> +		break;
>> +	case USB_REQ_SET_SEL:
>> +		ret =3D cdns3_req_ep0_set_sel(priv_dev, ctrl_req);
>> +		break;
>> +	case USB_REQ_SET_ISOCH_DELAY:
>> +		ret =3D cdns3_req_ep0_set_isoch_delay(priv_dev, ctrl_req);
>> +		break;
>> +	default:
>> +		ret =3D cdns3_ep0_delegate_req(priv_dev, ctrl_req);
>> +		break;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>  static void __pending_setup_status_handler(struct cdns3_device *priv_de=
v)
>>  {
>> -	//TODO: Implements this function
>> +	struct usb_request *request =3D priv_dev->pending_status_request;
>> +
>> +	if (priv_dev->status_completion_no_call && request &&
>> +	    request->complete) {
>> +		request->complete(priv_dev->gadget.ep0, request);
>> +		priv_dev->status_completion_no_call =3D 0;
>> +	}
>> +}
>> +
>> +void cdns3_pending_setup_status_handler(struct work_struct *work)
>> +{
>> +	struct cdns3_device *priv_dev =3D container_of(work, struct cdns3_devi=
ce,
>> +			pending_status_wq);
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>> +	__pending_setup_status_handler(priv_dev);
>> +	spin_unlock_irqrestore(&priv_dev->lock, flags);
>>  }
>>
>>  /**
>> @@ -101,12 +546,50 @@ static void __pending_setup_status_handler(struct =
cdns3_device *priv_dev)
>>   */
>>  static void cdns3_ep0_setup_phase(struct cdns3_device *priv_dev)
>>  {
>> -	//TODO: Implements this function.
>> +	struct usb_ctrlrequest *ctrl =3D priv_dev->setup;
>> +	int result;
>> +
>> +	if ((ctrl->bRequestType & USB_TYPE_MASK) =3D=3D USB_TYPE_STANDARD)
>> +		result =3D cdns3_ep0_standard_request(priv_dev, ctrl);
>> +	else
>> +		result =3D cdns3_ep0_delegate_req(priv_dev, ctrl);
>> +
>> +	if (result !=3D 0 && result !=3D USB_GADGET_DELAYED_STATUS) {
>> +		dev_dbg(&priv_dev->dev, "STALL for ep0\n");
>> +		/* set_stall on ep0 */
>> +		cdns3_select_ep(priv_dev, 0x00);
>> +		writel(EP_CMD_SSTALL, &priv_dev->regs->ep_cmd);
>> +		writel(EP_CMD_ERDY | EP_CMD_REQ_CMPL, &priv_dev->regs->ep_cmd);
>> +	}
>>  }
>>
>>  static void cdns3_transfer_completed(struct cdns3_device *priv_dev)
>>  {
>> -	//TODO: Implements this function
>> +	if (priv_dev->ep0_request) {
>> +		usb_gadget_unmap_request_by_dev(priv_dev->sysdev,
>> +						priv_dev->ep0_request,
>> +						priv_dev->ep0_data_dir);
>> +
>> +		priv_dev->ep0_request->actual =3D
>> +			TRB_LEN(le32_to_cpu(priv_dev->trb_ep0->length));
>> +
>> +		dev_dbg(&priv_dev->dev, "Ep0 completion length %d\n",
>> +			priv_dev->ep0_request->actual);
>> +		list_del_init(&priv_dev->ep0_request->list);
>> +	}
>> +
>> +	if (priv_dev->ep0_request &&
>> +	    priv_dev->ep0_request->complete) {
>> +		spin_unlock(&priv_dev->lock);
>> +		priv_dev->ep0_request->complete(priv_dev->gadget.ep0,
>> +						priv_dev->ep0_request);
>> +
>> +		priv_dev->ep0_request =3D NULL;
>> +		spin_lock(&priv_dev->lock);
>> +	}
>> +
>> +	cdns3_prepare_setup_packet(priv_dev);
>> +	writel(EP_CMD_REQ_CMPL, &priv_dev->regs->ep_cmd);
>>  }
>>
>>  /**
>> diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
>> index 309202474e57..0202ff5f6c90 100644
>> --- a/drivers/usb/cdns3/gadget.c
>> +++ b/drivers/usb/cdns3/gadget.c
>> @@ -70,6 +70,30 @@ static u8 cdns3_ep_reg_pos_to_index(int i)
>>  	return ((i / 16) + (((i % 16) - 2) * 2));
>>  }
>>
>> +/**
>> + * cdns3_ep_addr_to_index - Macro converts endpoint address to
>> + * index of endpoint object in cdns3_device.eps[] container
>> + * @ep_addr: endpoint address for which endpoint object is required
>> + *
>> + * Remember that endpoint container doesn't contain default endpoint
>> + */
>> +u8 cdns3_ep_addr_to_index(u8 ep_addr)
>> +{
>> +	return (((ep_addr & 0x7F) - 1) + ((ep_addr & USB_DIR_IN) ? 1 : 0));
>> +}
>> +
>> +/**
>> + * cdns3_ep_addr_to_bit_pos - Macro converts endpoint address to
>> + * bit position in ep_ists register
>> + * @ep_addr: endpoint address for which bit position is required
>> + *
>> + * Remember that endpoint container doesn't contain default endpoint
>> + */
>> +static u32 cdns3_ep_addr_to_bit_pos(u8 ep_addr)
>> +{
>> +	return (1 << (ep_addr & 0x7F)) << ((ep_addr & 0x80) ? 16 : 0);
>> +}
>> +
>>  /**
>>   * cdns3_next_request - returns next request from list
>>   * @list: list containing requests
>> @@ -464,6 +488,99 @@ static irqreturn_t cdns3_irq_handler_thread(struct =
cdns3 *cdns)
>>  	return ret;
>>  }
>>
>> +/**
>> + * cdns3_ep_onchip_buffer_alloc - Try to allocate onchip buf for EP
>> + *
>> + * The real allocation will occur during write to EP_CFG register,
>> + * this function is used to check if the 'size' allocation is allowed.
>> + *
>> + * @priv_dev: extended gadget object
>> + * @size: the size (KB) for EP would like to allocate
>> + * @is_in: the direction for EP
>> + *
>> + * Return 0 if the later allocation is allowed or negative value on fai=
lure
>> + */
>> +static int cdns3_ep_onchip_buffer_alloc(struct cdns3_device *priv_dev,
>> +					int size, int is_in)
>> +{
>> +	if (is_in) {
>> +		priv_dev->onchip_mem_allocated_size +=3D size;
>> +	} else if (!priv_dev->out_mem_is_allocated) {
>> +		 /* ALL OUT EPs are shared the same chunk onchip memory */
>> +		priv_dev->onchip_mem_allocated_size +=3D size;
>> +		priv_dev->out_mem_is_allocated =3D 1;
>> +	}
>> +
>> +	if (priv_dev->onchip_mem_allocated_size > CDNS3_ONCHIP_BUF_SIZE) {
>> +		priv_dev->onchip_mem_allocated_size -=3D size;
>> +		return -EPERM;
>> +	} else {
>> +		return 0;
>> +	}
>> +}
>> +
>> +/**
>> + * cdns3_ep_config Configure hardware endpoint
>> + * @priv_ep: extended endpoint object
>> + */
>> +void cdns3_ep_config(struct cdns3_endpoint *priv_ep)
>> +{
>> +	bool is_iso_ep =3D (priv_ep->type =3D=3D USB_ENDPOINT_XFER_ISOC);
>> +	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
>> +	u32 bEndpointAddress =3D priv_ep->num | priv_ep->dir;
>> +	u32 interrupt_mask =3D EP_STS_EN_TRBERREN;
>> +	u32 max_packet_size =3D 0;
>> +	u32 ep_cfg =3D 0;
>> +	int ret;
>> +
>> +	if (priv_ep->type =3D=3D USB_ENDPOINT_XFER_INT) {
>> +		ep_cfg =3D EP_CFG_EPTYPE(USB_ENDPOINT_XFER_INT);
>> +	} else if (priv_ep->type =3D=3D USB_ENDPOINT_XFER_BULK) {
>> +		ep_cfg =3D EP_CFG_EPTYPE(USB_ENDPOINT_XFER_BULK);
>> +	} else {
>> +		ep_cfg =3D EP_CFG_EPTYPE(USB_ENDPOINT_XFER_ISOC);
>> +		interrupt_mask =3D 0xFFFFFFFF;
>> +	}
>> +
>> +	switch (priv_dev->gadget.speed) {
>> +	case USB_SPEED_FULL:
>> +		max_packet_size =3D is_iso_ep ? 1023 : 64;
>> +		break;
>> +	case USB_SPEED_HIGH:
>> +		max_packet_size =3D is_iso_ep ? 1024 : 512;
>> +		break;
>> +	case USB_SPEED_SUPER:
>> +		max_packet_size =3D 1024;
>> +		break;
>> +	default:
>> +		//all other speed are not supported
>> +		return;
>> +	}
>> +
>> +	ret =3D cdns3_ep_onchip_buffer_alloc(priv_dev, CDNS3_EP_BUF_SIZE,
>> +					   priv_ep->dir);
>
>where do you free the buffer_alloc?
I don't free this buffer.=20
This function was added by Peter Chan, and it refer to on-chip buffer.=20
Peter in his platform has limited number of on-chip memory. If I remember=20
correctly It has only 16KB. It's kind of software protection against exceed=
ing this buffer.
It's hard coded now in driver. I think that this value can be read from  re=
gister,=20
I have to consult this with hardware team.

I think the cdns3_ep_onchip_buffer_reserve is a better name.
It is not associated with allocation of memory.=20
>
>> +	if (ret) {
>> +		dev_err(&priv_dev->dev, "onchip mem is full, ep is invalid\n");
>> +		return;
>> +	}
>> +
>> +	ep_cfg |=3D EP_CFG_MAXPKTSIZE(max_packet_size) |
>> +		  EP_CFG_BUFFERING(CDNS3_EP_BUF_SIZE - 1) |
>> +		  EP_CFG_MAXBURST(priv_ep->endpoint.maxburst);
>> +
>> +	cdns3_select_ep(priv_dev, bEndpointAddress);
>> +
>> +	writel(ep_cfg, &priv_dev->regs->ep_cfg);
>> +	writel(interrupt_mask, &priv_dev->regs->ep_sts_en);
>> +
>> +	dev_dbg(&priv_dev->dev, "Configure %s: with val %08x\n",
>> +		priv_ep->name, ep_cfg);
>> +
>> +	/* enable interrupt for selected endpoint */
>> +	cdns3_set_register_bit(&priv_dev->regs->ep_ien,
>> +			       cdns3_ep_addr_to_bit_pos(bEndpointAddress));
>> +}
>> +
>>  /* Find correct direction for HW endpoint according to description */
>>  static int cdns3_ep_dir_is_correct(struct usb_endpoint_descriptor *desc=
,
>>  				   struct cdns3_endpoint *priv_ep)
>> @@ -1104,6 +1221,8 @@ static int __cdns3_gadget_init(struct cdns3 *cdns)
>>  	priv_dev->is_connected =3D 0;
>>
>>  	spin_lock_init(&priv_dev->lock);
>> +	INIT_WORK(&priv_dev->pending_status_wq,
>> +		  cdns3_pending_setup_status_handler);
>>
>>  	priv_dev->in_standby_mode =3D 1;
>>
>> diff --git a/drivers/usb/cdns3/gadget.h b/drivers/usb/cdns3/gadget.h
>> index 8c2f363f9340..db8c6cb9f2a5 100644
>> --- a/drivers/usb/cdns3/gadget.h
>> +++ b/drivers/usb/cdns3/gadget.h
>> @@ -1070,14 +1070,18 @@ struct cdns3_device {
>>
>>  int cdns3_handshake(void __iomem *ptr, u32 mask, u32 done, int usec);
>>  void cdns3_set_register_bit(void __iomem *ptr, u32 mask);
>> +void cdns3_pending_setup_status_handler(struct work_struct *work);
>>  int cdns3_init_ep0(struct cdns3_device *priv_dev);
>>  void cdns3_ep0_config(struct cdns3_device *priv_dev);
>> +void cdns3_ep_config(struct cdns3_endpoint *priv_ep);
>>  void cdns3_check_ep0_interrupt_proceed(struct cdns3_device *priv_dev, i=
nt dir);
>>  void cdns3_select_ep(struct cdns3_device *priv_dev, u32 ep);
>>  void cdns3_enable_l1(struct cdns3_device *priv_dev, int enable);
>>  struct usb_request *cdns3_next_request(struct list_head *list);
>> +void cdns3_gadget_unconfig(struct cdns3_device *priv_dev);
>>  int cdns3_ep_run_transfer(struct cdns3_endpoint *priv_ep,
>>  			  struct usb_request *request);
>> +u8 cdns3_ep_addr_to_index(u8 ep_addr);
>>  int cdns3_gadget_ep_set_wedge(struct usb_ep *ep);
>>  int cdns3_gadget_ep_set_halt(struct usb_ep *ep, int value);
>>  struct usb_request *cdns3_gadget_ep_alloc_request(struct usb_ep *ep,
>>
Cheers=09
Pawel
