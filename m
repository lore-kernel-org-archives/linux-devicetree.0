From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 3/5] gpio: of: Return error if gpio hog configuration
 failed
Date: Tue, 8 Mar 2016 15:23:19 +0100
Message-ID: <20160308142318.GC9864@ulmo.nvidia.com>
References: <1457438528-29054-1-git-send-email-ldewangan@nvidia.com>
 <1457438528-29054-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hOcCNbCCxyk/YU74"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1457438528-29054-4-git-send-email-ldewangan@nvidia.com>
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, swarren@wwwdotorg.org, Benoit Parrot <bparrot@ti.com>, Alexandre Courbot <acourbot@nvidia.com>
List-Id: devicetree@vger.kernel.org

--hOcCNbCCxyk/YU74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2016 at 05:32:06PM +0530, Laxman Dewangan wrote:
> If GPIO hog configuration failed while adding OF based
> gpiochip() then return the error instead of ignoring it.
>=20
> This helps of properly handling the gpio driver dependency.
>=20
> When adding the gpio hog nodes for NVIDIA's Tegra210 platforms,
> the gpio_hogd() fails with EPROBE_DEFER because pinctrl is not
> ready at this time and gpio_request() for Tegra GPIO driver
> returns error. The error was not causing the Tegra GPIO driver
> to fail as the error was getting ignored.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Benoit Parrot <bparrot@ti.com>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpio/gpiolib-of.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--hOcCNbCCxyk/YU74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW3uBWAAoJEN0jrNd/PrOhxsAQAL+vuBhm42YtwPmdRLJA/noW
DyClSGyLkvmf/CUV1QjM/ccqr6iZ+7PTKssY2eSqmzFeUXBHHqZlxweDMssvvecq
aeuYd1PdA1GRXlFsN1ksZE4Qhu4eyOEtsOTPjKvO+nXdXbkmKB5eT9ABkKZZdPV4
uCLAGg7RFaj+M8159Vahv9cbm0y8M4s2OQ6IoUKTPacuxoiHs4aYP5pWY46JFCaF
ODGvvFLzHPWLRG2rNtGNAed41RmbXlPbP1AJgIN+gwsq0QAvnGgy9wtcHlvc6vv2
pT5d71Xx5kgQmCNzRxQe+aLfrCgb1NNKIZ2ZjTuFpcXh8AdE5PwImPGvtbyBzOmA
BP1/VEwsHyEfWlpjMDHvgJQnazebAwl8ZL+6AjW8PON0u79d2LApR/BS6gasSWAd
eOiGxA0+ym+d9cevDd5W1S6MVoWjEL2syOFN+k9j5qja/j7TlaViX+Pwl+/hBZfo
Cetedxyr2aS3uhu+ri7nfnH9ZOpWfp1AcQDWp3l3Jz3jknMcH+/XDdScK5JV3DAP
7ZfV60LUAS1m6+HDgDnMAtJgsRZlyKTS2pRjRcwBqqntPk7ty3SnUYMXUcBjeJKn
sJV/uvBsaK+dDI4sF/xtNurNYXzI+gmoPSsVkvnufJIXGwI9qtdKUcFohl2pZnZX
LMq75OOdtvstJnXMtPun
=ftQb
-----END PGP SIGNATURE-----

--hOcCNbCCxyk/YU74--
