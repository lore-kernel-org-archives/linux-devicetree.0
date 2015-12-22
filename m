From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/2] PCI: generic: Refactor code to enable reuse by other drivers.
Date: Tue, 22 Dec 2015 22:13:21 +0100
Message-ID: <201512222213.21744.arnd@arndb.de>
References: <1450749222-15966-1-git-send-email-ddaney.cavm@gmail.com> <20151222100732.GD32623@arm.com> <5679968B.4090908@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5679968B.4090908-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 22 December 2015, David Daney wrote:
> On 12/22/2015 02:07 AM, Will Deacon wrote:
> > On Mon, Dec 21, 2015 at 05:53:41PM -0800, David Daney wrote:
> >> From: David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
> >> diff --git a/drivers/pci/host/pci-host-generic.c b/drivers/pci/host/pci-host-generic.c
> >> index 5434c90..e83cec7 100644
> >> --- a/drivers/pci/host/pci-host-generic.c
> >> +++ b/drivers/pci/host/pci-host-generic.c
> [...]
> >> -static int gen_pci_probe(struct platform_device *pdev)
> >> +int gen_pci_common_probe(struct platform_device *pdev,
> >> +			 struct gen_pci *pci)
> >
> > Whilst I'm fine with this patch, I don't know how Bjorn will feel about
> > exposing this function outside of the generic host driver. We could avoid
> > it by turning things upside-down and having the generic driver probe
> > the other drivers by matching a compatible string with a probe function
> > pointer, but I'd be interested to see what others think.
> >
> 
> Note: I know that pci-host-generic is not built as a loadable module, but...
> 
> struct of_device_id, MODULE_DEVICE_TABLE, struct platform_driver and the 
> registering of platform drivers is fairly well standardized in the 
> kernel, and module loading userpace tools.

Agreed, this is the correct way to do the abstraction if we want one, the way
that Will describes is generally not a good idea, and we've converted a
number of drivers that did it like that to the way you do it here.

> The struct of_device_id, MODULE_DEVICE_TABLE must really reside in the 
> same module as the driver for the device.   We are creating a separate 
> driver precisely because we don't want to mix all this ThunderX specific 
> code into the pci-host-generic driver when it is used by arm-32bit and 
> others.  This means that, at a minimum, we would have to export the 
> pci-host-generic probe function so that it could be referenced by struct 
> platform_driver in other modules.

Right.

> This brings up the next problem.  How to attach driver specific data to 
> the generic driver structures?  At first I tried augmenting  struct 
> gen_pci_cfg_bus_ops with a callback .init() function to be called by the 
> generic driver, but this would also require adding an an element to 
> struct gen_pci to point to a driver specific data object.  It felt a 
> little convoluted and complex.
> 
> This led me to the current design where struct gen_pci is embedded in 
> the driver specific structure, and the allocation of this is done in the 
> driver specific probe function.  No more callbacks, no additions to the 
> pci-host-generic structures.  I think it is a little cleaner this way.
> 
> If there are suggestions as to how it can be made cleaner yet, I would 
> be happy to implement and test them.

My idea of the long-term direction for the pci-host-generic driver
would be to move more parts into the PCI core code as library functions
that can be used by other drivers as well. This would also address my
other concern that I'd like to see the generic host driver remain the
simplest example that we have, and only require any additional code in
other drivers to add functionality or workarounds.

Adding an abstraction layer within the driver to some degree goes in the
opposite direction of that.

One approach that might work would be to split the existing driver into
three files: one for CAM, one for ECAM and one for the common parts,
with an interface similar to what you have here. Then you can add your
driver as a third front-end, and we can keep working on integrating the
common parts further into the PCI core.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
