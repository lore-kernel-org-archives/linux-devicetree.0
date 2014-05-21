From: "Liviu Dudau" <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org>
Subject: Re: [PATCH v7 0/3] Add support for PCI in AArch64
Date: Wed, 21 May 2014 12:34:21 +0100
Message-ID: <20140521113421.GB13511@bart.dudau.co.uk>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com>
 <CA+sq2Ccok5wtKjCZUkBhhj3WsiqFAoMgHK7LY210aBtMku+8SA@mail.gmail.com>
 <20140516132451.GK967@e106497-lin.cambridge.arm.com>
 <CA+sq2CejJFg--0rS1arr4Sactp-ssENB8Y3g4b61JPGPBCms=A@mail.gmail.com>
 <CA+sq2Ccp0_4hgbbWa27bkYcqiXY6Ckr8eckWnHwANvhWNo97fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CA+sq2Ccp0_4hgbbWa27bkYcqiXY6Ckr8eckWnHwANvhWNo97fg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sunil Kovvuri <sunil.kovvuri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "kdb-JdWt/H98ok1AfugRpC6u6w@public.gmane.org" <kdb-JdWt/H98ok1AfugRpC6u6w@public.gmane.org>, "yu.zhao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <yu.zhao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, May 21, 2014 at 04:45:29PM +0530, Sunil Kovvuri wrote:
> Hi Liviu,
>=20
> Sorry for the trouble.
> I got why 'res->parent' is not set in my case.
> Basically my SR-IOV device has fixed resources, so resources will not
> be allocated/assigned and hence parent resource is not set.
> I will move the resource claiming to host controller driver as a fixu=
p
> so that parent resource hierarchy is set.
>=20
> Thanks for the support.

Glad you worked out the cause for the problem. I will still at to my li=
st of
ToDo things to investigate resource parenting with my patchset.

Best regards,
Liviu

>=20
> Regards,
> Sunil.
>=20
>=20
> On Fri, May 16, 2014 at 11:12 PM, Sunil Kovvuri <sunil.kovvuri@gmail.=
com> wrote:
> > Hi Liviu,
> >
> > Issue may not be only with SR-IOV resources.
> >
> > I am not an expert with Linux PCI core. But i am trying to understa=
nd
> > how even for a non SR-IOV capable device's resource, gets a parent
> > associated with it.
> >
> > When a PCI device driver calls pci_enable_device() which inturn cal=
ls
> > 'arch/arm64/kernel/pci.c' pcibios_enable_device() which uses Linux =
PCI core
> > API 'pci_enable_resources'. This API checks 'res->parent' for all
> > valid resources
> > before enabling them, otherwise it fails.
> >                 if (!r->parent) {
> >                         dev_err(&dev->dev, "device not available "
> >                                 "(can't reserve %pR)\n", r);
> >                         return -EINVAL;
> >                 }
> >
> > Can you please let me know where this hierarchy is being set for
> > 'pcibios_enable_resources' to work.
> >
> > I could only find request_resource() API which sets the parent and
> > pci_claim_resource() uses this.
> >
> > Thanks,
> > Sunil.
> >
> > On Fri, May 16, 2014 at 6:54 PM, Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org> =
wrote:
> >> Hi Sunil,
> >>
> >> On Fri, May 16, 2014 at 11:33:04AM +0100, Sunil Kovvuri wrote:
> >>> Hi Liviu,
> >>>
> >>> I am using your ARM64 PCIe patches to write a PCIe host controlle=
r
> >>> driver for our SOC. I am facing an issue with SR-IOV capable devi=
ce.
> >>>
> >>> Consider an PCI Express endpoint connected to a PCI Express
> >>> Root Port.  The PCI Express endpoint provides PCI-SIG SR-IOV
> >>> capabilities with a single physical function and a large number
> >>> of virtual functions.  The Root Port contains a pci-pci bridge in
> >>> between it and the SR-IOV device.
> >>>
> >>> When the SR-IOV capable device's driver tries to enable sriov
> >>> (pci_enable_sriov()) it fails to create/add PCI device for each
> >>> virtual function reporting  "not enough MMIO resources for SR-IOV=
".
> >>>
> >>> In sriov_enable() (drivers/pci/iov.c)
> >>>
> >>>  296        for (i =3D 0; i < PCI_SRIOV_NUM_BARS; i++) {
> >>>  297                 bars |=3D (1 << (i + PCI_IOV_RESOURCES));
> >>>  298                 res =3D dev->resource + PCI_IOV_RESOURCES + =
i;
> >>>  299                 if (res->parent)
> >>>  300                         nres++;
> >>>  301         }
> >>>  302         if (nres !=3D iov->nres) {
> >>>  303                 dev_err(&dev->dev, "not enough MMIO resource=
s for
> >>>  SR-IOV\n");
> >>>  304                 return -ENOMEM;
> >>>  305         }
> >>>
> >>> Here its checking if physical function's IOV resource has a paren=
t or not.
> >>> Which is pci-pci bridge in this case. Otherwise it doesn't consid=
er
> >>> that resource.
> >>>
> >>> Added below api to your patch.
> >>> This will try to claim a resource while creating a PCI device whi=
ch
> >>> inturn sets 'res->parent'.
> >>>
> >>> Let me know if this is okay.
> >>>
> >>> diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
> >>> index 9f29c9a..fbfb48f 100644
> >>> --- a/arch/arm64/kernel/pci.c
> >>> +++ b/arch/arm64/kernel/pci.c
> >>> @@ -125,6 +125,21 @@ resource_size_t pcibios_align_resource(void
> >>> *data, const struct resource *res,
> >>>         return res->start;
> >>>  }
> >>>
> >>> +int pcibios_add_device(struct pci_dev *pdev)
> >>> +{
> >>> +        unsigned int i, type_mask =3D IORESOURCE_IO | IORESOURCE=
_MEM;
> >>> +        struct resource *res;
> >>> +
> >>> +        for (i =3D 0; i < PCI_NUM_RESOURCES; i++) {
> >>> +                res =3D &pdev->resource[i];
> >>> +                if (res->parent || !(res->flags & type_mask))
> >>> +                        continue;
> >>> +                pci_claim_resource(pdev, i);
> >>> +        }
> >>> +
> >>>
> >>
> >> I would like not to have to add your patch in this file as I am tr=
ying to
> >> remove it entirely. I don't have an SR-IOV capable device in my se=
tup so
> >> I am not able to debug your problem, but could you have a go and t=
ry to
> >> figure out why the SR-IOV resources do not get a parent associated=
 with
> >> when they get created?
> >>
> >> Many thanks,
> >> Liviu
> >>
> >>
> >> --
> >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> | I would like to |
> >> | fix the world,  |
> >> | but they're not |
> >> | giving me the   |
> >>  \ source code!  /
> >>   ---------------
> >>     =C2=AF\_(=E3=83=84)_/=C2=AF
> >>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" =
in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20

--=20
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
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
