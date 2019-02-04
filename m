From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcs404: evb: Fix voltages for s5 and l3
Date: Mon, 4 Feb 2019 11:43:47 +0100
Message-ID: <20190204104347.GD23441@sirena.org.uk>
References: <20190125232954.26166-1-bjorn.andersson@linaro.org>
 <32b8136d-3acb-66e9-948c-ee8903b91401@linaro.org>
 <20190129224652.GB11349@centauri.lan>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4zI0WCX1RcnW9Hbu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190129224652.GB11349@centauri.lan>
Sender: linux-kernel-owner@vger.kernel.org
To: Niklas Cassel <niklas.cassel@linaro.org>
Cc: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Khasim Syed Mohammed <khasim.mohammed@linaro.org>
List-Id: devicetree@vger.kernel.org


--4zI0WCX1RcnW9Hbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 29, 2019 at 11:46:52PM +0100, Niklas Cassel wrote:

> Adding Mark Brown on CC.

It really helps if you ask a specific question when doing something like
this rather than just have a big quoted mail - it makes it much easier
to find what's relevant rather than trying to find things, especially
when they're buried behind several layers of quoting.

> On Tue, Jan 29, 2019 at 10:58:47PM +0100, Jorge Ramirez wrote:
> > On 1/26/19 00:29, Bjorn Andersson wrote:

> > the question is, should this property contain only hardware achievable
> > values? or should drivers only request hardware achievable values? the
> > way the constrains are implemented it has to be one of the two (I think
> > the former would be more intuitive - ie if the dts
> > regulator-min-microvolt is a valid value)

Drivers should not be coded with a specific regulator or board in mind
and should just request whatever they need.  This will then be matched
with whatever the board is actually able to deliver.  Similarly there is
no requirement that machine constraints be written with specific
reference to what the physical regulator on the board is able to do, for
example the constraints will come from electrical engineering
restrictions like the specifications of the parts connected to the
regulator rather than from what the regulator can actually do so people
should feel free to just write down the actual physical constraint and
let the regulator API ensure that the constraint is met.

--4zI0WCX1RcnW9Hbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxYF18ACgkQJNaLcl1U
h9Au6Qf+LpdYqVbelJRtzkiY7hM8KnLPW22HxU3sbgDRIo8tyQ1HY3hWhY63+cmE
XLTH4I5sv+tJsk4sEVYGHHH81DYdVlMEg3FnHqUU3YLWqULlEtmCTvs+alKAR2TA
IgXdRs4oG8A4iC0lAN+umBokj1xXDl0sSs/Uf/kAAVN6zoymThziFVrpI868+e01
fmo+lILI1d1DLqB6epeNkaDoIjitZ/4H5ycYr6yFIJvspZC0rrSJwKxsvyubUKTW
Athu41csXgHdmri1WM2toON7zpPslVLpxBslGwWngGFjgaDE+ohLic4sZ1Q8uLjS
XeB8tsDpt6XWCdvZt8ltbeeDpoZWkQ==
=RsID
-----END PGP SIGNATURE-----

--4zI0WCX1RcnW9Hbu--
