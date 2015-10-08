From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/4] dt-bindings: Document the STM32 DMA bindings
Date: Thu, 08 Oct 2015 22:40:19 +0200
Message-ID: <11583587.xphxbMQ7TN@wuerfel>
References: <1444317612-818-1-git-send-email-cedric.madianga@gmail.com> <15651913.U8kb3JZ9vO@wuerfel> <CAOAejn0x68GaEEfTZbsi5VSJt+Um-bV2Mcmc2pxUwh5QjD=ZYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOAejn0x68GaEEfTZbsi5VSJt+Um-bV2Mcmc2pxUwh5QjD=ZYw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: M'boumba Cedric Madianga <cedric.madianga-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thursday 08 October 2015 22:25:50 M'boumba Cedric Madianga wrote:
> >
> > How do you know which channels are available for memory-to-memory
> > transfers?
> For memory-to-memory transfer we don't need any channel/request combination.
> We look for any available channel in the channel list to execute our transfer.
> So, as often as possible, we expect that a peripheral release his
> channel after transfering data.
> In that way, we always should have at least one channel available for
> that kind of transfer.
> 

Ah, got it. So the use of virtual channels in this driver makes MEM2MEM
transfers work, but is otherwise not required.

Thanks for the clarification.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
