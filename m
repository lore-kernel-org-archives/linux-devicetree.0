From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH 3/6] pci, thunder: Add PCIe host controller devicetree
 bindings
Date: Wed, 8 Oct 2014 17:44:32 +0100
Message-ID: <20141008164432.GC15382@e106497-lin.cambridge.arm.com>
References: <1411573068-12952-1-git-send-email-rric@kernel.org>
 <1411573068-12952-4-git-send-email-rric@kernel.org>
 <3082935.e3X4GsVUDn@wuerfel>
 <20141007142744.GE31556@rric.localhost>
 <20141007150149.GW4652@e106497-lin.cambridge.arm.com>
 <20141008084927.GH31556@rric.localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20141008084927.GH31556@rric.localhost>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Richter <robert.richter@caviumnetworks.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Robert Richter <rric@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sunil Goutham <sgoutham@cavium.com>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 08, 2014 at 09:49:27AM +0100, Robert Richter wrote:
> On 07.10.14 16:01:49, Liviu Dudau wrote:
> > On Tue, Oct 07, 2014 at 03:27:44PM +0100, Robert Richter wrote:
> > > On 24.09.14 18:06:04, Arnd Bergmann wrote:
> > > > > +               compatible =3D "cavium,thunder-pcie";
> > > > > +               device_type =3D "pci";
> > > > > +               msi-parent =3D <&its>;
> > > > > +               bus-range =3D <0 255>;
> > > > > +               #size-cells =3D <2>;
> > > > > +               #address-cells =3D <3>;
> > > > > +               reg =3D <0x8480 0x00000000 0 0x10000000>;  /*=
 Configuration space */
> > > > > +               ranges =3D <0x03000000 0x8010 0x00000000 0x80=
10 0x00000000 0x70 0x00000000>, /* mem ranges */
> > > > > +                       <0x03000000 0x8300 0x00000000 0x8300 =
0x00000000 0x80 0x00000000>,
> > > > > +                       <0x03000000 0x87e0 0x00000000 0x87e0 =
0x00000000 0x01 0x00000000>;
> > > > > +        };
> > > >=20
> > > > If you claim the entire 0-255 bus range, I think you should als=
o
> > > > specify a domain, otherwise it's not predictable which domain y=
ou
> > > > get.
> > >=20
> > > Liviu's code assigns a unique id to the domain if missing, see
> > > of_pci_get_domain_nr(). So I don't think we need to add a "pci-do=
main"
> > > property here.
> >=20
> > Not anymore! That function is gone in v12 onwards. What is in -next=
 has
> > a new function called of_get_pci_domain_nr() (slight name change) b=
ut
> > that only gets the value set in the "linux,pci-domain" property of =
the
> > device node. It is the choice of the host bridge driver to use that
> > function or to use pci_get_new_domain_nr() which *does* generate an
> > unique id every time it gets called.
>=20
> I am quite confused a bit on which is the latest code base now. I was
> looking into Bjorn's pci/host-generic and there is a different
> implemetation:
>=20
> ----
> /**
>  * This function will try to obtain the host bridge domain number by
>  * using of_alias_get_id() call with "pci-domain" as a stem.  If that
>  * fails, a local allocator will be used.  The local allocator can
>  * be requested to return a new domain_nr if the information is missi=
ng
>  * from the device tree.
>  *
>  * @node: device tree node with the domain information
>  * @allocate_if_missing: if DT lacks information about the domain nr,
>  * allocate a new number.
>  *
>  * Returns the associated domain number from DT, or a new domain numb=
er
>  * if DT information is missing and @allocate_if_missing is true.  If
>  * @allocate_if_missing is false then the last allocated domain numbe=
r
>  * will be returned.
>  */
> int of_pci_get_domain_nr(struct device_node *node, bool allocate_if_m=
issing)
> {
>         int domain;
>=20
>         domain =3D atomic_read(&of_domain_nr);
>         if (domain =3D=3D -1) {
>                 /* first run, get max defined domain nr in device tre=
e */
>                 domain =3D of_get_max_pci_domain_nr();
>                 /* then set the start value for allocator to be max +=
 1 */
>                 atomic_set(&of_domain_nr, domain + 1);
>         }
>         domain =3D of_alias_get_id(node, "pci-domain");
>         if (domain =3D=3D -ENODEV) {
>                 domain =3D atomic_read(&of_domain_nr);
>                 if (allocate_if_missing)
>                         atomic_inc(&of_domain_nr);
>         }
>=20
>         return domain;
> }
> EXPORT_SYMBOL_GPL(of_pci_get_domain_nr);
> ----
>=20
> This differs also from v13. Please check.

I'm not sure what you are looking at. Commit 41e5c0f81d3e does look lik=
e
my v13. Not sure why you are still seeing this v11 version.


>=20
> It would be good to have a stable code base to work with, so I would
> prefer incremental patches on top of Bjorn's pci/host-generic.

Agreed, but from what I can see from my side pci/host-generic and next
have the same versions, so there should not be any confusion.

Best regards,
Liviu

>=20
> > > Liviu's DT implementation that assigns a unique number differs a =
bit
> > > from ACPI which states: "If _SEG [aka domain number] does not exi=
st,
> > > OSPM assumes that all PCI bus segments are in PCI Segment Group 0=
=2E"
> > >=20
> > > Maybe of_pci_get_domain_nr() should be similar to ACPI. If there =
are
> > > multiple root bridges, the "pci-domain" property could be forced
> > > instead.
> >=20
> > Indeed. But the enforcing is left as an exercise to the host bridge
> > implementor for the moment.
>=20
> Right, can be added later.
>=20
> Thanks,
>=20
> -Robert
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
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
