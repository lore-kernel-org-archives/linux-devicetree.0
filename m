From: Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>
Subject: Re: [PATCH v2] dma: Add Xilinx AXI Video Direct Memory Access Engine
 driver support
Date: Thu, 23 Jan 2014 14:50:49 +0100
Message-ID: <52E11E39.6090901@metafoo.de>
References: <1390409565-4200-1-git-send-email-sthokal@xilinx.com>  <1390409565-4200-2-git-send-email-sthokal@xilinx.com>  <52E0FC22.8060903@metafoo.de> <1390484317.7619.81.camel@smile>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390484317.7619.81.camel@smile>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Shevchenko, Andriy" <andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Srikanth Thokala <sthokal-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "Williams, Dan J" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Koul, Vinod" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 01/23/2014 02:38 PM, Shevchenko, Andriy wrote:
> On Thu, 2014-01-23 at 12:25 +0100, Lars-Peter Clausen wrote:
>> On 01/22/2014 05:52 PM, Srikanth Thokala wrote:
> 
> [...]
> 
>>> +	/* Request the interrupt */
>>> +	chan->irq = irq_of_parse_and_map(node, 0);
>>> +	err = devm_request_irq(xdev->dev, chan->irq, xilinx_vdma_irq_handler,
>>> +			       IRQF_SHARED, "xilinx-vdma-controller", chan);
>>
>> This is a clasic example of where to not use devm_request_irq. 'chan' is
>> accessed in the interrupt handler, but if you use devm_request_irq 'chan'
>> will be freed before the interrupt handler has been released, which means
>> there is now a race condition where the interrupt handler can access already
>> freed memory.ta
> 
> Could you elaborate this case? As far as I understood managed resources
> are a kind of stack pile. In this case you have no such condition. Where
> am I wrong?

The stacked stuff is only ran after the remove() function. Which means that
you call dma_async_device_unregister() before the interrupt handler is
freed. Another issue with the interrupt handler is a bit hidden. The driver
does not call tasklet_kill in the remove function. Which it should though to
make sure that the tasklet does not race against the freeing of the memory.
And in order to make sure that the tasklet is not rescheduled you need to
free the irq before killing the tasklet, since the interrupt handler
schedules the tasklet.

- Lars

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
