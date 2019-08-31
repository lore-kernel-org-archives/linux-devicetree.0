Return-Path: <SRS0=Mv5K=W3=verge.net.au=horms@kernel.org>
Date: Sat, 31 Aug 2019 11:29:00 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Fix eMMC status
Message-ID: <20190831092837.lgtxrnqoy55dn2oo@verge.net.au>
References: <1567170935-19186-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVtkBtVpXo2eCMbZ6MEJskeLHYgC4O=p1SjwOdkHLakyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVtkBtVpXo2eCMbZ6MEJskeLHYgC4O=p1SjwOdkHLakyg@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, xu_shunji@hoperun.com
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 30, 2019 at 03:25:39PM +0200, Geert Uytterhoeven wrote:
> On Fri, Aug 30, 2019 at 3:15 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > SDHI3 got accidentally disabled while adding USB 2.0 support,
> > this patch fixes it.
> >
> > Fixes: 734d277f412a ("arm64: dts: renesas: hihope-common: Add USB 2.0 support")
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> This is a fix for v5.3.

Thanks, applied as a fix for v5.3.
