From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 0/3] Add support for PCI in AArch64
Date: Tue, 22 Apr 2014 11:11:12 +0100
Message-ID: <20140422101112.GA865@e106497-lin.cambridge.arm.com>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com>
 <CA+b37P3HqMFU6kGA+GH3YpGM_Z=TwNXL6jKu+ConR3kCk-Tp4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+b37P3HqMFU6kGA+GH3YpGM_Z=TwNXL6jKu+ConR3kCk-Tp4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sandeepa Prabhu <sandeepa.prabhu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 22, 2014 at 09:58:28AM +0100, Sandeepa Prabhu wrote:
> On 14 March 2014 21:04, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> wrote:
> > Hi,
> >
> > This patch adds support for PCI to AArch64. It is based on my v7 pa=
tch
> > that adds support for creating generic host bridge structure from
> > device tree. With that in place, I was able to boot a platform that
> > has PCIe host bridge support and use a PCIe network card.
> Hi Liviu,
>=20
> Are these patches (including your other patchset for device tree host
> bridge support ) available on a public git repo I can checkout from?

Yes, I have pushed them into git://linux-arm.org/linux-ld.git

Best regards,
Liviu

>=20
> Thanks,
> ~Sandeepa
>=20
> >
> > I have dropped the RFC tag from the subject as I now have the ambit=
ious goal
> > of trying to get it mainlined.
> >
> > Changes from v6:
> >   - Guard the pci_domain_nr() inline implementation with #ifdef CON=
=46IG_PCI as
> >     to avoid conflict with default empty version present in include=
/linux/pci.h.
> >     Thanks to Jingoo Han for catching this.
> >
> > Changes from v5:
> >   - Removed pcibios_fixup_bridge_ranges() as the week default versi=
on is fine.
> >   - Removed the ALIGN() call in pcibios_align_resource()
> >   - Stopped exporting pcibios_align_resource()
> >
> > Changes from v4:
> >   - Fixed the pci_domain_nr() implementation for arm64. Now we use
> >     find_pci_host_bride() to find the host bridge before we retriev=
e
> >     the domain number.
> >
> > Changes from v3:
> >   - Added Acks accumulated so far ;)
> >   - Still carrying Catalin's patch for moving the PCI_IO_BASE until=
 it
> >     lands in linux-next or mainline, in order to ease applying the =
series
> >
> > Changes from v2:
> >   - Implement an arch specific version of pci_register_io_range() a=
nd
> >     pci_address_to_pio().
> >   - Return 1 from pci_proc_domain().
> >
> > Changes from v1:
> >   - Added Catalin's patch for moving the PCI_IO_BASE location and e=
xtend
> >     its size to 16MB
> >   - Integrated Arnd's version of pci_ioremap_io that uses a bitmap =
for
> >     keeping track of assigned IO space and returns an io_offset. At=
 the
> >     moment the code is added in arch/arm64 but it can be moved in d=
rivers/pci.
> >   - Added a fix for the generic ioport_map() function when !CONFIG_=
GENERIC_IOMAP
> >     as suggested by Arnd.
> >
> > v6 thread here: https://lkml.org/lkml/2014/3/5/41
> > v5 thread here: https://lkml.org/lkml/2014/3/4/307
> > v4 thread here: https://lkml.org/lkml/2014/3/3/298
> > v3 thread here: https://lkml.org/lkml/2014/2/28/211
> > v2 thread here: https://lkml.org/lkml/2014/2/27/255
> > v1 thread here: https://lkml.org/lkml/2014/2/3/389
> >
> >
> > The API used is different from the one used by ARM architecture. Th=
ere is
> > no pci_common_init_dev() function and no hw_pci structure, as that =
is no
> > longer needed. Once the last signature is added to the legal agreem=
ent, I
> > will post the host bridge driver code that I am using. Meanwhile, h=
ere
> > is an example of what the probe function looks like, posted as an e=
xample:
> >
> > static int myhostbridge_probe(struct platform_device *pdev)
> > {
> >         int err;
> >         struct device_node *dev;
> >         struct pci_host_bridge *bridge;
> >         struct myhostbridge_port *pp;
> >         resource_size_t lastbus;
> >
> >         dev =3D pdev->dev.of_node;
> >
> >         if (!of_device_is_available(dev)) {
> >                 pr_warn("%s: disabled\n", dev->full_name);
> >                 return -ENODEV;
> >         }
> >
> >         pp =3D kzalloc(sizeof(struct myhostbridge_port), GFP_KERNEL=
);
> >         if (!pp)
> >                 return -ENOMEM;
> >
> >         bridge =3D of_create_pci_host_bridge(&pdev->dev, &myhostbri=
dge_ops, pp);
> >         if (IS_ERR(bridge)) {
> >                 err =3D PTR_ERR(bridge);
> >                 goto bridge_create_fail;
> >         }
> >
> >         err =3D myhostbridge_setup(bridge->bus);
> >         if (err)
> >                 goto bridge_setup_fail;
> >
> >         /* We always enable PCI domains and we keep domain 0 backwa=
rd
> >          * compatible in /proc for video cards
> >          */
> >         pci_add_flags(PCI_ENABLE_PROC_DOMAINS);
> >         pci_add_flags(PCI_REASSIGN_ALL_BUS | PCI_REASSIGN_ALL_RSRC)=
;
> >
> >         lastbus =3D pci_scan_child_bus(bridge->bus);
> >         pci_bus_update_busn_res_end(bridge->bus, lastbus);
> >
> >         pci_assign_unassigned_bus_resources(bridge->bus);
> >
> >         pci_bus_add_devices(bridge->bus);
> >
> >         return 0;
> >
> > bridge_setup_fail:
> >         put_device(&bridge->dev);
> >         device_unregister(&bridge->dev);
> > bridge_create_fail:
> >         kfree(pp);
> >         return err;
> > }
> >
> > Best regards,
> > Liviu
> >
> >
> > Catalin Marinas (1):
> >   arm64: Extend the PCI I/O space to 16MB
> >
> > Liviu Dudau (2):
> >   Fix ioport_map() for !CONFIG_GENERIC_IOMAP cases.
> >   arm64: Add architecture support for PCI
> >
> >  Documentation/arm64/memory.txt |  16 +--
> >  arch/arm64/Kconfig             |  19 +++-
> >  arch/arm64/include/asm/Kbuild  |   1 +
> >  arch/arm64/include/asm/io.h    |   5 +-
> >  arch/arm64/include/asm/pci.h   |  51 +++++++++
> >  arch/arm64/kernel/Makefile     |   1 +
> >  arch/arm64/kernel/pci.c        | 173 +++++++++++++++++++++++++++++=
++
> >  include/asm-generic/io.h       |   2 +-
> >  8 files changed, 258 insertions(+), 10 deletions(-)
> >  create mode 100644 arch/arm64/include/asm/pci.h
> >  create mode 100644 arch/arm64/kernel/pci.c
> >
> > --
> > 1.9.0
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>=20

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    =C2=AF\_(=E3=83=84)_/=C2=AF

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
