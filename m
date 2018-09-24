Return-Path: <SRS0=YKJg=MG=the-dreams.de=wsa@kernel.org>
Date: Mon, 24 Sep 2018 14:26:37 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/4] dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
Message-ID: <20180924122637.GA1661@kunai>
References: <1537530911-443-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537530911-443-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVY1ty4fGoBg7qxfkRaEBEgBEK5YDgwNryDx_tCUYpiaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVY1ty4fGoBg7qxfkRaEBEgBEK5YDgwNryDx_tCUYpiaw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux MMC List <linux-mmc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> It seems RZ/G1C has two slighty different types of SD card interfaces:
>   1. SDHI0 and SDHI2 use SYS-DMAC,
>   2. SDHI1 can also be used as an MMC interface, and has an internal DMAC.
>=20
> Do we need to distinguish between them using the compatible value, or
> are there other ways?

Yes, that seems to need an update to our current implementation which is
per-SoC only. One idea from my side would be to whitelist SYS-DMAC for
this compatible and then check if dma-properties are present, otherwise
fall back to internal DMAC?

Fabrizio, did you have any plans how to handle that?


--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAluo1/gACgkQFA3kzBSg
KbYeAhAAqarCEpfmEGKlwODi5BDbr38IM0dyMdhv7WO1YLJhfO6K91vb7Ll0qddM
E1z+Enrmst3g/H8VzRv7PR80JMHnjTDI727ylXW9l8GrFYnnfah7omaxJ654FIp2
Nrh/jw2woeqHDCRk5Oka75zVl5HiJhSjUT2LT1NSFNjMrSvedSD/H9t/v597Xnwo
friYU4TO9FteZAfsBBSEI2F4QtsSHyeJXGKGDW+d74pzOhLRp4IH/APzJBb4pTnG
+0Wjwc1qBJXfbZEdq4XKwabUTKsG2+u4Kt90Gv0gjEkVVecZy05vN7kOAq01wCxm
r2jqwxI/uW3UPfc3yHRJDT1asgMf2qxsC2X0MKyZcj4kbf7cGdF3zA9WmCF4pObp
CHYUnzqS6rOmLSoiw+lNEjb2M30XkqShErDnoZJYbJV4YxuDz9a5vhOaUZvv2VRH
Clvixxrjm4e3WPjY7QkJN4047unu5A/p3Pzk0XMba+W7KEY/eOtpY8mK8cyATz/Y
aMseOoYYeyERvkieXcIgyUEfT6wVdA6NQN5FggCrKJIxp9dF8wFjydCMjXuvw8Ud
rwbRYev94cPA9dRn6RiIIrTroamWxmu/4e7GnLD86uuSmosCB6IU0EGb4LjDlE7q
b4FFdbFGEiaM2Nq0V9UjsJXhKTPNDDO0eDwnEFZby9OymmYHOhA=
=iRaW
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
