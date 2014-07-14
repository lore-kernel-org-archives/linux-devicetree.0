From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: dts: zynq: Add Parallella device tree
Date: Mon, 14 Jul 2014 11:12:45 -0700
Message-ID: <CAOesGMjMEiQkrCfYyc6y+s9kst74jAjTghbYvxUJ+9KvPGXj1Q@mail.gmail.com>
References: <1404075022-28745-1-git-send-email-afaerber@suse.de>
	<1404075022-28745-2-git-send-email-afaerber@suse.de>
	<CAOesGMhKY1Lb+o8AbtFXS5c7SLg2uGt4-oosdro2FMj_+bB6Tw@mail.gmail.com>
	<61d660b7-17a9-4817-ba34-40a5c1674d28@BY2FFO11FD032.protection.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <61d660b7-17a9-4817-ba34-40a5c1674d28-neA4ZlFjCT3tsTj3uZFmc2YJ4DzVTqeXkX/xN29GLwg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 8, 2014 at 4:18 AM, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> =
wrote:
> On 06/30/2014 07:15 AM, Olof Johansson wrote:
>> Hi,
>>
>> On Sun, Jun 29, 2014 at 1:50 PM, Andreas F=C3=A4rber <afaerber@suse.=
de> wrote:
>>> This allows to boot the Adapteva Parallella board to serial console=
=2E
>>>
>>> Cc: Andreas Olofsson <andreas-hhg9azYwhpdWk0Htik3J/w@public.gmane.org>
>>> Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>>
>> Nice and clean DTS, just a couple of comments below.
>>
>>> diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/=
dts/zynq-parallella.dts
>>> new file mode 100644
>>> index 0000000..98df66c
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/zynq-parallella.dts
>>> @@ -0,0 +1,63 @@
>>> +/*
>>> + * Copyright (c) 2014 SUSE LINUX Products GmbH
>>> + *
>>> + * Derived from zynq-zed.dts:
>>> + *
>>> + *  Copyright (C) 2011 Xilinx
>>> + *  Copyright (C) 2012 National Instruments Corp.
>>> + *  Copyright (C) 2013 Xilinx
>>> + *
>>> + * This software is licensed under the terms of the GNU General Pu=
blic
>>> + * License version 2, as published by the Free Software Foundation=
, and
>>> + * may be copied, distributed, and modified under those terms.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +/dts-v1/;
>>> +/include/ "zynq-7000.dtsi"
>>> +
>>> +/ {
>>> +       model =3D "Parallella Board";

You might want to have this say "Adapteva Parallella Board" instead
(just noticed).

>>> +       compatible =3D "xlnx,zynq-7000";
>>
>> This should have a more specific compatible as the first one. Probab=
ly
>> something like:
>>    compatible =3D "adapteva,parallella", "xlnx,zynq-7000";
>
> We were using these compatible properties but later there is no reaso=
n
> to create them because they will be unused.
> It is easy to add it when you need it which is not this case.

No, please add it from day one, otherwise everybody needs to update
their device tree, some will miss doing it, etc, etc. It's a simple
and trivial thing to do, and no reason to leave it o ut.

>>> +
>>> +       memory {
>>> +               device_type =3D "memory";
>>> +               reg =3D <0 0x20000000>;
>>
>> Does the bootloader update this entry, or is it truly static? If it'=
s
>> updated then it's become recent habit to leave the memory size empty
>> in the static file.
>
> Depends on your bootloader. I think it is good to have it here.
> Also this file can be used by u-boot for example and u-boot can be co=
nfigured
> from it that's why I think that make sense to keep this here.

Ok. It's become commonplace to leave memory empty for the machines
where it's guaranteed that the bootloader will have updated it, to
avoid having stale or incorrect values in the static tree. I'm not
going to be strict about it, but it's something to consider.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
