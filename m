From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 3/5] clk: lochnagar: Add support for the Cirrus Logic
 Lochnagar
Date: Mon, 15 Oct 2018 17:55:28 +0100
Message-ID: <20181015165528.GD12949@sirena.org.uk>
References: <20181008132542.19775-1-ckeepax@opensource.cirrus.com>
 <20181008132542.19775-3-ckeepax@opensource.cirrus.com>
 <153924124658.207691.10370075148426001371@swboyd.mtv.corp.google.com>
 <20181011132602.GD1653@imbe.wolfsonmicro.main>
 <153935999691.5275.1587207165396958375@swboyd.mtv.corp.google.com>
 <20181015104905.GF1653@imbe.wolfsonmicro.main>
 <153962159992.5275.9275448716859702011@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qGV0fN9tzfkG3CxV"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <153962159992.5275.9275448716859702011@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lee.jones@linaro.org, linus.walleij@linaro.org, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--qGV0fN9tzfkG3CxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 15, 2018 at 09:39:59AM -0700, Stephen Boyd wrote:

> Ok if there's going to be read/volatile regs and defaults then it makes
> sense to leave the defines in some shared header file, which is
> unfortunate for the independent merge of driver bits. Either way, I

Kconfig dependencies take care of that pretty well - if there's a
dependency on the MFD then the function driver just won't get built
until the MFD gets merged. =20

--qGV0fN9tzfkG3CxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvExn8ACgkQJNaLcl1U
h9Cm3wgAg68zzKd/x3cvsnLK+nLQu7ZH+s4qIBqCK+IZxuyQrrt22j+bCIyr1g7X
+oydMFZWxBkys3SvNyBAl+NF61lUhSsrrrmf6qc1RWdsIYAH7O9YFwKWQB6KiJnX
rroyNjAogqw/6vlI/VaOQ7nbWz9qjnyQDAgfgcxkNKL+EeLu2viJwiyCiU6Ybi0F
GUSIWcK9m/ha8HitOmrc0OX/TMykmiKPsWS3F3XgdLI0Spv91QOwd98dK+EAjhS7
nXdtijJMvFVIxFUngCmxPLOAJhkuj2fburxVSH/rgGlRx3eRYLPYjsKn4UO9WU+Z
0ZkKYkYeqinWW970tKk/qicJ+FCEGQ==
=kjjT
-----END PGP SIGNATURE-----

--qGV0fN9tzfkG3CxV--
