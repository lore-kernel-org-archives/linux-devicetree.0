From: liviu.dudau-5wv7dgnIgG8@public.gmane.org
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Mon, 11 Jan 2016 16:14:15 +0000
Message-ID: <20160111161415.GM13633@e106497-lin.cambridge.arm.com>
References: <1451396032-23708-1-git-send-email-zourongrong@gmail.com>
 <CABTftiT1+AmrNjiAie-T6on-oWA4Zz73+Tj2pQrixMT3o475uw@mail.gmail.com>
 <568912EE.9030009@huawei.com>
 <15026471.7nGZ0rWlIf@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <15026471.7nGZ0rWlIf@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rongrong Zou <zourongrong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jan 04, 2016 at 12:13:05PM +0100, Arnd Bergmann wrote:
> On Sunday 03 January 2016 20:24:14 Rongrong Zou wrote:
> > =E5=9C=A8 2015/12/31 23:00, Rongrong Zou =E5=86=99=E9=81=93:
> > > 2015-12-31 22:40 GMT+08:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org <mailto:a=
rnd-r2nGTMty4D4@public.gmane.org>>:
> > >  > On Thursday 31 December 2015 22:12:19 Rongrong Zou wrote:
> > >  > > =E5=9C=A8 2015/12/30 17:06, Arnd Bergmann =E5=86=99=E9=81=93=
:
> > >  > > > On Tuesday 29 December 2015 21:33:52 Rongrong Zou wrote:
> > >  >
> > >  > The DT sample above looks good in principle. I believe what yo=
u are missing
> > >  > here is code in your driver to scan the child nodes to create =
the platform
> > >  > devices. of_bus_isa_translate() should work with your definiti=
on here
> > >  > and create the correct IORESOURCE_IO resources. You don't have=
 any MMIO
> > >  > resources, so the absence of a ranges property is ok. Maybe al=
l you
> > >  > are missing is a call to of_platform_populate() or of_platform=
_bus_probe()?
> > >  >
> > >
> > > You are right. thanks, i'll try on test board .  if i get the cor=
rect result , the new patch
> > > will be sent later. By the way, it's my another email account use=
 when i at home.
> >=20
> > I tried, and there need some additional changes.
> >=20
> > isa@a01b0000 {
> >=20
> > /*the node name should start with "isa", because of below definitio=
n
> > * static int of_bus_isa_match(struct device_node *np)
> > * {
> > *	return !strcmp(np->name, "isa");
> > * }
>=20
> Looks good. It would be nicer to match on device_type than on name,
> but this is ancient code and it's probably best not to touch it
> so we don't accidentally break some old SPARC or PPC system.
>=20
> > */
> > 	compatible =3D "low-pin-count";
> > 	device_type =3D "isa";
> > 	#address-cells =3D <2>;
> > 	#size-cells =3D <1>;
> > 	reg =3D <0x0 0xa01b0000 0x0 0x10000>;
> > 	ranges =3D <0x1 0x0 0x0 0x0 0x1000>;
> > /*
> > *  ranges is required, then i can get the IORESOURCE_IO <0xe4,4> fr=
om "reg =3D <0x1, 0x000000e4, 4>".
> > *
> > */
> > 	ipmi_0:ipmi@000000e4{
> > 		device_type =3D "ipmi";
> > 		compatible =3D "ipmi-bt";
> > 		reg =3D <0x1 0x000000e4 0x4>;
> > };
> >=20
>=20
> This looks wrong: the property above says that the I/O port range is
> translated to MMIO address 0x00000000 to 0x00010000, which is not
> true on your hardware. I think this needs to be changed in the code
> so the ranges property is not required for I/O ports.
>=20
> > drivers\of\address.c
> > static int __of_address_to_resource(struct device_node *dev,
> >                  const __be32 *addrp, u64 size, unsigned int flags,
> >                  const char *name, struct resource *r)
> > {
> >          u64 taddr;
> >=20
> >          if ((flags & (IORESOURCE_IO | IORESOURCE_MEM)) =3D=3D 0)
> >                  return -EINVAL;
> >          taddr =3D of_translate_address(dev, addrp);
> >          if (taddr =3D=3D OF_BAD_ADDR)
> >                  return -EINVAL;
> >          memset(r, 0, sizeof(struct resource));
> >          if (flags & IORESOURCE_IO) {
> >                  unsigned long port;
> >=20
> > /*****************************************************************/
> > /*legacy port(< 0x1000) is reserved, and need no translation here*/
> > /*****************************************************************/
> >                  if(taddr + size < PCIBIOS_MIN_IO){
> >                          r->start =3D taddr;
> >                          r->end =3D taddr + size - 1;
> >                  }
>=20
> I don't like having a special case based on the address here,
> the same kind of hack might be needed for PCI I/O spaces in
> hardware that uses an indirect method like your LPC bus
> does, and the code above will not work on any LPC implementation
> that correctly multiplexes its I/O ports with the first PCI domain.
>=20
> I think it would be better to avoid translating the port into
> a physical address to start with just to translate it back into
> a port number, what we need instead is the offset between the
> bus specific port number and the linux port number. I've added
> Liviu to Cc, he wrote this code originally and may have some idea
> of how we could do that.

Hi,     =20
        =20
Getting back to work after a longer holiday, my brain might not be runn=
ing
at full speed here, so I'm trying to clarify things a bit here.

It looks to me like Rongrong is trying to trap the inb()/outb() calls t=
hat he
added to arm64 by patch 1/3 and redirect those operations to the memory
mapped LPC driver. I think the whole redirection and registration of in=
b/outb
ops can be made cleaner, so that the general concept resembles the DMA =
ops
registration? (I have this mental picture that what Rongrong is trying =
to do
is similar to what a DMA engine does, except this is slowing down thing=
s to
byte level). If that is done properly in the parent node, then we shoul=
d not
care what the PCIBIOS_MIN_IO value is as the inb()/outb() calls will al=
ways
go through the redirection for the children.

As for the ranges property: does he wants the ipmi-bt driver to see in =
the
reg property the legacy ISA I/O ports values or the CPU addresses? If t=
he former,
then I agree that the range property should not be required, but also t=
he
reg values need to be changed (drop the top bit). If the later, then th=
e
ranges property is required to do the proper translation.

Rongrong, removing the ranges property and with a reg =3D <0xe4 0x4> pr=
operty
in the ipmi-bt node, what IO_RESOURCE type resources do you get back fr=
om
the of_address_to_resource() translation?

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
