From: liviu.dudau@arm.com
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Tue, 12 Jan 2016 09:07:22 +0000
Message-ID: <20160112090722.GN13633@e106497-lin.cambridge.arm.com>
References: <1451396032-23708-1-git-send-email-zourongrong@gmail.com>
 <CABTftiT1+AmrNjiAie-T6on-oWA4Zz73+Tj2pQrixMT3o475uw@mail.gmail.com>
 <568912EE.9030009@huawei.com>
 <15026471.7nGZ0rWlIf@wuerfel>
 <20160111161415.GM13633@e106497-lin.cambridge.arm.com>
 <56946768.7090805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56946768.7090805@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rongrong Zou <zourongrong@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, Rongrong Zou <zourongrong@huawei.com>, devicetree@vger.kernel.org, benh@kernel.crashing.org, Corey Minyard <minyard@acm.org>, gregkh@linuxfoundation.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, linuxarm@huawei.com, Catalin Marinas <catalin.marinas@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 12, 2016 at 10:39:36AM +0800, Rongrong Zou wrote:
> On 2016/1/12 0:14, liviu.dudau@arm.com wrote:
> >On Mon, Jan 04, 2016 at 12:13:05PM +0100, Arnd Bergmann wrote:
> >>On Sunday 03 January 2016 20:24:14 Rongrong Zou wrote:
> >>>=E5=9C=A8 2015/12/31 23:00, Rongrong Zou =E5=86=99=E9=81=93:
> >>>>2015-12-31 22:40 GMT+08:00 Arnd Bergmann <arnd@arndb.de <mailto:a=
rnd@arndb.de>>:
> >>>>  > On Thursday 31 December 2015 22:12:19 Rongrong Zou wrote:
> >>>>  > > =E5=9C=A8 2015/12/30 17:06, Arnd Bergmann =E5=86=99=E9=81=93=
:
> >>>>  > > > On Tuesday 29 December 2015 21:33:52 Rongrong Zou wrote:
> >>>>  >
> >>>>  > The DT sample above looks good in principle. I believe what y=
ou are missing
> >>>>  > here is code in your driver to scan the child nodes to create=
 the platform
> >>>>  > devices. of_bus_isa_translate() should work with your definit=
ion here
> >>>>  > and create the correct IORESOURCE_IO resources. You don't hav=
e any MMIO
> >>>>  > resources, so the absence of a ranges property is ok. Maybe a=
ll you
> >>>>  > are missing is a call to of_platform_populate() or of_platfor=
m_bus_probe()?
> >>>>  >
> >>>>
> >>>>You are right. thanks, i'll try on test board .  if i get the cor=
rect result , the new patch
> >>>>will be sent later. By the way, it's my another email account use=
 when i at home.
