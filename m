From: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM64: dts: amlogic: Add basic support for Amlogic S905X
Date: Mon, 12 Sep 2016 19:18:10 +0200
Message-ID: <CAOQ7t2bWLq2XP2rKx3msf=1tUfXkQuBWagun46TaKk73qXr=FQ@mail.gmail.com>
References: <20160903082227.30559-1-narmstrong@baylibre.com>
 <20160903082227.30559-3-narmstrong@baylibre.com> <7e27e8c0-bb18-40d8-10d6-3928e66815c7@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7e27e8c0-bb18-40d8-10d6-3928e66815c7-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Carlo Caione <carlo-6IF/jdPJHihWk0Htik3J/w@public.gmane.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 12, 2016 at 6:28 PM, Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org> wro=
te:

>> +Boards with the Amlogic Meson GXL SoC shall have the following properti=
es:
>> +  Required root node property:
>> +    compatible: "amlogic,meson-gxl-s905x", "amlogic,meson-gxl";
>
> Can we please use "amlogic,s905x", "amlogic,meson-gxl"? No need to
> complicate the name. Also affects .dtsi and .dts below.

gxl !=3D s905x.

AFAWK to the GXL family belong several different SoCs, like S905X,
S905D, etc... (see patch 3/3)
This is why we use meson-gxl-s905x, meson-gxl-s905d, etc...

We could s/meson-gxl-s905x/meson-s905x/ and
s/meson-gxl-s905d/meson-s905d/ but I honestly prefer this way because
we can clearly see which family the SoC belongs to (the Amlogic naming
convention is already messy enough).
I mean, yes it's longer, but it's for the sake of documentation IMO.


[cut]
>> +     compatible =3D "amlogic,p212", "amlogic,meson-gxl-s905x", "amlogic=
,meson-gxl";
>> +     model =3D "Amlogic Meson GXL (S905X) P212 Development Board";
>
> Is that its official name? No objection, just wondering whether we need
> both GXL and S905X in the name, and then again the SoC name at all if
> the P212 is unique. Haven't compared the previous Pxxx ones.

P212 is the official name for the S905X Amlogic dev board. It follows
the name we used for the other P20x boards.


[cut]
>> +
>> +/* This UART is brought out to the DB9 connector */
>> +&uart_AO {
>> +     status =3D "okay";
>> +};
>> +
>
> Trailing white line - please watch out for that, git-am will complain.

Right.

[cut]
>> +#include "meson-gxl.dtsi"
>> +
>> +/ {
>> +     compatible =3D "amlogic,meson-gxl", "amlogic,meson-gxl-s905x";
>
> This needs to be reversed.

Agree.

Cheers,

--=20
Carlo Caione
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
