From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH] PCI: add missing DT binding for linux,pci-domain property
Date: Fri, 7 Nov 2014 15:23:11 +0000
Message-ID: <20141107152311.GJ8916@e106497-lin.cambridge.arm.com>
References: <1415101660-26450-1-git-send-email-l.stach@pengutronix.de>
 <20141105231743.GI6168@google.com>
 <20141106100518.GI8916@e106497-lin.cambridge.arm.com>
 <CAL_JsqK-g2qW12jatyZBLeBEtpr80o=WWZVet5+OgMtzAAXHJQ@mail.gmail.com>
 <20141106153051.GU8916@e106497-lin.cambridge.arm.com>
 <CAL_Jsq+WHyRN+hAaEwH1ZHabEYgTDnpPinoL8pagHYzP4Zfe=g@mail.gmail.com>
 <20141107101728.GZ8916@e106497-lin.cambridge.arm.com>
 <CAL_JsqKdwLkybzLHdYcg81vEYfZvLu3_Cg1vZyoAyuobi6Vc4Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqKdwLkybzLHdYcg81vEYfZvLu3_Cg1vZyoAyuobi6Vc4Q@mail.gmail.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lucas Stach <l.stach@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Mark Rutland <Mark.Rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Nov 07, 2014 at 02:00:56PM +0000, Rob Herring wrote:
> On Fri, Nov 7, 2014 at 4:17 AM, Liviu Dudau <Liviu.Dudau@arm.com> wro=
te:
> > On Thu, Nov 06, 2014 at 07:46:33PM +0000, Rob Herring wrote:
> >> On Thu, Nov 6, 2014 at 9:30 AM, Liviu Dudau <Liviu.Dudau@arm.com> =
wrote:
> >> > On Thu, Nov 06, 2014 at 02:57:35PM +0000, Rob Herring wrote:
> >> >> On Thu, Nov 6, 2014 at 4:05 AM, Liviu Dudau <Liviu.Dudau@arm.co=
m> wrote:
> >> >> > On Wed, Nov 05, 2014 at 11:17:43PM +0000, Bjorn Helgaas wrote=
:
> >> >> >> On Tue, Nov 04, 2014 at 12:47:40PM +0100, Lucas Stach wrote:
> >> >> >> > This property was added by 41e5c0f81d3e
> >> >> >> > (of/pci: Add pci_get_new_domain_nr() and of_get_pci_domain=
_nr())
> >> >> >> > without the required binding documentation. As this proper=
ty
> >> >> >> > will be supported by a number of host bridge drivers going=
 forward,
> >> >> >> > add it to the common PCI binding doc.
> >> >> >> >
> >> >> >> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> >> >> >>
> >> >> >> I merged 41e5c0f81d3e through my tree, and I could merge som=
ething like
> >> >> >> this if a consensus develops with some acks.  But I'll just =
let you guys
> >> >> >> handle it unless you poke me again.
> >> >> >
> >> >> > While I think the "linux,pci-domain" property *must* be docum=
ented, I
> >> >> > would like to get a consensus first on the usage. If we agree=
 that
> >> >> > the property is mandatory to all host bridge drivers that use=
 OF then
> >> >> > we need to patch existing drivers (partially done through Lor=
enzo's
> >> >> > patches, but other arches are ignoring it). If we say all *ne=
w* drivers
> >> >> > need to use it then we also need to come up with a strategy o=
n how to
> >> >> > deal with old vs new school drivers.
> >> >> >
> >> >> > My preferred approach is the 3rd way: "linux,pci-domain" beco=
mes part of
> >> >> > the core PCI infrastructure (and we find the common ground wi=
th ACPI).
> >> >> > That way the host bridge drivers don't have to do anything, b=
ut the DT
> >> >> > creators have to specify a value.
> >> >>
> >> >> I'm okay with it being in the core. It was the mixture of using=
 the
> >> >> property and automatic numbering that I had issues with. Any mi=
xture
> >> >> whether in DT or in drivers should be an error. Also, I think h=
aving a
> >> >> mixture of root bus host drivers would be rare, so I'm not too
> >> >> concerned about some drivers supporting the property and others=
 not.
> >> >> In any case, these issues are all with the kernel and not reall=
y the
> >> >> concern for the binding. For the binding, simply all hosts set =
the
> >> >> domain or none of them do.
> >> >
> >> > Repeating what you've said to verify my understanding: you are O=
K with
> >> > the "linux,pci-domain" being handled in the PCI framework and ma=
ndatory
> >> > to all OF-based host bridges and architectures. Failure to inclu=
de
> >> > the property should be an error and no host bridge driver should=
 default
> >> > to the auto-generation of domain numbers.
> >> >
> >> > Is that correct?
> >>
> >> Not exactly. It is only mandatory when you have multiple root buse=
s.
> >> But we can't say an existing dtb is in error, so it has to remain
> >> optional for compatibility. Also, given it is a Linux property, yo=
u
> >> can't really say it is mandatory for all PCI bindings from a DT
> >> perspective.
> >>
> >> While we could have issues in theory if this is handled in the
> >> drivers, I don't think we will in practice as having root buses wi=
th
> >> different drivers is unlikely.
> >
> > That's correct. However, I would like to bring to you attention tha=
t as
> > long as the property is treated as optional in certain cases we wil=
l need,
> > in the framework code, to mix the assignment of a domain number com=
ing from
> > parsing of the property with the auto-numbering scheme in order to =
support
> > old DT files. And that was one of your major concerns when reviewin=
g the
> > series. Any suggestions or clarifications?
>=20
> We have to support both allocation schemes, but not on the same
> system. A mixture on a given system is an error. So the cases to
> handle are like this:
>=20
> 1 root bus w/ domain -> use domain prop
> 1 root bus w/o domain -> auto numbering
> N root buses w/ domains -> use domain prop
> N root buses w/o domains -> auto numbering
> N root buses w/ and w/o domains -> error

Agree.

>=20
> I also had issues just around the implementation details, but we can
> discuss those when there is another version.

Well, there is a version already in arch/arm64/kernel/pci.c:
pci_bus_assign_domain_nr() and I believe it works on all the cases
listed above. Question is if you agree on making this the default
implementation for OF-based architectures. Lorenzo has already
copied it into arch/arm.

Best regards,
Liviu

>=20
> Rob
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
