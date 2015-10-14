From: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dmaengine: Add STM32 DMA driver
Date: Wed, 14 Oct 2015 14:29:16 +0100
Message-ID: <561E58AC.80207@linaro.org>
References: <1444745127-1105-1-git-send-email-cedric.madianga@gmail.com>
 <1444745127-1105-3-git-send-email-cedric.madianga@gmail.com>
 <561D1689.90703@linaro.org>
 <CAOAejn1N=dFZ3nQ_hNznJQX1-fkP3r=vdYuWY4OMH65PrW3xVg@mail.gmail.com>
 <CAOAejn2pcFSn3Hf=j6zgg6Ui6GjJZrtRch6ywByHaVLsTLMk6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOAejn2pcFSn3Hf=j6zgg6Ui6GjJZrtRch6ywByHaVLsTLMk6A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 14/10/15 14:17, M'boumba Cedric Madianga wrote:
> Hi Daniel,
>
>>>> +
>>>> +static int stm32_dma_remove(struct platform_device *pdev)
>>>> +{
>>>> +       struct stm32_dma_device *dmadev = platform_get_drvdata(pdev);
>>>> +
>>>> +       of_dma_controller_free(pdev->dev.of_node);
>>>> +
>>>> +       dma_async_device_unregister(&dmadev->ddev);
>>>> +
>>>> +       clk_disable_unprepare(dmadev->clk);
>>>
>>>
>>> What is the purpose of disabling/unpreparing the clock here?
>>> stm32_dma_alloc_chan_resources() and stm32_dma_free_chan_resources() should
>>> pair up and the clock should already be stopped.
>
> stm32_dma_remove() could be called during an on-going transfer during
> module unload.
> So in that case, it seems that disabling/unpreparing the clock is needed.

Really?

I think we need to be sure any on-going transfers are stopped.

There are multiple reasons for this, not least the risk of executing a 
callback that has been freed, but the one related to my point is that a 
single clk_disable_unprepare() will remain broken because if you don't 
know that the transfers have stopped then you don't know how many 
on-going transfers there are.


Daniel.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
