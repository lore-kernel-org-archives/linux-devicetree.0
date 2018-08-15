From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dmaengine: rcar-dmac: Document R8A774A1 bindings
Date: Wed, 15 Aug 2018 10:12:07 -0600
Message-ID: <20180815161207.GA21034@rob-hp-laptop>
References: <1534249935-15496-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1534249935-15496-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, 14 Aug 2018 13:32:15 +0100, Fabrizio Castro wrote:
> Renesas' RZ/G2M (R8A774A1) SoC has DMA controllers compatible
> with this driver, therefore document RZ/G2M specific bindings.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

I'm assuming subsystem maintainers will take this series of Renesas 
patches. They are bindings only, but you all update them frequently so 
we don't want any conflicts.

Reviewed-by: Rob Herring <robh@kernel.org>
