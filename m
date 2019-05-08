Return-Path: <SRS0=DUED=TI=pengutronix.de=mkl@kernel.org>
Subject: Re: [PATCH 1/2] can: mcp251x: add support for mcp25625
From: Marc Kleine-Budde <mkl@pengutronix.de>
References: <20190507093437.26025-1-sean@geanix.com>
 <18a26b2f-5166-2142-4b8d-59818ac6fd8b@pengutronix.de>
Message-ID: <68a1efc0-a07d-fae2-3942-650035c9634a@pengutronix.de>
Date: Wed, 8 May 2019 14:45:51 +0200
MIME-Version: 1.0
In-Reply-To: <18a26b2f-5166-2142-4b8d-59818ac6fd8b@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="lw2RIdFyXFwN1Civ5fQ4kWHCzo2X2RZUo"
To: Sean Nyekjaer <sean@geanix.com>, linux-can@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh+dt@kernel.org
List-ID: <devicetree@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lw2RIdFyXFwN1Civ5fQ4kWHCzo2X2RZUo
Content-Type: multipart/mixed; boundary="61fUK01FFsp6PKqP9OUagp05FJAz5CLVT";
 protected-headers="v1"
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Sean Nyekjaer <sean@geanix.com>, linux-can@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: robh+dt@kernel.org
Message-ID: <68a1efc0-a07d-fae2-3942-650035c9634a@pengutronix.de>
Subject: Re: [PATCH 1/2] can: mcp251x: add support for mcp25625
References: <20190507093437.26025-1-sean@geanix.com>
 <18a26b2f-5166-2142-4b8d-59818ac6fd8b@pengutronix.de>
In-Reply-To: <18a26b2f-5166-2142-4b8d-59818ac6fd8b@pengutronix.de>

--61fUK01FFsp6PKqP9OUagp05FJAz5CLVT
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

On 5/8/19 2:45 PM, Marc Kleine-Budde wrote:
> On 5/7/19 11:34 AM, Sean Nyekjaer wrote:
>> Fully compatible with mcp2515, the mcp25625 have
>> integrated transceiver.
>>
>> Signed-off-by: Sean Nyekjaer <sean@geanix.com>
>=20
> I've mentioned the mcp25625 to the .in file and properly introduced the=

> mcp25625 as a new model in the driver itself. This way the debug output=

> is formated properly:

Added both patches to linux-can-testing.

Marc

--=20
Pengutronix e.K.                  | Marc Kleine-Budde           |
Industrial Linux Solutions        | Phone: +49-231-2826-924     |
Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |


--61fUK01FFsp6PKqP9OUagp05FJAz5CLVT--

--lw2RIdFyXFwN1Civ5fQ4kWHCzo2X2RZUo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEmvEkXzgOfc881GuFWsYho5HknSAFAlzSz38ACgkQWsYho5Hk
nSAUUwgAgFI48RUywTjkkzLOoGYLrjv2N2kCOuGV+826SdJbnpOMMaDNCgwNIPpe
RCRA8ouPuwrlE3iZ9Y+eA9pImecgeEJqnGOe0yq/ghgcTxMQ08FHS7ySYiMTd0RE
V96VXFjJGDunm94yP/X2VsZ2fbis3I9n3Dgid2K3KVpQDQMPR7+1G/cWOGWHfu2U
YK/wHYL4mvwMmF/O4wgDSF9eqyDjeJlgeUrW5NwL527GQs+utQj1RsrmjNLOXQv4
XOeSEsJWhevPRGa7he8QThrasEowEqYoNEqDWgWB4bQ2tmJswDoWBBZ5FIVM/48Y
OnniV1VEht0TKyTHc2Znd32/V2xrsg==
=tLGM
-----END PGP SIGNATURE-----

--lw2RIdFyXFwN1Civ5fQ4kWHCzo2X2RZUo--
