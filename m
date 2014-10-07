From: Liviu Dudau <Liviu.Dudau-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 3/6] pci, thunder: Add PCIe host controller devicetree
 bindings
Date: Tue, 7 Oct 2014 16:01:49 +0100
Message-ID: <20141007150149.GW4652@e106497-lin.cambridge.arm.com>
References: <1411573068-12952-1-git-send-email-rric@kernel.org>
 <1411573068-12952-4-git-send-email-rric@kernel.org>
 <3082935.e3X4GsVUDn@wuerfel>
 <20141007142744.GE31556@rric.localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141007142744.GE31556-vWBEXY7mpu73kLQC+b9v0A@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Richter <robert.richter-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Robert Richter <rric-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sunil Goutham <sgoutham-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 07, 2014 at 03:27:44PM +0100, Robert Richter wrote:
> On 24.09.14 18:06:04, Arnd Bergmann wrote:
> > > +               compatible =3D "cavium,thunder-pcie";
> > > +               device_type =3D "pci";
> > > +               msi-parent =3D <&its>;
> > > +               bus-range =3D <0 255>;
> > > +               #size-cells =3D <2>;
> > > +               #address-cells =3D <3>;
> > > +               reg =3D <0x8480 0x00000000 0 0x10000000>;  /* Con=
figuration space */
> > > +               ranges =3D <0x03000000 0x8010 0x00000000 0x8010 0=
x00000000 0x70 0x00000000>, /* mem ranges */
> > > +                       <0x03000000 0x8300 0x00000000 0x8300 0x00=
000000 0x80 0x00000000>,
> > > +                       <0x03000000 0x87e0 0x00000000 0x87e0 0x00=
000000 0x01 0x00000000>;
> > > +        };
> >=20
> > If you claim the entire 0-255 bus range, I think you should also
> > specify a domain, otherwise it's not predictable which domain you
> > get.
>=20
> Liviu's code assigns a unique id to the domain if missing, see
> of_pci_get_domain_nr(). So I don't think we need to add a "pci-domain=
"
> property here.

Not anymore! That function is gone in v12 onwards. What is in -next has
a new function called of_get_pci_domain_nr() (slight name change) but
that only gets the value set in the "linux,pci-domain" property of the
device node. It is the choice of the host bridge driver to use that
function or to use pci_get_new_domain_nr() which *does* generate an
unique id every time it gets called.

>=20
> Liviu's DT implementation that assigns a unique number differs a bit
> from ACPI which states: "If _SEG [aka domain number] does not exist,
> OSPM assumes that all PCI bus segments are in PCI Segment Group 0."
>=20
> Maybe of_pci_get_domain_nr() should be similar to ACPI. If there are
> multiple root bridges, the "pci-domain" property could be forced
> instead.

Indeed. But the enforcing is left as an exercise to the host bridge
implementor for the moment.

Best regards,
Liviu

>=20
> -Robert
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
