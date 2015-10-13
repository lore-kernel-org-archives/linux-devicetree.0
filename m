From: "M'boumba Cedric Madianga" <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] dmaengine: Add STM32 DMA driver
Date: Tue, 13 Oct 2015 13:50:11 +0200
Message-ID: <CAOAejn18=RGt2VF+KbTrykWKg1pO=tfiJBx+Wak=XLGTb9oq0Q@mail.gmail.com>
References: <1444317612-818-1-git-send-email-cedric.madianga@gmail.com>
	<1444317612-818-3-git-send-email-cedric.madianga@gmail.com>
	<561C1391.2000802@gmail.com>
	<CAOAejn2rX2f7YM-JYeJv98JbPwg1Uir_30abVg1XSTKNjUHVSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOAejn2rX2f7YM-JYeJv98JbPwg1Uir_30abVg1XSTKNjUHVSA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

 Hi Maxime,

2015-10-13 13:25 GMT+02:00 M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:

>>> +static int stm32_dma_set_xfer_param(struct stm32_dma_chan *chan,
>>> +                                   enum dma_transfer_direction direction,
>>> +                                   enum dma_slave_buswidth *buswidth)
>>> +{
>>> +       enum dma_slave_buswidth src_addr_width, dst_addr_width;
>>> +       u32 src_bus_width, dst_bus_width, src_burst_size, dst_burst_size;
>>> +       u32 src_maxburst, dst_maxburst;
>>> +       dma_addr_t src_addr, dst_addr;
>>> +
>>> +       src_addr_width = chan->dma_sconfig.src_addr_width;
>>> +       dst_addr_width = chan->dma_sconfig.dst_addr_width;
>>> +       src_maxburst = chan->dma_sconfig.src_maxburst;
>>> +       dst_maxburst = chan->dma_sconfig.dst_maxburst;
>>> +       src_addr = chan->dma_sconfig.src_addr;
>>> +       dst_addr = chan->dma_sconfig.dst_addr;
>>> +
>>> +       switch (direction) {
>>> +       case DMA_MEM_TO_DEV:
>>> +               dst_bus_width = stm32_get_dma_width(chan, dst_addr_width);
>>> +               if (dst_bus_width < 0)
>>> +                       return -EINVAL;
>>
>> dst_bus_width is a u32, so cannot be negative.
>> Also, you should propagate de error returned by stm32_get_dma_width().

> Good point. Thanks.
> I am going to replace u32 by int in the v2.
> It will be done in v2.
>
Finally, I prefer to return a default value from stm32_get_dma_width()
and stm32_get_dma_burst().
In that way, I will always be able to configure DMA transfer parameters.

BR,
Cedric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
