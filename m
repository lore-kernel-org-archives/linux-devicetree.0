From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcs404: evb: Fix voltages for s5 and l3
Date: Mon, 4 Feb 2019 21:59:30 +0100
Message-ID: <20190204205930.GK23441@sirena.org.uk>
References: <20190125232954.26166-1-bjorn.andersson@linaro.org>
 <32b8136d-3acb-66e9-948c-ee8903b91401@linaro.org>
 <20190129224652.GB11349@centauri.lan>
 <20190204104347.GD23441@sirena.org.uk>
 <20190204160337.GG2387@tuxbook-pro>
 <20190204182321.GH23441@sirena.org.uk>
 <20190204192510.GZ31919@minitux>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BFVE2HhgxTpCzM8t"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190204192510.GZ31919@minitux>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Niklas Cassel <niklas.cassel@linaro.org>, Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Khasim Syed Mohammed <khasim.mohammed@linaro.org>
List-Id: devicetree@vger.kernel.org


--BFVE2HhgxTpCzM8t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 04, 2019 at 11:25:10AM -0800, Bjorn Andersson wrote:
> On Mon 04 Feb 10:23 PST 2019, Mark Brown wrote:
> > On Mon, Feb 04, 2019 at 08:03:37AM -0800, Bjorn Andersson wrote:

> Okay, I don't see a big problem with expecting the DT to only contain
> values that the hardware can actually do. I do however see that
> machine_constraints_voltage() has been changes to expect the driver to
> return -ENOTRECOVERABLE when we don't have a way to query the voltage
> during probe.

> So there's a risk of this breaking compatibility with older dtb files on
> other boards. We will have to do some more verification on this.

That's basically only going to affect Qualcomm hardware FWIW, I had
thought that such devices didn't manage to probe with upstream before
that change either but I could be misremembering.

> > > regulator framework be made to round down to the previous valid step
> > > instead of up?

> > We definitely don't want to round voltages down, it is vastly more
> > common for devices to experience problems like brownouts if they go
> > under voltage so it'd be more likely to cause harm than good.

> We're 2mV off in this case, but it could have been way off. So I'm good
> with this position.

Never mind that that's 2mV assuming the regulator has perfect accuracy
and there's headroom.  For something like this it's likely not a problem
but some high current things (especially CPUs or anything like that) are
operating on thin margins.

--BFVE2HhgxTpCzM8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxYp68ACgkQJNaLcl1U
h9DL1Qf9ED2ORN4Cuibho/qUCZ5Vmyq+ZZRNIMfcx+diIXcc2K8kfEGbQRNOcaOC
XYV9xfdv0kf6wJmw/KSn78iOhBac6VpZDTV2HDytsNd97JKExcBB3w9KficyBWNz
3CxQIBsyrzrwXsAaXQwbqqSabaUL4GMdQaK2LutuzIti4mjT8bUNSzSvP55kK+PK
vp9IwHvDjIJppc0YyupME4lRsWHUAuK+TmJuTWfsuQOMwGPe9SUbwoBV/FU3QzJ9
p+1iRIDWN/G9TkRgo4MqhzAL1L1mTpOB0S9xk392sG4J8L4N7xk1Z6ZCBsT8sVXP
CglfiH5s9zVjbXlKyehlSRbgPqSskg==
=eM4M
-----END PGP SIGNATURE-----

--BFVE2HhgxTpCzM8t--
