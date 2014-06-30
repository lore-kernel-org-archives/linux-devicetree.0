From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: zynq: Add Parallella device tree
Date: Mon, 30 Jun 2014 15:24:55 +0200
Message-ID: <53B16527.8060301@suse.de>
References: <1404075022-28745-1-git-send-email-afaerber@suse.de>	<1404075022-28745-2-git-send-email-afaerber@suse.de> <CAOesGMhKY1Lb+o8AbtFXS5c7SLg2uGt4-oosdro2FMj_+bB6Tw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMhKY1Lb+o8AbtFXS5c7SLg2uGt4-oosdro2FMj_+bB6Tw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, Ben Chaco <bchaco-injpXsizQNY@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Matteo Vit <matteo.vit-WGsyu9ztxDWovDFt+AQlJdBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

+Matteo

Am 30.06.2014 07:15, schrieb Olof Johansson:
> On Sun, Jun 29, 2014 at 1:50 PM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
>> This allows to boot the Adapteva Parallella board to serial console.
>>
>> Cc: Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>
>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>=20
> Nice and clean DTS, just a couple of comments below.
>=20
>> diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/d=
ts/zynq-parallella.dts
>> new file mode 100644
>> index 0000000..98df66c
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/zynq-parallella.dts
>> @@ -0,0 +1,63 @@
>> +/*
>> + * Copyright (c) 2014 SUSE LINUX Products GmbH
>> + *
>> + * Derived from zynq-zed.dts:
>> + *
>> + *  Copyright (C) 2011 Xilinx
>> + *  Copyright (C) 2012 National Instruments Corp.
>> + *  Copyright (C) 2013 Xilinx
>> + *
>> + * This software is licensed under the terms of the GNU General Pub=
lic
>> + * License version 2, as published by the Free Software Foundation,=
 and
>> + * may be copied, distributed, and modified under those terms.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +/dts-v1/;
>> +/include/ "zynq-7000.dtsi"
>> +
>> +/ {
>> +       model =3D "Parallella Board";
>> +       compatible =3D "xlnx,zynq-7000";
>=20
> This should have a more specific compatible as the first one. Probabl=
y
> something like:
>    compatible =3D "adapteva,parallella", "xlnx,zynq-7000";

Sure, I can add one if desired. As indicated in the file header, I used
zynq-zed.dts as template, which doesn't have its own either:

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arc=
h/arm/boot/dts/zynq-zed.dts

Andreas, can I assume you would be okay with me assigning Adapteva, Inc=
=2E
the suggested "adapteva" prefix in the below list?

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/vendor-prefixes.txt

I guess it'll come in handy if we ever document the Epiphany
coprocessor's registers. The physical chip on the board is connected vi=
a
some FPGA glue - would that be placed like this?

/ {
	amba {
		epiphany: epiphany@80000000 {
			compatible =3D "adapteva,epiphany-iii";
			reg =3D <0x80000000 0x40000000>;
		};
	};
};

It's accessed through /dev/epiphany in a userspace library below,

https://github.com/adapteva/epiphany-libs/blob/master/src/e-hal/src/epi=
phany-hal.c#L215

https://github.com/adapteva/epiphany-libs/commit/80364e8ee4e99e450a6328=
85a62e7a501398c200

but it's not clear to me who is supposed to create that device. No
downstream kernel driver nor corresponding node in the device tree:

https://github.com/parallella/parallella-linux-adi/blob/d04c39251dc3153=
b60555642b502dde15f7156a6/arch/arm/boot/dts/zynq-parallella.dts

Ben? Andreas?

Anyway, given that vf610.dtsi only documents the Cortex-A5 core but not
its Cortex-M4 companion core, I'm assuming we should not add the 16 (or
64) Epiphany cores to /cpus node (which would then require to split thi=
s
file into zynq-parallella.dtsi and zynq-parallella-{e16,e64}.dts).

>> +
>> +       memory {
>> +               device_type =3D "memory";
>> +               reg =3D <0 0x20000000>;

Err, this should be <0 0x40000000> (1 GiB). Copied from zynq-zed.dts,
and downstream has the wrong value, too.

> Does the bootloader update this entry, or is it truly static? If it's
> updated then it's become recent habit to leave the memory size empty
> in the static file.

The board uses a downstream U-Boot, displaying 992 MiB on serial.

andreas@parallella:/proc/device-tree/memory> hexdump -C reg
00000000  00 00 00 00 3e 00 00 00                           |....>...|
00000008

That matches 992 * 1024 * 1024. Shall I change to <0 0> then?

Confusing though is that the Epiphany manual says memory at <0x1e000000
0x02000000> is reserved for use by the Epiphany:

http://adapteva.com/docs/epiphany_sdk_ref.pdf section 14.1 page 118

I believe that is rather 0x3e000000, which U-Boot seems to confirm:

https://github.com/parallella/parallella-uboot/blob/3f4794e9ac524be6a37=
3e6ff39ee9ae4529e0f14/include/configs/parallella.h#L25

>> +       };
>> +
>> +       chosen {
>> +               bootargs =3D "console=3DttyPS0,115200 earlyprintk ro=
ot=3D/dev/mmcblk0p2 rootfstype=3Dext4 rw rootwait";
>> +       };
>> +};
>=20
> A bit more torn on this one, I'm OK with it staying in even if
> firmware overrides for all practical purposes since it's good to keep
> around for reference w.r.t. console. Note that we're starting to move
> over to using /chosen/stdout-path, so you might want to add that now
> instead of later.

The board boots U-Boot from flash; U-Boot is configured with no
bootdelay, and users are instructed to deploy one of two provided
devicetree.dtb files, depending on whether they want to run headless
(console=3DttyPS0,115200) or with HDMI-enabling FPGA bitstream (no
console=3D). No bootargs variable is set in U-Boot environment.

U-Boot loads uImage, device tree and bitstream from FAT p1, and device
trees currently hardcode an ext4 p2, so I intentionally left that in
here, for unmodified .dtb deployment for shipping bootloader.

I'll look into /chosen/stdout-path, thanks for the pointer.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=
=BCrnberg
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
