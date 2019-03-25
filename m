From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V2] dt-bindings: imx: update scu resource id headfile
Date: Mon, 25 Mar 2019 17:30:31 -0500
Message-ID: <20190325223031.GA22935@bogus>
References: <1550663846-22698-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550663846-22698-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, 20 Feb 2019 12:01:59 +0000, Anson Huang wrote:
> Update i.MX SCU resource ID table according to latest
> system controller firmware.
> 
> Latest system controller firmware removes below resources
> which are never be used:
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
> and also add below resources to support new features:
> 	IMX_SC_R_PERF
> 	IMX_SC_R_OCRAM
> 	IMX_SC_R_DMA_5_CH0
> 	IMX_SC_R_DMA_5_CH1
> 	IMX_SC_R_DMA_5_CH2
> 	IMX_SC_R_DMA_5_CH3
> 	IMX_SC_R_ATTESTATION
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> No changes since V1, just update the commit message to provide more detail info.
> ---
>  include/dt-bindings/firmware/imx/rsrc.h | 39 +++++++++++++++++++--------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
