From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 03/16] dt-bindings: qcom_nandc: make
 nand-ecc-strength optional
Date: Sat, 26 May 2018 10:42:53 +0200
Message-ID: <20180526104253.05489470@xps13>
References: <1527250904-21988-1-git-send-email-absahu@codeaurora.org>
        <1527250904-21988-4-git-send-email-absahu@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1527250904-21988-4-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit Taneja <architt@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Abhishek,

On Fri, 25 May 2018 17:51:31 +0530, Abhishek Sahu
<absahu@codeaurora.org> wrote:

> If nand-ecc-strength specified in DT, then controller will use
> this ECC strength otherwise ECC strength will be calculated
> according to chip requirement and available OOB size.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
> * Changes from v2:
>   NONE
> 
> * Changes from v1:
>   NEW PATCH
> 
>  Documentation/devicetree/bindings/mtd/qcom_nandc.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> index 73d336be..f246aa0 100644
> --- a/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> +++ b/Documentation/devicetree/bindings/mtd/qcom_nandc.txt
> @@ -45,11 +45,13 @@ Required properties:
>  			number (e.g., 0, 1, 2, etc.)
>  - #address-cells:	see partition.txt
>  - #size-cells:		see partition.txt
> -- nand-ecc-strength:	see nand.txt
>  - nand-ecc-step-size:	must be 512. see nand.txt for more details.

I think you can squash the two dt-bindings commits as they are tightly
related to each other.

>  
>  Optional properties:
>  - nand-bus-width:	see nand.txt
> +- nand-ecc-strength:	see nand.txt. If not specified, then ECC strength will
> +			be used according to chip requirement and available
> +			OOB size.
>  
>  Each nandcs device node may optionally contain a 'partitions' sub-node, which
>  further contains sub-nodes describing the flash partition mapping. See



-- 
Miquel Raynal, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
