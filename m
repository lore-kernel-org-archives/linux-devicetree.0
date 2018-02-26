From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 01/10] regmap: mmio: Add function to attach a clock
Date: Mon, 26 Feb 2018 13:12:07 +0000
Message-ID: <20180226131207.GB6681@sirena.org.uk>
References: <cover.68c39205c8726547449e3df67b549d89380e51a2.1519204731.git-series.maxime.ripard@bootlin.com>
 <1155920db000d014fd1cd604ed48d1b9a8f64ac1.1519204731.git-series.maxime.ripard@bootlin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1521752699=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1155920db000d014fd1cd604ed48d1b9a8f64ac1.1519204731.git-series.maxime.ripard@bootlin.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Daniel Vetter <daniel.vetter@intel.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--===============1521752699==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xXmbgvnjoT4axfJE"
Content-Disposition: inline


--xXmbgvnjoT4axfJE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2018 at 10:20:25AM +0100, Maxime Ripard wrote:
> From: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> regmap_init_mmio_clk allows to specify a clock that needs to be enabled
> while accessing the registers.

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git tags/m=
mio-clk-config

for you to fetch changes up to 31895662f9ba81e8ea9ef05abf8edcb29d4b9c18:

  regmap: mmio: Add function to attach a clock (2018-02-26 11:05:44 +0000)

----------------------------------------------------------------
regmap: MMIO regmap clock configuration

This patch provides a mechanism for specifying a different clock to be
used with the regmap clock integration.

----------------------------------------------------------------
Maxime Ripard (1):
      regmap: mmio: Add function to attach a clock

 drivers/base/regmap/regmap-mmio.c | 24 ++++++++++++++++++++++++
 include/linux/regmap.h            |  3 +++
 2 files changed, 27 insertions(+)

--xXmbgvnjoT4axfJE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlqUB6YACgkQJNaLcl1U
h9Cikwf+PMimnrn6dNczsXsvqRvm5hhO/h8dL0IBFzkQtwmA/qj6bHgIcu99EHNg
rvyz+J6fGket2zqJGO1LX6sbUa9v0FoedKk1VqesmaSzIr/Z3QB6kmPXArGIr7T+
u0dEmntyUh6CLNyjEyQJMuQEKWSoxjQnb8LbWpdydUynzUlJR6eSzM9vInxxmRqt
McyD/wqJLNVBuc8Z8Xzlpqrx/IEKVUQsznUV8hAPW/GHq/H2ziCE8OFofVaRCqPW
OjRpcs7suLWn1ky3iieLkGg/iJvbRGsI5xrRgs9MxqRr6HETVghViFGwYKd9Uyw7
DagDsMXB9k5bWNsgDA5Oa1+xTIMUXw==
=DRh6
-----END PGP SIGNATURE-----

--xXmbgvnjoT4axfJE--

--===============1521752699==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1521752699==--
