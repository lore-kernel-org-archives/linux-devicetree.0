Return-Path: <SRS0=V24m=QO=verge.net.au=horms@kernel.org>
Date: Thu, 7 Feb 2019 11:43:06 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a774c0-cat874: Add pciec0
 support
Message-ID: <20190207104305.tchwfqwqxysum4la@verge.net.au>
References: <1549528310-54436-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdVeVV9d4Sf=iPQ2UCrGqrnsh2Y9QCWaupwKc7QmRhCebw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVeVV9d4Sf=iPQ2UCrGqrnsh2Y9QCWaupwKc7QmRhCebw@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Feb 07, 2019 at 11:13:03AM +0100, Geert Uytterhoeven wrote:
> On Thu, Feb 7, 2019 at 9:37 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > Silicon Linux CAT 874 board has 2GB DDR memory. Update the dma-ranges
> > mapping for pciec0 node. Also declare pcie bus clock, since it is
> > generated on the CAT874 main board.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.1.
