From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 09/14] regmap: add iopoll-like polling macro for
 regmap_field
Date: Wed, 4 Oct 2017 11:47:32 +0100
Message-ID: <20171004104732.jkps4ufekfizcrkz@sirena.co.uk>
References: <20170929082306.16193-1-wens@csie.org>
 <20170929082306.16193-10-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mcbriylvxsuuyzhz"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170929082306.16193-10-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, David Airlie <airlied@linux.ie>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--mcbriylvxsuuyzhz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 29, 2017 at 04:23:01PM +0800, Chen-Yu Tsai wrote:
> This patch adds a macro regmap_field_read_poll_timeout that works
> similar to the readx_poll_timeout defined in linux/iopoll.h, except
> that this can also return the error value returned by a failed
> regmap_field_read.

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/regmap-poll-field

for you to fetch changes up to 667063acb81931e2f8fd0cb91df9fcccad131d9a:

  regmap: add iopoll-like polling macro for regmap_field (2017-10-04 11:46:32 +0100)

----------------------------------------------------------------
regmap: Add field polling macro

----------------------------------------------------------------
Chen-Yu Tsai (1):
      regmap: add iopoll-like polling macro for regmap_field

 include/linux/regmap.h | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

--mcbriylvxsuuyzhz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnUvEMACgkQJNaLcl1U
h9DeYQf+J9va+pqOxYTi/d3jtoxzIwAPBIvt2GRuinplv4i7nix/yuXnUcCFMf4V
Z1NLoWEfHF5BGBgxk3Gr/PK9tpdUj3kP94FC9D2IchWFdqSkXH/kpJS6uRVEDJMd
Flz9ZG3SiedY/y2MGPCF6FhY9Z7KWez4DOwwEU0RO27Kj+r2Bp2M1QzjqVMPh2u9
FjGoe6AHFp7/BkeoQsKCvJkdu27pD8GwSmE/chgAP+jW+IoC8ynCUZF2sU8RbUB0
YDjWCQsXyqTpBKBkC5Qkx+KVgP+kwti4HE2+nlsNNpIl20pDNCyOTNyBc7SmX+DJ
AP4wc4u0TOvCKMrFf5MDu+kxnA30SA==
=vFQm
-----END PGP SIGNATURE-----

--mcbriylvxsuuyzhz--
