From: Liviu Dudau <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org>
Subject: Re: [PATCH v6 3/3] arm64: Add architecture support for PCI
Date: Thu, 13 Mar 2014 00:11:09 +0000
Message-ID: <20140313001109.GA6915@bart.dudau.co.uk>
References: <1394020150-1875-1-git-send-email-Liviu.Dudau@arm.com>
 <1394020150-1875-4-git-send-email-Liviu.Dudau@arm.com>
 <000101cf3dce$df2c1840$9d8448c0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <000101cf3dce$df2c1840$9d8448c0$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: 'Liviu Dudau' <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>, 'linux-pci' <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, 'Bjorn Helgaas' <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, 'Catalin Marinas' <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, 'Will Deacon' <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, 'linaro-kernel' <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, 'Benjamin Herrenschmidt' <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, 'LKML' <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'LAKML' <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, 'Tanmay Inamdar' <tinamdar-qTEPVZfXA3Y@public.gmane.org>, 'Arnd Bergmann' <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 12, 2014 at 05:41:33PM +0900, Jingoo Han wrote:
> On Wednesday, March 05, 2014 8:49 PM, Liviu Dudau wrote:
> > 
> > Use the generic host bridge functions to provide support for
> > PCI Express on arm64. There is no support for ISA memory.
> > 
> > Signed-off-by: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
> > Tested-by: Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>
> > ---
> >  arch/arm64/Kconfig            |  19 +++-
> >  arch/arm64/include/asm/Kbuild |   1 +
> >  arch/arm64/include/asm/io.h   |   3 +-
> >  arch/arm64/include/asm/pci.h  |  49 +++++++++
> >  arch/arm64/kernel/Makefile    |   1 +
> >  arch/arm64/kernel/pci.c       | 173 ++++++++++++++++++++++++++++++++
> >  6 files changed, 244 insertions(+), 2 deletions(-)
> >  create mode 100644 arch/arm64/include/asm/pci.h
> >  create mode 100644 arch/arm64/kernel/pci.c
> 
> [.....]
> 
> > --- /dev/null
> > +++ b/arch/arm64/include/asm/pci.h
> 
> [.....]
> 
> > +
> > +static inline int pci_domain_nr(struct pci_bus *bus)
> > +{
> > +	struct pci_host_bridge *bridge = find_pci_host_bridge(bus);
> > +
> > +	if (bridge)
> > +		return bridge->domain_nr;
> > +
> > +	return 0;
> > +}
> 
> Hi Liviu Dudau,
> 
> When CONFIG_PCI=n, the following build errors happen. :-(
> Would you confirm this?
> 
> In file included from include/linux/pci.h:1393:0,
>                  from drivers/scsi/scsi_lib.c:19:
> arch/arm64/include/asm/pci.h:31:19: error: redefinition of 'pci_domain_nr'
>  static inline int pci_domain_nr(struct pci_bus *bus)
>                    ^
> In file included from drivers/scsi/scsi_lib.c:19:0:
> include/linux/pci.h:1383:19: note: previous definition of 'pci_domain_nr' was here
>  static inline int pci_domain_nr(struct pci_bus *bus) { return 0; }
>                    ^
>              .....

Hi Jingoo,

I confirm the build error. Sorry for missing out on this test. I've now got out
of some more pressing tasks and I will post v7 tomorrow.

Best regards,
Liviu

> 
> Best regards,
> Jingoo Han
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
-------------------
   .oooO
   (   )
    \ (  Oooo.
     \_) (   )
          ) /
         (_/

 One small step
   for me ...

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
