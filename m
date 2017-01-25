From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] ARM: dts: r7s72100: add power-domains to mmcif
Date: Wed, 25 Jan 2017 11:31:35 +0100
Message-ID: <20170125103134.GC14751@verge.net.au>
References: <20170123141349.29844-1-chris.brandt@renesas.com>
 <CAMuHMdULpxoNaTUX2Dc7R=d+FUb_V45H9=XXfsW3RKBTowE4Uw@mail.gmail.com>
 <20170124123304.GC20529@verge.net.au>
 <SG2PR06MB1165BD8C33491336E74AFE5A8A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <SG2PR06MB1165BD8C33491336E74AFE5A8A750@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2017 at 04:32:30PM +0000, Chris Brandt wrote:
> On Tuesday, January 24, 2017, Simon Horman wrote:
> > On Mon, Jan 23, 2017 at 04:12:16PM +0100, Geert Uytterhoeven wrote:
> > > On Mon, Jan 23, 2017 at 3:13 PM, Chris Brandt <chris.brandt@renesas.com>
> > wrote:
> > > > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > >
> > > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Should this be queued up as a fix for v4.10 with the following tag?
> > 
> > Fixes: 887862227ba3 ("ARM: dts: r7s72100: add mmcif to device tree")
> 
> I assume it can. I'm not sure how it effect the driver one way good or bad
> (that's a question for Geert I think).
> SDHI for r7s72100 needs it too, I just didn't send that yet because my other
> fix will cause a merge conflict because it is modifying the same line. But, 
> that patch is taking longer than I expected.
> 
> My guess is that power-domains is for runtime power management...which seems
> to be a sore subject for r7s72100 at this point.

Geert tells me that this should not have a runtime effect.
Accordingly, I will queued it up for v4.11.
