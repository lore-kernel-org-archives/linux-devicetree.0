From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Date: Thu, 25 Apr 2019 19:37:36 +0100
Message-ID: <20190425183736.GF23183@sirena.org.uk>
References: <1548675904-18324-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548675904-18324-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190204090301.GC23441@sirena.org.uk>
 <95276ca0-6896-a595-867a-184a518fa31f@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s5/bjXLgkIwAv6Hi"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <95276ca0-6896-a595-867a-184a518fa31f@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org, vinod.koul@linaro.org, niklas.cassel@linaro.org, khasim.mohammed@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--s5/bjXLgkIwAv6Hi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 19, 2019 at 07:29:48PM +0200, Jorge Ramirez wrote:
> On 2/4/19 10:03, Mark Brown wrote:

> >> +	/* we know we only have one range for this type */
> >> +	if (vreg->logical_type == SPMI_REGULATOR_LOGICAL_TYPE_HFS430)
> >> +		return range;

> > Rather than have special casing for the logical type in here it seems
> > better to just provide a specific op for this logical type, you could
> > always make _find_range() call into that one if you really want code
> > reuse here.  You already have separate ops for this regulator type
> > anyway.

> sorry I dont quite understand your point.

If you need to skip the majority of the contents of the function for
some regulators just define a separate function for those regulators and
give them different ops structures rather than using the same ops
structure and handling it in the functions.

> But also I am not sure I see the benefits with respect to the proposed
> change...

The benefit is that the selection of which operations to use is done in
only one place (the selection of the ops structure) rather than in
multiple places (the selection of the ops structure and the contents of
the operations).

--s5/bjXLgkIwAv6Hi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzB/m8ACgkQJNaLcl1U
h9DS4gf/bAbnyiU2v4l44+1nIFu1Ffa/AwcPHiVzkuINIa7V6xi3h/yxk1Cr4s43
aXJvrdZ/ntwIw4bKuV8OyNDwFgO5yICJmECx6aBP0ripdl7pC9dUg72aalbcr0z9
7Q9G+HDvgk+g3iFWbVKzKvjzyAuczqQUQApPIYUNmMN9GCvCBp3AZcrE8bSA9fW4
jBg4bnkesubO/6c4S3b1guJV/+/EviDML4LxpOTUuhXd3lVWyzrRdNZoGMAmn5U+
Eq5xWl1UQY8jXLPLvqU3/iS1cv7IPvfzoKez/nYHIxibVNREG3R4iq/jDnKZZkuv
vbmbmthnr1zVnDQmehWKd6qumeH+Hg==
=GJ7z
-----END PGP SIGNATURE-----

--s5/bjXLgkIwAv6Hi--
