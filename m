Return-Path: <SRS0=XPdD=V6=gmail.com=geert.uytterhoeven@kernel.org>
MIME-Version: 1.0
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-11-git-send-email-fabrizio.castro@bp.renesas.com> <20190802082754.GK5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802082754.GK5008@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 Aug 2019 11:03:54 +0200
Message-ID: <CAMuHMdUFHddHJW=FsF8Ha0PZUiAyKrWGy6yg-0PtevB7HiHoHg@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/12] arm64: dts: renesas: r8a774c0: Point LVDS0 to
 its companion LVDS1
Content-Type: text/plain; charset="UTF-8"
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Hi Laurent,

On Fri, Aug 2, 2019 at 10:27 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Aug 02, 2019 at 08:34:07AM +0100, Fabrizio Castro wrote:
> > Add the new renesas,companion property to the LVDS0 node to point to the
> > companion LVDS encoder LVDS1.
> > Based on similar work from Laurent Pinchart for the r8a7799[05].
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> and taken in my tree.

Shouldn't this go through renesas-devel and arm-soc?

> > ---
> >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 ++

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
