From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 0/3] Tango PCIe controller support
Date: Wed, 5 Jul 2017 22:39:46 -0500
Message-ID: <20170706033946.GO13824@bhelgaas-glaptop.roam.corp.google.com>
References: <987fac41-80dc-f1d0-ec0b-91ae57b91bfd@sigmadesigns.com>
 <20170704202412.GK13824@bhelgaas-glaptop.roam.corp.google.com>
 <6256cab3-dd77-c0f6-66b8-be261695bbb1@free.fr>
 <20170705180359.GL13824@bhelgaas-glaptop.roam.corp.google.com>
 <5a1207cb-31fd-6b85-86af-8c37bd57ad4f@free.fr>
 <20170705213419.GD25063@bhelgaas-glaptop.roam.corp.google.com>
 <8dcab663-245b-880a-be3a-2965fd12d663@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <8dcab663-245b-880a-be3a-2965fd12d663-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mason <slash.tmp-GANU6spQydw@public.gmane.org>
Cc: Marc Gonzalez <marc_gonzalez-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DT <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thibaud Cornic <thibaud_cornic-y1yR0Z3OICC7zZZRDBGcUA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 05, 2017 at 11:59:33PM +0200, Mason wrote:
> On 05/07/2017 23:34, Bjorn Helgaas wrote:
> 
> > On Wed, Jul 05, 2017 at 10:39:19PM +0200, Mason wrote:
> >
> >> On 05/07/2017 20:03, Bjorn Helgaas wrote:

> > If you confirm that
> > https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/commit/?h=pci/host-tango&id=d752a8b29345
> > works for you, I'll include it in my v4.13 pull request.
> 
> There were a few nits I wanted to address:
> 
> - Since we added suppress_bind_attrs = true, probe()
> can only be called at init, so I wanted to mark __init
> all the probe functions, to save space.
> 
> - I left the definition of MSI_MAX in the wrong patch
> 
> - You put a pointer to the pdev in the struct tango_pcie.
> I think this is redundant, since the pdev already has a
> pointer to the struct, as drvdata.
> So I wanted to change tango_msi_probe() to take a pdev
> as argument (to make it more like an actual probe function)
> and derive pcie from pdev, instead of the other way around.

I don't think tango_msi_probe() is really a "probe" function.  It's
all part of the tango driver, and it's not claiming a separate piece
of hardware.  So I would keep the name and structure similar to these:

  advk_pcie_init_msi_irq_domain()
  nwl_pcie_init_msi_irq_domain()

BTW, those functions use irq_domain_add_linear(), while you are one of
the very few callers of irq_domain_create_linear().  Why the difference?
If your code does basically the same thing, it's very helpful to me if
it *looks* basically the same.

> Can I send you a patch series with these changes on Friday?

I was planning to ask Linus to pull my branch tomorrow or Friday
because I'm going on vacation next week and I don't want to leave
right after he pulls it.  So the sooner the better.

Bjorn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
