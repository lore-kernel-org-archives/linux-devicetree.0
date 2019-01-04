From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [Letux-kernel] [PATCH RFC] bluetooth: add uart h4 devices via
 serdev/devicetree
Date: Fri, 4 Jan 2019 06:44:03 +0100
Message-ID: <20190104064403.325771fd@kemnade.info>
References: <20181110232034.17277-1-andreas@kemnade.info>
        <20181111024648.7rt7rlhaqihtqecv@earth.universe>
        <20181112215812.18ebca35@aktux>
        <2C74C837-A6D3-47C9-BE59-CCA594289B94@goldelico.com>
        <20181112222726.73m2oca7hankvcjs@earth.universe>
        <CABGGisxsdv+BTd5-HMzF8asEcWtL5F4CMzmkrBCwK=NibvqjLQ@mail.gmail.com>
        <20181113170128.0f59ef0e@kemnade.info>
        <86A3A2E6-FC89-42FE-8410-9C8273EC9CF7@holtmann.org>
        <20181116204601.4e1aa0de@kemnade.info>
        <09AFE47C-D188-4397-A2CD-C70FFAC3B677@holtmann.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Hz5e=EICJcp5xVQUKJXvZ7j"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <09AFE47C-D188-4397-A2CD-C70FFAC3B677@holtmann.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Rob Herring <robh@kernel.org>, sebastian.reichel@collabora.com, hns@goldelico.com, devicetree@vger.kernel.org, Johan Hedberg <johan.hedberg@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-bluetooth@vger.kernel.org, letux-kernel@openphoenux.org
List-Id: devicetree@vger.kernel.org

--Sig_/Hz5e=EICJcp5xVQUKJXvZ7j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Marcel,

On Fri, 16 Nov 2018 20:58:24 +0100
Marcel Holtmann <marcel@holtmann.org> wrote:

> Hi Andreas,
>=20
> >> Btw. I see nothing standing in the way of merging btuart.c driver and =
then go from there. Either I dig this out and submit or someone else does.
> >>  =20
> > Do you mean this?
> > https://patchwork.kernel.org/patch/10490651/ =20
>=20
> yes, that one.
>=20
Hmm, there seemed to be nothing in the pull requests regarding btuart.
Did you change plans?

commit 29d3c047b7038d7efce4f279e4d4165d69f6ccb9
Merge: 5a862f86b8e8 1629db9c7534
Author: David S. Miller <davem@davemloft.net>
Date:   Wed Dec 19 08:41:45 2018 -0800

    Merge branch 'for-upstream' of git://git.kernel.org/pub/scm/linux/kerne=
l/git/bluetooth/bluetooth-next
   =20
    Johan Hedberg says:
   =20
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    pull request: bluetooth-next 2018-12-19
   =20
    Here's the main bluetooth-next pull request for 4.21:
   =20
     - Multiple fixes & improvements for Broadcom-based controllers
     - New USB ID for an Intel controller
     - Support for new Broadcom controller variants
     - Use DEFINE_SHOW_ATTRIBUTE to simplify debugfs code
     - Eliminate confusing "last event is not cmd complete" warning message
     - Added vendor suspend/resume support for H:5 (3-Wire UART) controllers
     - Various other smaller improvements & fixes
   =20
    Please let me know if there are any issues pulling. Thanks.


Regards,
Andreas

--Sig_/Hz5e=EICJcp5xVQUKJXvZ7j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE7sDbhY5mwNpwYgrAfb1qx03ikyQFAlwu8qMACgkQfb1qx03i
kyQSEg/+Lo4Ruo+8/r63a7FWorKKYjnPMM9btjjHj0ggHDjZMgtHUk0JIkqB3BnV
sZ0z7UkhDQ7k6C3ElagI4UdDqmdV4IG1GufdP7GhyoGwMA5aAEIvPDKiwnCcZZFr
KjOAGMCFtZXxmu77bv976LcwJ1NqbwttgeI7068qPCTFBUqwJIcfY+s+o7e4o86V
PEX1LeOlpo5BnKPb0o4DdoVckIqiPN9fjYJMUxkL5pZyRFwt1a2kD2mTurgeGAhJ
I8yAXhQ4mNSehOtDM6UTOhaq7/IOcKjDn5E3O8Q9gvT0701ootLhLRO5PcdF5iNM
kPOn/mN/So/+ZOwBuxDHYRbrZiarKyJ2u6xPD1acM1bul07Kv+fnzimbN5DQfoWi
QYYcKp/80sIIqywr9BRCyIOJ4aaYng+y4CKWZv+yBGCgDLzDAlOEsQ62MwJsYZ2F
v2h+suyqbNugt5Qghv6Wpdx6CXCDp0gglX1JuJGOr2DSvHZTaZY6WLbiNzKCR65R
BQToXDw2/7wnsRKgu0jXjfWEs5PbOYLG5aj+Uc4PAMYi/8dmAdcXB63rzZFRIc9q
aPXB5d8rLkpkxRcB2InCR7noamh6Q626wCx8/4vqVxdXIXN7van0PxD4U78GXuDj
7U7IYLr+mKKG+lgtvJ+jZKlHcUkoo2fYdRjHbvVJdf7BBcvjxVE=
=JeaL
-----END PGP SIGNATURE-----

--Sig_/Hz5e=EICJcp5xVQUKJXvZ7j--
