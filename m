From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH RFC 4/5] gnss: sirf: add a separate supply for a lna
Date: Fri, 30 Nov 2018 09:43:15 +0100
Message-ID: <20181130084315.GA25587@amd>
References: <20181118215801.12280-1-andreas@kemnade.info>
 <20181118215801.12280-5-andreas@kemnade.info>
 <20181127180356.GA32751@localhost>
 <20181130073804.1e57226f@kemnade.info>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181130073804.1e57226f@kemnade.info>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas Kemnade <andreas@kemnade.info>
Cc: johan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
List-Id: devicetree@vger.kernel.org


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri 2018-11-30 07:38:04, Andreas Kemnade wrote:
> Hi,
>=20
> On Tue, 27 Nov 2018 19:03:57 +0100
> Pavel Machek <pavel@ucw.cz> wrote:
>=20
> > Hi!
> >=20
> > > Devices might have a separate lna between antenna output of the gps
> > > chip and the antenna which might have a separate supply =20
> >=20
> > Might have.
> >=20
> > > @@ -340,6 +349,12 @@ static int sirf_probe(struct serdev_device *serd=
ev)
> > >  		goto err_put_device;
> > >  	}
> > > =20
> > > +	data->lna =3D devm_regulator_get(dev, "lna");
> > > +	if (IS_ERR(data->lna)) {
> > > +		ret =3D PTR_ERR(data->lna);
> > > +		goto err_put_device;
> > > +	}
> > > + =20
> >=20
> > But it is not optional in the code. Probably should be?
>=20
> well, if it no lna regulator is defined in the dtb, the regulator
> framework will return a dummy

Aha, did not know that detail. It is ok, then...

> would not do that and would require more error checking in the code.
> But if there is some rule which says that devm_regulator_get_optional()
> should be used here, I can of course change that.
> Before sending a v2, is that the only issue here?

Quick look did not reveal anything else.

Best regards,
							Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwA+CMACgkQMOfwapXb+vKJxACgoJeecgtF1KtFCjEppOxKBsxy
OIUAn1ov1xofhbf3qXKyY8ipAR43iEIe
=3odg
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
