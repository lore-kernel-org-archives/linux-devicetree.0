Return-Path: <SRS0=v+2b=PX=pengutronix.de=l.stach@kernel.org>
Message-ID: <1547571231.4339.17.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: imx8mq: Number clocks consecutively
From: Lucas Stach <l.stach@pengutronix.de>
Date: Tue, 15 Jan 2019 17:53:51 +0100
In-Reply-To: <20190115163512.GA31914@bogon.m.sigxcpu.org>
References: <20190115163512.GA31914@bogon.m.sigxcpu.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
List-ID: <devicetree@vger.kernel.org>

Am Dienstag, den 15.01.2019, 17:35 +0100 schrieb Guido Günther:
> Signed-off-by: Guido Günther <agx@sigxcpu.org>

This is a breaking change in terms of devicetree stability. So either
we rush this into 5.0-rcX, before the current definition spreads around
or we need to drop this change. I'll leave this for Shawn (CCed) to
decide.

Regards,
Lucas

> ---
> 
>  include/dt-bindings/clock/imx8mq-clock.h | 26 ++++++++++++------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindings/clock/imx8mq-clock.h
> index b53be41929be..04f7ac345984 100644
> --- a/include/dt-bindings/clock/imx8mq-clock.h
> +++ b/include/dt-bindings/clock/imx8mq-clock.h
> @@ -350,7 +350,7 @@
> >  #define IMX8MQ_CLK_VPU_G2_ROOT			241
>  
>  /* SCCG PLL GATE */
> > -#define IMX8MQ_SYS1_PLL_OUT			232
> > +#define IMX8MQ_SYS1_PLL_OUT			242
> >  #define IMX8MQ_SYS2_PLL_OUT			243
> >  #define IMX8MQ_SYS3_PLL_OUT			244
> >  #define IMX8MQ_DRAM_PLL_OUT			245
> @@ -372,24 +372,24 @@
>  /* txesc clock */
>  #define IMX8MQ_CLK_DSI_IPG_DIV                  256
>  
> > -#define IMX8MQ_CLK_TMU_ROOT			265
> > +#define IMX8MQ_CLK_TMU_ROOT			257
>  
>  /* Display root clocks */
> > -#define IMX8MQ_CLK_DISP_AXI_ROOT		266
> > -#define IMX8MQ_CLK_DISP_APB_ROOT		267
> > -#define IMX8MQ_CLK_DISP_RTRM_ROOT		268
> > +#define IMX8MQ_CLK_DISP_AXI_ROOT		258
> > +#define IMX8MQ_CLK_DISP_APB_ROOT		259
> > +#define IMX8MQ_CLK_DISP_RTRM_ROOT		260
>  
> > -#define IMX8MQ_CLK_OCOTP_ROOT			269
> > +#define IMX8MQ_CLK_OCOTP_ROOT			261
>  
> > -#define IMX8MQ_CLK_DRAM_ALT_ROOT		270
> > -#define IMX8MQ_CLK_DRAM_CORE			271
> > +#define IMX8MQ_CLK_DRAM_ALT_ROOT		262
> > +#define IMX8MQ_CLK_DRAM_CORE			263
>  
> > -#define IMX8MQ_CLK_MU_ROOT			272
> > -#define IMX8MQ_VIDEO2_PLL_OUT			273
> > +#define IMX8MQ_CLK_MU_ROOT			264
> > +#define IMX8MQ_VIDEO2_PLL_OUT			265
>  
> > -#define IMX8MQ_CLK_CLKO2			274
> > +#define IMX8MQ_CLK_CLKO2			266
>  
> > -#define IMX8MQ_CLK_NAND_USDHC_BUS_RAWNAND_CLK	275
> > +#define IMX8MQ_CLK_NAND_USDHC_BUS_RAWNAND_CLK	267
>  
> > -#define IMX8MQ_CLK_END				276
> > +#define IMX8MQ_CLK_END				268
>  #endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
