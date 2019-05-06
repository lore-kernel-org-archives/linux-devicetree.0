Return-Path: <SRS0=+aPx=TG=ucw.cz=pavel@kernel.org>
Date: Mon, 6 May 2019 22:25:12 +0200
From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: Add binding for spi-byte LED.
Message-ID: <20190506202511.GA4979@amd>
References: <20190505200022.32209-1-oss@c-mauderer.de>
 <CAL_JsqKmKzSw2-mfmBbhpyY=Ku6H7cE2KZrgkcPD7kAS_GqbFw@mail.gmail.com>
 <20190506162848.GA9522@amd>
 <CAL_JsqJerwvjghnuiwndE9Kp_qX5ef-aSa5JcdUAoE6R6YYuYA@mail.gmail.com>
 <54199d69-67a9-eb9d-e46d-b3ea43e2e7a3@c-mauderer.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <54199d69-67a9-eb9d-e46d-b3ea43e2e7a3@c-mauderer.de>
To: Christian Mauderer <oss@c-mauderer.de>
Cc: Rob Herring <robh+dt@kernel.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, devicetree@vger.kernel.org, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Dan Murphy <dmurphy@ti.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>


--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >> Ok, I'm afraid I caused this. What should the compatible be, then?
> >=20
> > Knowing nothing about the h/w other than the above description:
> > ubiquiti,aircube-leds
> >=20
> > Not sure if that's a registered or correct vendor prefix though.
> >=20
> > Rob
> >=20
>=20
> Where would such a vendor prefix be registered? Does that mean that only
> the vendor is allowed to use it? In that case: How would a reverse
> engineered prefix look like?

You can use it, too. It is in
Documentation/devicetree/bindings/vendor-prefixes.txt :

ubnt    Ubiquiti Networks

So you can probably use ubnt, prefix.

> (still with some missing parts like U-Boot) about two weeks later. I had
> a look at it and they are not using a device tree. So there is no
> "official" string that I could deduce from that archive.

Mainline is the master. You are more "official" than them ;-).
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlzQmCcACgkQMOfwapXb+vIwOACfS3OKSH61uc/BSiQliPVPMyxZ
dt8An0E2c7R4KbBbjNVsOXcyf561MQtw
=xg07
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
