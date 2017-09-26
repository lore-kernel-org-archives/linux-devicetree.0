From: Quentin Schulz <quentin.schulz@free-electrons.com>
Subject: Re: [PATCH v2 01/10] pinctrl: move gpio-axp209 to pinctrl
Date: Tue, 26 Sep 2017 14:59:38 +0200
Message-ID: <cca522e6-1dbf-b682-b8fe-907fa293f335@free-electrons.com>
References: <cover.1c314f4154a6d27354625f03d0a5269eee55a9c5.1506428208.git-series.quentin.schulz@free-electrons.com>
 <e193f8efe9092171ebeffb77ab77422179fd3cab.1506428208.git-series.quentin.schulz@free-electrons.com>
 <20170926125518.kulkohinaojty2zl@flea>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1wRK5rxTKnVOU8HPvRh5JKvR0NS4sdKt2"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170926125518.kulkohinaojty2zl@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, linux@armlinux.org.uk, lee.jones@linaro.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com, thomas.petazzoni@free-electrons.com
List-Id: devicetree@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1wRK5rxTKnVOU8HPvRh5JKvR0NS4sdKt2
Content-Type: multipart/mixed; boundary="hB1sSdTrWHGXRvfR6jt6iIOrtbSh1anHf";
 protected-headers="v1"
From: Quentin Schulz <quentin.schulz@free-electrons.com>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com,
 wens@csie.org, linux@armlinux.org.uk, lee.jones@linaro.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@googlegroups.com, thomas.petazzoni@free-electrons.com
Message-ID: <cca522e6-1dbf-b682-b8fe-907fa293f335@free-electrons.com>
Subject: Re: [PATCH v2 01/10] pinctrl: move gpio-axp209 to pinctrl
References: <cover.1c314f4154a6d27354625f03d0a5269eee55a9c5.1506428208.git-series.quentin.schulz@free-electrons.com>
 <e193f8efe9092171ebeffb77ab77422179fd3cab.1506428208.git-series.quentin.schulz@free-electrons.com>
 <20170926125518.kulkohinaojty2zl@flea>
In-Reply-To: <20170926125518.kulkohinaojty2zl@flea>

--hB1sSdTrWHGXRvfR6jt6iIOrtbSh1anHf
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

On 26/09/2017 14:55, Maxime Ripard wrote:
> On Tue, Sep 26, 2017 at 12:17:11PM +0000, Quentin Schulz wrote:
>> To prepare the driver for the upcoming pinctrl features, move the GPIO=

>> driver AXP209 from GPIO to pinctrl subsystem.
>>
>> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
>=20
> I'm not sure we actually need to do this. Can't we just keep the
> driver here?
>=20

That's not what I understood from:
https://lkml.org/lkml/2016/11/24/360 and the following answers from
Linus on the first version.

Quentin
--=20
Quentin Schulz, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com


--hB1sSdTrWHGXRvfR6jt6iIOrtbSh1anHf--

--1wRK5rxTKnVOU8HPvRh5JKvR0NS4sdKt2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJZyk9BAAoJEIS4mnU+4PGjNzYP/3zF+TkPDVi+l7h7FXpXhExx
VpfT0OG/loAjdc5O6LmX1b8BT8TNlu6eFq1XEUIGjepjbKrp6VMyS6iMgEp8+kKz
uI3h6VwD3nIGhVnPIib3IJhbvrifus/XlXnI1KmNLA69vAyeD4/xKR1M0tB2oqG7
msYUhoaLZV6kfXjwxr1fmeitNPH1nDYJPC30V+hRPBsYZaneRq8ms/pUcKsHvxYx
MbDJCaUJMUZ5c1pDbIn+NeuWLs2nj6ZOsspziOKDCyIA066RfriqQE39hKi3xhTf
b5Kczz2rzZ+kIYh4sYzQMpa3FrQkAA3wqln68GG0SDHDetNLGNas9qKEzt95kLDg
doUQi4zD4+TVGsA8azTgZMnB8tCrb6vQP+NbyYAUc4gKU1bwCdkkVP0naIAD0lW/
rSX3knL7G459skDLfMrTxMRpIWG4+s1mGWelgHEnidbJR7rTGXzWvdY+33ZBvBtz
GA7jmWBfQTBj7pEGaTL173achyBSI4hJqKh8RwNr1I3P8xcgAva0vGDl6qxZ/Cbk
Wd8xzxPLobJVx6vJJGMpo0kOLMJQ80BGCBaMeB8K48oFryWfJJNkHRcW7Zd846lz
oAbOXuQGxTPg6TmS058fN/+ZCbb9L+7GVm2lTWgI8tRYUPJFXZmJMsoxzuOTUtqd
EDCoVRVB5WHjrZ6uOSaq
=qg0b
-----END PGP SIGNATURE-----

--1wRK5rxTKnVOU8HPvRh5JKvR0NS4sdKt2--
