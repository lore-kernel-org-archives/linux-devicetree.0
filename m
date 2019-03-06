Return-Path: <SRS0=dceb=RJ=verge.net.au=horms@kernel.org>
Date: Wed, 6 Mar 2019 13:54:00 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
Message-ID: <20190306125359.xqtuq35ccwfbbk5q@verge.net.au>
References: <1551438256-22065-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdWNqFkSRnX9kGGFOCMTEHguQtsD=JfqLaHUpB=kgETPWA@mail.gmail.com>
 <20190304095856.uqqwhw46oueb2vtf@verge.net.au>
 <TY1PR01MB1770F48284CA48C991052263C0710@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770F48284CA48C991052263C0710@TY1PR01MB1770.jpnprd01.prod.outlook.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Mon, Mar 04, 2019 at 10:10:49AM +0000, Fabrizio Castro wrote:
> Hello Simon,
> 
> Thank you for your feedback!
> 
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 04 March 2019 09:59
> > To: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> > Magnus Damm <magnus.damm@gmail.com>; Linux-Renesas <linux-renesas-soc@vger.kernel.org>; open list:OPEN FIRMWARE AND
> > FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; Chris Paterson <Chris.Paterson2@renesas.com>; Biju Das
> > <biju.das@bp.renesas.com>
> > Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Add CANFD support
> > 
> > On Fri, Mar 01, 2019 at 02:38:53PM +0100, Geert Uytterhoeven wrote:
> > > On Fri, Mar 1, 2019 at 12:04 PM Fabrizio Castro
> > > <fabrizio.castro@bp.renesas.com> wrote:
> > > > The CANFD implementation on the RZ/G2E (a.k.a. r8a774c0) is
> > > > identical to the one found on the r8a77990.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Thanks, applied.
> 
> The patch that adds R8A774C0_CLK_CANFD (https://patchwork.kernel.org/patch/10766867/)
> Isn't in a release candidate just yet, therefore I was expecting this patch to be deferred to
> to when R8A774C0_CLK_CANFD is finally available, similarly to:
> https://www.spinics.net/lists/netdev/msg547320.html
> 
> Was I wrong?

No, I was wrong in sending out the email above.

The patch is still deferred.
