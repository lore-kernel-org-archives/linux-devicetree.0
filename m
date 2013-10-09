From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [RFC] Architecture independent pcibios?
Date: Wed, 9 Oct 2013 17:23:00 +0100
Message-ID: <20131009162300.GK25606@e102652-lin.cambridge.arm.com>
References: <20131008144211.GA25231@e102652-lin.cambridge.arm.com>
 <CAErSpo5=sUJDZGm+zHw+b1h_a1YYbaGBshAutAoPBZYUCRbYkw@mail.gmail.com>
 <525438F6.3090600@gmail.com>
 <1381264135.645.230.camel@pasglop>
 <20131009090923.GE25606@e102652-lin.cambridge.arm.com>
 <1381315068.4330.1.camel@pasglop>
 <20131009104553.GI25606@e102652-lin.cambridge.arm.com>
 <CAErSpo6ujYmoOz4RMo3ATEJ+REMPiz6oR2pEUn=jW5GMDEB+Yw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAErSpo6ujYmoOz4RMo3ATEJ+REMPiz6oR2pEUn=jW5GMDEB+Yw@mail.gmail.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Rob Herring <robherring2@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Michal Simek <monstr@monstr.eu>, "grant.likely@linaro.org" <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 09, 2013 at 03:30:35PM +0100, Bjorn Helgaas wrote:
> On Wed, Oct 9, 2013 at 4:45 AM, Liviu Dudau <Liviu.Dudau@arm.com> wro=
te:
>=20
> > Semantic question: what is the perceived difference between a pci_c=
ontroller
> > and a pci_host_bridge? Are they just historical naming artifacts of=
 the
> > same concept? (person A deciding to do a cleanup of the code and pi=
cks a
> > new name in order not to upset the old APIs)
>=20
> pci_controller is a typical name for the arch-dependent PCI host
> bridge structure.  Some arches use different names, e.g.,
> pci_sys_data, pci_hba_data, pci_channel, etc.
>=20
> When I added support in the PCI core for host bridge address
> translation, e.g., ACPI _TRA, I named the core structure
> pci_host_bridge.
>=20
> Some of the stuff in pci_controller and similar arch-dependent
> structures could probably be moved into pci_host_bridge, given
> appropriate PCI core interfaces to supply the information (or maybe
> pcibios_*() functions the core could use to retrieve it).  But I doub=
t
> we could completely remove the arch-dependent structures.

How about this as a battle plan:

  - create a "generic pci_controller struct" (actual name to be picked =
later)
    that parses the DT for ranges and creates the relevant
    pci_host_bridge_windows, then calls pci_scan_root_bus()

  - provide some weak function definitions that arch-dependent code
    can override for the cases where the "generic pci_controller struct=
"
    version does not fit the bill.

Best regards,
Liviu


>=20
> Bjorn
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