> >>>
> >>>I tried, and there need some additional changes.
> >>>
> >>>isa@a01b0000 {
> >>>
> >>>/*the node name should start with "isa", because of below definiti=
on
> >>>* static int of_bus_isa_match(struct device_node *np)
> >>>* {
> >>>*	return !strcmp(np->name, "isa");
> >>>* }
> >>
> >>Looks good. It would be nicer to match on device_type than on name,
> >>but this is ancient code and it's probably best not to touch it
> >>so we don't accidentally break some old SPARC or PPC system.
> >>
> >>>*/
> >>>	compatible =3D "low-pin-count";
> >>>	device_type =3D "isa";
> >>>	#address-cells =3D <2>;
> >>>	#size-cells =3D <1>;
> >>>	reg =3D <0x0 0xa01b0000 0x0 0x10000>;
> >>>	ranges =3D <0x1 0x0 0x0 0x0 0x1000>;
> >>>/*
> >>>*  ranges is required, then i can get the IORESOURCE_IO <0xe4,4> f=
rom "reg =3D <0x1, 0x000000e4, 4>".
> >>>*
> >>>*/
> >>>	ipmi_0:ipmi@000000e4{
> >>>		device_type =3D "ipmi";
> >>>		compatible =3D "ipmi-bt";
> >>>		reg =3D <0x1 0x000000e4 0x4>;
> >>>};
> >>>
> >>
> >>This looks wrong: the property above says that the I/O port range i=
s
> >>translated to MMIO address 0x00000000 to 0x00010000, which is not
> >>true on your hardware. I think this needs to be changed in the code
> >>so the ranges property is not required for I/O ports.
> >>
> >>>drivers\of\address.c
> >>>static int __of_address_to_resource(struct device_node *dev,
> >>>                  const __be32 *addrp, u64 size, unsigned int flag=
s,
> >>>                  const char *name, struct resource *r)
> >>>{
> >>>          u64 taddr;
> >>>
> >>>          if ((flags & (IORESOURCE_IO | IORESOURCE_MEM)) =3D=3D 0)
> >>>                  return -EINVAL;
> >>>          taddr =3D of_translate_address(dev, addrp);
> >>>          if (taddr =3D=3D OF_BAD_ADDR)
> >>>                  return -EINVAL;
> >>>          memset(r, 0, sizeof(struct resource));
> >>>          if (flags & IORESOURCE_IO) {
> >>>                  unsigned long port;
> >>>
> >>>/*****************************************************************=
/
> >>>/*legacy port(< 0x1000) is reserved, and need no translation here*=
/
> >>>/*****************************************************************=
/
> >>>                  if(taddr + size < PCIBIOS_MIN_IO){
> >>>                          r->start =3D taddr;
> >>>                          r->end =3D taddr + size - 1;
> >>>                  }
> >>
> >>I don't like having a special case based on the address here,
> >>the same kind of hack might be needed for PCI I/O spaces in
> >>hardware that uses an indirect method like your LPC bus
> >>does, and the code above will not work on any LPC implementation
> >>that correctly multiplexes its I/O ports with the first PCI domain.
> >>
> >>I think it would be better to avoid translating the port into
> >>a physical address to start with just to translate it back into
> >>a port number, what we need instead is the offset between the
> >>bus specific port number and the linux port number. I've added
> >>Liviu to Cc, he wrote this code originally and may have some idea
> >>of how we could do that.
> >
> >Hi,
>=20
> Hi Liviu,
>=20
> Thanks for reviewing this.
>=20
> >
> >Getting back to work after a longer holiday, my brain might not be r=
unning
> >at full speed here, so I'm trying to clarify things a bit here.
> >
> >It looks to me like Rongrong is trying to trap the inb()/outb() call=
s that he
> >added to arm64 by patch 1/3 and redirect those operations to the mem=
ory
> >mapped LPC driver. I think the whole redirection and registration of=
 inb/outb
> >ops can be made cleaner, so that the general concept resembles the D=
MA ops
> >registration? (I have this mental picture that what Rongrong is tryi=
ng to do
> >is similar to what a DMA engine does, except this is slowing down th=
ings to
> >byte level). If that is done properly in the parent node, then we sh=
ould not
> >care what the PCIBIOS_MIN_IO value is as the inb()/outb() calls will=
 always
> >go through the redirection for the children.
> >
> >As for the ranges property: does he wants the ipmi-bt driver to see =
in the
> >reg property the legacy ISA I/O ports values or the CPU addresses? I=
f the former,
> >then I agree that the range property should not be required, but als=
o the
> >reg values need to be changed (drop the top bit). If the later, then=
 the
> >ranges property is required to do the proper translation.
>=20
> The former, thanks.
>=20
> >
> >Rongrong, removing the ranges property and with a reg =3D <0xe4 0x4>=
 property
> >in the ipmi-bt node, what IO_RESOURCE type resources do you get back=
 from
> >the of_address_to_resource() translation?
>=20
> I want to get IORESOURCE_IO type resource, but if the parent node dro=
p the
> "rangs" property, the of_address_to_resource() translation will retur=
n with -EINVAL.

Have you tracked what part of the code is sensitive to the presence of =
"ranges"
property? Does of_get_address() call returns the IO_RESOURCE flag set w=
ithout "ranges"?

Best regards,
Liviu

>=20
> >
> >Best regards,
> >Liviu
> >
> >
> >>
> >>	Arnd
> >>
> >
> Regards,
> Rongrong
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
