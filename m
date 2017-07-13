From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 01/18] regmap: mmio: Add function to attach a clock
Date: Thu, 13 Jul 2017 17:01:42 +0100
Message-ID: <20170713160142.2buaie6ebqbxunin@sirena.org.uk>
References: <cover.a5e7407c191c66e264164d017f64582039c56acb.1499955058.git-series.maxime.ripard@free-electrons.com>
 <02f409ad80afed68e02660f161fc26d588a86fa7.1499955058.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0286936309=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <02f409ad80afed68e02660f161fc26d588a86fa7.1499955058.git-series.maxime.ripard@free-electrons.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0286936309==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pegq6bobp7nhd4zb"
Content-Disposition: inline


--pegq6bobp7nhd4zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 13, 2017 at 04:12:56PM +0200, Maxime Ripard wrote:

> This might be problematic if the clock to enable is stored in another node.
> Let's add a function that allows to attach a clock that has already been
> retrieved to a regmap in order to fix this.

What is the use case for this?

--pegq6bobp7nhd4zb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllnmWYACgkQJNaLcl1U
h9C29gf9ExWbNqhDFlppfUkfVkzoUeE+eU+mRJdCOwJZTptV7nNFaQocXHRtzTQy
Cl8cs5frVvJxaB618l8tqyJJKs5n61MTtANBHmxSwZDEchFqF3oJRQDSkUMfPPPn
GxzNfq7z0AK/nZP40lc6u+gOqGue389YdzfOb6l2TLY5mYShO+qUA5wVcs2nlEZN
DAs9mPgFqw5CKsRzGbUxys4x4nK90i+v+52iwdxwE74YLGm6IBhHpufSwAOxkhEE
fAQzIRlGfXpadT5rjpBDz4FF7Zj/Zxid1/lr1yKyQEPOe6wn33hd2IEo2lgyVgfa
QlKS7vvJ+7qGXWIJ02FCAyy6Y6ZNzw==
=jPdr
-----END PGP SIGNATURE-----

--pegq6bobp7nhd4zb--

--===============0286936309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0286936309==--
