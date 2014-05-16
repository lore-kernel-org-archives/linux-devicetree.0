From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v7 0/3] Add support for PCI in AArch64
Date: Fri, 16 May 2014 14:24:51 +0100
Message-ID: <20140516132451.GK967@e106497-lin.cambridge.arm.com>
References: <1394811258-1500-1-git-send-email-Liviu.Dudau@arm.com>
 <CA+sq2Ccok5wtKjCZUkBhhj3WsiqFAoMgHK7LY210aBtMku+8SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+sq2Ccok5wtKjCZUkBhhj3WsiqFAoMgHK7LY210aBtMku+8SA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sunil Kovvuri <sunil.kovvuri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, linaro-kernel <linaro-kernel-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Tanmay Inamdar <tinamdar-qTEPVZfXA3Y@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "kdb-JdWt/H98ok1AfugRpC6u6w@public.gmane.org" <kdb-JdWt/H98ok1AfugRpC6u6w@public.gmane.org>, "yu.zhao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <yu.zhao-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Sunil,

On Fri, May 16, 2014 at 11:33:04AM +0100, Sunil Kovvuri wrote:
> Hi Liviu,
>=20
> I am using your ARM64 PCIe patches to write a PCIe host controller
> driver for our SOC. I am facing an issue with SR-IOV capable device.
>=20
> Consider an PCI Express endpoint connected to a PCI Express
> Root Port.  The PCI Express endpoint provides PCI-SIG SR-IOV
> capabilities with a single physical function and a large number
> of virtual functions.  The Root Port contains a pci-pci bridge in
> between it and the SR-IOV device.
>=20
> When the SR-IOV capable device's driver tries to enable sriov
> (pci_enable_sriov()) it fails to create/add PCI device for each
> virtual function reporting  "not enough MMIO resources for SR-IOV".
>=20
> In sriov_enable() (drivers/pci/iov.c)
>=20
>  296        for (i =3D 0; i < PCI_SRIOV_NUM_BARS; i++) {
>  297                 bars |=3D (1 << (i + PCI_IOV_RESOURCES));
>  298                 res =3D dev->resource + PCI_IOV_RESOURCES + i;
>  299                 if (res->parent)
>  300                         nres++;
>  301         }
>  302         if (nres !=3D iov->nres) {
>  303                 dev_err(&dev->dev, "not enough MMIO resources fo=
r
>  SR-IOV\n");
>  304                 return -ENOMEM;
>  305         }
>=20
> Here its checking if physical function's IOV resource has a parent or=
 not.
> Which is pci-pci bridge in this case. Otherwise it doesn't consider
> that resource.
>=20
> Added below api to your patch.
> This will try to claim a resource while creating a PCI device which
> inturn sets 'res->parent'.
>=20
> Let me know if this is okay.
>=20
> diff --git a/arch/arm64/kernel/pci.c b/arch/arm64/kernel/pci.c
> index 9f29c9a..fbfb48f 100644
> --- a/arch/arm64/kernel/pci.c
> +++ b/arch/arm64/kernel/pci.c
> @@ -125,6 +125,21 @@ resource_size_t pcibios_align_resource(void
> *data, const struct resource *res,
>         return res->start;
>  }
>=20
> +int pcibios_add_device(struct pci_dev *pdev)
> +{
> +        unsigned int i, type_mask =3D IORESOURCE_IO | IORESOURCE_MEM=
;
> +        struct resource *res;
> +
> +        for (i =3D 0; i < PCI_NUM_RESOURCES; i++) {
> +                res =3D &pdev->resource[i];
> +                if (res->parent || !(res->flags & type_mask))
> +                        continue;
> +                pci_claim_resource(pdev, i);
> +        }
> +
>=20

I would like not to have to add your patch in this file as I am trying =
to
remove it entirely. I don't have an SR-IOV capable device in my setup s=
o
I am not able to debug your problem, but could you have a go and try to
figure out why the SR-IOV resources do not get a parent associated with
when they get created?

Many thanks,
Liviu


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
