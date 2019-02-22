From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 1/2] dt-bindings: imx: remove unused resources from
 scu resource table
Date: Fri, 22 Feb 2019 13:46:26 -0600
Message-ID: <20190222194626.GA13280@bogus>
References: <1550673029-15910-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550673029-15910-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 20, 2019 at 02:35:02PM +0000, Anson Huang wrote:
> Removes below resources which were defined during
> pre-silicon phase and the real silicons do NOT have
> them, they have never been used, latest system
> controller firmware also removed them:
> 
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
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No changes since V2, just separate the patch to 2, 1 patch to remove resources and the other is to add new
> resources.
> ---
>  include/dt-bindings/firmware/imx/rsrc.h | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/include/dt-bindings/firmware/imx/rsrc.h b/include/dt-bindings/firmware/imx/rsrc.h
> index 4481f2d..32cce37 100644
> --- a/include/dt-bindings/firmware/imx/rsrc.h
> +++ b/include/dt-bindings/firmware/imx/rsrc.h
> @@ -36,15 +36,15 @@
>  #define IMX_SC_R_DC_0_BLIT1		20
>  #define IMX_SC_R_DC_0_BLIT2		21
>  #define IMX_SC_R_DC_0_BLIT_OUT		22
> -#define IMX_SC_R_DC_0_CAPTURE0		23
> -#define IMX_SC_R_DC_0_CAPTURE1		24
> +#define IMX_SC_R_UNUSED19		23
> +#define IMX_SC_R_UNUSED5		24

If unused, don't define them.
