From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 3/8] PCI: brcmstb: Add Broadcom STB PCIe host
 controller driver
Date: Fri, 15 Dec 2017 14:14:34 -0600
Message-ID: <20171215201434.GY30595@bhelgaas-glaptop.roam.corp.google.com>
References: <1510697532-32828-1-git-send-email-jim2101024@gmail.com>
 <1510697532-32828-4-git-send-email-jim2101024@gmail.com>
 <20171212221642.GB95453@bhelgaas-glaptop.roam.corp.google.com>
 <CANCKTBvtqNWZYXpLdUnEWwA2=14XhJ6adR5muOAYubY_1SxZWw@mail.gmail.com>
 <20171214225133.GM30595@bhelgaas-glaptop.roam.corp.google.com>
 <CANCKTBvFhHb57JdG01aiSypBAcUeLzY3Dhuh5xP-_F5k_NcAhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANCKTBvFhHb57JdG01aiSypBAcUeLzY3Dhuh5xP-_F5k_NcAhA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jim Quinlan <jim2101024-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel@lists.
List-Id: devicetree@vger.kernel.org

On Fri, Dec 15, 2017 at 02:53:57PM -0500, Jim Quinlan wrote:
> On Thu, Dec 14, 2017 at 5:51 PM, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > On Wed, Dec 13, 2017 at 06:53:53PM -0500, Jim Quinlan wrote:
> >> On Tue, Dec 12, 2017 at 5:16 PM, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >> > On Tue, Nov 14, 2017 at 05:12:07PM -0500, Jim Quinlan wrote:
> >> >> This commit adds the basic Broadcom STB PCIe controller.  Missing is
> >> >> the ability to process MSI and also handle dma-ranges for inbound
> >> >> memory accesses.  These two functionalities are added in subsequent
> >> >> commits.
> >> >>
> >> >> The PCIe block contains an MDIO interface.  This is a local interface
> >> >> only accessible by the PCIe controller.  It cannot be used or shared
> >> >> by any other HW.  As such, the small amount of code for this
> >> >> controller is included in this driver as there is little upside to put
> >> >> it elsewhere.
> >> ...
> >
> >> >> +static bool brcm_pcie_valid_device(struct brcm_pcie *pcie, struct pci_bus *bus,
> >> >> +                                int dev)
> >> >> +{
> >> >> +     if (pci_is_root_bus(bus)) {
> >> >> +             if (dev > 0)
> >> >> +                     return false;
> >> >> +     } else {
> >> >> +             /* If there is no link, then there is no device */
> >> >> +             if (!brcm_pcie_link_up(pcie))
> >> >> +                     return false;
> >> >
> >> > This is racy, since the link can go down after you check but before
> >> > you do the config access.  I assume your hardware can deal with a
> >> > config access that targets a link that is down?
> >>
> >> Yes, that can happen but there is really nothing that can be done if
> >> the link goes down in that vulnerability window.  What do you suggest
> >> doing?
> >
> > Most hardware drops writes and returns ~0 on reads if the link is
> > down.  I assume your hardware does something similar, and that should
> > be enough.  You shouldn't have to check whether the link is up.
> Unfortunately our HW is quite unforgiving and effects a synchronous or
> asynchronous abort when doing a config access when the link or power
> has gone down on the EP.  I will open a discussion with the PCIe HW
> folks regarding why our controller does not behave like "most
> hardware".  Thanks, Jim

I mentioned in the other thread [1] that I think the best way to
handle this is to figure out how to deal with the abort cleanly.
Using a test like *_pcie_link_up() to try to avoid it is a 99%
solution that means we'll see rare failures that are very difficult to
reproduce and debug.

> > The hardware might report errors, e.g., via AER, if the link is down.
> > And we might not not handle those nicely.  If we have issues there, we
> > should find out and fix them.

[1] https://lkml.kernel.org/r/20171214225821.GN30595-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
