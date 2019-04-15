From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/2] regulator: Add support for stm32 power regulators
Date: Mon, 15 Apr 2019 10:57:17 +0100
Message-ID: <20190415095717.GA6880@sirena.org.uk>
References: <1555319855-2982-1-git-send-email-p.paillet@st.com>
 <1555319855-2982-3-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ibTvN161/egqYuK8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1555319855-2982-3-git-send-email-p.paillet@st.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pascal PAILLET-LME <p.paillet@st.com>
Cc: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--ibTvN161/egqYuK8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 15, 2019 at 09:17:38AM +0000, Pascal PAILLET-LME wrote:

> +int stm32_pwr_reg_is_ready(struct regulator_dev *rdev)
> +{
> +	struct stm32_pwr_reg *priv = rdev_get_drvdata(rdev);
> +	u32 val;
> +
> +	val = readl_relaxed(priv->base + REG_PWR_CR3);
> +
> +	return (val & priv->ready_mask);
> +}

You should probably add a get_status() callback using this.

--ibTvN161/egqYuK8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAly0VX0ACgkQJNaLcl1U
h9AwaAf/aToCo2Lpwde4IyVS0Xah6RImQN5eFMHjqU/CAVzhfuHyxA3nncqEftbR
Ekr+CFAMrmjVYKnK4Qor47WwRDcGVkHgnlT3RqIMg7DlEUEdtgJm0ODNYQ53arhU
IaBwLKcv0/swlrt7tv0Bx2nB2BjTTE1DorL6DYw2fxhJ8o28FWgL4y+J/ZD6NUQB
KoiAe6vs/G1Wiyj3HRv+wd8nppNLHw6WCYdKUUOT6ApeTBfTmpMvuxGz2XLKrL3Q
/Aj8MN6dy6hLwwDZWtSV7UgcFkx/GpoMDORtFadEX9lyO0KcThiXKHh24D5MVFkd
mwSQr2AdZEEN8mMT8ZU8+gjOa3gVOg==
=JHeU
-----END PGP SIGNATURE-----

--ibTvN161/egqYuK8--
