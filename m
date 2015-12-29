From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 2/4] Documentation: fsl-quadspi: Add fsl, ls2080a-qspi
 compatible string
Date: Tue, 29 Dec 2015 12:34:54 -0600
Message-ID: <20151229183454.GF12450@rob-hp-laptop>
References: <1450954863-7540-1-git-send-email-yao.yuan@freescale.com>
 <1450954863-7540-2-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450954863-7540-2-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuan Yao <yao.yuan@freescale.com>
Cc: mark.rutland@arm.com, pawel.moll@arm.com, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yao.yuan@nxp.com
List-Id: devicetree@vger.kernel.org

On Thu, Dec 24, 2015 at 07:01:01PM +0800, Yuan Yao wrote:
> new compatible string: "fsl,ls2080a-qspi".
> 
> Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> ---
> Changed in v2:
> Update my email to <yao.yuan@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> index 6585ac7..2bef0dc 100644
> --- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
> @@ -3,7 +3,7 @@
>  Required properties:
>    - compatible : Should be "fsl,vf610-qspi", "fsl,imx6sx-qspi",
>  		 "fsl,imx7d-qspi", "fsl,imx6ul-qspi",
> -		 "fsl,ls1021-qspi"
> +		 "fsl,ls1021a-qspi", "fsl,ls2080a-qspi"

You should explain what combinations of compatible strings are valid.

Rob
