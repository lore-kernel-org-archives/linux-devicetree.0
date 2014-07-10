From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v8 6/9] pci: Introduce a domain number for
 pci_host_bridge.
Date: Thu, 10 Jul 2014 10:47:58 +0100
Message-ID: <20140710094758.GA6501@e106497-lin.cambridge.arm.com>
References: <1404240214-9804-1-git-send-email-Liviu.Dudau@arm.com>
 <1404240214-9804-7-git-send-email-Liviu.Dudau@arm.com>
 <20140708005954.GC22939@google.com>
 <20140708104655.GC6501@e106497-lin.cambridge.arm.com>
 <CAErSpo75ovmGoeSHKJN0nckGDy-0gpn8kLPfHQ79CtcXxhPydw@mail.gmail.com>
 <20140708224847.GC4980@e106497-lin.cambridge.arm.com>
 <CAErSpo5rBt0iF2HGeDD-UH6_sPCoC647VCw0Q1v_0Rdpvcir-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAErSpo5rBt0iF2HGeDD-UH6_sPCoC647VCw0Q1v_0Rdpvcir-w@mail.gmail.com>
Content-Disposition: inline
Sender: linux-pci-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci <linux-pci@vger.kernel.org>, Catalin Marinas <Catalin.Marinas@arm.com>, Will Deacon <Will.Deacon@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Arnd Bergmann <arnd@arndb.de>, linaro-kernel <linaro-kernel@lists.linaro.org>, Tanmay Inamdar <tinamdar@apm.com>, Grant Likely <grant.likely@secretlab.ca>, Sinan Kaya <okaya@codeaurora.org>, Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Suravee Suthikulanit <suravee.suthikulpanit@amd.com>, LKML <linux-kernel@vger.kernel.org>, Device Tree ML <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jul 09, 2014 at 04:10:04PM +0100, Bjorn Helgaas wrote:
> On Tue, Jul 8, 2014 at 4:48 PM, Liviu Dudau <Liviu.Dudau@arm.com> wro=
te:
> > On Tue, Jul 08, 2014 at 07:41:50PM +0100, Bjorn Helgaas wrote:
> >> On Tue, Jul 8, 2014 at 4:46 AM, Liviu Dudau <Liviu.Dudau@arm.com> =
wrote:
> >> > On Tue, Jul 08, 2014 at 01:59:54AM +0100, Bjorn Helgaas wrote:
> >>
> >> >> I wonder if it would help to make a weak pci_domain_nr() functi=
on that
> >> >> returns "bridge->domain_nr".  Then each arch could individually=
 drop its
> >> >> pci_domain_nr() definition as it was converted, e.g., something=
 like this:
> >> >>
> >> >>   - Convert every arch pci_domain_nr() from a #define to a non-=
inline
> >> >>     function
> >> >>   - Add bridge.domain_nr, initialized from pci_domain_nr()
> >> >>   - Add a weak generic pci_domain_nr() that returns bridge.doma=
in_nr
> >> >>   - Add a way to create a host bridge in a specified domain, so=
 we can
> >> >>     initialize bridge.domain_nr without using pci_domain_nr()
> >> >>   - Convert each arch to use the new creation mechanism and dro=
p its
> >> >>     pci_domain_nr() implementation
> >> >
> >> > I will try to propose a patch implementing this.
> >>
> >> I think this is more of an extra credit, cleanup sort of thing.  I
> >> don't think it advances your primary goal of (I think) getting arm=
64
> >> PCI support in.  So my advice is to not worry about unifying domai=
n
> >> handling until later.
> >
> > Getting arm64 supported *is* my main goal. But like you have stated=
 in your
> > review of v7, you wanted to see another architecture converted as a=
 guarantee
> > of "genericity" (for lack of a better word) for my patches. The one=
 architecture
> > I've set my eyes on is microblaze, and that one uses pci_scan_root_=
bus()
> > rather than pci_create_root_bus() so I don't have any opportunity t=
o pass the
> > domain number or any additional info (like the sysdata pointer that=
 we were
> > talking about) to the pci_host_bridge structure unless I do this cl=
eanup.
>=20
> I think maybe I was too harsh about that, or maybe we had different
> ideas about what "conversion" involved.  My comment was in response t=
o
> "pci: Introduce pci_register_io_range() helper function", and I don't
> remember why I was concerned about that; it's not even in drivers/pci=
,
> and it doesn't have an obvious connection to putting the domain numbe=
r
> in struct pci_host_bridge.

Well, to be honest I did move some of the code (as mentioned in the Cha=
ngelog) from
drivers/pci into drivers/of. It makes more sense to be in OF, as it mos=
tly concerns
architectures that use it.

>=20
> The thing I'm more concerned about is adding new PCI interfaces, e.g.=
,
> pci_create_root_bus_in_domain(), that are only used by one
> architecture.  Then it's hard to be sure that it's going to be useful
> for other arches.  If you can add arm64 using the existing PCI
> interfaces, I don't any problem with that.

(No blame here or reproaches, I'm just restating the situation:) I (mos=
tly) did try
that in my v7 series but it also got NAK-ed by Arnd and Catalin as it h=
ad too much
arm64 specific code in there.

I don't see a way out of adding new PCI interfaces if we want to have s=
upport in
the PCI framework for unifying existing architectures. Of course, there=
 is the painful
alternative of changing the existing APIs and fixing arches in one go, =
but like you've
said is going to be messy. I don't think I (or the people and companies=
 wanting PCIe
on arm64) should cop out and pick a quick fix that adds sysdata structu=
re into arm64
just to avoid new APIs, as this is not going to help anyone in long ter=
m. What I can
do is to create a set of parallel APIs for pci_{scan,create}_root_bus()=
 that take
a pci_host_bridge pointer and start converting architectures one by one=
 to that API
while deprecating the existing one. That way we can add arm64 easily as=
 it would be
the first architecture to use new code without breaking things *and* we=
 provide a
migration path.

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
