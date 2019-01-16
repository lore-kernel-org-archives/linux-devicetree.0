From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2] dt-bindings: imx8mq: Number clocks consecutively
Date: Wed, 16 Jan 2019 10:15:25 +0100
Message-ID: <1547630125.4339.20.camel@pengutronix.de>
References: <20190116084122.GA19712@bogon.m.sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190116084122.GA19712@bogon.m.sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abel.vesa@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 16.01.2019, 09:41 +0100 schrieb Guido Günther:
> This fixes a duplicate use of 232 and numbers the clocks without holes.
> 
> Fixes: 1cf3817bf1f5 ("dt-bindings: Add binding for i.MX8MQ CCM")
> 
> Signed-off-by: Guido Günther <agx@sigxcpu.org>

I agree that this should be applied as a fix for 5.0-rc.

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>


> ---
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
