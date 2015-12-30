From: Curt Brune <curt-qUQiAmfTcIp+XZJcv9eMoEEOCMrvLtNR@public.gmane.org>
Subject: Re: [RFC 1/1] powerpc: legacy serial port use device tree cell-index
 property
Date: Wed, 30 Dec 2015 08:36:01 -0800
Message-ID: <20151230163601.GX14046@cumulusnetworks.com>
References: <1448477209-22340-2-git-send-email-curt@cumulusnetworks.com>
 <20151220150225.GA27380@gate.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20151220150225.GA27380-JorI+TVEvZrY24RiXHRV3ti2O/JbrIOy@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Cc: galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org, mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sun Dec 20 09:02, Segher Boessenkool wrote:
> On Wed, Nov 25, 2015 at 10:46:49AM -0800, Curt Brune wrote:
> > +	/* Check if the ports have an ordering, defined by 'cell-index' */
> > +	if (((indexp = (u32*)of_get_property(np, "cell-index", &len)) != NULL) &&
> > +	    (len == sizeof(u32)))
> > +		index = *indexp;
> > +
> >  	/* Add port, irq will be dealt with later. We passed a translated
> >  	 * IO port value. It will be fixed up later along with the irq
> >  	 */
> >  	if (tsi && !strcmp(tsi->type, "tsi-bridge"))
> > -		return add_legacy_port(np, -1, UPIO_TSI, addr, addr,
> > +		return add_legacy_port(np, index, UPIO_TSI, addr, addr,
> >  				       NO_IRQ, legacy_port_flags, 0);
> >  	else
> > -		return add_legacy_port(np, -1, UPIO_MEM, addr, addr,
> > +		return add_legacy_port(np, index, UPIO_MEM, addr, addr,
> >  				       NO_IRQ, legacy_port_flags, 0);
> 
> What does this do if the value in cell-index is a duplicate. or the port
> with that number is already created some other way?  Are the numbers in
> cell-index global anyway, or relative to some parent device (I couldn't
> find the documentation for this).
> 
> 
> Segher

add_legacy_port() has support for handling duplicate index entries.
Reading that code it looks like the recent entry wins and the older
entry is moved to the next available index.

The numbers in cell-index are not global nor explicitly relative to a
parent device.  I also could not find documentation on this.

In common usage, however, the cell-index property is used in two
different ways:

1.  For devices that have "channels" or "regions" (DMA for example),
the parent device node has child nodes enumerated by cell-index.  For
example see:  arch/powerpc/boot/dts/fsl/pq3-dma-0.dtsi

2.  For multiple instances of a device, for example UARTS,
each device node is enumerated using cell-index.  See:
arch/powerpc/boot/dts/fsl/qoriq-duart-0.dtsi

Cheers,
Curt
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
