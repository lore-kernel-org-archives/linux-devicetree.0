From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH v2 2/7] DMA: shdma: Spelling s/controll/control/
Date: Mon, 02 Jun 2014 14:50:40 +0100
Message-ID: <538C8130.8050601@codethink.co.uk>
References: <1401716531-29794-1-git-send-email-geert+renesas@glider.be> <1401716531-29794-3-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1401716531-29794-3-git-send-email-geert+renesas@glider.be>
Sender: linux-sh-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, dmaengine@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 02/06/14 14:42, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New
> 
>  Documentation/devicetree/bindings/dma/shdma.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/shdma.txt b/Documentation/devicetree/bindings/dma/shdma.txt
> index d26b7065ae94..2b61cab0525c 100644
> --- a/Documentation/devicetree/bindings/dma/shdma.txt
> +++ b/Documentation/devicetree/bindings/dma/shdma.txt
> @@ -73,7 +73,7 @@ Example:
>  	};
>  
>  For r8a7790 and newer implementations, the information for the channel
> -controll register is found in the dma phandle and #dma-cells is set to 2.
> +control register is found in the dma phandle and #dma-cells is set to 2.
>  
>  	dma0: dma-mux@0 {
>  		compatible = "renesas,shdma-mux";
> 

Ok, if I don't fix this in the new series then you have my ack for
this to be applied.


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
