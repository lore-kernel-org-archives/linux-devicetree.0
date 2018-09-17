Return-Path: <SRS0=jvXL=L7=verge.net.au=horms@kernel.org>
Date: Mon, 17 Sep 2018 10:31:38 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 02/10] dt-bindings: power: rcar-sysc: Add r8a7744 power
 domain index macros
Message-ID: <20180917083138.daeh26rrsclnav62@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180912094259.54pxh3vwkoripua7@verge.net.au>
 <5b9f3f77.1c69fb81.ffb47.1086@mx.google.com>
 <CAMuHMdUEOZH3m59CcajgRX7G-t0gjYZ0DDUkxdrVOfnKKQvxZg@mail.gmail.com>
 <5b9f3f7a.1c69fb81.5077.ea0f@mx.google.com>
 <CAMuHMdUMsVbKbww6SUGVy6kDmQkdTDkucWvxHz31LbWD2h5j+Q@mail.gmail.com>
 <20180912100115.tkiqh25wz4pgvwcq@verge.net.au>
To: Biju Das <biju.das@bp.renesas.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Vladimir Barinov <vladimir.barinov@cogentembedded.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Takeshi Kihara <takeshi.kihara.df@renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 12, 2018 at 12:01:16PM +0200, Simon Horman wrote:
> On Tue, Sep 11, 2018 at 11:12:43AM +0100, Biju Das wrote:
> > Add power domain indices for RZ/G1N (R8A7744) SoC.
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

On Fri, Sep 14, 2018 at 02:26:53PM +0200, Geert Uytterhoeven wrote:
> On Tue, Sep 11, 2018 at 12:19 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Add power domain indices for RZ/G1N (R8A7744) SoC.
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

On Mon, Sep 17, 2018 at 01:45:30AM -0400, Rob Herring wrote:
> On Tue, 11 Sep 2018 11:12:43 +0100, Biju Das wrote:
> > Add power domain indices for RZ/G1N (R8A7744) SoC.
> > 
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > ---
> >  include/dt-bindings/power/r8a7744-sysc.h | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 include/dt-bindings/power/r8a7744-sysc.h
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

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
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
