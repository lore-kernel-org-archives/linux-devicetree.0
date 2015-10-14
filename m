From: "M'boumba Cedric Madianga" <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dmaengine: Add STM32 DMA driver
Date: Wed, 14 Oct 2015 17:26:04 +0200
Message-ID: <CAOAejn1spB+BCRh9+jJtaKxEmaRc04nveF3rQEbT7kLMH0kOkg@mail.gmail.com>
References: <1444745127-1105-1-git-send-email-cedric.madianga@gmail.com>
	<1444745127-1105-3-git-send-email-cedric.madianga@gmail.com>
	<561D1689.90703@linaro.org>
	<CAOAejn1N=dFZ3nQ_hNznJQX1-fkP3r=vdYuWY4OMH65PrW3xVg@mail.gmail.com>
	<CAOAejn2pcFSn3Hf=j6zgg6Ui6GjJZrtRch6ywByHaVLsTLMk6A@mail.gmail.com>
	<561E58AC.80207@linaro.org>
	<CAOAejn1XqvZDmCgGr5rmZoz2EzFUyxtmpSm0_atLr81rSJrEcw@mail.gmail.com>
	<561E658D.1070900@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561E658D.1070900-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

2015-10-14 16:24 GMT+02:00 Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
>
> Hmnnn...
>
> The dmaengine framework will WARN_ONCE() if an dmaengine is removed whilst
> it is active and also works hard to ensure dmaengine modules are not removed
> whilst there are active drivers using the framework.
>
> How do we get into this function whilst there is still an active DMA
> channels?

For example, when a user try "rmmod stm32-dma" in uart console.
It will enter in stm32_dma_remove while there is potentially still active DMA.

>
>
>> But even with this improvement, I think I have to disable the clock here.
>
>
> As above, I think the dmaengine framework work to protect you from this sort
> problem. However even if I am wrong about that then unconditionally calling
> clk_disable_unprepare() can not be used to reliably manage the clocks. You
> don't know what the counts are!

Ok got it. Thanks for the clarification.

Cedric
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
