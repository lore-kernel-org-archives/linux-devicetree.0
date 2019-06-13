From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 4/4] regulator: adding interrupt handling in labibb
 regulator
Date: Thu, 13 Jun 2019 18:27:38 +0100
Message-ID: <20190613172738.GO5316@sirena.org.uk>
References: <1560337252-27193-1-git-send-email-nishakumari@codeaurora.org>
 <1560337252-27193-5-git-send-email-nishakumari@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V7BlxAaPrdhzdIM1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1560337252-27193-5-git-send-email-nishakumari@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Nisha Kumari <nishakumari@codeaurora.org>
Cc: bjorn.andersson@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, agross@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, david.brown@linaro.org, linux-kernel@vger.kernel.org, kgunda@codeaurora.org, rnayak@codeaurora.org
List-Id: devicetree@vger.kernel.org


--V7BlxAaPrdhzdIM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2019 at 04:30:52PM +0530, Nisha Kumari wrote:

> +static void labibb_sc_err_recovery_work(void *_labibb)
> +{
> +	int ret;
> +	struct qcom_labibb *labibb = (struct qcom_labibb *)_labibb;
> +
> +	labibb->ibb_vreg.vreg_enabled = 0;
> +	labibb->lab_vreg.vreg_enabled = 0;
> +
> +	ret = qcom_ibb_regulator_enable(labibb->lab_vreg.rdev);

The driver should *never* enable the regulator itself, it should only do
this if the core told it to.

> +	/*
> +	 * The SC(short circuit) fault would trigger PBS(Portable Batch
> +	 * System) to disable regulators for protection. This would
> +	 * cause the SC_DETECT status being cleared so that it's not
> +	 * able to get the SC fault status.
> +	 * Check if LAB/IBB regulators are enabled in the driver but
> +	 * disabled in hardware, this means a SC fault had happened
> +	 * and SCP handling is completed by PBS.
> +	 */

Let the core worry about this, the driver should just report the problem
to the core like all other devices do (and this driver doesn't...).

--V7BlxAaPrdhzdIM1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0Ch4kACgkQJNaLcl1U
h9BvEQf/egUOCfKsMM6vyB+zbx/sZSo/l7Ffx+LPqI7wPhEmnDgX59uXuxu3/nDK
EU5U6q+g3lQxoiREaEnB1vQWdvdEHsd9Y9qfnMHzSfEbER7ZEGtRSuk78eBHKk05
f7p/STXzlhQ3clp9CcTMwKTaiESaCxGklC1031veOsUAAB/uSy93WrJh7lPLU35T
aVnjxgP3LVsN63YWUKyTh6F47zfbpPBbht3+qKhae5XNLdAK/OLjUt08US41eOHy
I3Ujlv94syz1hjB2kigh2Y0AUE7k2GEcW0pGjmOzGHm57Tw0dybGSDB2WnOOAnej
6plATXwprN3ILhOMtPpDFGusXGGefA==
=lIxx
-----END PGP SIGNATURE-----

--V7BlxAaPrdhzdIM1--
