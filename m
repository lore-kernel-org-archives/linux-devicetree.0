From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: Add regmap support to regulator-fixed
 device tree binding
Date: Mon, 30 Nov 2015 12:10:43 +0000
Message-ID: <20151130121043.GX1929@sirena.org.uk>
References: <565A18DD.60108@simon.arlott.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HBXo5IaYAxUG7vuS"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <565A18DD.60108-qdVf85lJwsCyrPCCpiK2c/XRex20P6io@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--HBXo5IaYAxUG7vuS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 28, 2015 at 09:13:01PM +0000, Simon Arlott wrote:
> Add properties for regmap to the regulator-fixed device tree binding:
> * Reference the regmap phandle
> * Specify the enable offset and enable mask
> * Reuse enable-active-high for regmap
>=20
> This is required for Broadcom BCM63xx SoCs that enable power to
> individual peripherals by clearing a bit in the miscIddqCtrl register.

Just write a driver for this, the fixed driver is really intended for
things like discrete regulators and if we were going to do a generic
regmap driver (which I'm not terribly keen on as it means we're not able
to later add additional information or custom handling in the driver) we
should just do that rather than shoehorning things into the fixed driver.

--HBXo5IaYAxUG7vuS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWXDzDAAoJECTWi3JdVIfQp5oH/jMvJGrqusp7GtHLhtpNoTqh
GQvZqYxkcqogSvr2xt+Y6A1XOCYxocJ1k312TlNQx4foN51/kIdoeZxclFLLMxPn
v9PXoLH3KkpgmS1Qb4KMFQJkrSaEL2+OWAyXF/afrPWzPCjvVPXwj4dzNPh5OqP7
oNJ6y+YHETlt5Z2gjofNqW1GCO5oLxXA/qZjDDGSaC7jCmOLu8w8gwg5dI6X9Wzh
+sJwW2KVz9Cu0QtjP8vwwU1uaYEz/hEEWAOzWWXXPQfDg9rhKL/rzN7p9MuwDij6
1K0pfgMBrg0D83ovvYyaK/zBiJZFcDPggawoagc4O0jocCjIfkk8eHxBM+zO5Dk=
=Z23Z
-----END PGP SIGNATURE-----

--HBXo5IaYAxUG7vuS--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
