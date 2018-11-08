From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dmaengine: rcar-dmac: Document R8A774A1 bindings
Date: Thu, 8 Nov 2018 13:23:29 +0100
Message-ID: <20181108122329.pxxjrmaaxutxxel3@verge.net.au>
References: <1534249935-15496-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TY1PR01MB17708409052CFB9469856335C0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <TY1PR01MB17708409052CFB9469856335C0C50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

I believe this one is for Vinod.

On Thu, Nov 08, 2018 at 11:03:53AM +0000, Fabrizio Castro wrote:
> Dear All,
> 
> Who is the best person to take this patch?
> 
> Thanks,
> Fab
> 
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Sent: 14 August 2018 13:32
> > Subject: [PATCH] dmaengine: rcar-dmac: Document R8A774A1 bindings
> >
> > Renesas' RZ/G2M (R8A774A1) SoC has DMA controllers compatible
> > with this driver, therefore document RZ/G2M specific bindings.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> > b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> > index 946229c..2de2eed 100644
> > --- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> > +++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> > @@ -1,6 +1,6 @@
> >  * Renesas R-Car (RZ/G) DMA Controller Device Tree bindings
> >
> > -Renesas R-Car Generation 2 SoCs have multiple multi-channel DMA
> > +Renesas R-Car (Gen 2/3) and RZ/G SoCs have multiple multi-channel DMA
> >  controller instances named DMAC capable of serving multiple clients. Channels
> >  can be dedicated to specific clients or shared between a large number of
> >  clients.
> > @@ -19,6 +19,7 @@ Required Properties:
> >  - "renesas,dmac-r8a7743" (RZ/G1M)
> >  - "renesas,dmac-r8a7745" (RZ/G1E)
> >  - "renesas,dmac-r8a77470" (RZ/G1C)
> > +- "renesas,dmac-r8a774a1" (RZ/G2M)
> >  - "renesas,dmac-r8a7790" (R-Car H2)
> >  - "renesas,dmac-r8a7791" (R-Car M2-W)
> >  - "renesas,dmac-r8a7792" (R-Car V2H)
> > --
> > 2.7.4
> 
> 
> 
> 
> Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
> 
