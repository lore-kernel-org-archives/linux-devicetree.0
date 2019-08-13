From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add PHYTEC i.MX6 UL/ULL
 devicetree bindings
Date: Tue, 13 Aug 2019 10:04:48 -0600
Message-ID: <20190813160448.GA27548@bogus>
References: <1563954573-370205-1-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1563954573-370205-1-git-send-email-s.riedmueller@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Andrew Smirnov <andrew.smirnov@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

On Wed, Jul 24, 2019 at 09:49:32AM +0200, Stefan Riedmueller wrote:
> Add devicetree bindings for i.MX6 UL/ULL based phyCORE-i.MX6 UL/ULL and
> phyBOARD-Segin.
> 
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 7294ac36f4c0..40f007859092 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -161,12 +161,20 @@ properties:
>          items:
>            - enum:
>                - fsl,imx6ul-14x14-evk      # i.MX6 UltraLite 14x14 EVK Board
> +              - phytec,imx6ul-pbacd10     # PHYTEC phyBOARD-Segin with i.MX6 UL
> +              - phytec,imx6ul-pbacd10-emmc  # PHYTEC phyBOARD-Segin eMMC Kit
> +              - phytec,imx6ul-pbacd10-nand  # PHYTEC phyBOARD-Segin NAND Kit
> +              - phytec,imx6ul-pcl063      # PHYTEC phyCORE-i.MX 6UL

This doesn't match what is in the dts files:

arch/arm/boot/dts/imx6ul-phytec-pcl063.dtsi:    compatible = "phytec,imx6ul-pcl063", "fsl,imx6ul";                    
arch/arm/boot/dts/imx6ul-phytec-phyboard-segin-full.dts:      compatible = "phytec,imx6ul-pbacd10", "phytec,imx6ul-pcl063", 
"fsl,imx6ul";
arch/arm/boot/dts/imx6ul-phytec-phyboard-segin.dtsi:    compatible = "phytec,imx6ul-pbacd-10", "phytec,imx6ul-pcl063",
"fsl,imx6ul";

>            - const: fsl,imx6ul
>  
>        - description: i.MX6ULL based Boards
>          items:
>            - enum:
>                - fsl,imx6ull-14x14-evk     # i.MX6 UltraLiteLite 14x14 EVK Board
> +              - phytec,imx6ull-pbacd10    # PHYTEC phyBOARD-Segin with i.MX6 ULL
> +              - phytec,imx6ull-pbacd10-emmc # PHYTEC phyBOARD-Segin eMMC Kit
> +              - phytec,imx6ull-pbacd10-nand # PHYTEC phyBOARD-Segin NAND Kit
> +              - phytec,imx6ull-pcl063     # PHYTEC phyCORE-i.MX 6ULL
>            - const: fsl,imx6ull
>  
>        - description: i.MX6ULZ based Boards
> -- 
> 2.7.4
> 
