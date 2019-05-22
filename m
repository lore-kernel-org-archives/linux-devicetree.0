From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] regulator: qcom_spmi: Add support for PM8005
Date: Wed, 22 May 2019 12:01:07 +0100
Message-ID: <20190522110107.GB8582@sirena.org.uk>
References: <20190521164932.14265-1-jeffrey.l.hugo@gmail.com>
 <20190521165315.14379-1-jeffrey.l.hugo@gmail.com>
 <20190521185054.GD16633@sirena.org.uk>
 <51caaee4-dfc9-5b5a-07c7-b1406c178ca3@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ftEhullJWpWg/VHq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <51caaee4-dfc9-5b5a-07c7-b1406c178ca3@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, lgirdwood@gmail.com, agross@kernel.org, david.brown@linaro.org, bjorn.andersson@linaro.org, jcrouse@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
List-Id: devicetree@vger.kernel.org


--ftEhullJWpWg/VHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2019 at 05:16:06PM -0600, Jeffrey Hugo wrote:
> On 5/21/2019 12:50 PM, Mark Brown wrote:

> > > +static int spmi_regulator_common_list_voltage(struct regulator_dev *rdev,
> > > +					      unsigned selector);
> > > +
> > > +static int spmi_regulator_common2_set_voltage(struct regulator_dev *rdev,
> > > +					      unsigned selector)

> > Eeew, can we not have better names?

> I'm open to suggestions.  Apparently there are two register common register
> schemes - the old one and the new one.  PMIC designs after some random point
> in time are all the new register scheme per the documentation I see.

> As far as I an aware, the FT426 design is the first design to be added to
> this driver to make use of the new scheme, but I expect more to be supported
> in future, thus I'm reluctant to make these ft426 specific in the name.

If there's a completely new register map why are these even in the same
driver?

> > > +	if (reg == SPMI_COMMON2_MODE_HPM_MASK)
> > > +		return REGULATOR_MODE_NORMAL;
> > > +
> > > +	if (reg == SPMI_COMMON2_MODE_AUTO_MASK)
> > > +		return REGULATOR_MODE_FAST;
> > > +
> > > +	return REGULATOR_MODE_IDLE;
> > > +}

> > This looks like you want to write a switch statement.

> It follows the existing style in the driver, but sure I can make this a
> switch.

Please fix the rest of the driver as well then.

--ftEhullJWpWg/VHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzlK/IACgkQJNaLcl1U
h9AXBAf+Mto6O8QugYdL/55lY+O0vvNOPBrb59BAFs7716IWtNgDrcYMV26RZQSH
BzgdRdziDxkoGHoN5SW0+SMI4M3+P/z2H/27sIzWS9XVN1Sa2FWpY/YXuLbH2CZi
X9ghBPTYAzoMuBUmYLFGtLIRdiO9010etKXNciGD2gFJfNNadNKO3J8hC3OqDgTZ
bMxyC5g7MC3I9htRJ9yafXbbXHqahv65Ef6qJglqAab9l8lEYZUsinLDr0+RsDjA
VK6zsNXyfMwkdUUWvLpzObIWE3LYAys1o/c62/nPfPdJp39K5ZVaN8oAKAQlcULk
rvwI3qh/T/+DFRxCMIU+w/Hp9MLa5g==
=jGLx
-----END PGP SIGNATURE-----

--ftEhullJWpWg/VHq--
