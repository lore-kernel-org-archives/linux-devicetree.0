Return-Path: <SRS0=jvXL=L7=verge.net.au=horms@kernel.org>
Date: Mon, 17 Sep 2018 10:46:57 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 04/10] dt-bindings: reset: rcar-rst: Document r8a7744
 reset module
Message-ID: <20180917084656.zxe2zulnccqlxx2n@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b9f3f7c.1c69fb81.d0271.2b38@mx.google.com>
 <CAMuHMdWyrsfQodVSTfSLTKS15thTzUGDdUPLReVJ9GgbJ9rB1Q@mail.gmail.com>
 <20180912100518.lth3p5cpl5f4lai4@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 12, 2018 at 12:05:19PM +0200, Simon Horman wrote:
> On Tue, Sep 11, 2018 at 11:12:45AM +0100, Biju Das wrote:
> > Document bindings for the RZ/G1N (R8A7744) reset module.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks again,

applied for v4.20.

On Fri, Sep 14, 2018 at 02:32:33PM +0200, Geert Uytterhoeven wrote:
> On Tue, Sep 11, 2018 at 12:19 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Document bindings for the RZ/G1N (R8A7744) reset module.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

On Mon, Sep 17, 2018 at 01:45:31AM -0400, Rob Herring wrote:
> On Tue, 11 Sep 2018 11:12:45 +0100, Biju Das wrote:
> > Document bindings for the RZ/G1N (R8A7744) reset module.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/reset/renesas,rst.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
