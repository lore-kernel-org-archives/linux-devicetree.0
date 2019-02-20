From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH] dt-bindings: imx: update scu resource id headfile
Date: Wed, 20 Feb 2019 03:38:04 +0000
Message-ID: <AM6PR04MB42152D05E62753E760741160807D0@AM6PR04MB4215.eurprd04.prod.outlook.com>
References: <1550566601-11497-1-git-send-email-Anson.Huang@nxp.com>
 <20190219125211.2pg2bqxner4klcb5@pengutronix.de>
 <DB3PR0402MB3916AF3AA0283DB22DF61E2FF57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <20190219144808.qqpaubjcsb4huoml@pengutronix.de>
 <DB3PR0402MB39160A56E168ED20410674D7F57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <DB3PR0402MB39160A56E168ED20410674D7F57C0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Anson Huang <anson.huang@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

[...]

> > I don't like droping some ID's (e.g. IMX_SC_R_DC_0_CAPTURE0) by mark
> > them as unused or even worse give them a other meaning. IMHO the
> > scu-api should be stable since day 1 and the ID's should only be extended.
> > Marking ID's as deprecated is much better than moving them around.
> 
> I agree the SCU APIs should be stable since day 1 and the ID should ONLY be
> extended, but that is the best cases, the reality is, there are different
> SoCs/Revision, some revisions may remove the resources ID defined in
> pre-coded SCU firmware, like the IMX_SC_R_DC_0_CAPTURE0 etc., so SCU APIs
> removes them after real silicon arrived, now latest SCU firmware marks them
> as UNUSED, they could be replaced by some other new resources in later new
> SoC, I am NOT sure, but if it happens, this resource ID table should be updated
> anyway, leaving the out-of-date resource ID table there will have issues, since it
> is NOT sync with SCU firmware.
> 
> So how to resolve such issue? We hope the SCU firmware should be stable
> since day 1, but the truth is NOT, could be still some updates but NOT very
> often. And I believe the updates will NOT break old kernel version.
> 

Please double check with SCU firmware owner what the removed ID are used before?
Any side effect if removing them.

And please also check if the combability can be maintained via IMX_SC_RPC_VERSION?

Regards
Dong Aisheng

