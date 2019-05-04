Return-Path: <SRS0=HuYX=TE=ucw.cz=pavel@kernel.org>
Date: Sun, 5 May 2019 00:17:19 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH 1/2] dt-bindings: leds: Add binding for ubnt-spi LED.
Message-ID: <20190504221719.GA7237@amd>
References: <20190504122825.11883-1-list@c-mauderer.de>
 <4889e87a-5c7a-da74-bff6-c20fd07ea0f4@gmail.com>
 <0175bf00-f2eb-98c7-ce0b-d9a2858872e7@c-mauderer.de>
 <5cc8907f-5cb4-e8b4-7309-cc446ef5bde7@gmail.com>
 <20190504203448.GA24856@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
In-Reply-To: <20190504203448.GA24856@amd>
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Christian Mauderer <list@c-mauderer.de>, oss@c-mauderer.de, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>


--DocE+STaALJfprDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > >I wasn't aware of that list. Maybe "power" or even better "status" wou=
ld
> > >match the function.
> >=20
> > Hmm, I've just found out that there are two "wlan-ap" occurrences in
> > the existing mainline bindings, so I propose to follow that.

Let me see... dove-d3plug.dts has "status", "wlan-ap", "wlan-act".

> > >Should I add the color too? So "white:status"?
> >=20
> > Yes, why not if it is known. So, having the above I propose:
> >=20
> > 		label =3D "white:wlan-ap";
>=20
> Linux now runs on many different devices, and I believe userland wants
> to know "this is main notification LED for this device" (and the only
> one in this case).

=2E..and I guess if you have single LED it will be used for more than
"is AP active". IOW it will likely to be more similar to "status" than
"wlan-ap".

Best regards,
									Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--DocE+STaALJfprDB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzOD28ACgkQMOfwapXb+vL4ngCgtVbAoiGxgNP8zN0wPkqGWv7h
ok8AmwcT1g1zJplSnehnX+5oE0EpcTed
=XWpT
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
