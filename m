From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 3/3] PCI: iproc: Implement PCI hotplug support
Date: Fri, 6 Oct 2017 11:02:06 -0500
Message-ID: <20171006160206.GB25517@bhelgaas-glaptop.roam.corp.google.com>
References: <1504155029-24729-1-git-send-email-oza.oza@broadcom.com>
 <1504155029-24729-4-git-send-email-oza.oza@broadcom.com>
 <20171006113700.GA25517@bhelgaas-glaptop.roam.corp.google.com>
 <CAK1A=4z6T9MLmCBBCmr5jVkVOySpw6fMTiTPqb=Nr-pjxhuARw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK1A=4z6T9MLmCBBCmr5jVkVOySpw6fMTiTPqb=Nr-pjxhuARw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oza Pawandeep <oza.pawandeep-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Oza Pawandeep <oza.oza-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ray Jui <rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Scott Branden <sbranden-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Andy Gospodarek <gospo-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vikram Prakash <vikram.prakash-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 06, 2017 at 08:03:52PM +0530, Oza Pawandeep wrote:
> On Fri, Oct 6, 2017 at 5:07 PM, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Thu, Aug 31, 2017 at 10:20:29AM +0530, Oza Pawandeep wrote:
> >> This patch implements PCI hotplug support for iproc family chipsets.
> >>
> >> iproc based SOC (e.g. Stingray) does not have hotplug controller
> >> integrated.
> >> Hence, standard PCI hotplug framework hooks can-not be used.
> >> e.g. controlled power up/down of slot.
> >>
> >> The mechanism, for e.g. Stingray has adopted for PCI hotplug is as follows:
> >> PCI present lines are input to GPIOs depending on the type of
> >> connector (x2, x4, x8).
> >>
> >> GPIO array needs to be present if hotplug is supported.
> >> HW implementation is SOC/Board specific, and also it depends on how
> >> add-in card is designed
> >> (e.g. how many present pins are implemented).
> >>
> >> If x8 card is connected, then it might be possible that all the
> >> 3 present pins could go low, or at least one pin goes low.
> >> If x4 card is connected, then it might be possible that 2 present
> >> pins go low, or at least one pin goes low.
> >>
> >> The implementation essentially takes care of following:
> >> > Initializing hotplug irq thread.
> >> > Detecting the endpoint device based on link state.
> >> > Handling PERST and detecting the plugged devices.
> >> > Ordered Hot plug-out, where User is expected
> >>   to write 1 to /sys/bus/pci/devices/<pci_dev>/remove
> >> > Handling spurious interrupt
> >> > Handling multiple interrupts and makes sure that card is
> >>   enumerated only once.
> >
> > I haven't forgotten this, but I am dragging my feet a little bit.
> > There is a standard way for hardware to support PCIe hotplug, and it's
> > hard enough to get the software for that right.  I really, really
> > don't want to see a bunch of one-off implementations that sort of look
> > like standard hotplug but not really.
> >
> > I have a few trivial comments below but haven't really reviewed the
> > whole thing.
> ...

> >> -     list_splice_init(res, &host->windows);
> >> -     host->busnr = 0;
> >> -     host->dev.parent = dev;
> >> -     host->ops = &iproc_pcie_ops;
> >> -     host->sysdata = sysdata;
> >> -     host->map_irq = pcie->map_irq;
> >> -     host->swizzle_irq = pci_common_swizzle;
> >> +     if (!link_not_active) {
> >
> > Double negation.  If you pick a better name, e.g., "link_active", this
> > will read much better.  But I don't understand why you want to check
> > whether the link is active here anyway.  pci_scan_root_bus_bridge()
> > should work fine even if there's no device present below the bridge.
> > Won't the root port be there always, even if there's no downstream
> > device?
> ...
> 
> pci_scan_root_bus_bridge crashes when link is not active. when I last
> tested, that is what I observed.

I think that would mean a bug in your config accessors.  The PCI core
enumeration itself doesn't depend on the link being up.  But I don't
see anything obvious in your accessors that looks like an issue.

If you post details about the crash, maybe we can help figure it out.

> because in previous code when we dont support hotplug, we just got to
> err, and remove root-bus in case link is not active.
> we dont do scan bus.
> 
> if fact so far none of the RC driver implements hotplug so this might
> not have been exercised.

If the RC implements PCIe hotplug correctly, the RC driver shouldn't
need to do anything special to support hotplug.  It should just work.
That's why I'm so reluctant to merge stuff like this.  Your hardware
folks are making work for themselves by designing a new scheme, and
that makes work for software folks to support it.  None of that should
be necessary.

> ...
> >> @@ -104,6 +108,9 @@ struct iproc_pcie {
> >>       struct iproc_pcie_ib ib;
> >>       const struct iproc_pcie_ib_map *ib_map;
> >>
> >> +     bool enable_hotplug;
> >> +     bool ep_is_present;
> >
> > Are you suggesting that only an endpoint can be hotplugged?  You can't
> > hotplug a switch?
> >
> 
> ok, we can change the name, PCI switch also can be hot-plugged.

I'm dubious about the need for such a variable in the first place.
It's always going to be unreliable because you might test it after a
device has been hotplugged but before the variable has been updated.

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
