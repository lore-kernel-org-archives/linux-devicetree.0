Return-Path: <SRS0=7Anx=F3=vger.kernel.org=devicetree-compiler-owner@kernel.org>
Date: Mon, 5 Mar 2018 17:40:13 +1100
From: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH/RFC dtc 0/2] Drop unit addresses from overlay fragments
Message-ID: <20180305064013.GM2650@umbus.fritz.box>
References: <1519374917-30171-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="asNXdz5DenlsLVVk"
Content-Disposition: inline
In-Reply-To: <1519374917-30171-1-git-send-email-geert+renesas@glider.be>
Sender: devicetree-compiler-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jon Loeliger <jdl@jdl.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, devicetree-compiler@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--asNXdz5DenlsLVVk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2018 at 09:35:15AM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
>=20
> Using "fragment@N" as node name for overlay fragments violates unit
> address rules:
>=20
>     <stdout>: Warning (unit_address_vs_reg): Node /fragment@0 has a unit =
name, but no reg property

Hm, regardless of this patch, that's really a bug in the checks not to
handle overlays as a different case.

The quick fix would be to just suppress that check if an __overlay__
subnode exists.  THe more ambitious approach would be to actually
parse things that look like overlays into their components and apply
checks separately to each fragment (except for ones that don't make
sense except on a fully resolved tree).  I had plans for that, but am
unlikely to get time to work on it any time soon.

> This patch series (for dtc) fixes:
>   1. generation of node names when using overlay sugar syntax,
>   2. all documentation and tests.
>=20
> If this is accepted, I'll send similar patches for Linux.
>=20
> Note that I've been using "fragment-N" in hand-written DT overlays for
> years, so this is known to work fine with Linux.

Existing tools expecting the @ would be my only concern with this.
You've check Linux is ok, and I've checked libfdt is ok too.  I'm not
really confident if that's enough to call it everything we care about.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--asNXdz5DenlsLVVk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlqc5ksACgkQbDjKyiDZ
s5KPhA/+PnmpypDdID70zHhD/Cet6BwiZSBITuGRNclWSDLuoQ8fT190BIyCTJpQ
SNA322mKDSpBETyq0JBgdzVyK2xPDXmFPODB2ZmuKzndzymnBvTuNUKTBIsD92dW
pT2cB/9qhdIoupFMOLHZohPTs5NyxBDoO43XGVzDOjPj4QGNgxpxJMzYshC6dRaZ
T+hx0lwzOGVdJJS5OxN6SiHg/A34D9QvhWT8UKPE5OA3gEMlGo4E/a6uBOvH28G+
YeYjGm/jsE9kNwIjvNdJo61PAfE5GeXTlEVQ8cTGHL1GmLjwp7Jf93D8LH/ec6j4
RzABXZinuZuaGmktHyI8EgQCzt30E9kt1d0/iFa2oMjNqibUgSN/UEjsBZICGgZE
eBRyLeRt71dZdJdde9WPG5QoNHvggygGzQJInJadfq+DkHbCJ6+ATxlRKqCT65bd
kYeoWvbMc/D5ERASBiX/aW5iPq6Edor6+DRSSWAcvvaolCCQAlUaBgYlAB2XY2O0
JOs45g+T5ugh5zE2lYBqWxm/NjtIn3vUwb0PCumIH6Q7az1PlP6QB8GsQcdUA6cG
rZ5Wb9Sx7tHILcVInytwOs/jGD3PZbrKwRo7mkz4up+ikfGUYWfxVM/FuxLw/2dR
uQS9WiE2np5VbHLYsCIslSUtIfqeIdX4sDV+z1j4qO94clK+5+U=
=rCqq
-----END PGP SIGNATURE-----

--asNXdz5DenlsLVVk--
