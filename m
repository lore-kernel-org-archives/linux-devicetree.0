From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>
Subject: Re: [PATCH 1/7] ARM: dts: qcom: Add PM8841 functions device nodes
Date: Wed, 08 Apr 2015 10:07:15 +0300
Message-ID: <1428476835.825.1.camel@linaro.org>
References: <1427900715-26273-1-git-send-email-ivan.ivanov@linaro.org>
	 <1427900715-26273-2-git-send-email-ivan.ivanov@linaro.org>
	 <B79AE5C9-D035-4B0E-A3C4-2648D49F03F3@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <B79AE5C9-D035-4B0E-A3C4-2648D49F03F3@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kumar Gala <galak@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On Wed, 2015-04-01 at 14:54 -0500, Kumar Gala wrote:
> On Apr 1, 2015, at 10:05 AM, Ivan T. Ivanov ivanov@linaro.org> wrote:
>=20
> > Add configuration nodes for multi purpose pins and
> > thermal sensor devices. Thermal sensor will report
> > PMIC die temperature.
> >=20
> > Signed-off-by: Ivan T. Ivanov ivanov@linaro.org>
> > ---
> > arch/arm/boot/dts/qcom-pm8841.dtsi | 14 ++++++++++++++
> > 1 file changed, 14 insertions(+)
> >=20
> > diff --git a/arch/arm/boot/dts/qcom-pm8841.dtsi b/arch/arm/boot/dts=
/qcom-pm8841.dtsi
> > index 73813cc..5c109bd 100644
> > --- a/arch/arm/boot/dts/qcom-pm8841.dtsi
> > +++ b/arch/arm/boot/dts/qcom-pm8841.dtsi
> > @@ -7,6 +7,20 @@
> >                 reg =3D <0x4 SPMI_USID>;
> >                 #address-cells =3D <1>;
> >                 #size-cells =3D <0>;
> > +
> > +               pm8841_mpps: mpps@a000 {
> > +                       compatible =3D "qcom,pm8841-mpp";
> > +                       reg =3D <0xa000 0x400>;
> > +                       gpio-controller;
> > +                       #gpio-cells =3D <2>;
> > +                       interrupts =3D <4 0xa0 0 0>, <4 0xa1 0 0>, =
<4 0xa2 0 0>, <4 0xa3 0 0>;
>=20
> What=E2=80=99s the interrupt parent here with 4 cells?=20

SPMI PMIC Arbiter controller.

Ivan
