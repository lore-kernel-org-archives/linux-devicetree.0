From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v1 3/3] ARM64 LPC: update binding doc
Date: Thu, 31 Dec 2015 15:40:49 +0100
Message-ID: <17750582.ajK78gYOFz@wuerfel>
References: <1451396032-23708-1-git-send-email-zourongrong@gmail.com> <1899302.RWIn6Bg3Dr@wuerfel> <568537C3.3060902@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <568537C3.3060902@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rongrong Zou <zourongrong@huawei.com>
Cc: Rongrong Zou <zourongrong@gmail.com>, minyard@acm.org, gregkh@linuxfoundation.org, catalin.marinas@arm.com, will.deacon@arm.com, linuxarm@huawei.com, linux-kernel@vger.kernel.org, benh@kernel.crashing.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thursday 31 December 2015 22:12:19 Rongrong Zou wrote:
> =E5=9C=A8 2015/12/30 17:06, Arnd Bergmann =E5=86=99=E9=81=93:
> > On Tuesday 29 December 2015 21:33:52 Rongrong Zou wrote:
> >> +Example:
> >> +
> >> +        lpc_0: lpc@a01b0000 {
> >> +		#address-cells =3D <1>;
> >> +		#size-cells =3D <1>;
> >> +                compatible =3D "low-pin-count";
> >> +                reg =3D <0x0 0xa01b0000 0x0 0x10000>;
> >> +        };
> >
> > One more thought: please try to stick as closely as possible to the=
 existing
> > ISA binding that is documented at
> >
> > http://www.firmware.org/1275/bindings/isa/isa0_4d.ps
>  From the specification, I think I should use 2 32bit integer to desc=
ribe the isa addr in dts.
> >
> > In particular, this should cover the possibility of describing both=
 memory
> > and I/O spaces in child devices.
> >
>=20
> I found below config in powerpc dts "arch/powerpc/boot/dts/mpc8544ds.=
dts"
>=20
> isa@1e {
>                                  device_type =3D "isa";
>                                  #interrupt-cells =3D <2>;
>                                  #size-cells =3D <1>;
>                                  #address-cells =3D <2>;
>                                  reg =3D <0xf000 0x0 0x0 0x0 0x0>;
>                                  ranges =3D <0x1 0x0 0x1000000 0x0 0x=
0
>                                            0x1000>;
>                                  interrupt-parent =3D <&i8259>;
>=20
>=20
>=20
>                                  rtc@70 {
>                                          compatible =3D "pnpPNP,b00";
>                                          reg =3D <0x1 0x70 0x2>;
>                                  };
>   the isa space in child-node: reg =3D <0x1 0x70 0x2>;
>   0x1 means IO space, 70 means addr, 0x2 is size.
>   but when i config the following in dts, the ipmi_0 node can't be pr=
obed,
>   I think there may be some problems.
>=20
> lpc_0: lpc@a01b0000 {
> 	compatible =3D "low-pin-count";
> 	device_type =3D "isa";
> 	#address-cells =3D <2>;
> 	#size-cells =3D <1>;
> 	reg =3D <0x0 0xa01b0000 0x0 0x10000>;
>=20
> 	ipmi_0:ipmi@000000e4{
> 		device_type =3D "ipmi";
> 		compatible =3D "ipmi-bt";
> 		reg =3D <0x1 0x000000e4 0x4>;
> };

The DT sample above looks good in principle. I believe what you are mis=
sing
here is code in your driver to scan the child nodes to create the platf=
orm
devices. of_bus_isa_translate() should work with your definition here
and create the correct IORESOURCE_IO resources. You don't have any MMIO
resources, so the absence of a ranges property is ok. Maybe all you=20
are missing is a call to of_platform_populate() or of_platform_bus_prob=
e()?

	Arnd
