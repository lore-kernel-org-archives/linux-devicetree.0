From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/2] regulator: Add support for stm32 power regulators
Date: Wed, 10 Apr 2019 11:38:52 +0100
Message-ID: <20190410103852.GG6106@sirena.org.uk>
References: <1554737044-9460-1-git-send-email-p.paillet@st.com>
 <1554737044-9460-3-git-send-email-p.paillet@st.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6128523778494764782=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1554737044-9460-3-git-send-email-p.paillet@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Pascal PAILLET-LME <p.paillet@st.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Alexandre TORGUE <alexandre.torgue@st.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--===============6128523778494764782==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Fnm8lRGFTVS/3GuM"
Content-Disposition: inline


--Fnm8lRGFTVS/3GuM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 08, 2019 at 03:24:08PM +0000, Pascal PAILLET-LME wrote:

> +config REGULATOR_STM32_PWR
> +	bool "STMicroelectronics STM32 PWR"
> +	depends on ARCH_STM32

There's no build time dependency here, please also add an || COMPILE_TEST t=
o=20
help with build coverage.

> +int stm32_pwr_reg_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct stm32_pwr_reg *priv =3D rdev_get_drvdata(rdev);
> +	u32 val;
> +
> +	val =3D readl_relaxed(priv->base + REG_PWR_CR3);
> +
> +	return (val & priv->ready_mask);
> +}

This looks like it's reading back a status bit from the hardware not the
state requested by software - I'd expect an _is_enabled() to reference
the same bit that's updated by the enable/disable functions.  This looks
like a better fit for _get_status().

> +	of_regulator_match(&pdev->dev, np, stm32_pwr_reg_matches,
> +			   STM32PWR_REG_NUM_REGS);

You don't need to open code the matching any more, just set of_match and
regulators_node in the regulator_desc and the core will do it for you.

> +MODULE_DESCRIPTION("STM32MP1 PWR voltage regulator driver");
> +MODULE_AUTHOR("Gabriel Fernandez <gabriel.fernandez@st.com>");
> +MODULE_LICENSE("GPL v2");

No signoff from Gabriel?

--Fnm8lRGFTVS/3GuM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlytx7sACgkQJNaLcl1U
h9BwVgf+LLgiEYtwgfFTsrSp6gKGUw64bODOr0luZtJ6amf8o2zZSuNbVuNzP1Ys
mK2fUUATzt+Icf/Y/3/IPgAOkgsp/bXvaR1QpG++/Q29iwP0uMkJwM2Tf0pkUiEL
A8JfyoT0fHdVC4Q0UG6cYVfwZBaQM8FLgc6o32KqDqLSPDu0ii9rEDfdhJIqbMu+
3YEU1P8BsoMzVok3FUcEUuzXoYChT3yE0uuGzHrURwiTOjGIatsDNlQuyRfECRG9
kTM/UBk09kP/ZxIla3c83lOdiCv83GGGaP+G3yQvPIyEXU4MPdveoCQCuvw9RtxN
6+Af+T1TM6kk16CmFEpuWDL9x0Uq2A==
=tUtb
-----END PGP SIGNATURE-----

--Fnm8lRGFTVS/3GuM--


--===============6128523778494764782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6128523778494764782==--
