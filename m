Return-Path: <SRS0=3uSo=N6=the-dreams.de=wsa@kernel.org>
Date: Mon, 19 Nov 2018 11:53:58 +0100
From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 1/2] dt-bindings: can: rcar_canfd: document r8a77965
 support
Message-ID: <20181119105358.GB932@kunai>
References: <20181118173201.4645-1-marek.vasut+renesas@gmail.com>
 <20181118231807.GE2553@kunai>
 <20181119104139.ujbtl4jfnhxj5gxy@verge.net.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zx4FCpZtqtKETZ7O"
Content-Disposition: inline
In-Reply-To: <20181119104139.ujbtl4jfnhxj5gxy@verge.net.au>
To: Simon Horman <horms@verge.net.au>
Cc: Marek Vasut <marek.vasut@gmail.com>, devicetree@vger.kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Marc Kleine-Budde <mkl@pengutronix.de>, Rob Herring <robh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>


--zx4FCpZtqtKETZ7O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 19, 2018 at 11:41:39AM +0100, Simon Horman wrote:
> On Mon, Nov 19, 2018 at 12:18:07AM +0100, Wolfram Sang wrote:
> >=20
> > > +  - "renesas,r8a77965-canfd" for R8A77965 (R-Car M3-N) compatible co=
ntroller.
> >=20
> > Eeeks, the 'canfd' is a suffix here not a prefix :( Not your issue,
> > of course. But Simon, shall we fix that for all CANFD?
>=20
> I think its too late to fix it for existing bindings.
> We could move to a new scheme for r8a77965 and beyond,
> but that is rather messy. I lean to wards continuing with
> using 'canfd' as a suffix.

Geert, Simon: OK, thanks for the answers.


--zx4FCpZtqtKETZ7O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvylkYACgkQFA3kzBSg
KbaGzhAApO8tALjab/tR4UIzVxvzKMnnA6YFnDOLWo3WFiMfqa1r8OIC/4FQzX3g
ZtyIYDslsMbd/Q/gV8ohW2iGf5jDKyX37MplBR1VNeTEGg1kd2aIDjcmF3+38j3D
PsICYjdnF9Wud918Bqb+JrdToiue2ipMs+/ziY2cQ2CdBoadjQl3baaafr+7/UOb
ywJDvwsgJKBQH9YkxJIjeYo/78cHs8AaXVkObdoHPya4X8aCvtVRpWTSd/U3AeTq
5HZiafyg5u4qQR8vDXzXFykpboaD6C6TdZIJ63sOeGEUEVsVg5EK31m6ERjQAfNT
bKbCoc7/eSeR+OVLsPY/fTR7gAbAA2PSGejAAnwJ+NWoohxLVCdhApVR17TLbDAE
MDODnVjDum/ilPe1102HqzVEh76KFp1bCu1ao9tDuQaSH6Y0ZdFQepNN2UvOB5by
XATBmegVbqBtepqrxx5p46HJhWUz/CsDdUd1vXiAJmjs3x6/KQP2A9MVkGHFreje
Brwqt+f5iJ7oGd7RfZY/nrBOmQP9MDNJM4CBgeJyTHOaMAI4zLVImccnD/zKXnSN
nsvIIhyV+KOsGoG/rrWOQel/rDdHuQ9s4B8MdqV8YV1E8CMnMytRv51umi6zLERH
wtvtmk34+IEB/KJtyXAzO2cEQYuzosoYKTczmAlGvuw1sb8v3mE=
=hS8D
-----END PGP SIGNATURE-----

--zx4FCpZtqtKETZ7O--
