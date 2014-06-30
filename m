From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: zynq: Add Parallella device tree
Date: Sun, 29 Jun 2014 22:15:10 -0700
Message-ID: <CAOesGMhKY1Lb+o8AbtFXS5c7SLg2uGt4-oosdro2FMj_+bB6Tw@mail.gmail.com>
References: <1404075022-28745-1-git-send-email-afaerber@suse.de>
	<1404075022-28745-2-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404075022-28745-2-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Sun, Jun 29, 2014 at 1:50 PM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>=
 wrote:
> This allows to boot the Adapteva Parallella board to serial console.
>
> Cc: Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>

Nice and clean DTS, just a couple of comments below.

> diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dt=
s/zynq-parallella.dts
> new file mode 100644
> index 0000000..98df66c
> --- /dev/null
> +++ b/arch/arm/boot/dts/zynq-parallella.dts
> @@ -0,0 +1,63 @@
> +/*
> + * Copyright (c) 2014 SUSE LINUX Products GmbH
> + *
> + * Derived from zynq-zed.dts:
> + *
> + *  Copyright (C) 2011 Xilinx
> + *  Copyright (C) 2012 National Instruments Corp.
> + *  Copyright (C) 2013 Xilinx
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +/dts-v1/;
> +/include/ "zynq-7000.dtsi"
> +
> +/ {
> +       model =3D "Parallella Board";
> +       compatible =3D "xlnx,zynq-7000";

This should have a more specific compatible as the first one. Probably
something like:
   compatible =3D "adapteva,parallella", "xlnx,zynq-7000";

> +
> +       memory {
> +               device_type =3D "memory";
> +               reg =3D <0 0x20000000>;

Does the bootloader update this entry, or is it truly static? If it's
updated then it's become recent habit to leave the memory size empty
in the static file.

> +       };
> +
> +       chosen {
> +               bootargs =3D "console=3DttyPS0,115200 earlyprintk roo=
t=3D/dev/mmcblk0p2 rootfstype=3Dext4 rw rootwait";
> +       };
> +};

A bit more torn on this one, I'm OK with it staying in even if
firmware overrides for all practical purposes since it's good to keep
around for reference w.r.t. console. Note that we're starting to move
over to using /chosen/stdout-path, so you might want to add that now
instead of later.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
