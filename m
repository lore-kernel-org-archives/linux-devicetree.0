From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 5/6] ARM: pinctrl: Add Broadcom Capri pinctrl driver
Date: Fri, 13 Dec 2013 10:22:52 +0000
Message-ID: <20131213102252.GS11044@sirena.org.uk>
References: <1381174108-25168-1-git-send-email-syin@broadcom.com>
 <1386787041-6035-1-git-send-email-syin@broadcom.com>
 <1386787041-6035-6-git-send-email-syin@broadcom.com>
 <CACRpkdaeZCodKv6R+4ZS3o-5u=QQuV3JidEp7uaLsN9aYG7bqA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lCKkSrrNUaKEhaIQ"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaeZCodKv6R+4ZS3o-5u=QQuV3JidEp7uaLsN9aYG7bqA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sherman Yin <syin@broadcom.com>, Rob Herring <rob.herring@calxeda.com>, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Christian Daudt <bcm@fixthebug.org>, Russell King <linux@arm.linux.org.uk>, Grant Likely <grant.likely@linaro.org>, Matt Porter <matt.porter@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--lCKkSrrNUaKEhaIQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 12, 2013 at 09:54:50PM +0100, Linus Walleij wrote:

> This is a reimplementation of regmap for MMIO.
> See drivers/base/regmap/regmap-mmio.c
> Notice how regmap_update_bits() is used throughout the
> kernel.

> If you want to do this, use regmap.

Or if this is very performance sensitive (which I'd not expect for
pinctrl) there's a helper in review at the minute which just uses a
spinlock.

--lCKkSrrNUaKEhaIQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSqt/5AAoJELSic+t+oim9IgcP/R43kRMBOxBnYDq8Ij0BX7Be
V9/gx+yft4kW5mdXfkaaYf0bqS12axkR/dGFFoo24jEdkDJG66nHw8wEEptdK016
uPihWqrbxwxJk8FvqodRgjYmVarUvpE5wZUplSsJwTHw4FEdepznCx138I5+Q4+6
Bh0ax2xQGKXdttp8dwxK/WjMndzJSedsmSVpX0fdXtLShSOXYFnRQEOCSpbkTVhZ
/19Xu9htjUjjl4W0cv0g5mvyz8ne9SydcDXu/u642sNDJ0k3rHMJGMcvVtyq22RH
lXMUYnj+6mwBlB4o74lMR92tMaTR4mcDKOyov/AfKS97jtJ6IHThavfyeQOzxkhH
kDckQ/xrMvjiS05GUCq2/fy+XRZsfgj+yX7fZpC3UKG4LkN6zuFejo4RlOyV/0k9
fp82jIYAyphMuBZjjAuYN9pSHRJoMdn3Wso6qlQxsLl2lzmMfe27T4SPw+GCck4x
CJ525BgskU+JXqKUd+/0lILgQ+GvZ6vc0R5TwWAeddoaZDYcqLH908Z3+FImI3fz
MWqeHZ8O5M0ht7mptpC4KgSTCqgwf8O0NjI0DSDte+3wS2ra41dtZ4mBdx1dVqmC
5jv5Bi1xyYSmqQ2s5YcEGNCSGiXDUgOf/AWQu8R2T9GQi/hejUAVBFNgebUyvClN
m0CUNDo0i5pHQOngsM7A
=vlSZ
-----END PGP SIGNATURE-----

--lCKkSrrNUaKEhaIQ--
