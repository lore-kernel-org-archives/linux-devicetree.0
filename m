From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [PATCH V4 1/2] dt-bindings: imx: remove unused resources from scu
 resource table
Date: Tue, 26 Feb 2019 12:02:41 +0000
Message-ID: <VI1PR04MB42224740E322E5792426DAAB807B0@VI1PR04MB4222.eurprd04.prod.outlook.com>
References: <1550891655-29043-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550891655-29043-1-git-send-email-Anson.Huang@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

> From: Anson Huang
> Sent: Saturday, February 23, 2019 11:20 AM
> To: robh+dt@kernel.org; mark.rutland@arm.com; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> ulf.hansson@linaro.org; Aisheng Dong <aisheng.dong@nxp.com>;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org
> Cc: dl-linux-imx <linux-imx@nxp.com>
> Subject: [PATCH V4 1/2] dt-bindings: imx: remove unused resources from sc=
u
> resource table
>=20
> Removes below resources which were defined during pre-silicon phase and t=
he
> real silicons do NOT have them, they have never been used, latest system
> controller firmware also removed them:
>=20
> 	IMX_SC_R_DC_0_CAPTURE0
> 	IMX_SC_R_DC_0_CAPTURE1
> 	IMX_SC_R_DC_0_INTEGRAL0
> 	IMX_SC_R_DC_0_INTEGRAL1
> 	IMX_SC_R_DC_0_FRAC1
> 	IMX_SC_R_DC_1_CAPTURE0
> 	IMX_SC_R_DC_1_CAPTURE1
> 	IMX_SC_R_DC_1_INTEGRAL0
> 	IMX_SC_R_DC_1_INTEGRAL1
> 	IMX_SC_R_DC_1_FRAC1
> 	IMX_SC_R_GPU_3_PID0
> 	IMX_SC_R_M4_0_SIM
> 	IMX_SC_R_M4_0_WDOG
> 	IMX_SC_R_M4_1_SIM
> 	IMX_SC_R_M4_1_WDOG
>=20
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

There're gaps left after removing, but I can't see it's actually a problem.
So:
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>

Regards
Dong Aisheng

> ---
> Changes since V3:
> 	- just remove those unused resource and no need to define UNUSED
> resource.
> --
>  include/dt-bindings/firmware/imx/rsrc.h | 15 ---------------
>  1 file changed, 15 deletions(-)
>=20
> diff --git a/include/dt-bindings/firmware/imx/rsrc.h
> b/include/dt-bindings/firmware/imx/rsrc.h
> index 4481f2d..d69f934 100644
> --- a/include/dt-bindings/firmware/imx/rsrc.h
> +++ b/include/dt-bindings/firmware/imx/rsrc.h
> @@ -36,15 +36,10 @@
>  #define IMX_SC_R_DC_0_BLIT1		20
>  #define IMX_SC_R_DC_0_BLIT2		21
>  #define IMX_SC_R_DC_0_BLIT_OUT		22
> -#define IMX_SC_R_DC_0_CAPTURE0		23
> -#define IMX_SC_R_DC_0_CAPTURE1		24
>  #define IMX_SC_R_DC_0_WARP		25
> -#define IMX_SC_R_DC_0_INTEGRAL0		26
> -#define IMX_SC_R_DC_0_INTEGRAL1		27
>  #define IMX_SC_R_DC_0_VIDEO0		28
>  #define IMX_SC_R_DC_0_VIDEO1		29
>  #define IMX_SC_R_DC_0_FRAC0		30
> -#define IMX_SC_R_DC_0_FRAC1		31
>  #define IMX_SC_R_DC_0			32
>  #define IMX_SC_R_GPU_2_PID0		33
>  #define IMX_SC_R_DC_0_PLL_0		34
> @@ -53,17 +48,11 @@
>  #define IMX_SC_R_DC_1_BLIT1		37
>  #define IMX_SC_R_DC_1_BLIT2		38
>  #define IMX_SC_R_DC_1_BLIT_OUT		39
> -#define IMX_SC_R_DC_1_CAPTURE0		40
> -#define IMX_SC_R_DC_1_CAPTURE1		41
>  #define IMX_SC_R_DC_1_WARP		42
> -#define IMX_SC_R_DC_1_INTEGRAL0		43
> -#define IMX_SC_R_DC_1_INTEGRAL1		44
>  #define IMX_SC_R_DC_1_VIDEO0		45
>  #define IMX_SC_R_DC_1_VIDEO1		46
>  #define IMX_SC_R_DC_1_FRAC0		47
> -#define IMX_SC_R_DC_1_FRAC1		48
>  #define IMX_SC_R_DC_1			49
> -#define IMX_SC_R_GPU_3_PID0		50
>  #define IMX_SC_R_DC_1_PLL_0		51
>  #define IMX_SC_R_DC_1_PLL_1		52
>  #define IMX_SC_R_SPI_0			53
> @@ -303,8 +292,6 @@
>  #define IMX_SC_R_M4_0_UART		287
>  #define IMX_SC_R_M4_0_I2C		288
>  #define IMX_SC_R_M4_0_INTMUX		289
> -#define IMX_SC_R_M4_0_SIM		290
> -#define IMX_SC_R_M4_0_WDOG		291
>  #define IMX_SC_R_M4_0_MU_0B		292
>  #define IMX_SC_R_M4_0_MU_0A0		293
>  #define IMX_SC_R_M4_0_MU_0A1		294
> @@ -323,8 +310,6 @@
>  #define IMX_SC_R_M4_1_UART		307
>  #define IMX_SC_R_M4_1_I2C		308
>  #define IMX_SC_R_M4_1_INTMUX		309
> -#define IMX_SC_R_M4_1_SIM		310
> -#define IMX_SC_R_M4_1_WDOG		311
>  #define IMX_SC_R_M4_1_MU_0B		312
>  #define IMX_SC_R_M4_1_MU_0A0		313
>  #define IMX_SC_R_M4_1_MU_0A1		314
> --
> 2.7.4
