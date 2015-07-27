From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 05/11] mfd: devicetree: bindings: Add Qualcomm SMD
 based RPM DT binding
Date: Mon, 27 Jul 2015 08:29:18 +0100
Message-ID: <20150727072918.GU3436@x1>
References: <1435355419-23602-1-git-send-email-bjorn.andersson@sonymobile.com>
 <1435355419-23602-6-git-send-email-bjorn.andersson@sonymobile.com>
 <20150707121609.GZ3182@x1>
 <20150713214836.GA15178@usrtlx11787.corpusers.net>
 <20150723133133.GB3436@x1>
 <20150723164128.GD4753@usrtlx11787.corpusers.net>
 <20150723171638.GE11162@sirena.org.uk>
 <20150724095847.GC3436@x1>
 <20150724102434.GF11162@sirena.org.uk>
 <20150724172316.GR11162@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150724172316.GR11162@sirena.org.uk>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>, "bjorn@kryo.se" <bjorn@kryo.se>, Andy Gross <agross@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Samuel Ortiz <sameo@linux.intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, 24 Jul 2015, Mark Brown wrote:

> On Fri, Jul 24, 2015 at 11:24:34AM +0100, Mark Brown wrote:
> > On Fri, Jul 24, 2015 at 10:58:47AM +0100, Lee Jones wrote:
> > > On Thu, 23 Jul 2015, Mark Brown wrote:
>=20
> > > > I have no idea what's going on here, sorry.  I've not been read=
ing this
> > > > thread.
>=20
> > > All of the information you need is in the email you replied to.
>=20
> > The mail appears to have an edited down section of what looks like =
an
> > example rather than the actual binding.  I haven't seen the binding=
 so I
> > can't really comment on it.
>=20
> I managed to find the binding but I'm afraid I'm still not sure what =
the
> concern here is - can someone please be specific about the question(s=
)
> you're looking for an answer on?

[...]

=46rom here:

> > > > > +                pm8941-regulators {
> > > > > +                        compatible =3D "qcom,rpm-pm8941-regu=
lators";
> > > > > +                        vdd_l13_l20_l23_l24-supply =3D <&pm8=
941_boost>;
> > > >=20
> > > > I'd like Mark to glance at this.

Mark: Is this new property okay?

> > > > > +                        pm8941_s3: s3 {
> > > > > +                                regulator-min-microvolt =3D =
<1800000>;
> > > > > +                                regulator-max-microvolt =3D =
<1800000>;
> > > >=20
> > > > Aren't these fixed regulators?
> > >=20
> > > In this system configuration most of the regulators have fixed va=
lues,
> > > but the regulators (hw) are not fixed.
> >
> > I'm not sure that's how it works.  I believe 'max' and 'min' should
> > describe the upper and lower constraints of the regulator.  The act=
ual
> > value it runs it is selected elsewhere.
>=20
> The specified range of the regulator is 1.75-1.85V and this is handle=
d
> by the implementation, however the board designers have stated that i=
t
> is only allowed to be configured to 1.8V.
>=20
> So DT is used to narrow the capabilities of the individual component =
to
> something that's suitable for this particular system.
>=20
> > We still need Mark to look at this.

Is it okay for the regulator-{min,max}-microvolt to be artificially
restricted to the required value, despite knowing that the regulator
is capable of supply {more,less} voltage?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
