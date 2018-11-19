From: Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [Letux-kernel] [PATCH 0/5] gnss: sirf: add support for w2sg0004
 + lna
Date: Mon, 19 Nov 2018 19:44:14 +0100
Message-ID: <20181119194414.1c7d6887@aktux>
References: <20181118215801.12280-1-andreas@kemnade.info>
        <3487514B-E546-4F11-8C0A-F5B4A8114376@goldelico.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QxG88QwxSvDB+6LkeHZqApT"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3487514B-E546-4F11-8C0A-F5B4A8114376@goldelico.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org

--Sig_/QxG88QwxSvDB+6LkeHZqApT
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 19 Nov 2018 09:22:59 +0100
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> Hi,
>=20
> > Am 18.11.2018 um 22:57 schrieb Andreas Kemnade <andreas@kemnade.info>:
> >=20
> > Here is another chapter of the story to get gta04 gnss power
> > management into the mainline kernel.
> > There is a w2sg0004 without wakeup line in there, so power state
> > can only be determined indirectly by looking at the serial data lines.
> > Then there as also an lna which needs to be powered for real gps
> > reception. That part needs probably more discussion, since it might
> > be an idea to have it more generalized since it has nothing todo
> > with the chip itself. =20
>=20
> On the other hand if we follow the "SoC is the spider in the net"
> way of looking at DTS hierarchy, we have the uart as a child of the
> SoC and the gnss receiver as a serdev child of the UART. The LNA
> is even one step more distantly connected to the gnss. So it makes
> sense to me to have it as a property/reference of the gnss chip's
> DTS record which is a sibling of the compatible records. So the only
> place where it can be reasonably processed is the driver.
>=20
Or the lna is a child of the gnss receiver. The whole thing
should probably not be overdesigned, but it does not make sense that
every gnss chip driver has some lna logic.
Maybe the regulator should just be stored in the struct
gnss_device and then drivers/gnss/core.c takes care.

Regards,
Andreas

--Sig_/QxG88QwxSvDB+6LkeHZqApT
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE7sDbhY5mwNpwYgrAfb1qx03ikyQFAlvzBH4ACgkQfb1qx03i
kyTgPQ//RA8pPeqn1cTeHl9WICut+tS9Hi42qRG7/a+aR2lAz+/FiWc0cJPoF8vO
h1vTlnCR+NsGC7jT2X/I1RW50isiCmzNTAcPaEBmKj1JbjslowWL29GiG03TibID
Y7be5v6SiZiDNvCBRkuC5x1zCNAWHOf66/HsQQLsX2FABMgZSGNE9pwpPTSUDbIz
dBxCYPZl3ax6aRN3eo9kIl3UHvSVGx940VG9tdNl7rCtpWpQYOzedK2OX+ZtQjeI
b3S2kK1gcQQYsA3dLWHpVnCWujDzoT7/HzuVl2C1jCrJyuyf/cDbHjJpNRoq5gBS
waZYlTKm9Wzd9M3wFbFE6JjG6DH4JVJZqXTPJ8DJBCy4YgSFpU5NmA+20wpDF6sL
wp+MzhOS3A+fc9lMAGEC8HPZltXQmRxcilCOR91wYBCAlK0BeY4hXN+Pd5ESiLhG
Z6sW5wH/fUlUoQ69zu74IXid1NJB2qI6QWX4wtXFMUcfJvCdihja03taMW8qgzLV
7RstMW0xpWIkNX3uJSAI/gQmGhZQt1nsnZkVX3acq70ZlcIbrjPMm7i0xboesS4J
SOR804e7EwmZ86r58GmNpsJ5uXbihMlkGtTSWt8nba+hBBztPZVw/SLpsvsbqGET
Yrr6rVH8rdseHfqLZGxZWEO/woTXOvCGNGS+e1DY2eXBrlt3eCw=
=7gJ+
-----END PGP SIGNATURE-----

--Sig_/QxG88QwxSvDB+6LkeHZqApT--
