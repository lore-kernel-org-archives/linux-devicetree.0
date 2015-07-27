From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 05/11] mfd: devicetree: bindings: Add Qualcomm SMD
 based RPM DT binding
Date: Mon, 27 Jul 2015 11:58:53 +0100
Message-ID: <20150727105853.GA21114@x1>
References: <20150707121609.GZ3182@x1>
 <20150713214836.GA15178@usrtlx11787.corpusers.net>
 <20150723133133.GB3436@x1>
 <20150723164128.GD4753@usrtlx11787.corpusers.net>
 <20150723171638.GE11162@sirena.org.uk>
 <20150724095847.GC3436@x1>
 <20150724102434.GF11162@sirena.org.uk>
 <20150724172316.GR11162@sirena.org.uk>
 <20150727072918.GU3436@x1>
 <20150727095347.GU11162@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150727095347.GU11162@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, "bjorn@kryo.se" <bjorn@kryo.se>, Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, 27 Jul 2015, Mark Brown wrote:

> On Mon, Jul 27, 2015 at 08:29:18AM +0100, Lee Jones wrote:
> > On Fri, 24 Jul 2015, Mark Brown wrote:
> > > On Fri, Jul 24, 2015 at 11:24:34AM +0100, Mark Brown wrote:
>=20
> > From here:
>=20
> > > > > > > +                pm8941-regulators {
> > > > > > > +                        compatible =3D "qcom,rpm-pm8941-=
regulators";
> > > > > > > +                        vdd_l13_l20_l23_l24-supply =3D <=
&pm8941_boost>;
>=20
> > > > > > I'd like Mark to glance at this.
>=20
> > Mark: Is this new property okay?
>=20
> As far as I can see that looks like a standard supply property, assum=
ing
> the supply is actually called that why would it be an issue?
>=20
> > > The specified range of the regulator is 1.75-1.85V and this is ha=
ndled
> > > by the implementation, however the board designers have stated th=
at it
> > > is only allowed to be configured to 1.8V.
>=20
> > > So DT is used to narrow the capabilities of the individual compon=
ent to
> > > something that's suitable for this particular system.
>=20
> > > > We still need Mark to look at this.
>=20
> > Is it okay for the regulator-{min,max}-microvolt to be artificially
> > restricted to the required value, despite knowing that the regulato=
r
> > is capable of supply {more,less} voltage?
>=20
> Yes, that's the entire purpose of those properties - to set the limit=
s
> the board designers have which will typically be more restrictive tha=
n
> those that the regulator itself is capable of imposing.

All fine then.

Please re-submit with the changes we discussed.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
