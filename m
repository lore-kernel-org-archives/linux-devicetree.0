Return-Path: <SRS0=LpfV=US=verge.net.au=horms@kernel.org>
Date: Wed, 19 Jun 2019 16:07:06 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add HDMI encoder
 instance
Message-ID: <20190619140706.klchxtzxjldnhh5r@verge.net.au>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190619123856.GA21753@pendragon.ideasonboard.com>
 <TY1PR01MB177067A85CA3535257A38C2FC0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB177067A85CA3535257A38C2FC0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Jun 19, 2019 at 12:42:24PM +0000, Fabrizio Castro wrote:
> Hello Laurent,
> 
> Thank you for your feedback.
> 
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: 19 June 2019 13:39
> > Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add HDMI encoder instance
> > 
> > Hi Fabrizio,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Jun 18, 2019 at 04:18:38PM +0100, Fabrizio Castro wrote:
> > > Add the HDMI encoder to the R8A774A1 DT in disabled state.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > ---
> > > This patch depends on:
> > > https://patchwork.kernel.org/patch/10995149/
> > 
> > Is that the correct one ? I don't see how CAN support is related.
> 
> It's only to please git ;-)
> 
> Thank you for reviewing this.
> 
> Fab
> 
> > 
> > In any case,
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, I have queued this up for inclusion in v5.3.
