From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 06/25] dt-bindings: qcom_nandc: remove chip select
 compatible string
Date: Fri, 4 Aug 2017 09:47:47 +0200
Message-ID: <20170804094747.58ba2bb9@bbrezillon>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
        <1500464893-11352-7-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500464893-11352-7-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org, mark.rutland@arm.com, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, andy.gross@linaro.org, architt@codeaurora.org, sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

On Wed, 19 Jul 2017 17:17:54 +0530
Abhishek Sahu <absahu@codeaurora.org> wrote:

> Currently the compatible “qcom,nandcs” is being used for each
> connected NAND device to support for multiple NAND devices in the
> same bus. The same thing can be achieved by looking reg property
> for each sub nodes which contains the chip select number so this
> patch removes the use of “qcom,nandcs” for specifying NAND device
> sub nodes.
> 
> Since there is no user for this driver currently in so
> changing compatible string is safe.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>

Applied to nand/next.

Thanks,

Boris

> ---
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> index 4511918..b24adfe 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> @@ -28,7 +28,6 @@ chip-selects which (may) contain NAND flash chips. Their properties are as
>  follows.
>  
>  Required properties:
> -- compatible:		should contain "qcom,nandcs"
>  - reg:			a single integer representing the chip-select
>  			number (e.g., 0, 1, 2, etc.)
>  - #address-cells:	see partition.txt
> @@ -62,7 +61,6 @@ nand@1ac00000 {
>  	#size-cells = <0>;
>  
>  	nandcs@0 {
> -		compatible = "qcom,nandcs";
>  		reg = <0>;
>  
>  		nand-ecc-strength = <4>;
