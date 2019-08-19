From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 1/2] dt-bindings: leds: document the "power-supply"
 property
Date: Mon, 19 Aug 2019 13:31:12 +0200
Message-ID: <20190819113111.GH21072@amd>
References: <20190715155657.22976-1-jjhiblot@ti.com>
 <20190715155657.22976-2-jjhiblot@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Uu2n37VG4rOBDVuR"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190715155657.22976-2-jjhiblot@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Cc: jacek.anaszewski@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, daniel.thompson@linaro.org, dmurphy@ti.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--Uu2n37VG4rOBDVuR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2019-07-15 17:56:56, Jean-Jacques Hiblot wrote:
> Most of the LEDs are powered by a voltage/current regulator. Describing it
> in the device-tree makes it possible for the LED core to enable/disable it
> when needed.
>=20
> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>

Acked-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--Uu2n37VG4rOBDVuR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1aiH8ACgkQMOfwapXb+vJ6XQCgiIrpQmvbBHZjEjV5SpEDtd84
gAgAn03AYtiswSYRdaEQAeNIr2uR6Z8w
=wPaJ
-----END PGP SIGNATURE-----

--Uu2n37VG4rOBDVuR--
