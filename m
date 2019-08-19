From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 10/22] arm64: dts: qcom: pm8150b: Add pon and adc nodes
Date: Mon, 19 Aug 2019 10:56:27 -0700
Message-ID: <20190819175628.6914A22CEB@mail.kernel.org>
References: <20190814125012.8700-1-vkoul@kernel.org> <20190814125012.8700-11-vkoul@kernel.org> <20190814170803.DEFCC214DA@mail.kernel.org> <20190819174331.GN12733@vkoul-mobl.Dlink>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190819174331.GN12733@vkoul-mobl.Dlink>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, sibis@codeaurora.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Vinod Koul (2019-08-19 10:43:31)
> On 14-08-19, 10:08, Stephen Boyd wrote:
> >=20
> > >=20
> > > diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/=
dts/qcom/pm8150b.dtsi
> > > index c0a678b0f159..846197bd65cd 100644
> > > --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> > > @@ -2,6 +2,7 @@
> > >  // Copyright (c) 2017-2019, The Linux Foundation. All rights reserve=
d.
> > >  // Copyright (c) 2019, Linaro Limited
> > > =20
> > > +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> > >  #include <dt-bindings/interrupt-controller/irq.h>
> > >  #include <dt-bindings/spmi/spmi.h>
> > > =20
> > > @@ -11,6 +12,59 @@
> > >                 reg =3D <0x2 SPMI_USID>;
> > >                 #address-cells =3D <1>;
> > >                 #size-cells =3D <0>;
> > > +
> > > +               pon@800 {
> >=20
> > Maybe pon node name should be 'key' or 'power-on'?
>=20
> pon stands for power on device. See Documentation/devicetree/bindings/pow=
er/reset/qcom,pon.txt
>=20

Right. I was hoping for a more standard node name vs. an acronym that's
SoC specific.
