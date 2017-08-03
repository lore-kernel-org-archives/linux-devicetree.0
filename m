From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dmaengine: usb-dmac: Add soctype for R-Car M3-W
Date: Thu, 3 Aug 2017 09:40:13 +0200
Message-ID: <20170803074012.GA19671@verge.net.au>
References: <1501673614-6633-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1501673614-6633-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: vinod.koul@intel.com, robh+dt@kernel.org, mark.rutland@arm.com, dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 02, 2017 at 08:33:34PM +0900, Yoshihiro Shimoda wrote:
> This patch adds R-Car M3-W device tree bindings for usb-dmac driver.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> index e7780a1..1be6941 100644
> --- a/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> +++ b/Documentation/devicetree/bindings/dma/renesas,usb-dmac.txt
> @@ -8,6 +8,7 @@ Required Properties:
>  	  - "renesas,r8a7793-usb-dmac" (R-Car M2-N)
>  	  - "renesas,r8a7794-usb-dmac" (R-Car E2)
>  	  - "renesas,r8a7795-usb-dmac" (R-Car H3)
> +	  - "renesas,r8a7796-usb-dmac" (R-Car M3-W)
>  - reg: base address and length of the registers block for the DMAC
>  - interrupts: interrupt specifiers for the DMAC, one for each entry in
>    interrupt-names.
> -- 
> 1.9.1
> 
