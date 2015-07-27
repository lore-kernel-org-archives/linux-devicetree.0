From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 05/11] mfd: devicetree: bindings: Add Qualcomm SMD
 based RPM DT binding
Date: Mon, 27 Jul 2015 10:53:47 +0100
Message-ID: <20150727095347.GU11162@sirena.org.uk>
References: <1435355419-23602-6-git-send-email-bjorn.andersson@sonymobile.com>
 <20150707121609.GZ3182@x1>
 <20150713214836.GA15178@usrtlx11787.corpusers.net>
 <20150723133133.GB3436@x1>
 <20150723164128.GD4753@usrtlx11787.corpusers.net>
 <20150723171638.GE11162@sirena.org.uk>
 <20150724095847.GC3436@x1>
 <20150724102434.GF11162@sirena.org.uk>
 <20150724172316.GR11162@sirena.org.uk>
 <20150727072918.GU3436@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hWlXnmO21HWBEYii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150727072918.GU3436@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, "bjorn@kryo.se" <bjorn@kryo.se>, Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--hWlXnmO21HWBEYii
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 27, 2015 at 08:29:18AM +0100, Lee Jones wrote:
> On Fri, 24 Jul 2015, Mark Brown wrote:
> > On Fri, Jul 24, 2015 at 11:24:34AM +0100, Mark Brown wrote:

> From here:

> > > > > > +                pm8941-regulators {
> > > > > > +                        compatible = "qcom,rpm-pm8941-regulators";
> > > > > > +                        vdd_l13_l20_l23_l24-supply = <&pm8941_boost>;

> > > > > I'd like Mark to glance at this.

> Mark: Is this new property okay?

As far as I can see that looks like a standard supply property, assuming
the supply is actually called that why would it be an issue?

> > The specified range of the regulator is 1.75-1.85V and this is handled
> > by the implementation, however the board designers have stated that it
> > is only allowed to be configured to 1.8V.

> > So DT is used to narrow the capabilities of the individual component to
> > something that's suitable for this particular system.

> > > We still need Mark to look at this.

> Is it okay for the regulator-{min,max}-microvolt to be artificially
> restricted to the required value, despite knowing that the regulator
> is capable of supply {more,less} voltage?

Yes, that's the entire purpose of those properties - to set the limits
the board designers have which will typically be more restrictive than
those that the regulator itself is capable of imposing.

--hWlXnmO21HWBEYii
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVtf+qAAoJECTWi3JdVIfQWDMH/RUoPbfBqpvhfGbK03QIRtdK
CfVDfU1YaqXBI/TdsbA/wGR910PaWoLVQpfAl3KO2FP1K0/B1HNS9qa8ykEHR0Pt
Rup6nlAMqXGrkKlTBQwYkYev6EaRoKpDqt+ASyio7U2r9KABvzuwlSTtoGyJ4DEM
GUnVH5AISpzlIsaDPr+DPU4ZpDPonja9cW/0qavdi0OK8RLRXS/AohNBHaLuVmcJ
YihPHsTkQ4Lx6RBddYQGcS9XzLve7JUMg44ZznFBlf/fDm7Eo70hXNh3woepLplc
e6vU2dqJz/FLWEqJdFa8TjNMLUJmPrKlwEAS7cyOmb85Y8BZzykPihvlFiLQeC8=
=y1Ty
-----END PGP SIGNATURE-----

--hWlXnmO21HWBEYii--
