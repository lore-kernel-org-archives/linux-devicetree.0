From: sundeep subbaraya <sundeep.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] usb: gadget: Add xilinx axi usb2 device support
Date: Thu, 17 Apr 2014 15:01:37 +0530
Message-ID: <CALHRZuq6=TMryHtbjTw7rYoGwbu2w0BTdxiOA95HYS3_CG6vwQ@mail.gmail.com>
References: <1396510519-8555-1-git-send-email-sbhatta@xilinx.com>
	<113d0620-4003-417d-806b-0b79ae692829@VA3EHSMHS023.ehs.local>
	<20140403145853.GD14162@saruman.home>
	<CALHRZuoCtEz5-CmU17dUpVS_MjSDdYVLMSvgXq_RwxLj_KJMDA@mail.gmail.com>
	<20140416180228.GK28035@saruman.home>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140416180228.GK28035-HgARHv6XitL9zxVx7UNMDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Subbaraya Sundeep Bhatta <subbaraya.sundeep.bhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Michal Simek <michals-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Subbaraya Sundeep Bhatta <sbhatta-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Felipe,

On Wed, Apr 16, 2014 at 11:32 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
> Hi,
>
> On Wed, Apr 16, 2014 at 04:09:28PM +0530, sundeep subbaraya wrote:
>> Hi Felipe,
>>
>> On Thu, Apr 3, 2014 at 8:28 PM, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org> wrote:
>>
>> >> +static int start_dma(struct xusb_ep *ep, u32 src, u32 dst, u32 length)
>> >
>> > please prepend this with xudc_, it makes tracing a lot easier.
>> >
>> >> +{
>> >> +     struct xusb_udc *udc;
>> >> +     int rc = 0;
>> >> +     unsigned long timeout;
>> >> +
>> >> +     udc = ep->udc;
>> >> +     /*
>> >> +      * Set the addresses in the DMA source and
>> >> +      * destination registers and then set the length
>> >> +      * into the DMA length register.
>> >> +      */
>> >> +     udc->write_fn(udc->base_address, XUSB_DMA_DSAR_ADDR_OFFSET, src);
>> >> +     udc->write_fn(udc->base_address, XUSB_DMA_DDAR_ADDR_OFFSET, dst);
>> >> +     udc->write_fn(udc->base_address, XUSB_DMA_LENGTH_OFFSET, length);
>> >> +
>> >> +     /*
>> >> +      * Wait till DMA transaction is complete and
>> >> +      * check whether the DMA transaction was
>> >> +      * successful.
>> >> +     */
>> >> +     while ((udc->read_fn(ep->udc->base_address + XUSB_DMA_STATUS_OFFSET) &
>> >> +                     XUSB_DMA_DMASR_BUSY) == XUSB_DMA_DMASR_BUSY) {
>> >> +             timeout = jiffies + 10000;
>> >> +
>> >> +             if (time_after(jiffies, timeout)) {
>> >> +                     rc = -ETIMEDOUT;
>> >> +                     goto clean;
>> >> +             }
>> >> +     }
>> >
>> > don't you get an IRQ for DMA completion ? If you do, you could be using
>> > wait_for_completion()
>>
>> This function is called in interrupt context when buffer is ready or
>> free. It initiates DMA to transfer data from IP buffer to memory.
>> Hence it waits in busy loop till DMA completes
>
> wait, so you start_dma() before your gadget driver asks you to ?

in ep_queue driver starts dma transfer from/to IP buffer to/from req->buf.
If transfer is completed then request is not added to ep request queue
and returns from ep_queue.
If transfer is not completed (actual < length) then request is added
to queue and returns from ep_queue.
when buffer processed interrupt occurs, handler starts dma if there is
request in queue and calls complete call back (when actual == length)
Hence answer is Yes for some transfers (start dma called from
interrupt handler not from ep_queue).

Thanks,
Sundeep.B.S.
>
> --
> balbi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
