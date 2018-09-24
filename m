Return-Path: <SRS0=YKJg=MG=the-dreams.de=wsa@kernel.org>
Date: Mon, 24 Sep 2018 17:52:50 +0200
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/4] dt-bindings: i2c: rcar: Add r8a77470 support
Message-ID: <20180924155250.GA2988@kunai>
References: <1537551421-4259-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537551421-4259-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180924085904.xa76egqvowg5gkjs@verge.net.au>
 <TY1PR01MB1770C5200D068C52EA140B4CC0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770C5200D068C52EA140B4CC0170@TY1PR01MB1770.jpnprd01.prod.outlook.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das@bp.renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > It seems to me that the RZ/G1C has some extra registers described
> > for I2C when compared with both other RZ/G1 and R-Car Gen2 SoCs.
>=20
> Exactly. The extra registers found with the RZ/G1C I2C controller are
> also found in R-Car Gen3, but the driver doesn't handle them. R-Car
> Gen3 has more registers on top of those found with the RZ/G1C.

I don't have he RZ documentation yet, could you name which ones are Gen3
only?


--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlupCE4ACgkQFA3kzBSg
KbZ9gxAAhHoR19MxkX5m8BOaG8qEHX153pgkcbTBZ+xHzhSvj9Y4EuQ470OJGAgw
K/Rx8qtPMtrosmezwaINEz2KIO5NyZ61Z0IlOn14vftulYWTZCi8cNNewSFR18I2
fpHegnSxbdYa0xP0+BS0EQwyc+FngiGHeJzVCyfJO3ak6EvVBR1kBFi3gJDpeBwN
5Pt/RLDa74/bQbRmpZrgpzBkJmYJMtIqCHTgD/0kiIPhSckQeJ+dU6EOQVjvIdhM
8ReKjMGa9KHaP6idzjDmp7t+70jdTDN4RlxBDvBKIZYAhTZYYVZeXRgSc7fMytR/
9uJKxAjWVT45+yaHJjtmlUZEt9Uze1mAGzru+eEJ4Px+tH/fjKVFKoKPCMkal0mu
+H1aX0rLsqb8AHpysJh+DzaekYPTI6Xrq6yZgm3CYuTYSm5vE5Wa2USTZaxEODhP
UWaWKRI+qaOxG1lW70nS4OhUgrqXtGX1QPKemJqHk0o67cw2/1v6s12lUTkhBLse
KIesOt3S7jhyadlfnLnu9YvlnVvpgv63QylZY4vvVEHbF+bos+V4yd+Y2X9I0wC5
Z6FBQrW9WHecHIWFT4pRyoNL1fEXc0pE2GbmoMrfUfC9xyS6848sc9tDJ2Anh7vu
irc2pu84ttHpOvou2+6NR6WdjqNumliVu2Xi0yG0/zGBuE4ldiU=
=Wfty
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
