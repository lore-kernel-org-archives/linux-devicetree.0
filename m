From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: Re: [PATCH v2 18/19] ARM: dts: aspeed-romulus: Update Romulus system
Date: Wed, 20 Dec 2017 13:52:36 +1030
Message-ID: <CACPK8Xdb59ofAnpGt6Uoe9AubTirzvU1=R-4k2y0mfjz09YAjQ@mail.gmail.com>
References: <20171215062443.23059-1-joel@jms.id.au> <20171215062443.23059-19-joel@jms.id.au>
 <b8e80861-88c4-da87-a201-ca2eefaa5a94@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b8e80861-88c4-da87-a201-ca2eefaa5a94-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>, Patrick Venture <venture-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Xo Wang <xow-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Lei YU <mine260309-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-aspeed-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Dec 18, 2017 at 8:02 PM, C=C3=A9dric Le Goater <clg-Bxea+6Xhats@public.gmane.org> wrote=
:
>> +};
>> +
>> +&fmc {
>> +     status =3D "okay";
>> +
>> +     flash@0 {
>> +             status =3D "okay";
>> +             label =3D "pnor";
>> +             m25p,fast-read;
>> +#include "openbmc-flash-layout.dtsi"
>> +     };
>> +};
>> +
>> +&spi1 {
>> +     status =3D "okay";
>> +
>> +     pinctrl-names =3D "default";
>> +     pinctrl-0 =3D <&pinctrl_spi1_default>;
>> +
>> +     flash@0 {
>> +             status =3D "okay";
>> +             label =3D "pnor";
>> +             m25p,fast-read;
>>       };
>>  };
>
>
> hmm, the fmc and spi1 bindings were already added in commit 1142aea9ff9d.
>
>
>> @@ -38,6 +101,7 @@
>>               status =3D "okay";
>>               m25p,fast-read;
>>               label =3D "bmc";
>> +#include "openbmc-flash-layout.dtsi"
>
>
> This looks like an extra "fmc" node ?

You're right. It still built and booted too. Good catch.

Cheers,

Joel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
