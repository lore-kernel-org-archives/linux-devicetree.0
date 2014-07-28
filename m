From: Benoit Masson <benoitm@perenite.com>
Subject: Re: [PATCH 2/2] ARM: mvebu: Added dts defintion for Lenovo Iomega ix4-300d NAS
Date: Mon, 28 Jul 2014 13:17:56 +0200
Message-ID: <78E68BC6-1D2C-4B75-93BA-5414A358B90D@perenite.com>
References: <1406418436-61452-1-git-send-email-yahoo@perenite.com> <5442226.1WCY4fjGCy@wuerfel> <78788908-DDB5-46F8-83C1-FAE312D7BFB2@perenite.com> <6028388.mjACYPxFta@wuerfel>
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6028388.mjACYPxFta@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Benoit Masson <yahoo@perenite.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, jason@lakedaemon.net, gregory.clement@free-electrons.com, sebastian.hesselbarth@googlemail.com
List-Id: devicetree@vger.kernel.org


Le 28 juil. 2014 =E0 13:02, Arnd Bergmann <arnd@arndb.de> a =E9crit :

> On Monday 28 July 2014 12:50:47 Benoit Masson wrote:
>>>=20
>>> It should still list both "marvell,mv78230-i2c" and "marvell,mv64xx=
x-i2c",
>>> as the generic name may not be enough to describe the register layo=
ut
>>> correctly.
>>=20
>> I tend to disagree since the dts include the armada-xp.dtsi, which a=
lready declare
>>=20
>> "i2c0: i2c@11000 {
>>                                compatible =3D "marvell,mv78230-i2c",=
 "marvell,mv64xxx-i2c";
>>                                reg =3D <0x11000 0x100>;
>>                        };
>> "
>>=20
>> I tested the dts on the device and it does inherits the i2c declarat=
ion, did I miss something here ?
>>=20
>=20
> Inheriting from armada-xp.dtsi is fine, but if you manually set
> "marvell,mv64xxx-i2c", that will override the old setting
> and drop the "marvell,mv78230-i2c" part, which is bad because
> it may break things later if it turns out that the mv78230
> variant is not completely compatible with the old
> mv64xxx variant.

Ok then does this mean I can simply remove the "compatible" line to onl=
y inherits from armada-xp-dtsi ?

"i2c@11000 {
                                clock-frequency =3D <400000>;
                                status =3D "okay";
"

Would this be enough ?

Benoit
>=20
> 	Arnd
