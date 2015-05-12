From: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH v4 2/2] pinctrl: asm9260: add pinctrl add device tree
 bindings documentation
Date: Tue, 12 May 2015 18:02:40 +0200
Message-ID: <55522420.3010503@rempel-privat.de>
References: <1428306169.634.51.camel@x220>	<1428311043-12012-1-git-send-email-linux@rempel-privat.de>	<1428311043-12012-3-git-send-email-linux@rempel-privat.de> <CACRpkdbAipNWY+Vn77x88apchnbjKpCtWPAZU2uHM0ZsEQOjkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GCja8ht0tNcCFKl1QsMuBwBQo0kR07blK"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbAipNWY+Vn77x88apchnbjKpCtWPAZU2uHM0ZsEQOjkA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GCja8ht0tNcCFKl1QsMuBwBQo0kR07blK
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Am 05.05.2015 um 16:46 schrieb Linus Walleij:
> On Mon, Apr 6, 2015 at 11:04 AM, Oleksij Rempel <linux@rempel-privat.de=
> wrote:
>=20
>> Add device tree bindings documentation for Alphascale asm9260 pin cont=
roller
>>
>> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
>=20
> (...)
>> +* Alphascale ASM9260 SoC pinctrl core driver
>> +
>> +The pinctrl driver enables Alphascale ASM9260 to configure pin multip=
lexing
>> +to a specific function.
>> +
>> +Required properties for pinctrl driver:
>> +- compatible: "alphascale,asm9260-pinctrl"
>> +- reg: Register base of the MPP block and length.
>> +- clocks: clock ids.
>> +- clock-names:
>> +       * 1 "ahb" : AHB gating clock.
>=20
> This clock is usually called pclock, "apb_pclk" (amba peripheral bus
> p clock, don't know what P is...) what name does this have on your
> data sheet?

the datasheet uses only "AHB" or "ahb_clk".
Since i use in other modules same name i would prefer to use one style :)=


>> +The following generic properties as defined in pinctrl-bindings.txt a=
re valid
>> +to specify in a pin configuration subnode:
>> +pins                   - the list of pins that properties in the node=

>> +                         apply to (either this or "groups" has to be
>> +                         specified)
>> +function               - the mux function to select
>> +bias-disable           - disable any pin bias
>> +bias-pull-up           - pull up the pin. Supported only on GPIO0_* p=
ins.
>> +bias-pull-down         - pull down the pin. Supported on all pins exc=
ept of GPIO0_*.
>=20
> Generic bindings, nice. Put a reference to the file pinctrl-bindings.tx=
t
> to point this out.

Yea, it was already done, see ^^ - "The following generic properties as
defined in pinctrl-bindings.txt" :)

--=20
Regards,
Oleksij


--GCja8ht0tNcCFKl1QsMuBwBQo0kR07blK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iF4EAREIAAYFAlVSJCUACgkQHwImuRkmbWm/UwEAhGsFGEibqirMwo8/ruBjZCTw
aC3oKx7joOGOYTmQw1gA/31jN66Tj/nrhmIx9p1DgNmAp4Hb6FaKN/gXMUzPP1YG
=j1iq
-----END PGP SIGNATURE-----

--GCja8ht0tNcCFKl1QsMuBwBQo0kR07blK--
