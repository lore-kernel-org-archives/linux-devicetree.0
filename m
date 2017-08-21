From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH  2/3] ARM: dts: iwg20m: Enable SDHI0 controller
Date: Mon, 21 Aug 2017 10:33:57 +0200
Message-ID: <20170821083357.GC2418@katana>
References: <1502711389-16040-1-git-send-email-biju.das@bp.renesas.com>
 <1502711389-16040-3-git-send-email-biju.das@bp.renesas.com>
 <20170821082842.GB2418@katana>
 <KL1PR06MB1702AC0B4C40F48A80505B74B8870@KL1PR06MB1702.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <KL1PR06MB1702AC0B4C40F48A80505B74B8870@KL1PR06MB1702.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Chris Paterson <Chris.Paterson2@renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > +vmmc-supply =3D <&reg_3p3v>;
> > > +vqmmc-supply =3D <&reg_3p3v>;
> >
> > Just to make sure: No 1.8V and UHS support (SDR50/104)? Or is this to be
> > tested and added later?
>=20
> Thanks. The current hardware doesn't support 1.8V switching for SDHI0. Th=
ere is a plan to
> add this in future board varient, at that time we will add UHS support.

I see. Thanks for the info, patch looks good to me then:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmamvUACgkQFA3kzBSg
KbZRZw//VaHQeiky1O6xGyUVW2w5/Az3BK/kibuncjXKbwI1kduAfB6sylnYo7FB
UuHV4vldj2Tpq/k1TtYm+MppCIDbAZwwOcTevB7+rP138cUKO5/GBo0qhQUcYkKK
P8nWWvIESb7naW0khTtyeFOE7bGDMUM9ToVIUYSVVpm5pqNFZ5UbV3uMK2LCt+0k
fM3dq6iFGr1NP7zAaazAU1QOwF8Tm4X0uIBl84dMGsdwRR9UdgzVsGFpqxCj2M2v
q03p3q5m0lgMzeSQv1V2mtFmaVayVBSE98obdIgmr8c3MvL8RAixRAvBsjHKdQMT
RiNVp4WPJD1mmWt9Dh6C+DqvRahWBMQIfbh+BIYPtpSBbCIXPONtElXXk/MTeP1z
965Z37RGELOW0M//3zsGRYO/M0LB86zDMtad30E4Oc9GB8bAFa97d/PlpuN1ys18
yG22y5Or/LBupbzIcSGiKyKXo4D9VxjcLX0Kaj10GNN+/IfS4+CSU4T1o9JolUvP
LaG1XmLJgU7VfvI9W46zgdgqXOrZgxYZKKW3B9FWf/8MuJAqdg52ex9erykYdMBR
Wddj4c12EH8oyfJrFNPah3DuU9hOZYu30KT9rnFeST8G8SxvANpqMivrNt2TZH9L
t17/ieMPji3YY6mjLb0YW9qyEE3Rmx6fhxSiT1lyMIVuPpe4u2k=
=NiQK
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--
