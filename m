From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 01/13] clk: sunxi-ng: sun6i: Export video PLLs
Date: Tue, 26 Sep 2017 11:24:31 +0200
Message-ID: <20170926092431.puk7e5ippmjwfy4x@flea>
References: <20170926065919.24446-1-wens@csie.org>
 <20170926065919.24446-2-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0194140202=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20170926065919.24446-2-wens@csie.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-sunxi@googlegroups.com, Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============0194140202==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3ongovkpszxygp7q"
Content-Disposition: inline


--3ongovkpszxygp7q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2017 at 06:59:07AM +0000, Chen-Yu Tsai wrote:
> The 2x outputs of the 2 video PLL clocks are directly used by the
> HDMI controller block.
>=20
> Export them so they can be referenced in the device tree.
>=20
> Fixes: c6e6c96d8fa6 ("clk: sunxi-ng: Add A31/A31s clocks")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--3ongovkpszxygp7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyhzPAAoJEBx+YmzsjxAglzEQAI37U0e29MoGz6ePrmcg9E1b
6OzMpr0XfUr6/IsI3A4P6ie8zt0e+0qVCmtRV5STdTOmFPQYJqSmdvqheWIrkCgM
oeakoaANy1KKUV9f8EHOj9bAJCvx8uvcppFZFqJH006XPEZhm8FJhoKtH71RLYa7
C7wJ+1QLRBHA4uo+CPORNZakUnurfTrZzkxNmokB6FMcz5J9QXlOx0u9gmPx0hvM
FxPz2sWq5ATNx5PTfq1rb/uHn6FceCgKpS+1A2B5wsZ/Y3eghyLnT5+XLNnt0FM4
R/aW7ELvR2WgLJvnbbk/tbl92zYXR7YQIfNPEgylm2zJtxrLikaKqIxysCKp99vH
HVMiz+wHZYOJQ9qrYmCQEkD98WJtWokFYR+s/ALkEFn2a/d1Rx2LVU8SNv6BooQV
ObMrfpeOcdRYEmeIRKUsHBQ/j8NEfJIKJNXQc8mEiEbdn6VJTYFu4ow2ZQ2rQhqg
CWREe++3Sx7Zq3LlvzzCYWQtYO89QqtB7i2P4OLzIt1PONZd/onQMzTsjzX5UMfx
146OqSgoJV8m6u4qxg2NKdypkClf/sQ3hfyllRE7qACwzG0b5lcH+a5/DKOkbEz7
jsSryFrVLVLSFFYWdFRwIkkvUlPGAGKR7tAtljF93r8eh/cxUOcwoYt/3QkzRlZH
vp5hbV0AW8lHj38XTdK0
=qNQW
-----END PGP SIGNATURE-----

--3ongovkpszxygp7q--

--===============0194140202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============0194140202==--
