From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/4] Documentation: fsl-quadspi: Add fsl,ls2080a-dspi
 compatible string
Date: Tue, 29 Dec 2015 12:35:01 -0600
Message-ID: <20151229183501.GH12450@rob-hp-laptop>
References: <1450954863-7540-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1450954863-7540-1-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuan Yao <yao.yuan@freescale.com>
Cc: mark.rutland@arm.com, pawel.moll@arm.com, galak@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yao.yuan@nxp.com
List-Id: devicetree@vger.kernel.org

On Thu, Dec 24, 2015 at 07:01:00PM +0800, Yuan Yao wrote:
> new compatible string: "fsl,ls2080a-qspi".
> 
> Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
> ---
> Changed in v2:
> Update my email to <yao.yuan@nxp.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> index fa77f87..2fe51d6 100644
> --- a/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-fsl-dspi.txt
> @@ -1,7 +1,8 @@
>  ARM Freescale DSPI controller
>  
>  Required properties:
> -- compatible : "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi", "fsl,ls2085a-dspi"
> +- compatible : "fsl,vf610-dspi", "fsl,ls1021a-v1.0-dspi",
> +		"fsl,ls2085a-dspi", "fsl,ls2080a-dspi"

You should explain what combinations of compatible strings are valid.

Rob
