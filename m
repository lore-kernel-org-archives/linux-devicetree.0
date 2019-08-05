Return-Path: <SRS0=SJQI=WB=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-12-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802082952.GL5008@pendragon.ideasonboard.com> <TY1PR01MB17702E7517D3EE5E48337DA8C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB17702E7517D3EE5E48337DA8C0DA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Aug 2019 17:30:38 +0200
Message-ID: <CAMuHMdX9JghQgTksYQfT=Mt5LkyR9aX3BXtZD449y3ZTQAczsg@mail.gmail.com>
Subject: Re: [PATCH/RFC 11/12] arm64: dts: renesas: cat874: Add definition for
 12V regulator
Content-Type: text/plain; charset="UTF-8"
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "ebiharaml@si-linux.co.jp" <ebiharaml@si-linux.co.jp>
List-ID: <devicetree@vger.kernel.org>

Hi Fabrizio,

On Mon, Aug 5, 2019 at 11:17 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 02 August 2019 09:30
> > Subject: Re: [PATCH/RFC 11/12] arm64: dts: renesas: cat874: Add definition for 12V regulator
> >
> > Hi Fabrizio,
> >
> > Thank you for the patch.
> >
> > On Fri, Aug 02, 2019 at 08:34:08AM +0100, Fabrizio Castro wrote:
> > > Power rail "D12.0V" comes straight from the power barrel connector,
> > > and it's used in both main board and sub board.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > I don't plan to take this in my tree without patch 12/12, so if you
> > think the rest of the series won't be ready in time for v5.4, feel free
> > to get this patch merged through Simon or Geert already.
>
> Geert, would you be happy to take this patch?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
