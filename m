From: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/4] dmaengine: Add STM32 DMA driver
Date: Thu, 15 Oct 2015 09:37:08 +0530
Message-ID: <20151015040708.GC27370@localhost>
References: <1444745127-1105-3-git-send-email-cedric.madianga@gmail.com>
 <561D1689.90703@linaro.org>
 <CAOAejn1N=dFZ3nQ_hNznJQX1-fkP3r=vdYuWY4OMH65PrW3xVg@mail.gmail.com>
 <CAOAejn2pcFSn3Hf=j6zgg6Ui6GjJZrtRch6ywByHaVLsTLMk6A@mail.gmail.com>
 <561E58AC.80207@linaro.org>
 <CAOAejn1XqvZDmCgGr5rmZoz2EzFUyxtmpSm0_atLr81rSJrEcw@mail.gmail.com>
 <561E658D.1070900@linaro.org>
 <CAOAejn1spB+BCRh9+jJtaKxEmaRc04nveF3rQEbT7kLMH0kOkg@mail.gmail.com>
 <561E7497.1050105@linaro.org>
 <CAOAejn0chZD5mgi8WrW3ow3APUHTJOYP4=G2jCZ_Po4qe9eACw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAOAejn0chZD5mgi8WrW3ow3APUHTJOYP4=G2jCZ_Po4qe9eACw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 14, 2015 at 05:41:26PM +0200, M'boumba Cedric Madianga wrote:
> 2015-10-14 17:28 GMT+02:00 Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> > On 14/10/15 16:26, M'boumba Cedric Madianga wrote:
> >>
> >> 2015-10-14 16:24 GMT+02:00 Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> >>>
> >>>
> >>> Hmnnn...
> >>>
> >>> The dmaengine framework will WARN_ONCE() if an dmaengine is removed
> >>> whilst
> >>> it is active and also works hard to ensure dmaengine modules are not
> >>> removed
> >>> whilst there are active drivers using the framework.
> >>>
> >>> How do we get into this function whilst there is still an active DMA
> >>> channels?
> >>
> >>
> >> For example, when a user try "rmmod stm32-dma" in uart console.
> >> It will enter in stm32_dma_remove while there is potentially still active
> >> DMA.
> >
> >
> > Check dmaengine.c for yourself but I think in this case the dmaengine
> > framework will hold references to the module and prevent the remove from
> > taking place.
> 
> Yes I did it.
> As far I understand, the dmaengine framework will print a warning
> message but doesn't stop removing operation if there are some active
> clients.

we hold a ref, so removal wont work, see dma_chan_get()

-- 
~Vinod
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
