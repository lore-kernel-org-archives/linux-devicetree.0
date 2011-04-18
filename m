From: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH v2] uio/pdrv_genirq: Add OF support
Date: Mon, 18 Apr 2011 17:25:51 +0200
Message-ID: <20110418152551.GB23814@pengutronix.de>
References: <1302774106-32764-1-git-send-email-monstr@monstr.eu>
 <20110414165931.GA19228@pengutronix.de>
 <4DABF744.4010209@monstr.eu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4DABF744.4010209@monstr.eu>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <monstr@monstr.eu>
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, john.williams@petalogix.com, linux-kernel@vger.kernel.org, hjk@hansjkoch.de, arnd@arndb.de
List-Id: devicetree@vger.kernel.org


--24zk1gE8NUlDmwG9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> >>+
> >>+		/* Multiple IRQs are not supported */
> >>+		if (pdev->num_resources > 1) {
> >>+			struct resource *r =3D &pdev->resource[1];
> >
> >Are you sure the irq-ressource is always [1]?  (Similar question for the
> >if()-block above). Try platform_get_irq().
>=20
> I wasn't aware about platform_get_irq. You are right.
>=20
> What "if()-block above" are you talking about?

The one I quoted: if (pdev->num_resources > 1)

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk2sV/8ACgkQD27XaX1/VRtc6wCeJDxfInwzBQ1w0qRZAsd5NfMy
55sAoKnvHBjRPSeUYsag2haZYp1flpAL
=wM4i
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
