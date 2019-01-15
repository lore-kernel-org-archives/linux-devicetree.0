Return-Path: <SRS0=opqW=PX=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr130043.outbound.protection.outlook.com ([40.107.13.43]:49775
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728502AbfAOQw2 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 15 Jan 2019 11:52:28 -0500
From: Abel Vesa <abel.vesa@nxp.com>
Subject: Re: [PATCH] dt-bindings: imx8mq: Number clocks consecutively
Date: Tue, 15 Jan 2019 16:49:17 +0000
Message-ID: <20190115164916.h7lzanixvc7pergx@fsr-ub1664-175>
References: <20190115163512.GA31914@bogon.m.sigxcpu.org>
In-Reply-To: <20190115163512.GA31914@bogon.m.sigxcpu.org>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B60D11604735944C963A07564452E366@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: =?iso-8859-1?Q?Guido_G=FCnther?= <agx@sigxcpu.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <sboyd@kernel.org>, Lucas Stach <l.stach@pengutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On 19-01-15 17:35:12, Guido G=FCnther wrote:

You need a commit message here.

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> ---
>=20
>  include/dt-bindings/clock/imx8mq-clock.h | 26 ++++++++++++------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>=20
> diff --git a/include/dt-bindings/clock/imx8mq-clock.h b/include/dt-bindin=
gs/clock/imx8mq-clock.h
> index b53be41929be..04f7ac345984 100644
> --- a/include/dt-bindings/clock/imx8mq-clock.h
> +++ b/include/dt-bindings/clock/imx8mq-clock.h
> @@ -350,7 +350,7 @@
>  #define IMX8MQ_CLK_VPU_G2_ROOT			241
> =20
>  /* SCCG PLL GATE */
> -#define IMX8MQ_SYS1_PLL_OUT			232
> +#define IMX8MQ_SYS1_PLL_OUT			242

Nice catch. And it worked because the IMX8MQ_CLK_HDMI_ROOT (which is also 2=
32)
was not used (and registered).

>  #define IMX8MQ_SYS2_PLL_OUT			243
>  #define IMX8MQ_SYS3_PLL_OUT			244
>  #define IMX8MQ_DRAM_PLL_OUT			245
> @@ -372,24 +372,24 @@
>  /* txesc clock */
>  #define IMX8MQ_CLK_DSI_IPG_DIV                  256
> =20
> -#define IMX8MQ_CLK_TMU_ROOT			265
> +#define IMX8MQ_CLK_TMU_ROOT			257
> =20
>  /* Display root clocks */
> -#define IMX8MQ_CLK_DISP_AXI_ROOT		266
> -#define IMX8MQ_CLK_DISP_APB_ROOT		267
> -#define IMX8MQ_CLK_DISP_RTRM_ROOT		268
> +#define IMX8MQ_CLK_DISP_AXI_ROOT		258
> +#define IMX8MQ_CLK_DISP_APB_ROOT		259
> +#define IMX8MQ_CLK_DISP_RTRM_ROOT		260
> =20
> -#define IMX8MQ_CLK_OCOTP_ROOT			269
> +#define IMX8MQ_CLK_OCOTP_ROOT			261
> =20
> -#define IMX8MQ_CLK_DRAM_ALT_ROOT		270
> -#define IMX8MQ_CLK_DRAM_CORE			271
> +#define IMX8MQ_CLK_DRAM_ALT_ROOT		262
> +#define IMX8MQ_CLK_DRAM_CORE			263
> =20
> -#define IMX8MQ_CLK_MU_ROOT			272
> -#define IMX8MQ_VIDEO2_PLL_OUT			273
> +#define IMX8MQ_CLK_MU_ROOT			264
> +#define IMX8MQ_VIDEO2_PLL_OUT			265
> =20
> -#define IMX8MQ_CLK_CLKO2			274
> +#define IMX8MQ_CLK_CLKO2			266
> =20
> -#define IMX8MQ_CLK_NAND_USDHC_BUS_RAWNAND_CLK	275
> +#define IMX8MQ_CLK_NAND_USDHC_BUS_RAWNAND_CLK	267
> =20
> -#define IMX8MQ_CLK_END				276
> +#define IMX8MQ_CLK_END				268
>  #endif /* __DT_BINDINGS_CLOCK_IMX8MQ_H */
> --=20
> 2.20.1=
