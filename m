From: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC] Architecture independent pcibios?
Date: Tue, 8 Oct 2013 10:32:57 -0600
Message-ID: <CAErSpo5=sUJDZGm+zHw+b1h_a1YYbaGBshAutAoPBZYUCRbYkw@mail.gmail.com>
References: <20131008144211.GA25231@e102652-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131008144211.GA25231-CibnQJhq84/ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

[+cc Grant, Rob, devicetree list]

On Tue, Oct 8, 2013 at 8:42 AM, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wrote:
> Hello,
>
> I am working on adding PCIe support for a new architecture and looking
> at various existing implementations of pcibios functions I've realised
> that some architectures share a lot of common code. As I don't like to
> repeat the pattern again without any good reasons, I am wondering if
> there is any appetite for carving out those common functions into
> a generic place under drivers/pci/pcibios.c where they can be reused.
>
> Things that I am specifically looking at are pcibios_{alloc,free}_controller,
> pci_process_bridge_OF_ranges and anything that will make adding support
> for PCI/PCIe in a new architecture easier. Candidates for promoting
> to a generic place are the functions found in both powerpc and microblaze
> as they seem to be mostly identical, they support DT bindings and are
> 64bits ready.

I'm very much in favor of unifying code to reduce duplication across
architectures.

In general, the pcibios_*() interfaces are things used by the PCI core
(drivers/pci) but implemented by the architecture.  The specific cases
you mentioned are not actually used by the PCI core, so my inclination
would be to name them something else and possibly put them somewhere
other than drivers/pci.

I wonder if pci_process_bridge_OF_ranges() would fit somewhere in
drivers/of?  The implementations I looked at are mostly concerned with
parsing OF resources, and they don't have much to do with PCI
directly.

pcibios_alloc_controller() is implemented by microblaze, powerpc, and
xtensa.  Each of those arches defines its own "struct pci_controller",
so it won't be completely trivial to unify this.  I tried to start
some unification with the "struct pci_host_bridge" in the core, but
haven't made much progress there.

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
