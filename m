From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH] dt-bindings: imx: update scu resource id headfile
Date: Wed, 20 Feb 2019 03:43:14 +0000
Message-ID: <AM6PR04MB4215CDF6103C8E085802DA91807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
References: <1550566601-11497-1-git-send-email-Anson.Huang@nxp.com>
 <AM6PR04MB421521095AEEC7530E97998A807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
 <DB3PR0402MB3916C81C158BD68ECB4DA7B6F57D0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <DB3PR0402MB3916C81C158BD68ECB4DA7B6F57D0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

> >
> > You need at least explain what changes made like what new features adde=
d?
> > What removed? Side affect if any?
>=20
> No new features added, looks like SCFW just remove some unused resources.
> No side-effect, as they are NOT used by anyone.
>=20

That seems not true.
I see some new IDs added.
e.g. IMX_SC_R_PERF, IMX_SC_R_OCRAM

Regards
Dong Aisheng

> Anson.
>=20
> >
> > Regards
> > Dong Aisheng
> >
> > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > ---
> > >  include/dt-bindings/firmware/imx/rsrc.h | 39
> > > +++++++++++++++++++--------------
> > >  1 file changed, 22 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/include/dt-bindings/firmware/imx/rsrc.h
> > > b/include/dt-bindings/firmware/imx/rsrc.h
> > > index 4481f2d..ad747a8 100644
> > > --- a/include/dt-bindings/firmware/imx/rsrc.h
> > > +++ b/include/dt-bindings/firmware/imx/rsrc.h
> > > @@ -36,15 +36,15 @@
> > >  #define IMX_SC_R_DC_0_BLIT1		20
> > >  #define IMX_SC_R_DC_0_BLIT2		21
> > >  #define IMX_SC_R_DC_0_BLIT_OUT		22
> > > -#define IMX_SC_R_DC_0_CAPTURE0		23
> > > -#define IMX_SC_R_DC_0_CAPTURE1		24
> > > +#define IMX_SC_R_PERF			23
> > > +#define IMX_SC_R_UNUSED5		24
> > >  #define IMX_SC_R_DC_0_WARP		25
> > > -#define IMX_SC_R_DC_0_INTEGRAL0		26
> > > -#define IMX_SC_R_DC_0_INTEGRAL1		27
> > > +#define IMX_SC_R_UNUSED7		26
> > > +#define IMX_SC_R_UNUSED8		27
> > >  #define IMX_SC_R_DC_0_VIDEO0		28
> > >  #define IMX_SC_R_DC_0_VIDEO1		29
> > >  #define IMX_SC_R_DC_0_FRAC0		30
> > > -#define IMX_SC_R_DC_0_FRAC1		31
> > > +#define IMX_SC_R_UNUSED6		31
> > >  #define IMX_SC_R_DC_0			32
> > >  #define IMX_SC_R_GPU_2_PID0		33
> > >  #define IMX_SC_R_DC_0_PLL_0		34
> > > @@ -53,17 +53,17 @@
> > >  #define IMX_SC_R_DC_1_BLIT1		37
> > >  #define IMX_SC_R_DC_1_BLIT2		38
> > >  #define IMX_SC_R_DC_1_BLIT_OUT		39
> > > -#define IMX_SC_R_DC_1_CAPTURE0		40
> > > -#define IMX_SC_R_DC_1_CAPTURE1		41
> > > +#define IMX_SC_R_UNUSED9		40
> > > +#define IMX_SC_R_UNUSED10		41
> > >  #define IMX_SC_R_DC_1_WARP		42
> > > -#define IMX_SC_R_DC_1_INTEGRAL0		43
> > > -#define IMX_SC_R_DC_1_INTEGRAL1		44
> > > +#define IMX_SC_R_UNUSED11		43
> > > +#define IMX_SC_R_UNUSED12		44
> > >  #define IMX_SC_R_DC_1_VIDEO0		45
> > >  #define IMX_SC_R_DC_1_VIDEO1		46
> > >  #define IMX_SC_R_DC_1_FRAC0		47
> > > -#define IMX_SC_R_DC_1_FRAC1		48
> > > +#define IMX_SC_R_UNUSED13		48
> > >  #define IMX_SC_R_DC_1			49
> > > -#define IMX_SC_R_GPU_3_PID0		50
> > > +#define IMX_SC_R_UNUSED14		50
> > >  #define IMX_SC_R_DC_1_PLL_0		51
> > >  #define IMX_SC_R_DC_1_PLL_1		52
> > >  #define IMX_SC_R_SPI_0			53
> > > @@ -303,8 +303,8 @@
> > >  #define IMX_SC_R_M4_0_UART		287
> > >  #define IMX_SC_R_M4_0_I2C		288
> > >  #define IMX_SC_R_M4_0_INTMUX		289
> > > -#define IMX_SC_R_M4_0_SIM		290
> > > -#define IMX_SC_R_M4_0_WDOG		291
> > > +#define IMX_SC_R_UNUSED15		290
> > > +#define IMX_SC_R_UNUSED16		291
> > >  #define IMX_SC_R_M4_0_MU_0B		292
> > >  #define IMX_SC_R_M4_0_MU_0A0		293
> > >  #define IMX_SC_R_M4_0_MU_0A1		294
> > > @@ -323,8 +323,8 @@
> > >  #define IMX_SC_R_M4_1_UART		307
> > >  #define IMX_SC_R_M4_1_I2C		308
> > >  #define IMX_SC_R_M4_1_INTMUX		309
> > > -#define IMX_SC_R_M4_1_SIM		310
> > > -#define IMX_SC_R_M4_1_WDOG		311
> > > +#define IMX_SC_R_UNUSED17		310
> > > +#define IMX_SC_R_UNUSED18		311
> > >  #define IMX_SC_R_M4_1_MU_0B		312
> > >  #define IMX_SC_R_M4_1_MU_0A0		313
> > >  #define IMX_SC_R_M4_1_MU_0A1		314
> > > @@ -337,7 +337,7 @@
> > >  #define IMX_SC_R_IRQSTR_SCU2		321
> > >  #define IMX_SC_R_IRQSTR_DSP		322
> > >  #define IMX_SC_R_ELCDIF_PLL		323
> > > -#define IMX_SC_R_UNUSED6		324
> > > +#define IMX_SC_R_OCRAM			324
> > >  #define IMX_SC_R_AUDIO_PLL_0		325
> > >  #define IMX_SC_R_PI_0			326
> > >  #define IMX_SC_R_PI_0_PWM_0		327
> > > @@ -554,6 +554,11 @@
> > >  #define IMX_SC_R_VPU_MU_3		538
> > >  #define IMX_SC_R_VPU_ENC_1		539
> > >  #define IMX_SC_R_VPU			540
> > > -#define IMX_SC_R_LAST			541
> > > +#define IMX_SC_R_DMA_5_CH0		541
> > > +#define IMX_SC_R_DMA_5_CH1		542
> > > +#define IMX_SC_R_DMA_5_CH2		543
> > > +#define IMX_SC_R_DMA_5_CH3		544
> > > +#define IMX_SC_R_ATTESTATION		545
> > > +#define IMX_SC_R_LAST			546
> > >
> > >  #endif /* __DT_BINDINGS_RSCRC_IMX_H */
> > > --
> > > 2.7.4
