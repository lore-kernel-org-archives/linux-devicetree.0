Return-Path: <SRS0=jvXL=L7=verge.net.au=horms@kernel.org>
Date: Mon, 17 Sep 2018 10:29:39 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 01/10] dt-bindings: power: rcar-sysc: Document r8a7744
 SYSC binding
Message-ID: <20180917082938.bkd4nvjokyfv6vf2@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b9f3f77.1c69fb81.ffb47.1086@mx.google.com>
 <CAMuHMdUEOZH3m59CcajgRX7G-t0gjYZ0DDUkxdrVOfnKKQvxZg@mail.gmail.com>
 <20180912094259.54pxh3vwkoripua7@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 12, 2018 at 11:43:00AM +0200, Simon Horman wrote:
> On Tue, Sep 11, 2018 at 11:12:42AM +0100, Biju Das wrote:
> > Add binding documentation for the RZ/G1N (R8A7744) SYSC block.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.


Thanks again,

applied for v4.20.

On Fri, Sep 14, 2018 at 02:25:36PM +0200, Geert Uytterhoeven wrote:
> On Tue, Sep 11, 2018 at 12:19 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Add binding documentation for the RZ/G1N (R8A7744) SYSC block.
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

On Mon, Sep 17, 2018 at 01:45:26AM -0400, Rob Herring wrote:
> On Tue, 11 Sep 2018 11:12:42 +0100, Biju Das wrote:
> > Add binding documentation for the RZ/G1N (R8A7744) SYSC block.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 
