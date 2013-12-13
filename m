From: Andreas Larsson <andreas@gaisler.com>
Subject: Re: [PATCH v3] usb: gadget: Add UDC driver for Aeroflex Gaisler GRUSBDC
Date: Fri, 13 Dec 2013 08:48:30 +0100
Message-ID: <52AABBCE.8000709@gaisler.com>
References: <1386144838-16403-1-git-send-email-andreas@gaisler.com> <20131212180106.GF1939@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131212180106.GF1939@saruman.home>
Sender: linux-kernel-owner@vger.kernel.org
To: balbi@ti.com
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, software@gaisler.com
List-Id: devicetree@vger.kernel.org

On 2013-12-12 19:01, Felipe Balbi wrote:
> Hi,
>
> On Wed, Dec 04, 2013 at 09:13:58AM +0100, Andreas Larsson wrote:
>> +static void gr_finish_request(struct gr_ep *ep, struct gr_request *req,
>> +			      int status)
>> +{
>> +	struct gr_udc *dev;
>> +
>> +	list_del_init(&req->queue);
>> +
>> +	if (likely(req->req.status == -EINPROGRESS))
>> +		req->req.status = status;
>> +	else
>> +		status = req->req.status;
>> +
>> +	dev = ep->dev;
>> +	usb_gadget_unmap_request(&dev->gadget, &req->req, ep->is_in);
>> +	gr_free_dma_desc_chain(dev, req);
>> +
>> +	if (ep->is_in) /* For OUT, actual gets updated bit by bit */
>> +		req->req.actual = req->req.length;
>> +
>> +	if (!status) {
>> +		if (ep->is_in)
>> +			gr_dbgprint_request("SENT", ep, req);
>> +		else
>> +			gr_dbgprint_request("RECV", ep, req);
>> +	}
>> +
>> +	/* Prevent changes to ep->queue during callback */
>> +	ep->callback = 1;
>> +	if (req == dev->ep0reqo && !status) {
>> +		if (req->setup)
>> +			gr_ep0_setup(dev, req);
>> +		else
>> +			dev_err(dev->dev,
>> +				"Unexpected non setup packet on ep0in\n");
>> +	} else if (req->req.complete) {
>> +		unsigned long flags;
>> +
>> +		/*
>> +		 * Complete should be called with interrupts disabled according
>> +		 * to the contract of struct usb_request
>> +		 */
>> +		local_irq_save(flags);
>
> sorry but this driver isn't ready for inclusion. local_irq_save() is a
> pretty good hint that there's something wrong in the driver. Consider
> the fact that local_irq_save() will disable preemption even when
> CONFIG_PREEMPT_FULL is enabled and you have a bit a problem.

This connection between local_irq_save and CONFIG_PREEMPT_RT_FULL was 
unknown to me. Sure, I can disable interrupts right at spin lock time.


> Also, the way you're using thread IRQs is quite wrong. I can't let that
> pass and get merged upstream, sorry.

What is quite wrong? What is it that I need to fix?


Best regards,
Andreas Larsson
