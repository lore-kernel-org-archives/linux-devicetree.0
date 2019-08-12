From: Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH] arm64: dts: ls1028a: fix gpio nodes
Date: Mon, 12 Aug 2019 21:01:16 +0000
Message-ID: <VE1PR04MB6687FD06F5E8DADE55F495D38FD30@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20190805065700.7601-1-hui.song_1@nxp.com>
 <20190812134716.GF27041@X250>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190812134716.GF27041@X250>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Hui Song <hui.song_1@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



> -----Original Message-----
> From: Shawn Guo <shawnguo@kernel.org>
> Sent: Monday, August 12, 2019 8:47 AM
> To: Hui Song <hui.song_1@nxp.com>; Leo Li <leoyang.li@nxp.com>
> Cc: Rob Herring <robh+dt@kernel.org>; Mark Rutland
> <mark.rutland@arm.com>; Linus Walleij <linus.walleij@linaro.org>; Bartosz
> Golaszewski <bgolaszewski@baylibre.com>; linux-arm-
> kernel@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-gpio@vger.kernel.org
> Subject: Re: [PATCH] arm64: dts: ls1028a: fix gpio nodes
>=20
> On Mon, Aug 05, 2019 at 02:57:00PM +0800, Hui Song wrote:
> > From: Song Hui <hui.song_1@nxp.com>
> >
> > Update the nodes to include little-endian property to be consistent
> > with the hardware.
> >
> > Signed-off-by: Song Hui <hui.song_1@nxp.com>
>=20
> @Leo, looks good?

Acked-by: Li Yang <leoyang.li@nxp.com>

>=20
> Shawn
>=20
> > ---
> >  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > index aef5b06..7ccbbfc 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> > @@ -277,33 +277,36 @@
> >  		};
> >
> >  		gpio1: gpio@2300000 {
> > -			compatible =3D "fsl,qoriq-gpio";
> > +			compatible =3D "fsl,ls1028a-gpio","fsl,qoriq-gpio";
> >  			reg =3D <0x0 0x2300000 0x0 0x10000>;
> >  			interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> >  			gpio-controller;
> >  			#gpio-cells =3D <2>;
> >  			interrupt-controller;
> >  			#interrupt-cells =3D <2>;
> > +			little-endian;
> >  		};
> >
> >  		gpio2: gpio@2310000 {
> > -			compatible =3D "fsl,qoriq-gpio";
> > +			compatible =3D "fsl,ls1028a-gpio","fsl,qoriq-gpio";
> >  			reg =3D <0x0 0x2310000 0x0 0x10000>;
> >  			interrupts =3D <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> >  			gpio-controller;
> >  			#gpio-cells =3D <2>;
> >  			interrupt-controller;
> >  			#interrupt-cells =3D <2>;
> > +			little-endian;
> >  		};
> >
> >  		gpio3: gpio@2320000 {
> > -			compatible =3D "fsl,qoriq-gpio";
> > +			compatible =3D "fsl,ls1028a-gpio","fsl,qoriq-gpio";
> >  			reg =3D <0x0 0x2320000 0x0 0x10000>;
> >  			interrupts =3D <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> >  			gpio-controller;
> >  			#gpio-cells =3D <2>;
> >  			interrupt-controller;
> >  			#interrupt-cells =3D <2>;
> > +			little-endian;
> >  		};
> >
> >  		usb0: usb@3100000 {
> > --
> > 2.9.5
> >
