From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 2/5] PCI: Add quirk for PLDA's XpressRICH3 host bridge
 class.
Date: Mon, 12 Oct 2015 09:57:35 +0100
Message-ID: <20151012085735.GJ3394@e106497-lin.cambridge.arm.com>
References: <1444409849-5685-1-git-send-email-Liviu.Dudau@arm.com>
 <1444409849-5685-3-git-send-email-Liviu.Dudau@arm.com>
 <7335872.olmykfZgj7@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7335872.olmykfZgj7@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jon Medhurst <tixy-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-pci <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, device-tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAKML <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 09, 2015 at 08:32:07PM +0200, Arnd Bergmann wrote:
> On Friday 09 October 2015 17:57:26 Liviu Dudau wrote:
> > +/*
> > + * The PLDA's XpressRICH3 doesn't describe itself as a bridge. Thi=
s is required
> > + * for correct/normal enumeration.
> > + */
> > +static void xr3pci_quirk_class(struct pci_dev *pdev)
> > +{
> > +       pdev->class =3D PCI_CLASS_BRIDGE_PCI << 8;
> > +}
> > +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_PLDA, PCI_DEVICE_ID_XR3PCI, =
xr3pci_quirk_class);
> >=20
>=20
> Are you sure that this device ID is only used for the host bridge, no=
t
> for related devices in endpoint mode?

I would hope so. The device ID has been assigned to ARM's implementatio=
n by PLDA,
it would be logical not to be reused for anyone else's.

>=20
> While we don't support PCIe endpoint drivers at the moment, it might
> happen at some point and then things break when someone tries to
> plug a machine with this ID into a Linux host.

I'm asking for confirmation inside ARM that the IDs are uniquely alloca=
ted to Juno
and will come back when I'll get confirmation.

Best regards,
Liviu

>=20
> 	Arnd
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
