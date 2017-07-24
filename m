From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 12/25] dt-bindings: qcom_nandc: QPIC NAND documentation
Date: Mon, 24 Jul 2017 14:17:23 -0500
Message-ID: <20170724191723.aisibziviylk5ihc@rob-hp-laptop>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-13-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1500464893-11352-13-git-send-email-absahu@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wed, Jul 19, 2017 at 05:18:00PM +0530, Abhishek Sahu wrote:
> 1. QPIC NAND will use compatible string "qcom,qpic-nandc-v1.4.0"
> 2. QPIC NAND will 3 BAM channels: command, data tx and data rx
>    while EBI2 NAND uses only single ADM channel.
> 3. CRCI is only required for ADM DMA and its not required for
>    QPIC NAND.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  .../devicetree/bindings/mtd/qcom_nandc.txt         | 54 ++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> index b24adfe..8efaeb0 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> @@ -1,13 +1,15 @@
>  * Qualcomm NAND controller
>  
>  Required properties:
> -- compatible:		should be "qcom,ebi2-nandc" - EBI2 NAND which uses ADM
> -			DMA like IPQ8064.
> -
> +- compatible:		must be one of the following:
> +	* "qcom,ebi2-nandc" - EBI2 NAND which uses ADM DMA like IPQ8064.
> +	* "qcom,qpic-nandc-v1.4.0" - QPIC NAND v1.4.0 which uses BAM DMA like IPQ4019.

Looks like you have 2 SoCs and 2 versions of h/w. Use SoC specific 
compatible strings.

Rob
