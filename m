From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v9 3/5] regulators: axp20x: Use "clock-frequency"
 property for dcdc work frequency
Date: Tue, 27 Jan 2015 12:14:24 +0000
Message-ID: <20150127121424.GS21293@sirena.org.uk>
References: <1421941147-9682-1-git-send-email-wens@csie.org>
 <1421941147-9682-4-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z3XR48OWYS228AZl"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421941147-9682-4-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--z3XR48OWYS228AZl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2015 at 11:39:05PM +0800, Chen-Yu Tsai wrote:
> Since the dcdc regulator work frequency is a property of the regulators
> DT sub-tree, there is no issue of naming collisions, so we can use the
> standard "clock-frequency" binding for this.
>=20
> The driver sets a reasonable default value (same as the datasheet), and
> only 1 dts has the old binding, with the default value.

I don't see any benefit from this change - not only is this an
incompatible change (which may affect out of tree users as well as in
tree users) but it's not really doing anything with the clock API which
I'd expect to be happening for a clock API property.  What's the goal
here?

--z3XR48OWYS228AZl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJUx4EfAAoJECTWi3JdVIfQxVEIAIBZUkhYIKUYUlp2lbbE2U39
988UjOv7eAPlV/4oQP71bcaY4oFhzhmvX1Q76xiAK00CE38fVrrOf8izwwZB3zQy
1jQr8sy4zB8lkZdM9l7jWJpGYVUlvWewbnZleZC/dj1p+4c64DNwb4tEb3Sg42Dm
JjLTYtcWalPBwYWe4LLddt8urCgxTEyZKalBJj5akqaiuLs3IDTj0ggKqwqRFitR
ulKn36Zx6T5BJdAsgAZSBc2NG7Y1KPbBkCIr9Y8/p+ZW8zm6L4cK/xIzUVtFiTws
X0ME8hpvul39eZmF3fmfTUUj6pV3p0cOl3kwQQ+4LEMlMIHsz3V+QsRAxPAH4pk=
=ymXa
-----END PGP SIGNATURE-----

--z3XR48OWYS228AZl--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
