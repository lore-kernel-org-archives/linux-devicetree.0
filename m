From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v3] arm: dts: sun7i-a20-bananapi: name the GPIO lines
Date: Wed, 10 May 2017 16:27:53 +0200
Message-ID: <9d88e913-2848-a41a-a00c-78f95b4bd556@rempel-privat.de>
References: <1494048638-24365-1-git-send-email-linux@rempel-privat.de>
 <20170509202725.e2tkry7dmsgx7se5@lukather>
 <17553199-cc74-96ae-bc75-5e91b866ccd1@rempel-privat.de>
 <20170510124741.GI5465@flea.lan>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6814696790373771846=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170510124741.GI5465@flea.lan>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, ore@pengutronix.de, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6814696790373771846==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FLVjWgt0elIkWaXXiS7uq68BT6hUCGHBM"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FLVjWgt0elIkWaXXiS7uq68BT6hUCGHBM
Content-Type: multipart/mixed; boundary="rv128XbHMWQFLdgtUv1fEssaOgqFISg6h";
 protected-headers="v1"
From: Oleksij Rempel <linux@rempel-privat.de>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: ore@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>
Message-ID: <9d88e913-2848-a41a-a00c-78f95b4bd556@rempel-privat.de>
Subject: Re: [PATCH v3] arm: dts: sun7i-a20-bananapi: name the GPIO lines
References: <1494048638-24365-1-git-send-email-linux@rempel-privat.de>
 <20170509202725.e2tkry7dmsgx7se5@lukather>
 <17553199-cc74-96ae-bc75-5e91b866ccd1@rempel-privat.de>
 <20170510124741.GI5465@flea.lan>
In-Reply-To: <20170510124741.GI5465@flea.lan>

--rv128XbHMWQFLdgtUv1fEssaOgqFISg6h
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 10.05.2017 um 14:47 schrieb Maxime Ripard:
> On Wed, May 10, 2017 at 06:47:58AM +0200, Oleksij Rempel wrote:
>>>> +		"", "", "", "", "SCL", "SDA", "", "",
>>>
>>> I'm not sure how it's called in the schematics / documentation, but
>>> having a way to get which bus it's from would be helpful (like you di=
d
>>> for the PMIC I2C bus).
>>
>> I use only names provided by schematics. Using something different IMO=

>> makes no sense and confusing.
>=20
> Indeed.
>=20
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		/* PC */
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		/* PD */
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		/* PE */
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		/* PF */
>>>> +		"SD0-D1", "SD0-D0", "SD0-CLK", "SD0-CMD", "SD0-D3",
>>>> +			"SD0-D2", "", "",
>>>
>>> Why did you change the wrapping and indentation on those two lines?
>>
>> i use 8 entry per line to keep counting easier. If line is too wide, i=

>> wrap it with changed indentation.
>=20
> Ack.
>=20
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		/* PG */
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		"", "", "", "", "", "", "", "",
>>>> +		/* PH */
>>>> +		"TXD0", "RXD0", "IO-1", "PH3", "USB0-IDDET", "PH5", "", "",
>>>
>>> What are PH3 and PH5 used for on the board? Can't we provide a more
>>> explicit name?
>>
>> Only names used by schematic :) If we will use something different use=
rs
>> will hate us even more.
>=20
> Those schematics suck then :)
>=20
>> I can image to use some kind of combination of connector name and pin
>> name. For example: "JP1-RXD0", or some thing like this.
>=20
> There's no mark on the PCB either?

correct, no mark on the PCB.

> RXD0 and the other are fine, the
> only ones that concern me are PH3 and PH5, which are basically only
> the SoC pin name, and nothing else.
>=20
> I guess we don't really have the choice if the schematic uses that,
> and there's nothing on the PCB..

ack.

--=20
Regards,
Oleksij


--rv128XbHMWQFLdgtUv1fEssaOgqFISg6h--

--FLVjWgt0elIkWaXXiS7uq68BT6hUCGHBM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlkTI2kACgkQHwImuRkmbWkyRwD/bKYOPl52yyMQIGubplrYyHDh
syiwQn7PT8YGLrLg/EMA/3pnaiYJp7pKimKWM8fVxhHjJPtaq7kOsxqhsqQ7jaIW
=lV08
-----END PGP SIGNATURE-----

--FLVjWgt0elIkWaXXiS7uq68BT6hUCGHBM--


--===============6814696790373771846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6814696790373771846==--