> Anson.
> 
> >
> > Regards,
> > Marco
> >
> > >
> > > Anson.
> > >
> > > >
> > > > Regards,
> > > > Marco
> > > >
> > > > > Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> > > > > ---
> > > > >  include/dt-bindings/firmware/imx/rsrc.h | 39
> > > > > +++++++++++++++++++--------------
> > > > >  1 file changed, 22 insertions(+), 17 deletions(-)
> > > > >
> > > > > diff --git a/include/dt-bindings/firmware/imx/rsrc.h
> > > > > b/include/dt-bindings/firmware/imx/rsrc.h
> > > > > index 4481f2d..ad747a8 100644
> > > > > --- a/include/dt-bindings/firmware/imx/rsrc.h
> > > > > +++ b/include/dt-bindings/firmware/imx/rsrc.h
> > > > > @@ -36,15 +36,15 @@
> > > > >  #define IMX_SC_R_DC_0_BLIT1		20
> > > > >  #define IMX_SC_R_DC_0_BLIT2		21
> > > > >  #define IMX_SC_R_DC_0_BLIT_OUT		22
> > > > > -#define IMX_SC_R_DC_0_CAPTURE0		23
> > > > > -#define IMX_SC_R_DC_0_CAPTURE1		24
> > > > > +#define IMX_SC_R_PERF			23
> > > > > +#define IMX_SC_R_UNUSED5		24
> > > > >  #define IMX_SC_R_DC_0_WARP		25
> > > > > -#define IMX_SC_R_DC_0_INTEGRAL0		26
> > > > > -#define IMX_SC_R_DC_0_INTEGRAL1		27
> > > > > +#define IMX_SC_R_UNUSED7		26
> > > > > +#define IMX_SC_R_UNUSED8		27
> > > > >  #define IMX_SC_R_DC_0_VIDEO0		28
> > > > >  #define IMX_SC_R_DC_0_VIDEO1		29
> > > > >  #define IMX_SC_R_DC_0_FRAC0		30
> > > > > -#define IMX_SC_R_DC_0_FRAC1		31
> > > > > +#define IMX_SC_R_UNUSED6		31
> > > > >  #define IMX_SC_R_DC_0			32
> > > > >  #define IMX_SC_R_GPU_2_PID0		33
> > > > >  #define IMX_SC_R_DC_0_PLL_0		34
> > > > > @@ -53,17 +53,17 @@
> > > > >  #define IMX_SC_R_DC_1_BLIT1		37
> > > > >  #define IMX_SC_R_DC_1_BLIT2		38
> > > > >  #define IMX_SC_R_DC_1_BLIT_OUT		39
> > > > > -#define IMX_SC_R_DC_1_CAPTURE0		40
> > > > > -#define IMX_SC_R_DC_1_CAPTURE1		41
> > > > > +#define IMX_SC_R_UNUSED9		40
> > > > > +#define IMX_SC_R_UNUSED10		41
> > > > >  #define IMX_SC_R_DC_1_WARP		42
> > > > > -#define IMX_SC_R_DC_1_INTEGRAL0		43
> > > > > -#define IMX_SC_R_DC_1_INTEGRAL1		44
> > > > > +#define IMX_SC_R_UNUSED11		43
> > > > > +#define IMX_SC_R_UNUSED12		44
> > > > >  #define IMX_SC_R_DC_1_VIDEO0		45
> > > > >  #define IMX_SC_R_DC_1_VIDEO1		46
> > > > >  #define IMX_SC_R_DC_1_FRAC0		47
> > > > > -#define IMX_SC_R_DC_1_FRAC1		48
> > > > > +#define IMX_SC_R_UNUSED13		48
> > > > >  #define IMX_SC_R_DC_1			49
> > > > > -#define IMX_SC_R_GPU_3_PID0		50
> > > > > +#define IMX_SC_R_UNUSED14		50
> > > > >  #define IMX_SC_R_DC_1_PLL_0		51
> > > > >  #define IMX_SC_R_DC_1_PLL_1		52
> > > > >  #define IMX_SC_R_SPI_0			53
> > > > > @@ -303,8 +303,8 @@
> > > > >  #define IMX_SC_R_M4_0_UART		287
> > > > >  #define IMX_SC_R_M4_0_I2C		288
> > > > >  #define IMX_SC_R_M4_0_INTMUX		289
> > > > > -#define IMX_SC_R_M4_0_SIM		290
> > > > > -#define IMX_SC_R_M4_0_WDOG		291
> > > > > +#define IMX_SC_R_UNUSED15		290
> > > > > +#define IMX_SC_R_UNUSED16		291
> > > > >  #define IMX_SC_R_M4_0_MU_0B		292
> > > > >  #define IMX_SC_R_M4_0_MU_0A0		293
> > > > >  #define IMX_SC_R_M4_0_MU_0A1		294
> > > > > @@ -323,8 +323,8 @@
> > > > >  #define IMX_SC_R_M4_1_UART		307
> > > > >  #define IMX_SC_R_M4_1_I2C		308
> > > > >  #define IMX_SC_R_M4_1_INTMUX		309
> > > > > -#define IMX_SC_R_M4_1_SIM		310
> > > > > -#define IMX_SC_R_M4_1_WDOG		311
> > > > > +#define IMX_SC_R_UNUSED17		310
> > > > > +#define IMX_SC_R_UNUSED18		311
> > > > >  #define IMX_SC_R_M4_1_MU_0B		312
> > > > >  #define IMX_SC_R_M4_1_MU_0A0		313
> > > > >  #define IMX_SC_R_M4_1_MU_0A1		314
> > > > > @@ -337,7 +337,7 @@
> > > > >  #define IMX_SC_R_IRQSTR_SCU2		321
> > > > >  #define IMX_SC_R_IRQSTR_DSP		322
> > > > >  #define IMX_SC_R_ELCDIF_PLL		323
> > > > > -#define IMX_SC_R_UNUSED6		324
> > > > > +#define IMX_SC_R_OCRAM			324
> > > > >  #define IMX_SC_R_AUDIO_PLL_0		325
> > > > >  #define IMX_SC_R_PI_0			326
> > > > >  #define IMX_SC_R_PI_0_PWM_0		327
> > > > > @@ -554,6 +554,11 @@
> > > > >  #define IMX_SC_R_VPU_MU_3		538
> > > > >  #define IMX_SC_R_VPU_ENC_1		539
> > > > >  #define IMX_SC_R_VPU			540
> > > > > -#define IMX_SC_R_LAST			541
> > > > > +#define IMX_SC_R_DMA_5_CH0		541
> > > > > +#define IMX_SC_R_DMA_5_CH1		542
> > > > > +#define IMX_SC_R_DMA_5_CH2		543
> > > > > +#define IMX_SC_R_DMA_5_CH3		544
> > > > > +#define IMX_SC_R_ATTESTATION		545
> > > > > +#define IMX_SC_R_LAST			546
> > > > >
> > > > >  #endif /* __DT_BINDINGS_RSCRC_IMX_H */
> > > > > --
> > > > > 2.7.4
> > > > >
> > > > >
> > > > >
> > > >
> > > > --
> > > > Pengutronix e.K.                           |
> |
> > > > Industrial Linux Solutions                 |
> > > >
> > https://emea01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fww
> > > >
> > w.pengutronix.de%2F&amp;data=02%7C01%7Canson.huang%40nxp.com%7
> > > >
> >
> Cfe709ac17a164d82c7d508d6966915fb%7C686ea1d3bc2b4c6fa92cd99c5c30
> 1
> > > >
> >
> 635%7C0%7C0%7C636861775412076730&amp;sdata=05ZzPf2%2BQF10JXLLs
> > > > OPqDdqTi00BWXNHxmMOsQ1z0yI%3D&amp;reserved=0  | Peiner Str.
> 6-8,
> > > > 31137 Hildesheim, Germany | Phone: +49-5121-206917-0
> > |
> > > > Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |
> >
> > --
> > Pengutronix e.K.                           |
> |
> > Industrial Linux Solutions                 |
> > https://emea01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fww
> > w.pengutronix.de%2F&amp;data=02%7C01%7Canson.huang%40nxp.com%7
> >
> Cd5d39730435e4b06549c08d696794904%7C686ea1d3bc2b4c6fa92cd99c5c
> 30
> >
> 1635%7C0%7C0%7C636861845015130502&amp;sdata=tQYrNl5lzIRRNVBCji6
> A
> > sPREOnIfDgdPWgAnsWyCErg%3D&amp;reserved=0  |
> > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0
> |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |
