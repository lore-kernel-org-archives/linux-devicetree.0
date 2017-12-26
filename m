From: Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx: Add memory node unit name
Date: Tue, 26 Dec 2017 16:09:24 -0200
Message-ID: <CAOMZO5But4BU0WP69LoCgGqPGDFNw8hsBB+P8=416oB1e1q6tA@mail.gmail.com>
References: <1512575989-15627-1-git-send-email-marcofrk@gmail.com>
 <20171221090736.3ac9d5db@karo-electronics.de> <CAM4PwSVzVn3=wWpFohw2q23Oiwp1FimCkdHPq=BfG-QzuuPtfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM4PwSVzVn3=wWpFohw2q23Oiwp1FimCkdHPq=BfG-QzuuPtfQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marco Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

On Thu, Dec 21, 2017 at 12:26 PM, Marco Franchi <marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Lothar,
>
> 2017-12-21 6:07 GMT-02:00 Lothar Wa=C3=9Fmann <LW-AvR2QvxeiV7DiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>:
>> Hi,
>>
>> On Wed,  6 Dec 2017 13:59:49 -0200 Marco Franchi wrote:
>>> Fix the following warnings from dtc by adding the unit name to memory
>>> nodes:
>>>
>>> Warning (unit_address_vs_reg): Node /memory has a reg or ranges propert=
y, but no unit name
>>>
>>> Converted using the following command:
>>>
>>> perl -p0777i -e 's/memory \{\n\t\treg =3D \<0x+([0-9a-f])/memory\@$1$\0=
000000 \{\n\t\treg =3D <0x$1/m' `find ./arch/arm/boot/dts -name "imx*"`
>>>
>>> The files below were manually fixed:
>>> -imx1-ads.dts
>>> -imx1-apf9328.dts
>>>
>> The imx*.dtsi files all have this:
>> |       memory { device_type =3D "memory"; reg =3D <0 0>; };
>> Thus you will end up with a 'memory' node with a reg =3D <0 0> entry and
>> an additional 'memory@...' node with the correct 'reg' values.
>
> You are right. The .dtb files were composed by two different memory nodes=
.
> Do you have some recommendation to take off this specific warning?

Currently the only dtc warnings we have with imx_v6_v7_defconfig are:

Warning (unit_address_vs_reg): Node /memory has a reg or ranges
property, but no unit name

What is the recommended way to fix these warnings?

Thanks
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
