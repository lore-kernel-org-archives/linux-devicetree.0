Return-Path: <SRS0=+yaY=OT=verge.net.au=horms@kernel.org>
Date: Mon, 10 Dec 2018 14:20:26 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r8a7743: Fix sorting of rwdt node
Message-ID: <20181210132025.c5ghe5ui2cse7nkb@verge.net.au>
References: <1544442750-39442-1-git-send-email-biju.das@bp.renesas.com>
 <CAMuHMdWbeNi+NrjcB43FCSCRzBa=hfhseXUAKAZ0vsLkh5jjmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWbeNi+NrjcB43FCSCRzBa=hfhseXUAKAZ0vsLkh5jjmQ@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Dec 10, 2018 at 01:27:12PM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 10, 2018 at 1:01 PM Biju Das <biju.das@bp.renesas.com> wrote:
> > Watchdog node is incorrectly placed on r8a7743 SoC dtsi. This patch fixes
> > the sorting order.
> >
> > Fixes: b5beb5d4c81c358f50a8310108 ("ARM: dts: r8a7743: Add watchdog support to SoC dtsi")
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.22.
