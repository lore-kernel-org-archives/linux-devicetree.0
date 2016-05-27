From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 0/4] clk: renesas: cpg-mssr: Add support for R-Car M3-W
Date: Fri, 27 May 2016 09:49:00 +0900
Message-ID: <20160527004859.GG14269@verge.net.au>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
 <20160526023548.GA20224@verge.net.au>
 <CAMuHMdW4Q=OO1zX6_wcN85rs8ZtNqFGnQYEMkriSh1q2L4vJSA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdW4Q=OO1zX6_wcN85rs8ZtNqFGnQYEMkriSh1q2L4vJSA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Magnus Damm <damm+renesas@opensource.se>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>, linux-renesas-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 26, 2016 at 08:55:35AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, May 26, 2016 at 4:35 AM, Simon Horman <horms@verge.net.au> wrote:
> > On Wed, May 04, 2016 at 04:35:39PM +0200, Geert Uytterhoeven wrote:
> >> This patch series adds initial support for the Clock Pulse Generator and
> >> Module Standby and Software Reset modules on the Renesas R-Car M3-W
> >> SoC:
> >>   - Basic core clocks,
> >>   - SCIF2 (console) module clock,
> >>   - INTC-AP (GIC) module clock (disabled pending CLK_ENABLE_HAND_OFF).
> >>
> >> Support for more core and module clocks will be added incrementally.
> >
> > I am wondering about the status of this patchset vis a vis mainline.
> >
> > I would like to queue up "[PATCH v3 0/3] arm64: Add Renesas R8A7796 SoC
> > support" for v4.8 but I'd prefer to do so only if there is a good chance
> > that this patch-set, which is provides run-time dependency, will also be in
> > v4.8.
> 
> I plan to queue it in clk-renesas-for-v4.8 after the closing of the v4.7 merge
> window.
> 
> BTW, as there were no comments on the code, but people are obviously using it,
> and building on top of it, it would be good to receive some
> {Acked,Tested,Reviewed}-by tags.

Sorry, I meant to do that a long time ago.

Tested-by: Simon Horman <horms+renesas@verge.net.au>
