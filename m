From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 0/7] PM8005 and PMS405 regulator support
Date: Mon, 17 Jun 2019 15:58:53 +0100
Message-ID: <20190617145853.GT5316@sirena.org.uk>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NZ00oluAJr3A0NMv"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--NZ00oluAJr3A0NMv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 13, 2019 at 02:24:36PM -0700, Jeffrey Hugo wrote:
> The MSM8998 MTP reference platform supplies VDD_GFX from s1 of the
> pm8005 PMIC.  VDD_GFX is needed to turn on the GPU.  As we are looking
> to bring up the GPU, add the support for pm8005 and wire up s1 in a
> basic manner so that we have this dependency out of the way and can
> focus on enabling the GPU driver.

There's something really weird with the threading in how you posted
these, a few of the patches are in reply to the prior patch so indented
a level down.

--NZ00oluAJr3A0NMv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0HqqwACgkQJNaLcl1U
h9D8RQf+OxNLRt9KY0qAKM/axbtNoK16v0PmHjNYLhYl5yBMi63SehdoXh1DkZY5
pBVOnlHPnB3usazND0knM12bH9x/qWXJZeA4PPGCDwUz2SOJRxIYr7wsKNmNjV/u
nZwsZ0dCbIFjRTZ8YCrc2FTsjCUVylqDeHzFJJ/I9nstD8POAs043rd5FIuNlGGS
sb2Qhu94o6C8u7YUjWciJ3zjXtQM5rfcuxVpMpxX8dg55PPvk6cTeSnQwto+lpeU
HypcRzk7F36tl5ElZPhf/WkPycNHdx8h+0oy85CVQ4/bqNb8rNDUFymfDE5qGI4o
6qoIyaY8tuzHoiLnJNXFhtl6YzjKbw==
=dHUK
-----END PGP SIGNATURE-----

--NZ00oluAJr3A0NMv--
