From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/4] dt-bindings: Document the STM32 DMA bindings
Date: Thu, 08 Oct 2015 21:26:07 +0200
Message-ID: <15651913.U8kb3JZ9vO@wuerfel>
References: <1444317612-818-1-git-send-email-cedric.madianga@gmail.com> <13614799.2Hi64P0fJ2@wuerfel> <CAOAejn0y+6uFbho3iv37xh6=zKevnp_6MxOEw4e9Oc4U2x_csQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOAejn0y+6uFbho3iv37xh6=zKevnp_6MxOEw4e9Oc4U2x_csQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 08 October 2015 18:01:23 M'boumba Cedric Madianga wrote:
> Hi Arnd,
> 
> 2015-10-08 17:43 GMT+02:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>:
> > On Thursday 08 October 2015 17:20:09 M'boumba Cedric Madianga wrote:
> >> +Each dmas request consists of 5 cells:
> >> +1. A phandle pointing to the STM32 DMA controller
> >> +2. The channel id
> >> +3. The request line number
> >> +4. A 32bit mask specifying the DMA channel configuration
> >>
> >
> > It's fairly unusual to encode the channel id here, rather than
> > letting the driver pick one. Is that actually required here?
>
> Yes it is required as in STM32 platform the channel/request DMA
> mapping is done by hardware lines.
> So, if one client wants to use DMA, he has to choose the correct
> channel/request values according to the DMA mapping of his STM32
> platform.
 
Interesting. So you have seven channels ans seven request lines,
with a random but fixed mapping between them?

How do you know which channels are available for memory-to-memory
transfers?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
