From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [PATCH v1 2/2] usb:cdns3 Add Cadence USB3 DRD Driver
Date: Fri, 14 Dec 2018 09:16:18 +0530
Message-ID: <d77b4083-6641-4a60-1629-b8edacc36c26@ti.com>
References: <1544445555-17325-1-git-send-email-pawell@cadence.com>
 <1544445555-17325-3-git-send-email-pawell@cadence.com>
 <87h8fkmfar.fsf@linux.intel.com>
 <BYAPR07MB47095110AF28CC11B4C9E144DDA60@BYAPR07MB4709.namprd07.prod.outlook.com>
 <87a7lbme3m.fsf@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87a7lbme3m.fsf@linux.intel.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, Pawel Laszczak <pawell@cadence.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "rogerq@ti.com" <rogerq@ti.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alan Douglas <adouglas@cadence.com>, "jbergsagel@ti.com" <jbergsagel@ti.com>, "nsekhar@ti.com" <nsekhar@ti.com>, "nm@ti.com" <nm@ti.com>, Suresh Punnoose <sureshp@cadence.com>, "peter.chen@nxp.com" <peter.chen@nxp.com>, Pawel Jez <pjez@cadence.com>, Rahul Kumar <kurahul@cadence.com>
List-Id: devicetree@vger.kernel.org



