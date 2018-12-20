Return-Path: <SRS0=kGNq=O5=verge.net.au=horms@kernel.org>
Date: Thu, 20 Dec 2018 16:56:48 +0900
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774a1: Fix hsusb reg size
Message-ID: <20181220075647.mr7vmtfa3t6oxzh3@verge.net.au>
References: <1545134534-22392-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdUT8GJuCQFZ3pt9HrfMi9zo9gQS46qKbRg3b0VTO=WCAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUT8GJuCQFZ3pt9HrfMi9zo9gQS46qKbRg3b0VTO=WCAw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Tue, Dec 18, 2018 at 01:07:19PM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 18, 2018 at 1:02 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > HS-USB has registers outside the currently specified memory area,
> > therefore change the definition accordingly.
> >
> > Fixes: ed898d4fc19d ("arm64: dts: renesas: r8a774a1: Add USB-DMAC and
> > HSUSB device nodes")
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.22.
