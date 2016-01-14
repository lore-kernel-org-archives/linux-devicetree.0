From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 1/2] regulator: act8945a: add regulator driver for
 ACT8945A
Date: Thu, 14 Jan 2016 06:19:36 +0000
Message-ID: <20160114061936.GM27358@x1>
References: <1452586629-1117-1-git-send-email-wenyou.yang@atmel.com>
 <1452586629-1117-2-git-send-email-wenyou.yang@atmel.com>
 <87oacp5zl7.fsf@dell.be.48ers.dk>
 <B256D81BAE5131468A838E5D7A243641D63EBC6E@penmbx01>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <B256D81BAE5131468A838E5D7A243641D63EBC6E@penmbx01>
Sender: linux-kernel-owner@vger.kernel.org
To: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
Cc: Peter Korsgaard <peter@korsgaard.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Javier Martinez Canillas <javier@dowhile0.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, 14 Jan 2016, Yang, Wenyou wrote:

> > -----Original Message-----
> > From: Peter Korsgaard [mailto:jacmet@gmail.com] On Behalf Of Peter =
Korsgaard
> > Sent: 2016=E5=B9=B41=E6=9C=8813=E6=97=A5 22:22
> > To: Yang, Wenyou <Wenyou.Yang@atmel.com>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>; Mark Brown <broonie@kernel=
=2Eorg>;
> > Rob Herring <robh+dt@kernel.org>; Pawel Moll <pawel.moll@arm.com>; =
Mark
> > Rutland <mark.rutland@arm.com>; Ian Campbell <ijc+devicetree@hellio=
n.org.uk>;
> > Kumar Gala <galak@codeaurora.org>; Krzysztof Kozlowski
> > <k.kozlowski@samsung.com>; devicetree@vger.kernel.org; Ferre, Nicol=
as
> > <Nicolas.FERRE@atmel.com>; linux-kernel@vger.kernel.org; Javier Mar=
tinez
> > Canillas <javier@dowhile0.org>; Lee Jones <lee.jones@linaro.org>; l=
inux-arm-
> > kernel@lists.infradead.org
> > Subject: Re: [PATCH v2 1/2] regulator: act8945a: add regulator driv=
er for
> > ACT8945A
> >=20
> > >>>>> "Wenyou" =3D=3D Wenyou Yang <wenyou.yang@atmel.com> writes:
> >=20
> >  > This patch adds new regulator driver to support ACT8945A MFD  > =
chip's
> > regulators.
> >=20
> >  > The ACT8945A has three step-down DC/DC converters and four  > lo=
w-dropout
> > regulators.
> >=20
> >  > Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
> >=20
> > Isn't the regulator part of the act8945a identical to act8865? Can'=
t we just use the
> > existing act8865-regulator.c driver? (E.G. support 8865 variant in =
the mfd driver,
> > but only register the regulator sub device?)
>=20
> Yes, the regulator part of the act8945a is identical to act8865.
>=20
> But the act8865-regulator driver is a struct i2c_driver,  and the mfd=
 sub-device driver is a platform_driver driver, it is not easy to use i=
t.

Take a look at some existing files with the pattern
drivers/mfd/*{spi,i2c,core}.c to see how this might be possible.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
