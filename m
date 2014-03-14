From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH RFC v9 5/6] dma: mpc512x: add device tree binding document
Date: Fri, 14 Mar 2014 11:43:01 +0100
Message-ID: <201403141143.01288.arnd@arndb.de>
References: <1394624875-24411-1-git-send-email-a13xp0p0v88@gmail.com> <1394624875-24411-6-git-send-email-a13xp0p0v88@gmail.com> <20140313180916.GF25870@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140313180916.GF25870-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Alexander Popov <a13xp0p0v88-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday 13 March 2014, Mark Rutland wrote:
> > +
> > +Example:
> > +
> > +     dma0: dma@14000 {
> > +             compatible = "fsl,mpc5121-dma";
> > +             reg = <0x14000 0x1800>;
> > +             interrupts = <65 0x8>;
> > +             #dma-cells = <1>;
> > +     };
> > +
> > +
> > +Client node properties:
> > +
> > +Required properties:
> > +- dmas:                      list of DMA specifiers, consisting each of a handle
> > +                     for the DMA controller and integer cells to specify
> > +                     the channel used within the DMA controller
> > +- dma-names:         list of identifier strings for the DMA specifiers,
> > +                     client device driver code uses these strings to
> > +                     have DMA channels looked up at the controller
> 
> List the exact names you expect, or the dma-names property is useless.

Listing specific names makes no sense in the binding for the provider,
they should be part of the slave device binding. A reference to the
generic bindings/dma/dma.txt file should be enough here.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