On 12/12/18 12:22 PM, Felipe Balbi wrote:
> 
> Hi
> 
> Pawel Laszczak <pawell@cadence.com> writes:
>>>> +	cdns->phy = devm_phy_get(dev, "cdns3,usbphy");
>>>> +	if (IS_ERR(cdns->phy)) {
>>>> +		ret = PTR_ERR(cdns->phy);
>>>> +		if (ret == -ENOSYS || ret == -ENODEV) {
>>>
>>> Are you sure you can get ENOSYS here? Have you checked output of
>>> checkpatch --strict?
>>> -:852: WARNING: ENOSYS means 'invalid syscall nr' and nothing else
>>
>> Yes this error code can be returned by related to phy function if
>> CONFIG_GENERIC_PHY is disabled.
>>
>> I have seen this warning in output of checkpatch --strict .
> 
> Kishon, seems like you shouldn't be using that error value.

hmm, yeah should change the return value to -ENODEV when GENERIC_PHY is disabled.

Thanks
Kishon
> 
> <snip>
> 
>>>> +	case USB_REQ_SET_ISOCH_DELAY:
>>>> +		sprintf(str, "Set Isochronous Delay Delay: %d ns", wValue);
>>>> +		break;
>>>> +	default:
>>>> +		sprintf(str,
>>>> +			"SETUP BRT: %02x BR: %02x V: %04x I: %04x L: %04x\n",
>>>> +			bRequestType, bRequest,
>>>> +			wValue, wIndex, wLength);
>>>> +	}
>>>> +
>>>> +	return str;
>>>> +}
>>>
>>> All of these are a flat out copy of dwc3's implementation. It's much,
>>> much better to turn dwc3's implementation into a generic, reusable
>>> library function then spinning your own as a duplicated effort.
>> I agree, 
>> It would be nice to have a set of decoding function  in some generic library. It could be used 
>> also by other drivers.
>> Who should do this ?
> 
> since you're the first to reuse it, then it should be you :-)
> 
>>>> +static int cdns3_req_ep0_set_configuration(struct cdns3_device *priv_dev,
>>>> +					   struct usb_ctrlrequest *ctrl_req)
>>>> +{
>>>> +	enum usb_device_state device_state = priv_dev->gadget.state;
>>>> +	struct cdns3_endpoint *priv_ep;
>>>> +	u32 config = le16_to_cpu(ctrl_req->wValue);
>>>> +	int result = 0;
>>>> +	int i;
>>>> +
>>>> +	switch (device_state) {
>>>> +	case USB_STATE_ADDRESS:
>>>> +		/* Configure non-control EPs */
>>>> +		for (i = 0; i < CDNS3_ENDPOINTS_MAX_COUNT; i++) {
>>>> +			priv_ep = priv_dev->eps[i];
>>>> +			if (!priv_ep)
>>>> +				continue;
>>>> +
>>>> +			if (priv_ep->flags & EP_CLAIMED)
>>>> +				cdns3_ep_config(priv_ep);
>>>> +		}
>>>> +
>>>> +		result = cdns3_ep0_delegate_req(priv_dev, ctrl_req);
>>>> +
>>>> +		if (result)
>>>> +			return result;
>>>> +
>>>> +		if (config) {
>>>> +			cdns3_set_hw_configuration(priv_dev);
>>>> +		} else {
>>>> +			cdns3_gadget_unconfig(priv_dev);
>>>> +			usb_gadget_set_state(&priv_dev->gadget,
>>>> +					     USB_STATE_ADDRESS);
>>>
>>> this is wrong. If address is zero, state should be default, not
>>> addressed. Addressed would be used on the other branch here, when you
>>> have a non-zero address
>>
>> If address is zero then state should be USB_STATE_DEFAULT. Driver
>> enters to this branch only if gadget.state = USB_STATE_ADDRESS
>> (address != 0). This state can be changed in composite.c file after
>> delegating request to gadget driver. Because this state could be
>> changed driver simple restore USB_STATE_ADDRESS if config = 0.
> 
> nevermind, I read this as being the handler for Set Address. This is Set
> Config, instead.
> 
>>>> +		}
>>>> +		break;
>>>> +	case USB_STATE_CONFIGURED:
>>>
>>> where do you set this state?
>> It's set in set_config in composite.c file. 
> 
> indeed
> 
>>>> +	case USB_DEVICE_TEST_MODE:
>>>> +		if (state != USB_STATE_CONFIGURED || speed > USB_SPEED_HIGH)
>>>> +			return -EINVAL;
>>>> +
>>>> +		tmode = le16_to_cpu(ctrl->wIndex);
>>>> +
>>>> +		if (!set || (tmode & 0xff) != 0)
>>>> +			return -EINVAL;
>>>> +
>>>> +		switch (tmode >> 8) {
>>>> +		case TEST_J:
>>>> +		case TEST_K:
>>>> +		case TEST_SE0_NAK:
>>>> +		case TEST_PACKET:
>>>> +			cdns3_set_register_bit(&priv_dev->regs->usb_cmd,
>>>> +					       USB_CMD_STMODE |
>>>> +					       USB_STS_TMODE_SEL(tmode - 1));
>>>
>>> I'm 90% sure this won't work. There's a reason why we only enter the
>>> requested test mode from status stage. How have you tested this?
>>
>> From USB spec:
>> "The transition to test mode must be complete no later than 3 ms after the completion of the status stage of the
>> request."
> 
> exactly, _after_ completion of status stage :-)
> 
>> But I don't remember any issues with this test on other ours
>> drivers. Maybe status stage is armed in this case by controller. I
>> have to confirm how it works with hardware team.  Driver doesn't know
>> when status stage was completed. We don't have any event on status
>> stage completion.  I haven't checked it yet with tester on this
>> driver.
> 
> Let's consider the scenario where you're requesting Test_Packet mode. If
> you start transmitting the test pattern from setup stage, how can you
> even transmit status stage?
> 
>>>> +void cdns3_gadget_unconfig(struct cdns3_device *priv_dev)
>>>> +{
>>>> +	/* RESET CONFIGURATION */
>>>> +	writel(USB_CONF_CFGRST, &priv_dev->regs->usb_conf);
>>>> +
>>>> +	cdns3_allow_enable_l1(priv_dev, 0);
>>>> +	priv_dev->hw_configured_flag = 0;
>>>> +	priv_dev->onchip_mem_allocated_size = 0;
>>>
>>> clear all test modes? Reset ep0 max_packet_size to 512?
>> Test mode should be reset automatically on exit. 
> 
> on exit? Which exit? Did you test this on USB Reset? Did you run USBCV
> on Super and High speed with any gadget?
> 
>> W can't clear this mode in register. It's WAC (write only and auto clear)  bit.
>> This function only reset endpoint configuration in controller register. 
>> Ep0 max_packet_size should be unchanged here.  Ep0 max_packet it's updated on 
>> Connect/Disconnect/Reset events.  
> 
> right, and this is called for both reset and disconnect (see below). If
> you're telling me that test mode and ep0 wMaxPacketSize is handled
> elsewhere, that's fine.
> 
> +	/* Disconnection detected */
> +	if (usb_ists & (USB_ISTS_DIS2I | USB_ISTS_DISI)) {
> +		if (priv_dev->gadget_driver &&
> +		    priv_dev->gadget_driver->disconnect) {
> +			spin_unlock(&priv_dev->lock);
> +			priv_dev->gadget_driver->disconnect(&priv_dev->gadget);
> +			spin_lock(&priv_dev->lock);
> +		}
> +
> +		priv_dev->gadget.speed = USB_SPEED_UNKNOWN;
> +		usb_gadget_set_state(&priv_dev->gadget, USB_STATE_NOTATTACHED);
> +		cdns3_gadget_unconfig(priv_dev);
> +	}
> +
> +	/* reset*/
> +	if (usb_ists & (USB_ISTS_UWRESI | USB_ISTS_UHRESI | USB_ISTS_U2RESI)) {
> +		/*read again to check the actuall speed*/
> +		speed = cdns3_get_speed(priv_dev);
> +		usb_gadget_set_state(&priv_dev->gadget, USB_STATE_DEFAULT);
> +		priv_dev->gadget.speed = speed;
> +		cdns3_gadget_unconfig(priv_dev);
> +		cdns3_ep0_config(priv_dev);
> +	}
> 
> 
>> Maybe this function should be called cdns3_hw_reset_eps_config. 
> 
> perhaps
> 
>> It doesn't unconfigure whole gadget but only reset endpoints configuration kept by 
>> controller.
>> I will change this function. 
> 
> ok
> 
>>>> +static irqreturn_t cdns3_device_irq_handler(int irq, void *data)
>>>> +{
>>>> +	struct cdns3_device *priv_dev;
>>>> +	struct cdns3 *cdns = data;
>>>> +	irqreturn_t ret = IRQ_NONE;
>>>> +	unsigned long flags;
>>>> +	u32 reg;
>>>> +
>>>> +	priv_dev = cdns->gadget_dev;
>>>> +	spin_lock_irqsave(&priv_dev->lock, flags);
>>>
>>> you're already running in hardirq context. Why do you need this lock at
>>> all? I would be better to use the hardirq handler to mask your
>>> interrupts, so they don't fire again, then used the top-half (softirq)
>>> handler to actually handle the interrupts.
>>
>> Yes, spin_lock_irqsave is not necessary here. 
>>
>> Do you mean replacing devm_request_irq with a request_threaded_irq ?
>> I have single interrupt line shared between  Host, Driver, DRD/OTG. 
>> I'm not sure if it will work more efficiently. 
> 
> The whole idea for running very little in hardirq context is to give the
> scheduler a chance to decide what should run. This is important to
> reduce latency when running with RT patchset applied, for
> example. However, I'll give you that, it's a minor requirement. It's
> just that, to me, it's a small detail that's easy to implement.
> 
>>>> +	/* check USB device interrupt */
>>>> +	reg = readl(&priv_dev->regs->usb_ists);
>>>> +	writel(reg, &priv_dev->regs->usb_ists);
>>>> +
>>>> +	if (reg) {
>>>> +		dev_dbg(priv_dev->dev, "IRQ: usb_ists: %08X\n", reg);
>>>
>>> I strongly advise against using dev_dbg() for debugging. Even more so
>>> inside your IRQ handler.
>> Ok, It's not necessary in this place, especially, that there is invoked trace point 
>> inside cdns3_check_usb_interrupt_proceed which makes the same.
> 
> overhead. Tracepoints are really, really low overhead. The string
> decoding doesn't happen until you read the trace file.
> 
