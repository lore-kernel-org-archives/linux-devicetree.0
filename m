From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 18/20] dt-bindings: qcom_nandc: IPQ8074 QPIC NAND
 documentation
Date: Thu, 10 Aug 2017 15:30:09 -0500
Message-ID: <20170810203009.sree54ddecbnymep@rob-hp-laptop>
References: <1501949998-29859-1-git-send-email-absahu@codeaurora.org>
 <1501949998-29859-19-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501949998-29859-19-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, boris.brezillon@free-electrons.com, computersforpeace@gmail.com, marek.vasut@gmail.com, mark.rutland@arm.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Sat, Aug 05, 2017 at 09:49:56PM +0530, Abhishek Sahu wrote:
> Qualcom IPQ8074 SoC uses QPIC NAND controller version 1.5.0
> which uses BAM DMA Engine.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> index d93b952..8dfa543 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> @@ -6,6 +6,8 @@ Required properties:
>  			    SoC and it uses ADM DMA
>      * "qcom,ipq4019-nand" - for QPIC NAND controller v1.4.0 being used in
>                              IPQ4019 SoC and it uses BAM DMA
> +    * "qcom,ipq8074-nand" - for QPIC NAND controller v1.5.0 being used in
> +                            IPQ8074 SoC and it uses BAM DMA
>  
>  - reg:			MMIO address range
>  - clocks:		must contain core clock and always on clock
> @@ -97,7 +99,7 @@ nand-controller@1ac00000 {
>  };
>  
>  nand-controller@79b0000 {
> -	compatible = "qcom,ipq4019-nand";
> +	compatible = "qcom,ipq4019-nand", "qcom,ipq8074-nand";

The order here should be reversed as 8074 is the newer one. And if 4019 
is the fallback compatible, that needs to be documented above.

Rob
