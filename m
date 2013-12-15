From: Andreas Larsson <andreas-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] usb: gadget: Add UDC driver for Aeroflex Gaisler GRUSBDC
Date: Sun, 15 Dec 2013 23:24:12 +0100
Message-ID: <52AE2C0C.80401@gaisler.com>
References: <1386144838-16403-1-git-send-email-andreas@gaisler.com> <20131212180106.GF1939@saruman.home> <52AABBCE.8000709@gaisler.com> <20131213195234.GE5292@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131213195234.GE5292-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, software-FkzTOoA/JUlBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 12/13/2013 08:52 PM, Felipe Balbi wrote:
> Hi,
>
> On Fri, Dec 13, 2013 at 08:48:30AM +0100, Andreas Larsson wrote:
>>> On Wed, Dec 04, 2013 at 09:13:58AM +0100, Andreas Larsson wrote:
>>>> +static void gr_finish_request(struct gr_ep *ep, struct gr_request *req,
>>>> +			      int status)
>>>> +{
>>>> +	struct gr_udc *dev;
>>>> +
>>>> +	list_del_init(&req->queue);
>>>> +
>>>> +	if (likely(req->req.status == -EINPROGRESS))
>>>> +		req->req.status = status;
>>>> +	else
>>>> +		status = req->req.status;
>>>> +
>>>> +	dev = ep->dev;
>>>> +	usb_gadget_unmap_request(&dev->gadget, &req->req, ep->is_in);
>>>> +	gr_free_dma_desc_chain(dev, req);
>>>> +
>>>> +	if (ep->is_in) /* For OUT, actual gets updated bit by bit */
>>>> +		req->req.actual = req->req.length;
>>>> +
>>>> +	if (!status) {
>>>> +		if (ep->is_in)
>>>> +			gr_dbgprint_request("SENT", ep, req);
>>>> +		else
>>>> +			gr_dbgprint_request("RECV", ep, req);
>>>> +	}
>>>> +
>>>> +	/* Prevent changes to ep->queue during callback */
>>>> +	ep->callback = 1;
>>>> +	if (req == dev->ep0reqo && !status) {
>>>> +		if (req->setup)
>>>> +			gr_ep0_setup(dev, req);
>>>> +		else
>>>> +			dev_err(dev->dev,
>>>> +				"Unexpected non setup packet on ep0in\n");
>>>> +	} else if (req->req.complete) {
>>>> +		unsigned long flags;
>>>> +
>>>> +		/*
>>>> +		 * Complete should be called with interrupts disabled according
>>>> +		 * to the contract of struct usb_request
>>>> +		 */
>>>> +		local_irq_save(flags);
>>>
>>> sorry but this driver isn't ready for inclusion. local_irq_save() is a
>>> pretty good hint that there's something wrong in the driver. Consider
>>> the fact that local_irq_save() will disable preemption even when
>>> CONFIG_PREEMPT_FULL is enabled and you have a bit a problem.
>>
>> This connection between local_irq_save and CONFIG_PREEMPT_RT_FULL was
>> unknown to me. Sure, I can disable interrupts right at spin lock
>> time.
>
> that's better.

Alright, I'll put this in v4.


>>> Also, the way you're using thread IRQs is quite wrong. I can't let that
>>> pass and get merged upstream, sorry.
>>
>> What is quite wrong? What is it that I need to fix?
>
> Ideally the hardirq handler should be usually to actually check if
> $this_device generated the IRQ, that should involve reading a IRQSTATUS
> register of some sort.
>
> Sure, check that IRQs are actually enabled, but you also need to read
> STATUS register before waking the thread up.

I agree that that would be preferable. Unfortunately, the hardware lacks 
status register bits that indicates whether interrupts has been 
generated or not. That is why the only check is if interrupts are 
disabled, because that is the only sure way to know that the softirq 
handler does not need to go through everything.

Best regards,
Andreas Larsson

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
