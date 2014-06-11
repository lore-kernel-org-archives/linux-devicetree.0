From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH] dma: at_xdmac: creation of the atmel eXtended DMA Controller driver
Date: Wed, 11 Jun 2014 09:41:47 +0200
Message-ID: <8696483.Dng95cR5kK@wuerfel>
References: <1401179736-8235-1-git-send-email-ludovic.desroches@atmel.com> <6544148.4RKn2Y8vCE@wuerfel> <20140611073525.GQ1701@ldesroches-Latitude-E6320>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140611073525.GQ1701@ldesroches-Latitude-E6320>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 11 June 2014 09:35:25 Ludovic Desroches wrote:
> > > +     if (dma_spec->args_count != 2) {
> > > +             dev_err(&pdev->dev, "dma phandler args: bad number of args\n");
> > > +             return NULL;
> > > +     }
> > > +
> > > +     dma_cap_zero(mask);
> > > +     dma_cap_set(DMA_SLAVE, mask);
> > > +     chan = dma_request_channel(mask, NULL, NULL);
> > > +     if (!chan) {
> > > +             dev_err(&pdev->dev, "can't get a dma channel\n");
> > > +             return NULL;
> > > +     }
> > 
> > You must use dma_get_any_slave_channel. dma_request_channel gives you a
> > channel from a random dma engine that is present in the system, not
> > necessarily the one you are managing here.
> 
> It is planned to use dma_get_any_slave_channel but currently I am doing
> tests on a 3.10 kernel that's why I am still using dma_request_channel.

Ok, I see. The correct way to do this then would be to have a filter
function that compares the channel's dmadevice pointer to the one
you get from the of_dma_data pointer. Since you already plan to
change this, and you probably know that there are no other engines
in the system, maybe you can do it like this in the meantime:

	/* FIXME: use dma_get_any_slave_chan to avoid the WARN_ON */
	if (!chan || WARN_ON(chan->device != dev)) {
		dev_err(&pdev->dev, "can't get a dma channel\n");
		return NULL;
	}

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
