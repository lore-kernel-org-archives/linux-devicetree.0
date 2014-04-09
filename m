From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v7 4/6] pci: Introduce a domain number for
 pci_host_bridge.
Date: Wed, 9 Apr 2014 13:07:50 +0100
Message-ID: <20140409120750.GN985@e106497-lin.cambridge.arm.com>
References: <1394811272-1547-1-git-send-email-Liviu.Dudau@arm.com>
 <1394811272-1547-5-git-send-email-Liviu.Dudau@arm.com>
 <20140405000007.GD15806@google.com>
 <20140407084623.GG17163@e106497-lin.cambridge.arm.com>
 <1396862058.3671.40.camel@pasglop>
 <20140407100715.GI17163@e106497-lin.cambridge.arm.com>
 <CAErSpo7h+Yew2hBztzkOzcHU5r4OQebxFbcZGkNUwJwfTFsbfg@mail.gmail.com>
 <20140408102043.GV17163@e106497-lin.cambridge.arm.com>
 <CAErSpo4anYBmaRbJEFE9kAXSmnvfqud=w1QA=mSSsTUamM4kSw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAErSpo4anYBmaRbJEFE9kAXSmnvfqud=w1QA=mSSsTUamM4kSw@mail.gmail.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, linaro-kernel <linaro-kernel@lists.linaro.org>, Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 08, 2014 at 05:28:39PM +0100, Bjorn Helgaas wrote:
> On Tue, Apr 8, 2014 at 4:20 AM, Liviu Dudau <Liviu.Dudau@arm.com> wro=
te:
> > On Mon, Apr 07, 2014 at 11:44:51PM +0100, Bjorn Helgaas wrote:
>=20
> >> Let me try to explain my concern about the
> >> pci_create_root_bus_in_domain() interface.  We currently have thes=
e
> >> interfaces:
> >>
> >>   pci_scan_root_bus()
> >>   pci_scan_bus()
> >>   pci_scan_bus_parented()
> >>   pci_create_root_bus()
> >> ...
>=20
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
> > OK, what about this: all the functions that you have mentioned take=
 a
> > void *sysdata parameter. Should we convert this opaque pointer into=
 a
> > specific structure that holds the domain_nr and (in future) the NUM=
A
> > node info?
>=20
> I doubt if we can make sysdata itself generic because I suspect we
> need a way to have *some* arch-specific data.  But maybe the arch
> could supply a structure containing a struct device *, domain, struct
> pci_ops *, list of resources, aperture info, etc.  I wonder if struct
> pci_host_bridge would be a reasonable place to put this stuff, e.g.,
> something like this:
>=20
>   struct pci_host_bridge {
>     int domain;
>     int node;
>     struct device *dev;
>     struct pci_ops *ops;
>     struct list_head resources;
>     void *sysdata;
>     struct pci_bus *bus;  /* filled in by core, not by arch */
>     ... /* other existing contents managed by core */
>   };
>=20
>   struct pci_bus *pci_scan_host_bridge(struct pci_host_bridge *bridge=
);

I'm really reluctant to give the arches more rope to hang themselves. I
really dislike the use of xxxx_initcall() to do PCI initialisation orde=
ring
that is currently in widespread use through the arch code. As I hope to
have proven with my arm64 code, you can have PCI support for an archite=
cture
without having to provide any arch specific code. We have enough correc=
t
code in the PCI framework, what would the architectures provide to the =
generic
code that we cannot get by following the standard?

Of course, there are always arch specific corners and they need their d=
ata
structures to make sense of those, but rather than having architectures
fill in a structure *before* we can setup host bridges I think we need
to reverse the order. Using your example structure, I don't think is
the arch's job to provide the list of resources or the domain number
before we can scan the host bridge. We should be able to get those from
somewhere else (like adding by default the ioport_resource and
iomem_resource and managing domain numbers inside the core framework).

Best regards,
Liviu

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
