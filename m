From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH RFC v5 4/5] dma: mpc512x: register for device tree
 channel lookup
Date: Mon, 18 Nov 2013 15:23:57 +0000
Message-ID: <20131118152357.GB3759@e106331-lin.cambridge.arm.com>
References: <1383290374-17484-1-git-send-email-a13xp0p0v88@gmail.com>
 <1383290374-17484-5-git-send-email-a13xp0p0v88@gmail.com>
 <20131118120957.GH30853@e106331-lin.cambridge.arm.com>
 <201311181531.54818.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201311181531.54818.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 18, 2013 at 02:31:54PM +0000, Arnd Bergmann wrote:
> On Monday 18 November 2013, Mark Rutland wrote:
> > > +++ b/Documentation/devicetree/bindings/dma/mpc512x-dma.txt
> > > @@ -0,0 +1,55 @@
> > > +* Freescale MPC512x DMA Controller
> > > +
> > > +The DMA controller in the Freescale MPC512x SoC can move blocks of
> > > +memory contents between memory and peripherals or memory to memory.
> > > +
> > > +Refer to the "Generic DMA Controller and DMA request bindings" description
> > > +in the dma.txt file for a more detailled discussion of the binding.  The
> > > +MPC512x DMA engine binding follows the common scheme, but doesn't provide
> > > +support for the optional channels and requests counters (those values are
> > > +derived from the detected hardware features) and has a fixed client
> > > +specifier length of 1 integer cell (the value is the DMA channel, since
> > > +the DMA controller uses a fixed assignment of request lines per channel).
> > 
> > The fact that #dma-cells must be <1> isn't a difference from the
> > standard binding, and needs not be described here. The meaning of the
> > value should be in your description of #dma-cells below.
> 
> I think the value it has to be in there, and I have in the past asked other
> people to add this. Note that in the generic binding, it says that it must
> be "at least 1". You can have controllers that require a larger number, or
> that can use 1 or 2 alternatively, depending on how the device is wired
> up, e.g. when a dma controller has two master ports you would need a
> second cell to specify the port number, but only if more than one port
> is actually connected to a slave.

The number of cells required should be described. My points were that it
should be described at the property description rather than in the introduction,
and that the fact that a specific value was required was not a
difference from the bindings as the paragraph implied.

> 
> > I'm not sure it's worth mentioning optional channels / request counters.
> > If anything, it would be better to update dma.txt to move the "Optional
> > properties" to something like "Suggested properties"...
> 
> These are less clearly defined. In the generic binding, it's mostly a matter
> of "if you need to pass this information, use these properties". The individual
> binding can then make them mandatory if needed.

Agreed. I'd prefer that bindings described the suggested properties they
used, rather than those they don't.

Thanks,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
