From: Pavel Machek <pavel@denx.de>
Subject: Re: [PATCH v6 3/3] soc: fsl: add RCPM driver
Date: Tue, 3 Sep 2019 16:12:48 +0200
Message-ID: <20190903141248.GA8354@amd>
References: <20190821031537.46824-1-ran.wang_1@nxp.com>
 <20190821031537.46824-3-ran.wang_1@nxp.com>
 <DB8PR04MB6826A9EA5D9232D55FE8BDEFF1AA0@DB8PR04MB6826.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <DB8PR04MB6826A9EA5D9232D55FE8BDEFF1AA0@DB8PR04MB6826.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Leo Li <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Biwen Li <biwen.li@nxp.com>, Len Brown <len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +	/* Begin with first registered wakeup source */
> > +	ws =3D wakeup_source_get_start(&idx);
>=20
> Since I have mad some change in this version, could you please take a loo=
k on this.
> If it's OK to you, I would re-add 'Acked-by: Pavel Machek <pavel@ucw.cz> '

I'm sorry, I'm a bit busy at the moment and this is not really my
area.

Best regards,
								Pavel
							=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1udOAACgkQMOfwapXb+vLLrwCgprpkyPdWIRm3F6Lv4rV9h5Vg
zkUAnRa7EWL6E5/thkcXz87A7zdQUWUB
=oBPe
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
