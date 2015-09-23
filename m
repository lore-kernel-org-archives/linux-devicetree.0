From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 4/5] PCI: generic: Correct, and avoid overflow, in
 bus_max calculation.
Date: Wed, 23 Sep 2015 20:47:53 +0100
Message-ID: <20150923194753.GA7356@arm.com>
References: <1442527332-1174-1-git-send-email-ddaney.cavm@gmail.com>
 <3751968.n8LRgots8n@wuerfel>
 <20150923193545.GZ7356@arm.com>
 <1707525.QvfFzUYq4E@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1707525.QvfFzUYq4E@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 23, 2015 at 08:39:27PM +0100, Arnd Bergmann wrote:
> On Wednesday 23 September 2015 20:35:45 Will Deacon wrote:
> > On Wed, Sep 23, 2015 at 08:27:41PM +0100, Arnd Bergmann wrote:
> > > On Wednesday 23 September 2015 11:21:56 David Daney wrote:
> > > > >>
> > > > >>      /* Limit the bus-range to fit within reg */
> > > > >> -    bus_max = pci->cfg.bus_range->start +
> > > > >> -              (resource_size(&pci->cfg.res) >> pci->cfg.ops.bus_shift) - 1;
> > > > >> +    bus_max = (resource_size(&pci->cfg.res) >> pci->cfg.ops.bus_shift) - 1;
> > > > >> +    if (bus_max > 255)
> > > > >> +            bus_max = 255;
> > > > >
> > > > > I still don't understand the need for this part. If the cfg space is bigger
> > > > > than bus_max, isn't that simply an invalid resource? Given that the resource
> > > > > could be broken in other ways too, this check feels more like a specific
> > > > > workaround rather than generally useful code.
> > > > 
> > > > Imagine...
> > > > 
> > > >    bus-range [0x80 .. 0xff], this requires a cfg.res that will cover the 
> > > > entire range of 0..0xff.
> > > > 
> > > >    according to the calculations above, (resource_size(&pci->cfg.res) >> 
> > > > pci->cfg.ops.bus_shift) - 1 will have a value of 0xff, so...
> > > 
> > > Extending the computation to 32 bit seems fine, but I'd rather warn loudly
> > > if the bus range does not fit within the registers.
> > > 
> > > Also note that the computation is already correct with my interpretation
> > > of the reg property.
> > 
> > From what Lorenzo was saying, ACPI shares the interpretation that David is
> > implementing here and, given that the DT version seems to be subjective,
> > aligning this reg property with MMCFG seems to make sense.
> 
> We should then make it very clear in the binding that the driver
> is not allowed to actually map the registers for the buses outside
> of the bus-range, as that is highly unusual.
> 
> We would also need a special exception for this if we ever get to
> implement the DT source checker that we have been talking about for
> years, as the reg property might then overlap with a property from
> another device.

Completely agreed. Having a base that isn't actually safe to map is horrible
and should be called out.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
