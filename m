From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [RFC PATCH] dma: at_xdmac: creation of the atmel eXtended DMA Controller driver
Date: Tue, 10 Jun 2014 19:58:01 +0200
Message-ID: <11151546.Z6056AoQxM@wuerfel>
References: <1401179736-8235-1-git-send-email-ludovic.desroches@atmel.com> <20140610154118.GA4254@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140610154118.GA4254@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Ludovic Desroches <ludovic.desroches-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 10 June 2014 17:41:18 Maxime Ripard wrote:
> > +DMA clients connected to the Atmel XDMA controller must use the format
> > +described in the dma.txt file, using a three-cell specifier for each channel:
> > +a phandle plus two integer cells.
> > +The three cells in order are:
> > +
> > +1. A phandle pointing to the DMA controller.
> > +2. The memory interface (16 most significant bits), the peripheral interface
> > +(16 less significant bits).
> 
> Can you elaborate on this? What are they? The request IDs on both ends
> of the transfers?
> 
> > +3. Channel configuration register. Configurable fields are:
> > +  - bit 2-1: MBSIZE, memory burst size.
> > +  - bit 10-8: CSIZE, chunk size.
> > +  - bit 12-11: DWIDTH, data width.
> 
> I'd rather see those as generic properties.

Actually these are standard settings that a slave driver
configures using dma_slave_config. They don't belong into
DT at all, as they are slave driver specific.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
