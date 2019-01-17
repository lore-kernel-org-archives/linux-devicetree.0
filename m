From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] drm: support gpu aliases defined in DT data
Date: Thu, 17 Jan 2019 12:35:12 +0100
Message-ID: <20190117113512.crty5dgnjxzrjtf4@flea>
References: <20190117111918.31759-1-tomi.valkeinen@ti.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0228839733=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20190117111918.31759-1-tomi.valkeinen@ti.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Paul <sean@poorly.run>
List-Id: devicetree@vger.kernel.org


--===============0228839733==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ib5asm3nsa725acm"
Content-Disposition: inline


--ib5asm3nsa725acm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 17, 2019 at 01:19:18PM +0200, Tomi Valkeinen wrote:
> The DRM device minor numbers are allocated according to the registration
> order. This causes confusion in cases where the registration order can
> change, or when, say, a modesetting capable device is preferred to be
> card0, and a rendering device is preferred to be card1.
>=20
> This patch adds similar functionality that is used in some other
> subsystems, where device minor numbers can be defined in DT bindings'
> aliases node.
>=20
> For example, this sets the DRM device minor number to 1 for the 'dss'
> device.
>=20
> aliases {
> 	gpu1 =3D &dss;
> };
>=20
> The logic on how to pick the minor number is:
>=20
> - if there's a DT gpu alias for the device, use that
> - else, if there are any gpu aliases, pick a minor number that is higher
>   than any of the aliases.
> - else, use the full range of possible numbers
>=20
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

I guess we'd need a binding document for this? IIRC, Rob was against
introducing new aliases. Rob?

Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--ib5asm3nsa725acm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXEBocAAKCRDj7w1vZxhR
xVBJAP0YnxF68BFqcH7af+D5Vg/BWCIoXDIgBRxE3bcRpwXK6AD/e32VV0gci3Xg
aUTSnM2CYW+b40aj+K+XWkLJm576mgo=
=QYnc
-----END PGP SIGNATURE-----

--ib5asm3nsa725acm--

--===============0228839733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0228839733==--
