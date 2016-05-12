From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: bcm2835: add the bcm2835-sdram-controller to the dt
Date: Thu, 12 May 2016 18:00:07 +0200
Message-ID: <0DF5210B-0269-4E49-A8E4-A4A83FCAABCF@martin.sperl.org>
References: <1463056732-5607-1-git-send-email-kernel@martin.sperl.org> <1463056732-5607-4-git-send-email-kernel@martin.sperl.org> <73859954.21004.36a104a6-5284-487f-b397-da7ff0407f1f.open-xchange@email.1und1.de>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <73859954.21004.36a104a6-5284-487f-b397-da7ff0407f1f.open-xchange-7tX72C7vayboQLBSYMtkGA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


> On 12.05.2016, at 16:56, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org> wrote=
:
>=20
> Hi,
>=20
>> kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org hat am 12. Mai 2016 um 14:38 geschrieben:
>>=20
>>=20
>> From: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
>>=20
>> Add the bcm2835 sdram controller to the device tree.
>>=20
>> Signed-off-by: Martin Sperl <kernel-TqfNSX0MhmxHKSADF0wUEw@public.gmane.org>
>> ---
>> arch/arm/boot/dts/bcm283x.dtsi | 6 ++++++
>> 1 file changed, 6 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm2=
83x.dtsi
>> index 8aaf193..9db9d97 100644
>> --- a/arch/arm/boot/dts/bcm283x.dtsi
>> +++ b/arch/arm/boot/dts/bcm283x.dtsi
>> @@ -22,6 +22,12 @@
>> 		#address-cells =3D <1>;
>> 		#size-cells =3D <1>;
>>=20
>> +		memory-controller@7e002000 {
>> +			compatible =3D "brcm,bcm2835-sdram";
>> +			reg =3D <0x7e002000 0x58>, <0x7e002800 0x58>;
>=20
> where do you get these addresses?
I took this info based on the shared headers by broadcom:
https://github.com/msperl/rpi-registers/blob/master/md/README.md

And the bootrom code showed something similar that would point to
these registers.

Ic0 and ic1 register values also show the valid memory regions:
Especially IC[01]_SRC0 contains reference to the SRAM
size on the CM - 0x20000000
here the fump of devmem2:=20
Value at address 0x3F00200C (0x76f3300c): 0x20000000.

But as you point out that may also be the interrupt controller for the =
VC4
cores=E2=80=A6

It is probably the location where the VC4 interrupt table is situated.


> According to register documentation [1] the adresses belong to the in=
terrupt
> controller.
>=20
> Maybe 0x7ee00000 is the right address.
This would also fall in range with the cache register ranges:
0x7ee00000 SD
0x7ee01000 L2
0x7ee02000 L1=20

L1 contains also IC0 and IC1 register names (L1_IC0_CONTROL et.al.)
so I guess this is what has set me in the wrong direction...

Thanks for pointing it out...

I guess I will need to amend the patchset for that=E2=80=A6

Martin


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
