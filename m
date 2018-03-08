Return-Path: <SRS0=1I8i=F6=ucw.cz=pavel@kernel.org>
Date: Thu, 8 Mar 2018 23:54:12 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: document Panasonic AN30259A
 bindings
Message-ID: <20180308225412.GA11646@amd>
References: <20180307004722.23524-1-simon@lineageos.org>
 <20180307004722.23524-2-simon@lineageos.org>
 <973256fd-8394-1b41-9ca1-846442515f62@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <973256fd-8394-1b41-9ca1-846442515f62@gmail.com>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Simon Shields <simon@lineageos.org>, linux-leds@vger.kernel.org, Richard Purdie <rpurdie@rpsys.net>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
List-ID: <devicetree@vger.kernel.org>


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +	led@1 {
> > +		reg =3D <1>;
> > +		linux,default-trigger =3D "heartbeat";
> > +		label =3D "an30259a:red:notification";
>=20
> s/an30259a:red:notification/red:notification/
>=20
> Let's drop devicename section from label, and make it a LED class
> driver responsibility to prepend the label with devicename when
> composing LED class device name.

Is it good idea?

(Some existing bindings specify three-part label in the label, some do
not. Documentation/devicetree/bindings/leds/leds-netxbig.txt
vs. Documentation/devicetree/bindings/leds/leds-mt6323.txt :-( We
should really solve that somehow).

I'd really like to see input0:white:numlock in the name, so same
software has a chance to work on PC and ARM notebook. Prepending
an30259a in the driver will break that...

Best regards,

									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlqhvxQACgkQMOfwapXb+vL23QCfTfuDpNLIv6vbtr7mMomcv8XO
iiwAniu/g4fiXkH9XfWldvXVYueoxXHH
=Rlmn
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--
