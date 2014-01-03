From: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RFC v6 4/5] dma: mpc512x: register for device tree channel lookup
Date: Sat, 4 Jan 2014 00:54:38 +0400
Message-ID: <CAF0T0X7wotm60Bq4tfYcRhkDwiCw2hh5R5m2WmVLmLGLZYpQsQ@mail.gmail.com>
References: <1387886789-20249-1-git-send-email-a13xp0p0v88@gmail.com>
	<1387886789-20249-5-git-send-email-a13xp0p0v88@gmail.com>
	<20131226124828.GK8064@book.gsilab.sittig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131226124828.GK8064-kDjWylLy9wD0K7fsECOQyeGNnDKD8DIp@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Gerhard.
Thanks for your review.

2013/12/26 Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>:
> [ dropping devicetree, we're DMA specific here ]
>
> On Tue, Dec 24, 2013 at 16:06 +0400, Alexander Popov wrote:
>>
>> --- a/drivers/dma/mpc512x_dma.c
>> +++ b/drivers/dma/mpc512x_dma.c
>> [ ... ]
>> @@ -950,6 +951,7 @@ static int mpc_dma_probe(struct platform_device *op)
>>       INIT_LIST_HEAD(&dma->channels);
>>       dma_cap_set(DMA_MEMCPY, dma->cap_mask);
>>       dma_cap_set(DMA_SLAVE, dma->cap_mask);
>> +     dma_cap_set(DMA_PRIVATE, dma->cap_mask);
>>
>>       for (i = 0; i < dma->chancnt; i++) {
>>               mchan = &mdma->channels[i];
>
> What are the implications of this?  Is a comment due?

I've involved DMA_PRIVATE flag because new of_dma_xlate_by_chan_id()
uses dma_get_slave_channel() instead of dma_request_channel()
(PATCH RFC v6 3/5). This flag is implicitly set in dma_request_channel(),
but is not set in dma_get_slave_channel().

There are only two places in the mainline kernel, where
dma_get_slave_channel() is used. I've picked up the idea
at one of these places. Please look at this patch:
http://www.spinics.net/lists/arm-kernel/msg268718.html

> I haven't found documentation about the DMA_PRIVATE flag, only
> saw commit 59b5ec21446b9 "dmaengine: introduce
> dma_request_channel and private channels".

Unfortunately I didn't find any description of DMA_PRIVATE flag too.
But the comment at the beginning of drivers/dma/dmaengine.c
may give a clue. Quotation:
  * subsystem can get access to a channel by calling dmaengine_get() followed
  * by dma_find_channel(), or if it has need for an exclusive channel
it can call
  * dma_request_channel().  Once a channel is allocated a reference is taken
  * against its corresponding driver to disable removal.

DMA_PRIVATE capability flag might indicate that the DMA controller
can provide exclusive channels to its clients. Please correct me if I'm wrong.

> Alex, unless I'm
> missing something this one-line change is quite a change in
> semantics, and has dramatic influence on the code's behaviour
> (ignores the DMA controller when looking for channels that can do
> mem-to-mem transfers)

Excuse me, Gerhard, I don't see what you mean.
Could you point to the corresponding code?

> Consider the fact that this driver
> handles both MPC5121 as well as MPC8308 hardware.

Ah, yes, sorry. I should certainly fix this, if setting of DMA_PRIVATE flag
is needed at all.

Thanks!

Best regards,
Alexander
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
