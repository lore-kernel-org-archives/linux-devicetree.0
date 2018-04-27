Return-Path: <robherring2@gmail.com>
Date: Fri, 27 Apr 2018 09:31:20 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4] dmaengine: rcar-dmac: Document R-Car D3 bindings
Message-ID: <20180427143120.vpay5ryxkwfxyobm@rob-hp-laptop>
References: <20180424085106.11907-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180424085106.11907-1-horms+renesas@verge.net.au>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Apr 24, 2018 at 10:51:06AM +0200, Simon Horman wrote:
> From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> 
> R8A77995's SYS-DMAC is R-Car Gen3-compatible.
> 
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> [simon: rebased]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on v4.17-rc1
> ---
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
