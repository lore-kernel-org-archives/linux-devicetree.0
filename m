From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 4/5] PCI: generic: Correct, and avoid overflow, in
 bus_max calculation.
Date: Wed, 23 Sep 2015 20:33:18 +0100
Message-ID: <20150923193318.GY7356@arm.com>
References: <1442527332-1174-1-git-send-email-ddaney.cavm@gmail.com>
 <1442527332-1174-5-git-send-email-ddaney.cavm@gmail.com>
 <20150923180157.GV7356@arm.com>
 <5602EDC4.3040603@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5602EDC4.3040603-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Sep 23, 2015 at 07:21:56PM +0100, David Daney wrote:
> On 09/23/2015 11:01 AM, Will Deacon wrote:
> > On Thu, Sep 17, 2015 at 11:02:11PM +0100, David Daney wrote:
> [...]
> >
> >>   Properties of the /chosen node:
> >> diff --git a/drivers/pci/host/pci-host-generic.c b/drivers/pci/host/pci-host-generic.c
> >> index 77cf4bd..0a9c453 100644
> >> --- a/drivers/pci/host/pci-host-generic.c
> >> +++ b/drivers/pci/host/pci-host-generic.c
> >> @@ -164,7 +164,7 @@ out_release_res:
> >>   static int gen_pci_parse_map_cfg_windows(struct gen_pci *pci)
> >>   {
> >>   	int err;
> >> -	u8 bus_max;
> >> +	int bus_max;
> >>   	resource_size_t busn;
> >>   	struct resource *bus_range;
> >>   	struct device *dev = pci->host.dev.parent;
> >> @@ -177,8 +177,9 @@ static int gen_pci_parse_map_cfg_windows(struct gen_pci *pci)
> >>   	}
> >>
> >>   	/* Limit the bus-range to fit within reg */
> >> -	bus_max = pci->cfg.bus_range->start +
> >> -		  (resource_size(&pci->cfg.res) >> pci->cfg.ops.bus_shift) - 1;
> >> +	bus_max = (resource_size(&pci->cfg.res) >> pci->cfg.ops.bus_shift) - 1;
> >> +	if (bus_max > 255)
> >> +		bus_max = 255;
> >
> > I still don't understand the need for this part. If the cfg space is bigger
> > than bus_max, isn't that simply an invalid resource? Given that the resource
> > could be broken in other ways too, this check feels more like a specific
> > workaround rather than generally useful code.
> 
> Imagine...
> 
>    bus-range [0x80 .. 0xff], this requires a cfg.res that will cover the 
> entire range of 0..0xff.
> 
>    according to the calculations above, (resource_size(&pci->cfg.res) >> 
> pci->cfg.ops.bus_shift) - 1 will have a value of 0xff, so...
> 
>    bus_max = 0x80 + 0xff -> OVERFLOW of u8!
> 
> That is not useful.  bus_max should represent the largest bus number 
> that can be covered by cfg.res.  That is what my patch is attempting to 
> accomplish.  Calculate the largest bus number that can be accommodated 
> by cfg.res, and then clamp it to 0xff.

Sorry, I should've been more specific. The only part I don't like is the
'if (bus_max > 255)' check.

Will
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
