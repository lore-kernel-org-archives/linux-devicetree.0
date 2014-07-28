From: Benoit Masson <benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: mvebu: Added dts defintion for Lenovo Iomega ix4-300d NAS
Date: Mon, 28 Jul 2014 12:50:47 +0200
Message-ID: <78788908-DDB5-46F8-83C1-FAE312D7BFB2@perenite.com>
References: <1406418436-61452-1-git-send-email-yahoo@perenite.com> <20140727015244.GA31974@lunn.ch> <5442226.1WCY4fjGCy@wuerfel>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5442226.1WCY4fjGCy@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Benoit Masson <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
List-Id: devicetree@vger.kernel.org


Le 28 juil. 2014 =E0 10:49, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> a =E9crit :

> On Sunday 27 July 2014 03:52:44 Andrew Lunn wrote:
>> Hi Benoit

Hi Arnd,

>>=20
>>> +                     i2c@11000 {
>>> +                             compatible =3D "marvell,mv78230-a0-i2=
c",
>>> +                                     "marvell,mv64xxx-i2c";
>>=20
>> The point of my patches is that you don't need the
>> "marvell,mv78230-a0-i2c". It will work out at runtime if the SoC is =
A0
>> stepping and automatically enable the workaround. Please test with
>> only "marvell,mv64xxx-i2c";
>>=20
>=20
> It should still list both "marvell,mv78230-i2c" and "marvell,mv64xxx-=
i2c",
> as the generic name may not be enough to describe the register layout
> correctly.

I tend to disagree since the dts include the armada-xp.dtsi, which alre=
ady declare

"i2c0: i2c@11000 {
				compatible =3D "marvell,mv78230-i2c", "marvell,mv64xxx-i2c";
				reg =3D <0x11000 0x100>;
			};
"

I tested the dts on the device and it does inherits the i2c declaration=
, did I miss something here ?

Benoit

> 	Arnd

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
