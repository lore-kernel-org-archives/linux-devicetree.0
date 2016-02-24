From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 02/06] devicetree: bindings: R-Car Gen2 CMT0 and CMT1
 bindings
Date: Wed, 24 Feb 2016 14:10:38 +0900
Message-ID: <20160224051038.GB5435@verge.net.au>
References: <20160216071722.25461.61862.sendpatchset@little-apple>
 <20160216071741.25461.54191.sendpatchset@little-apple>
 <CAMuHMdVEPeEd3cTWWd-a_6k7MgtcGiiHdyMLZ1yXoWQpsH_URg@mail.gmail.com>
 <CANqRtoQg--gnv+ZkopO3PR3Pt7i5quiKvaPDyeJVOnahJGgdmg@mail.gmail.com>
 <20160217062805.GH11534@verge.net.au>
 <CANqRtoRORF0MBs9GZPeppT0p28=s98Kw_foP7W8eyUCeOyuBJQ@mail.gmail.com>
 <20160217120829.GA346@verge.net.au>
 <CANqRtoTC=UshKih94JrsNMkxwj+1dqzkRaQHKP0ajLA3qRHG9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANqRtoTC=UshKih94JrsNMkxwj+1dqzkRaQHKP0ajLA3qRHG9A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-renesas-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 24, 2016 at 01:19:25PM +0900, Magnus Damm wrote:
> Hi Simon,
> 
> On Wed, Feb 17, 2016 at 9:08 PM, Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Feb 17, 2016 at 03:45:19PM +0900, Magnus Damm wrote:
> >> $ grep "renesas," Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> >> - compatible: "renesas,dmac-<soctype>", "renesas,rcar-dmac" as fallback.
> >>         - "renesas,dmac-r8a7790" (R-Car H2)
> >>         - "renesas,dmac-r8a7791" (R-Car M2-W)
> >>         - "renesas,dmac-r8a7792" (R-Car V2H)
> >>         - "renesas,dmac-r8a7793" (R-Car M2-N)
> >>         - "renesas,dmac-r8a7794" (R-Car E2)
> >>         - "renesas,dmac-r8a7795" (R-Car H3)
> >>         compatible = "renesas,dmac-r8a7790", "renesas,rcar-dmac";
> >>         compatible = "renesas,dmac-r8a7790", "renesas,rcar-dmac";
> >> $
> >
> > It looks like I have been making the mess worse :(
> >
> > Possibly I prepared the patch in question, though recently,
> > before I was properly aware of the preferred order.
> 
> No worries! The code above is at least consistent and matches the
> common current case.
> 
> >> No need to rework existing stuff IMO. However once we rework DT
> >> bindings (CMT) or add new ones (SYS-DMAC) then we have a good
> >> opportunity to clean things up.
> >
> > Understood. From my point of view that seems like an opportunity worth taking.
> 
> So shall we leave the SYS-DMAC as-is or change things around? I
> personally don't see the point in redoing things just to change order,
> so keep as-is sounds good to me.
> 
> For the "fallback" CMT DT compat strings I think we should follow the
> proposal from Geert and go with "renesas,rcar-gen2-cmt0". Regarding
> the per-soc CMT DT compat strings my feeling is that we should follow
> the same order as SYS-DMAC to keep things consistent.

I would lean towards changing the order of the per-soc CMT DT compat
strings but I do not feel strongly about it.

As for the rest of your proposal above: I agree without reservation.
