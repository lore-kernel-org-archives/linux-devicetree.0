From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC PATCH 0/3] drivers: port PCIe designware to new DT parsing API
Date: Mon, 19 Jan 2015 10:40:39 -0600
Message-ID: <CAL_JsqLYg9vhFVmf=O4YLPfboj-dyoCR0H5dzBbMC3PeAEOwhQ@mail.gmail.com>
References: <1420644571-18928-1-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420644571-18928-1-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>, Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 7, 2015 at 9:29 AM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> The introduction of the DT API:
>
> of_pci_get_host_bridge_resources()
>
> allows to retrieve PCI resources from the device tree in a generic way.
>
> Some PCI host controllers, in addition to standard IO and MEM resources and
> corresponding CPU addresses, require to retrieve the addresses that are used
> for bus routing of IO/MEM regions as seen at the bus level corresponding
> to the bus segment the host controller is sitting on, so that the host
> controller can programme its inbound/outbound memory regions correctly to
> respond to bus transactions coming from the CPU on the host controller bus
> ports.
>
> The DT generic layer provides functions that carry out the PCI
> ranges <-> resources translation from PCI addresses to CPU addresses (as
> seen at the CPU top level bus, through all required hierarchical bus layers),
> but there is no generic API to retrieve the PCI range CPU untranslated
> addresses, so PCI host controllers have to do it in a driver specific way
> through the DT property parsing methods.
>
> This patchset converts the PCIe designware host controller driver to
> use the API:
>
> of_pci_get_host_bridge_resources()
>
> in order to retrieve the PCI regions resources. To achieve generality, it
> also augments the parsing API so that a new DT struct is created out of
> PCI ranges, that contains the PCI resource and the range parser itself
> so that it can be passed back to PCI host controllers drivers that
> can, if needed, use it to parse the CPU untranslated addresses
> corresponding to the resource in question.

I don't really like exposing ranges to host drivers. We've worked to
not do that. So perhaps we need to rethink the API. I think we need to
provide each range as a pair of resources which are the CPU address
and PCI address. Perhaps an iterator is kind of pointless here. We do
different things for each one. Are there cases with more than a single
i/o space, non-prefetch memory and prefetch memory range? Perhaps we
should just get the i/o and memory resources as separate calls. Just
tossing out some ideas here.

> The first patch in the series is a fix/update for the parsing function:
>
> of_pci_get_host_bridge_resources()

This one stands on its own and should go to stable perhap? If so, send
it separately.

Rob

>
> It is part of the RFC series since it is a controversial fix to be
> discussed before getting merged.
>
> Patch [2-3] augment the parsing API and convert the PCIe designware
> driver code.
>
> The current API stays unchanged, so that the existing drivers using it
> do not need patching and changes are limited.
>
> Tested on an iMX6 Sabrelite board.
>
> Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> Cc: Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>
> Cc: Mohit Kumar <mohit.kumar-qxv4g6HH51o@public.gmane.org>
> Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
> Lorenzo Pieralisi (3):
>   drivers: of: fix resources freeing in
>     of_pci_get_host_bridge_resources()
>   drivers: of: of_pci_get_host_bridge_resources() range parsing update
>   drivers: pci: host: update the pcie designware driver to new range
>     parsing API
>
>  drivers/of/of_pci.c                |  36 +++++++--
>  drivers/pci/host/pcie-designware.c | 145 +++++++++++++++++--------------------
>  drivers/pci/host/pcie-designware.h |   5 +-
>  include/linux/of_address.h         |   5 ++
>  4 files changed, 104 insertions(+), 87 deletions(-)
>
> --
> 2.2.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
