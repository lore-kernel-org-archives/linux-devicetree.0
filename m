From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 4/6] PCI: generic: Correct, and avoid overflow, in
 bus_max calculation.
Date: Tue, 15 Sep 2015 19:35:01 +0100
Message-ID: <20150915183500.GR31157@arm.com>
References: <1442013719-5001-1-git-send-email-ddaney.cavm@gmail.com>
 <1442013719-5001-5-git-send-email-ddaney.cavm@gmail.com>
 <20150915174934.GL31157@arm.com>
 <55F85D4E.9020604@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55F85D4E.9020604-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Lorenzo Pieralisi <Lorenzo.Pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 15, 2015 at 07:02:54PM +0100, David Daney wrote:
> On 09/15/2015 10:49 AM, Will Deacon wrote:
> > On Sat, Sep 12, 2015 at 12:21:57AM +0100, David Daney wrote:
> >>   	/* Limit the bus-range to fit within reg */
> >> -	bus_max = pci->cfg.bus_range->start +
> >> -		  (resource_size(&pci->cfg.res) >> pci->cfg.ops.bus_shift) - 1;
> >> +	bus_max = (resource_size(&pci->cfg.res) >> pci->cfg.ops.bus_shift) - 1;
> >> +	if (bus_max > 255)
> >> +		bus_max = 255;
> >>   	pci->cfg.bus_range->end = min_t(resource_size_t,
> >>   					pci->cfg.bus_range->end, bus_max);
> >
> > Hmm, this is changing the meaning of the bus-range property in the
> > device-tree, which really needs to match what IEEE Std 1275-1994 requires.
> 
> I doesn't change the bus-range.

Not directly, but pci->cfg.bus_range is a resource populated from the
"bus-range" property in the device-tree, so it's changing how the driver
uses that property.

> > My understanding was that the bus-range could be used to offset the config
> > space, which is why it's subtracted from the bus number in
> > gen_pci_map_cfg_bus_[e]cam.
> 
> There is an inconsistency in the current code.  The calculation of the 
> cfg.win[?] pointers is done such that the beginning of the config space 
> specified in the "reg" property corresponds to bus 0.

I don't follow you here. The mapping functions explicitly subtract the
start of the bus range when calculating the window offset:

  resource_size_t idx = bus->number - pci->cfg.bus_range->start;

so if I have bus-range = <128 255>; then bus 128 lives at the start of
the configuration space described by the reg property, not bus 0.

Sorry if I'm being thick; I just can't see the inconsistency.

> The calculation that I am changing, was done such that the beginning of 
> the config space specified in the "reg" property corresponds to the 
> first bus of the "bus-range"
> 
> Which is correct?  I assumed that the config space specified in the 
> "reg" property corresponds to bus 0.  Based on this assumption, I made 
> the bus_max calculation match.
> 
> Due to hardware peculiarities, our bus-range starts at a non-zero bus 
> number.  So, something has to be done to make all the code agree on a 
> single interpretation of the meaning "reg" property.

I think you're the first to exercise this code, so it's definitely worth
us fixing whatever's going wrong.

> > Also, why is your config space so large that
> > we end up overflowing bus_max?
> 
> It isn't.  The part of the patch that changes the type from u8 to int 
> was just to add some sanity.  The  code was easily susceptible to 
> overflow failures, it seemed best to change to int.

Can we drop this part for now if it's not actually needed?

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
