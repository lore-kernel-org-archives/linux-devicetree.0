From: Laurentiu Palcu <laurentiu.palcu@nxp.com>
Subject: Re: Re: [PATCH 5/5] arm64: dts: imx8mq: add DCSS node
Date: Tue, 24 Sep 2019 07:25:03 +0000
Message-ID: <20190924072502.GA25260@fsr-ub1664-121>
References: <1569248002-2485-1-git-send-email-laurentiu.palcu@nxp.com>
 <1569248002-2485-6-git-send-email-laurentiu.palcu@nxp.com>
 <20190923165443.D1B1C20882@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190923165443.D1B1C20882@mail.kernel.org>
Content-Language: en-US
Content-ID: <7AB49DD3028DE1488B72B757DD762F4E@eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 23, 2019 at 09:54:42AM -0700, Stephen Boyd wrote:
> Quoting Laurentiu Palcu (2019-09-23 07:13:19)
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mq.dtsi
> > index 52aae34..d4aa778 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > @@ -871,6 +871,31 @@
> >                                 interrupt-controller;
> >                                 #interrupt-cells =3D <1>;
> >                         };
> > +
> > +                       dcss: dcss@0x32e00000 {
>=20
> Drop the 0x prefix on node names.

Thanks, will do.
laurentiu

>=20
> > +                               #address-cells =3D <1>;
> > +                               #size-cells =3D <0>;
> > +                               compatible =3D "nxp,imx8mq-dcss";
> > +                               reg =3D <0x32e00000 0x2D000>, <0x32e2f0=
00 0x1000>;
> > +                               interrupts =3D <6>, <8>, <9>;
> > +                               interrupt-names =3D "ctx_ld", "ctxld_ki=
ck", "vblank";
> > +                               interrupt-parent =3D <&irqsteer>;
> > +                               clocks =3D <&clk IMX8MQ_CLK_DISP_APB_RO=
OT>,
> > +                                        <&clk IMX8MQ_CLK_DISP_AXI_ROOT=
>,
> > +                                        <&clk IMX8MQ_CLK_DISP_RTRM_ROO=
T>,
> > +                                        <&clk IMX8MQ_VIDEO2_PLL_OUT>,
> > +                                        <&clk IMX8MQ_CLK_DISP_DTRC>;
> > +                               clock-names =3D "apb", "axi", "rtrm", "=
pix", "dtrc";
> > +                               assigned-clocks =3D <&clk IMX8MQ_CLK_DI=
SP_AXI>,
> > +                                                 <&clk IMX8MQ_CLK_DISP=
_RTRM>,
> > +                                                 <&clk IMX8MQ_VIDEO2_P=
LL1_REF_SEL>;
> > +                               assigned-clock-parents =3D <&clk IMX8MQ=
_SYS1_PLL_800M>,
> > +                                                        <&clk IMX8MQ_S=
YS1_PLL_800M>,
> > +                                                        <&clk IMX8MQ_C=
LK_27M>;
> > +                               assigned-clock-rates =3D <800000000>,
> > +                                                          <400000000>;
> > +                               status =3D "disabled";
> > +                       };
> =
