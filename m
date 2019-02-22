From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 2/2] dt-bindings: imx: add new resources to scu
 resource  table
Date: Fri, 22 Feb 2019 13:47:03 -0600
Message-ID: <20190222194703.GA16450@bogus>
References: <1550673029-15910-1-git-send-email-Anson.Huang@nxp.com>
 <1550673029-15910-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1550673029-15910-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <anson.huang@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, 20 Feb 2019 14:35:06 +0000, Anson Huang wrote:
> Add new resources as below according to latest system
> controller firmware for new features:
> 
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
> No changes since V2, just separate the patch to 2, 1 patch to remove resources and the other is to add new
> resources.
> ---
>  include/dt-bindings/firmware/imx/rsrc.h | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
