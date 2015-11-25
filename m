From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Documentation: fsl-quadspi: Add fsl, ls1021-qspi
 compatible string
Date: Wed, 25 Nov 2015 17:49:25 -0600
Message-ID: <20151125234925.GA18905@rob-hp-laptop>
References: <1447838291-9865-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1447838291-9865-1-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuan Yao <yao.yuan@freescale.com>
Cc: mark.rutland@arm.com, pawel.moll@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 18, 2015 at 05:18:11PM +0800, Yuan Yao wrote:
> new compatible string: "fsl,ls1021-qspi".
> 
> Signed-off-by: Yuan Yao <yao.yuan@freescale.com>

Applied, thanks.

Rob

> ---
>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> index 862aa2f..00c587b 100644
> --- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> @@ -2,7 +2,8 @@
>  
>  Required properties:
>    - compatible : Should be "fsl,vf610-qspi", "fsl,imx6sx-qspi",
> -		 "fsl,imx7d-qspi", "fsl,imx6ul-qspi"
> +		 "fsl,imx7d-qspi", "fsl,imx6ul-qspi",
> +		 "fsl,ls1021-qspi"
>    - reg : the first contains the register location and length,
>            the second contains the memory mapping address and length
>    - reg-names: Should contain the reg names "QuadSPI" and "QuadSPI-memory"
> -- 
> 2.1.0.27.g96db324
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
