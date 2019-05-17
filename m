From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add device tree binding for
 ls1046a-frwy board
Date: Fri, 17 May 2019 10:32:49 +0800
Message-ID: <20190517023248.GY15856@dragon>
References: <20190508135501.17578-1-pramod.kumar_1@nxp.com>
 <20190508135501.17578-2-pramod.kumar_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190508135501.17578-2-pramod.kumar_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pramod Kumar <pramod.kumar_1@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "Michal.Vokac@ysoft.com" <Michal.Vokac@ysoft.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vabhav Sharma <vabhav.sharma@nxp.com>
List-Id: devicetree@vger.kernel.org

On Wed, May 08, 2019 at 01:53:08PM +0000, Pramod Kumar wrote:
> Add "fsl,ls1046a-frwy" bindings for ls1046afrwy board based on ls1046a SoC
> 
> Signed-off-by: Vabhav Sharma <vabhav.sharma@nxp.com>
> Signed-off-by: Pramod Kumar <pramod.kumar_1@nxp.com>

Sorry. I do not take patch from message using base64 encoding.

Shawn

> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 7e2cd6ad26bd..873999bf4a43 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -205,6 +205,7 @@ properties:
>            - enum:
>                - fsl,ls1046a-qds
>                - fsl,ls1046a-rdb
> +              - fsl,ls1046a-frwy
>            - const: fsl,ls1046a
>  
>        - description: LS1088A based Boards
> -- 
> 2.17.1
> 
