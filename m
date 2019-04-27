From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] drivers: regulator: qcom: add PMS405 SPMI regulator
Date: Sun, 28 Apr 2019 03:21:13 +0900
Message-ID: <20190427182113.GL14916@sirena.org.uk>
References: <1548675904-18324-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1548675904-18324-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20190204090301.GC23441@sirena.org.uk>
 <95276ca0-6896-a595-867a-184a518fa31f@linaro.org>
 <20190425183736.GF23183@sirena.org.uk>
 <022b3c6a-e356-3c5a-3c46-c6edcf4f8cd5@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sCNd3Ivk/oijKKf1"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <022b3c6a-e356-3c5a-3c46-c6edcf4f8cd5@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, bjorn.andersson@linaro.org, vinod.koul@linaro.org, niklas.cassel@linaro.org, khasim.mohammed@linaro.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--sCNd3Ivk/oijKKf1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 25, 2019 at 09:44:00PM +0200, Jorge Ramirez wrote:

> the way I see it, if I follow your suggestion and since we are not
> allowed to extend spmi_regulator_find_range(), the only options are:

> 1) duplicate verbatim this whole function
> (spmi_regulator_select_voltage_same_range) with a minor change (this
> amount of code duplication in the kernel seems rather unnecessary to me)

> 2) modify the struct spmi_regulator definition with a new operation that
> calls a different implementation of find range (seems a massive overkill)

Since the point of this change is AFAICT that this regulator only has a
single linear range it seems like it should just be able to use the
existing generic functions shouldn't it?  It just needs it's own
set/get_voltage_sel() operations.  As far as I can see the main thing
the driver is doing with the custom stuff is handling the fact that
there's multiple ranges but that's not an issue for this regulator.
It's possible I'm missing something there but that was the main thing
(and we do have some generic support for multiple linear ranges in the
helper code already, can't remember why this driver isn't using that -
the ranges overlap IIRC?).

TBH looking at the uses of find_range() I'm not sure they're 100%
sensible as they are - the existing _time_sel() is assuming we only need
to work out the ramp time between voltages in the same range which is
going to have trouble.

--sCNd3Ivk/oijKKf1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzEnZYACgkQJNaLcl1U
h9Be2wf/Ts0rAq3XrujapmG1sE36u6DgwDxHfPpMSejg40goWEljc2BT0WnUwqiC
NRj8O2f8zXZJ6jEofNYk6dOO17ej93naTtIO34nDIU7KSB0q0DhyApUTMwGiFuC9
b5Aoa1EvRAaqQ/Pr9n8XUHnDxgCJsMzDxz9w6dXlT0fgDnvoFnQAL1OYaHZjwb72
Sgp/3sJSpniaTGO+F3QaSV/lmGJ/7bMRvvNSQZOpwYc10YRmuFOGcGw2WZp71G4q
XUlyxvscZ77dvHs3p/p87mwuzJID6ZTxnIFcH3ScemFJE6DDSN4aRb1gfVZtrOIS
qdrDP4sKHBDd+xxxcUqJVBtZaWHK/Q==
=RPrf
-----END PGP SIGNATURE-----

--sCNd3Ivk/oijKKf1--
