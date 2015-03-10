From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 07/12] regulator: axp20x: add support for AXP22X
 regulators
Date: Tue, 10 Mar 2015 20:05:50 +0000
Message-ID: <20150310200550.GI28806@sirena.org.uk>
References: <1425988764-23618-1-git-send-email-wens@csie.org>
 <1425988764-23618-8-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zrGaLLVn9NtiuXI2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425988764-23618-8-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zrGaLLVn9NtiuXI2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 07:59:18PM +0800, Chen-Yu Tsai wrote:
> From: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> Add AXP22X regulator definitions and variant id associations.
> This introduces a new "switch" type output for one of the regulators.
> It is a switchable secondary output of one regulator, with the same
> voltage level as the primary output.

Wait, no - sorry.  I'd missed the defines being added earlier on.
Instead:

Reviewed-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--zrGaLLVn9NtiuXI2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU/06eAAoJECTWi3JdVIfQ7uIH/0GJwzENVjxTz8wUgTcF6fEJ
2Gmmn0lUDCQ/IdGPi++iGhWmWuucDaqQhQYbNH0vDzs5m0qwU6I0sxQMKnH27YOD
4pJwPS/tscNisuOkYTkb+76B4BLF3nADY/qjlS8pVPXu6Qvsa7+j6fJ7W+PxuS0e
NLVHhRt+mUB8lQ8yTD7lcjOEp8SyGBG3vV8qbWJVaV/mWIrufJe/WU9m0q3wPu+9
bIExyrvaR3JKm1VOuPGY5VaJVWAb2CDz4Aty5pKggcCAGu6bWfgVVr+WAom/FWwc
GqTRzmi1xA/Xs5VRwjgAnbFBO7D8W7HcZzfN4TBddWAkaaynnTGIVwavMBs4k90=
=cZRm
-----END PGP SIGNATURE-----

--zrGaLLVn9NtiuXI2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
