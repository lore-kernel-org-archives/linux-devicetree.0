From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH] dt-bindings: mfd: rn5t618: Document optional property
 system-power-controller
Date: Thu, 8 Aug 2019 20:39:24 +0200
Message-ID: <20190808183924.GB1966@latitude>
References: <20190129135917.29521-1-j.neuschaefer@gmx.net>
 <20190201092411.GG783@dell>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190201092411.GG783@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 01, 2019 at 09:24:11AM +0000, Lee Jones wrote:
> On Tue, 29 Jan 2019, Jonathan Neusch=C3=A4fer wrote:
>=20
> > The RN5T618 family of PMICs can be used as system management
> > controllers, in which case they handle poweroff and restart. Document
> > this capability by referring to the corresponding generic DT binding.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > ---
> >  Documentation/devicetree/bindings/mfd/rn5t618.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
>=20
> Applied, thanks.

Hi,

apparently this patch got lost somehow (I can't find it in mainline or
-next). Should I resend it?


Thanks
Jonathan Neusch=C3=A4fer

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAl1MbFMACgkQCDBEmo7z
X9teow/7BstSO97Sl8F6BD6eFHTwI0a/YAhcZlXYyQ11Rvt/a9JFhEE+b9oDaFuc
MaLE3wXSEcx1Ssh8xPhrUzpPsQ8MWV83f1roR6jU0lwUYkjdWm4Far8BSUi5ilmz
BVPeBOlWgRwoyMEjMojIfYLuvhFm2iBvTNbRyU99h7tMF99n4kor07zu/zaQY+fX
8hH1/o4TY19vMgMIK/OQjNAYJHQBoJbX/RrICvBq/QB74nxv/XmgICv2eoI1Tkup
Jf/A6IuTdlhUjGxn1UYwKFfsilMYrLMHYb2l7Zsb6sVYlly3vZjrgBwHsmQWQaYQ
9aKqaK2x3rb1GMfYKhMIHh+4vN2qjJJZeNHn34ut3CHGVhkI08o2lPk5d3DdeHFC
ctl6EoCtb9cGpDBUQKdwZc838tB9Tt5Qdn3ixNknpc17M2rhi/XqxJgjwRmOOC2M
dl2rEh2Ryk4f0mkII5Eo9MoPXimv1fB+rTY5LUFFa91n1rBRYSD6Ko+TvHIpNQDG
Beyx3ol41HSnSqYrfscl2plPZimIQq53bHfKaRQq094Ph/YqIRPtte1jZo/qRnns
6LOF3YBGt7M07VKtSjUKm4zM6mFj2oxD7YE1T/9jq05bxwFSFp5oi+3wmRJ+oENx
f2Ul03iVlXXLBR+W1igbzv09+KAiMeFc8zmkxZ+tKvTLOXNAm5Q=
=nKs6
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
