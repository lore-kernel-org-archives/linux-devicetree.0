From: Rongrong Zou <zourongrong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Sun, 3 Jan 2016 20:24:14 +0800
Message-ID: <568912EE.9030009@huawei.com>
References: <1451396032-23708-1-git-send-email-zourongrong@gmail.com>
 <1899302.RWIn6Bg3Dr@wuerfel> <568537C3.3060902@huawei.com>
 <17750582.ajK78gYOFz@wuerfel>
 <CABTftiT1+AmrNjiAie-T6on-oWA4Zz73+Tj2pQrixMT3o475uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABTftiT1+AmrNjiAie-T6on-oWA4Zz73+Tj2pQrixMT3o475uw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rongrong Zou <zourongrong-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linuxarm-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

=E5=9C=A8 2015/12/31 23:00, Rongrong Zou =E5=86=99=E9=81=93:
>
>
> 2015-12-31 22:40 GMT+08:00 Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org <mailto:arnd@=
arndb.de>>:
>  >
>  > On Thursday 31 December 2015 22:12:19 Rongrong Zou wrote:
>  > > =E5=9C=A8 2015/12/30 17:06, Arnd Bergmann =E5=86=99=E9=81=93:
>  > > > On Tuesday 29 December 2015 21:33:52 Rongrong Zou wrote:
>  > > >> +Example:
>  > > >> +
>  > > >> +        lpc_0: lpc@a01b0000 {
>  > > >> +          #address-cells =3D <1>;
>  > > >> +          #size-cells =3D <1>;
>  > > >> +                compatible =3D "low-pin-count";
>  > > >> +                reg =3D <0x0 0xa01b0000 0x0 0x10000>;
>  > > >> +        };
>  > > >
>  > > > One more thought: please try to stick as closely as possible t=
o the existing
>  > > > ISA binding that is documented at
>  > > >
>  > > > http://www.firmware.org/1275/bindings/isa/isa0_4d.ps
>  > >  From the specification, I think I should use 2 32bit integer to=
 describe the isa addr in dts.
>  > > >
>  > > > In particular, this should cover the possibility of describing=
 both memory
>  > > > and I/O spaces in child devices.
>  > > >
>  > >
>  > > I found below config in powerpc dts "arch/powerpc/boot/dts/mpc85=
44ds.dts"
>  > >
>  > > isa@1e {
>  > >                                  device_type =3D "isa";
>  > >                                  #interrupt-cells =3D <2>;
>  > >                                  #size-cells =3D <1>;
>  > >                                  #address-cells =3D <2>;
>  > >                                  reg =3D <0xf000 0x0 0x0 0x0 0x0=
>;
>  > >                                  ranges =3D <0x1 0x0 0x1000000 0=
x0 0x0
>  > >                                            0x1000>;
>  > >                                  interrupt-parent =3D <&i8259>;
>  > >
>  > >
>  > >
>  > >                                  rtc@70 {
>  > >                                          compatible =3D "pnpPNP,=
b00";
>  > >                                          reg =3D <0x1 0x70 0x2>;
>  > >                                  };
>  > >   the isa space in child-node: reg =3D <0x1 0x70 0x2>;
>  > >   0x1 means IO space, 70 means addr, 0x2 is size.
>  > >   but when i config the following in dts, the ipmi_0 node can't =
be probed,
>  > >   I think there may be some problems.
>  > >
>  > > lpc_0: lpc@a01b0000 {
>  > >       compatible =3D "low-pin-count";
>  > >       device_type =3D "isa";
>  > >       #address-cells =3D <2>;
>  > >       #size-cells =3D <1>;
>  > >       reg =3D <0x0 0xa01b0000 0x0 0x10000>;
>  > >
>  > >       ipmi_0:ipmi@000000e4{
>  > >               device_type =3D "ipmi";
>  > >               compatible =3D "ipmi-bt";
>  > >               reg =3D <0x1 0x000000e4 0x4>;
>  > > };
>  >
>  > The DT sample above looks good in principle. I believe what you ar=
e missing
>  > here is code in your driver to scan the child nodes to create the =
platform
>  > devices. of_bus_isa_translate() should work with your definition h=
ere
>  > and create the correct IORESOURCE_IO resources. You don't have any=
 MMIO
>  > resources, so the absence of a ranges property is ok. Maybe all yo=
u
>  > are missing is a call to of_platform_populate() or of_platform_bus=
_probe()?
>  >
>
> You are right. thanks, i'll try on test board .  if i get the correct=
 result , the new patch
> will be sent later. By the way, it's my another email account use whe=
n i at home.

I tried, and there need some additional changes.

isa@a01b0000 {

/*the node name should start with "isa", because of below definition
* static int of_bus_isa_match(struct device_node *np)
* {
*	return !strcmp(np->name, "isa");
* }
*/
	compatible =3D "low-pin-count";
	device_type =3D "isa";
	#address-cells =3D <2>;
	#size-cells =3D <1>;
	reg =3D <0x0 0xa01b0000 0x0 0x10000>;
	ranges =3D <0x1 0x0 0x0 0x0 0x1000>;
/*
*  ranges is required, then i can get the IORESOURCE_IO <0xe4,4> from "=
reg =3D <0x1, 0x000000e4, 4>".
*
*/
	ipmi_0:ipmi@000000e4{
		device_type =3D "ipmi";
		compatible =3D "ipmi-bt";
		reg =3D <0x1 0x000000e4 0x4>;
};

drivers\of\address.c
static int __of_address_to_resource(struct device_node *dev,
                 const __be32 *addrp, u64 size, unsigned int flags,
                 const char *name, struct resource *r)
{
         u64 taddr;

         if ((flags & (IORESOURCE_IO | IORESOURCE_MEM)) =3D=3D 0)
                 return -EINVAL;
         taddr =3D of_translate_address(dev, addrp);
         if (taddr =3D=3D OF_BAD_ADDR)
                 return -EINVAL;
         memset(r, 0, sizeof(struct resource));
         if (flags & IORESOURCE_IO) {
                 unsigned long port;

/*****************************************************************/
/*legacy port(< 0x1000) is reserved, and need no translation here*/
/*****************************************************************/
                 if(taddr + size < PCIBIOS_MIN_IO){
                         r->start =3D taddr;
                         r->end =3D taddr + size - 1;
                 }


                 else{
                         port =3D pci_address_to_pio(taddr);
                         if (port =3D=3D (unsigned long)-1)
                                 return -EINVAL;
                         r->start =3D port;
                         r->end =3D port + size - 1;
                 }
         } else {
                 r->start =3D taddr;
                 r->end =3D taddr + size - 1;
         }
         r->flags =3D flags;
         r->name =3D name ? name : dev->full_name;

         return 0;
}



>
>  >         Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
