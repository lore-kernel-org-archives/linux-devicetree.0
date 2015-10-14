From: "M'boumba Cedric Madianga" <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dmaengine: Add STM32 DMA driver
Date: Wed, 14 Oct 2015 10:57:55 +0200
Message-ID: <CAOAejn2SMDtDa8TmMNeTUb38aqbAQnX5bK9JuMCweV6mKNMKZQ@mail.gmail.com>
References: <1444745127-1105-1-git-send-email-cedric.madianga@gmail.com>
	<1444745127-1105-3-git-send-email-cedric.madianga@gmail.com>
	<561D1689.90703@linaro.org>
	<CAOAejn1N=dFZ3nQ_hNznJQX1-fkP3r=vdYuWY4OMH65PrW3xVg@mail.gmail.com>
	<561E17EA.6000900@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561E17EA.6000900-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Daniel,

2015-10-14 10:52 GMT+02:00 Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> On 14/10/15 08:54, M'boumba Cedric Madianga wrote:
>>>>
>>>> +static int stm32_dma_alloc_chan_resources(struct dma_chan *c)
>>>> +{
>>>> +       struct stm32_dma_chan *chan = to_stm32_dma_chan(c);
>>>> +       struct stm32_dma_device *dmadev = stm32_dma_chan_get_dev(chan);
>>>> +       int ret;
>>>> +
>>>> +       chan->config_init = false;
>>>> +       ret = clk_prepare_enable(dmadev->clk);
>>>> +       if (ret < 0) {
>>>> +               dev_err(chan2dev(chan), "clk_prepare_enable failed:
>>>> %d\n",
>>>> ret);
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       ret = stm32_dma_disable_chan(chan);
>>>> +
>>>> +       return ret;
>>>> +}
>>>
>
>
> If stm32_dma_disable_chan() returns an error then we will not restore the
> original the clock counts causing them to "leak".

Ok got it. Thanks for the clarification.
I will fix it in the next version.

BR,
Cedric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
