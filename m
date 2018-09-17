Return-Path: <SRS0=jvXL=L7=verge.net.au=horms@kernel.org>
Date: Mon, 17 Sep 2018 10:25:36 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] dt-bindings: reset: rcar-rst: Document r8a774c0 rst
Message-ID: <20180917082536.q5vkhgzr3pno2zle@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b9f3f76.1c69fb81.21f5b.5535@mx.google.com>
 <1536919741.4112.4.camel@pengutronix.de>
 <20180912090428.uhchjukjopblz5ui@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 12, 2018 at 11:04:28AM +0200, Simon Horman wrote:
> On Mon, Sep 10, 2018 at 04:09:40PM +0100, Fabrizio Castro wrote:
> > Document bindings for the RZ/G2E (a.k.a. R8A774C0) reset
> > module.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks again, applied for v4.20.

On Fri, Sep 14, 2018 at 12:09:01PM +0200, Philipp Zabel wrote:
> On Mon, 2018-09-10 at 16:09 +0100, Fabrizio Castro wrote:
> > Document bindings for the RZ/G2E (a.k.a. R8A774C0) reset
> > module.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/reset/renesas,rst.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
> > index e4fe0ab..25e6db5 100644
> > --- a/Documentation/devicetree/bindings/reset/renesas,rst.txt
> > +++ b/Documentation/devicetree/bindings/reset/renesas,rst.txt
> > @@ -19,6 +19,7 @@ Required properties:
> >  		  - "renesas,r8a7745-rst" (RZ/G1E)
> >  		  - "renesas,r8a77470-rst" (RZ/G1C)
> >  		  - "renesas,r8a774a1-rst" (RZ/G2M)
> > +		  - "renesas,r8a774c0-rst" (RZ/G2E)
> >  		  - "renesas,r8a7778-reset-wdt" (R-Car M1A)
> >  		  - "renesas,r8a7779-reset-wdt" (R-Car H1)
> >  		  - "renesas,r8a7790-rst" (R-Car H2)
> 
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> regards
> Philipp
> 

On Mon, Sep 17, 2018 at 01:45:25AM -0400, Rob Herring wrote:
> On Mon, 10 Sep 2018 16:09:40 +0100, Fabrizio Castro wrote:
> > Document bindings for the RZ/G2E (a.k.a. R8A774C0) reset
> > module.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/reset/renesas,rst.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
