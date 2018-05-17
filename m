Return-Path: <SRS0=KKmW=IE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39607 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751640AbeEQHlT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 17 May 2018 03:41:19 -0400
Date: Thu, 17 May 2018 09:41:00 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/2] dmaengine: rcar-dmac: Document R8A77990 bindings
Message-ID: <20180517074100.rcuy62e6vzel2ki4@verge.net.au>
References: <1526475979-13891-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <1526475979-13891-2-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526475979-13891-2-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: devicetree-owner@vger.kernel.org
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, May 16, 2018 at 03:06:19PM +0200, Ulrich Hecht wrote:
> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> 
> Renesas R-Car E3 (R8A77990) SoC also has the R-Car gen2/3 compatible DMA
> controllers, so document the SoC specific binding.
> 
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> index b1ba6395..946229c 100644
> --- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> +++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> @@ -29,6 +29,7 @@ Required Properties:
>  		- "renesas,dmac-r8a77965" (R-Car M3-N)
>  		- "renesas,dmac-r8a77970" (R-Car V3M)
>  		- "renesas,dmac-r8a77980" (R-Car V3H)
> +		- "renesas,dmac-r8a77990" (R-Car E3)
>  		- "renesas,dmac-r8a77995" (R-Car D3)
>  
>  - reg: base address and length of the registers block for the DMAC
> -- 
> 2.7.4
> 
