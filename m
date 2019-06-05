From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: nxp: Add device tree binding
 for ls1046a-frwy board
Date: Wed, 5 Jun 2019 14:34:50 +0800
Message-ID: <20190605063449.GG29853@dragon>
References: <20190527123404.30858-1-pramod.kumar_1@nxp.com>
 <20190527123404.30858-2-pramod.kumar_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190527123404.30858-2-pramod.kumar_1@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pramod Kumar <pramod.kumar_1@nxp.com>
Cc: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, Aisheng Dong <aisheng.dong@nxp.com>, "Michal.Vokac@ysoft.com" <Michal.Vokac@ysoft.com>, Leo Li <leoyang.li@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Vabhav Sharma <vabhav.sharma@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, May 27, 2019 at 12:32:09PM +0000, Pramod Kumar wrote:
> Add "fsl,ls1046a-frwy" bindings for ls1046afrwy board based on ls1046a SoC
> 
> Signed-off-by: Vabhav Sharma <vabhav.sharma@nxp.com>
> Signed-off-by: Pramod Kumar <pramod.kumar_1@nxp.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

I cannot apply patch from message using 'Content-Transfer-Encoding: base64'.

> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 407138ebc0d0..09ff1999ce96 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -241,6 +241,7 @@ properties:
>            - enum:
>                - fsl,ls1046a-qds
>                - fsl,ls1046a-rdb
> +              - fsl,ls1046a-frwy

It might be better to keep the list alphabetically sorted.

Shawn

>            - const: fsl,ls1046a
>  
>        - description: LS1088A based Boards
> -- 
> 2.17.1
> 
