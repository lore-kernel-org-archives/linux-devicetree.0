From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 4/6] pci: Introduce a domain number for
 pci_host_bridge.
Date: Tue, 8 Jul 2014 11:21:21 +0100
Message-ID: <20140708102121.GY6501@e106497-lin.cambridge.arm.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811272-1547-5-git-send-email-Liviu.Dudau@arm.com>
 <20140405000007.GD15806@google.com>
 <20140407084623.GG17163@e106497-lin.cambridge.arm.com>
 <1396862058.3671.40.camel@pasglop>
 <20140407100715.GI17163@e106497-lin.cambridge.arm.com>
 <CAErSpo7h+Yew2hBztzkOzcHU5r4OQebxFbcZGkNUwJwfTFsbfg@mail.gmail.com>
 <20140704145752.GJ6501@e106497-lin.cambridge.arm.com>
 <20140708011136.GE22939@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20140708011136.GE22939@google.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 08, 2014 at 02:11:36AM +0100, Bjorn Helgaas wrote:
> On Fri, Jul 4, 2014 at 8:57 AM, Liviu Dudau <Liviu.Dudau@arm.com> wro=
te:
> > On Mon, Apr 07, 2014 at 11:44:51PM +0100, Bjorn Helgaas wrote:
> >> On Mon, Apr 7, 2014 at 4:07 AM, Liviu Dudau <Liviu.Dudau@arm.com> =
wrote:
> >> > On Mon, Apr 07, 2014 at 10:14:18AM +0100, Benjamin Herrenschmidt=
 wrote:
> >> >> On Mon, 2014-04-07 at 09:46 +0100, Liviu Dudau wrote:
> >> >> >
> >> >> > *My* strategy is to get rid of pci_domain_nr(). I don't see w=
hy we need
> >> >> > to have arch specific way of providing the number, specially =
after looking
> >> >> > at the existing implementations that return a value from a va=
riable that
> >> >> > is never touched or incremented. My guess is that pci_domain_=
nr() was
> >> >> > created to work around the fact that there was no domain_nr m=
aintainance in
> >> >> > the generic code.
> >> >>
> >> >> Well, there was no generic host bridge structure. There is one =
now, it should
> >> >> go there.
> >> >
> >> > Exactly! Hence my patch. After it gets accepted I will go throug=
h architectures
> >> > and remove their version of pci_domain_nr().
> >>
> >> Currently the arch has to supply pci_domain_nr() because that's th=
e
> >> only way for the generic code to learn the domain.  After you add
> >> pci_create_root_bus_in_domain(), the arch can supply the domain th=
at
> >> way, and we won't need the arch-specific pci_domain_nr().  Right?
> >> That makes more sense to me; thanks for the explanation.
> >>
> >> Let me try to explain my concern about the
> >> pci_create_root_bus_in_domain() interface.  We currently have thes=
e
> >> interfaces:
> >>
> >>   pci_scan_root_bus()
> >>   pci_scan_bus()
> >>   pci_scan_bus_parented()
> >>   pci_create_root_bus()
> >>
> >> pci_scan_root_bus() is a higher-level interface than
> >> pci_create_root_bus(), so I'm trying to migrate toward it because =
it
> >> lets us remove a little code from the arch, e.g., pci_scan_child_b=
us()
> >> and pci_bus_add_devices().
> >>
> >> I think we can only remove the arch-specific pci_domain_nr() if th=
at
> >> arch uses pci_create_root_bus_in_domain().  When we convert an arc=
h
> >> from using scan_bus interfaces to using
> >> pci_create_root_bus_in_domain(), we will have to move the rest of =
the
> >> scan_bus code (pci_scan_child_bus(), pci_bus_add_devices()) back i=
nto
> >> the arch code.
> >>
> >> One alternative is to add an _in_domain() variant of each of these
> >> interfaces, but that doesn't seem very convenient either.  My idea=
 of
> >> passing in a structure would also require adding variants, so ther=
e's
> >> not really an advantage there, but I am thinking of the next
> >> unification effort, e.g., for NUMA node info.  I don't really want=
 to
> >> have to change all the _in_domain() interfaces to also take yet
> >> another parameter for the node number.
> >
> > ...
> > My understanding is that when pci_host_bridge structure was introdu=
ced
> > you were trying to keep the APIs unchanged and hence the creation o=
f a
> > bridge was hidden inside the pci_create_root_bus() function.
>=20
> You mean pci_alloc_host_bridge()?  Right; ideally I would have used
> pci_scan_root_bus() everywhere and gotten rid of pci_create_root_bus(=
).
> The outline of pci_scan_root_bus() is:
>=20
>     pci_create_root_bus()
>     pci_scan_child_bus()
>     pci_bus_add_devices()
>=20
> The problem was that several arches do interesting things scattered a=
mong
> that core.  The ACPI host bridge driver used on x86 and ia64 does res=
ource
> allocation before pci_bus_add_devices(), as does parisc.  Probably al=
l
> arches should do this, but they don't.
>=20
> And powerpc and sparc use of_scan_bus() or something similar instead =
of
> pci_scan_child_bus().  They probably *could* provide config space acc=
essors
> that talk to OF and would allow pci_scan_child_bus() to work.  But th=
at
> seemed like too much work at the time.
>=20
> > If we want to store the domain_nr information in the host bridge st=
ructure,
> > together with a pointer to sysdata, then we need to break up the cr=
eation
> > of the pci_host_bridge from the creation of a root bus. At that mom=
ent,
> > pci_scan_root_bus() will need to be changed to accept a pci_host_br=
idge
> > pointer, while pci_scan_bus() and pci_scan_bus_parented() will crea=
te
> > the host bridge in the body of their function.
>=20
> It's hard to change an existing interface like pci_scan_root_bus() be=
cause
> it's called from so many places and you have to change them all at on=
ce.
> Then if something goes wrong, the revert makes a mess for everybody. =
 But
> I think it makes sense to add a new interface that does what you want=
=2E

OK, I understand your concern. It does sort of return us back to the in=
itial
discussion, where you were arguing against adding a new set of function=
s
for every existing function, but it makes sense from transition point o=
f view.

Best regards,
Liviu

>=20
> Bjorn
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
