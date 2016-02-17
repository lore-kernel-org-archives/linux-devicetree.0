From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH v3 02/06] devicetree: bindings: R-Car Gen2 CMT0 and CMT1
 bindings
Date: Wed, 17 Feb 2016 21:08:29 +0900
Message-ID: <20160217120829.GA346@verge.net.au>
References: <20160216071722.25461.61862.sendpatchset@little-apple>
 <20160216071741.25461.54191.sendpatchset@little-apple>
 <CAMuHMdVEPeEd3cTWWd-a_6k7MgtcGiiHdyMLZ1yXoWQpsH_URg@mail.gmail.com>
 <CANqRtoQg--gnv+ZkopO3PR3Pt7i5quiKvaPDyeJVOnahJGgdmg@mail.gmail.com>
 <20160217062805.GH11534@verge.net.au>
 <CANqRtoRORF0MBs9GZPeppT0p28=s98Kw_foP7W8eyUCeOyuBJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANqRtoRORF0MBs9GZPeppT0p28=s98Kw_foP7W8eyUCeOyuBJQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-renesas-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 03:45:19PM +0900, Magnus Damm wrote:
> Hi Simon,
> 
> On Wed, Feb 17, 2016 at 3:28 PM, Simon Horman <horms@verge.net.au> wrote:
> > On Wed, Feb 17, 2016 at 11:33:27AM +0900, Magnus Damm wrote:
> >> Hi Geert,
> >>
> >> On Tue, Feb 16, 2016 at 10:11 PM, Geert Uytterhoeven
> >> <geert@linux-m68k.org> wrote:
> >> > On Tue, Feb 16, 2016 at 8:17 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> >> >> From: Magnus Damm <damm+renesas@opensource.se>
> >> >>
> >> >> Add documentation for new separate CMT0 and CMT1 DT compatible strings
> >> >> for R-Car Gen2. These compat strings allow us to enable CMT1-specific
> >> >> features in the driver. The old compat strings will be deprecated in
> >> >> the not so distant future.
> >> >>
> >> >> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> >> >> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >> >> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> >> Acked-by: Rob Herring <robh@kernel.org>
> >> >> ---
> >> >>
> >> >>  Changes since V2:
> >> >>  - Added Acked-by from Rob
> >> >>  - Removed Tested-by tag from DT binding patch - duh!
> >> >>
> >> >>  Changes since V1:
> >> >>  - Added Acked-by and Tested-by from Geert
> >> >>  - Added Acked-by from Laurent
> >> >>
> >> >>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    3 +++
> >> >>  1 file changed, 3 insertions(+)
> >> >>
> >> >> --- 0002/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> >> >> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt        2015-09-17 17:26:57.440513000 +0900
> >> >> @@ -36,6 +36,9 @@ Required Properties:
> >> >>                 (CMT1 on sh73a0 and r8a7740)
> >> >>                 This is a fallback for the above renesas,cmt-48-* entries.
> >> >>
> >> >> +    - "renesas,cmt0-rcar-gen2" for 32-bit CMT0 devices included in R-Car Gen2.
> >> >> +    - "renesas,cmt1-rcar-gen2" for 48-bit CMT1 devices included in R-Car Gen2.
> >> >
> >> > (advancing a few months always means more comments ;-)
> >>
> >> Indeed!
> >>
> >> > I'm wondering whether we should use e.g. "renesas,rcar-gen2-cmt0" instead?
> >>
> >> I have no strong feelings one way or the other, but I agree that
> >> aiming to make things more consistent must be good.
> >
> > FWIW, I agree with Geert's suggestion.
> > But I also think it is not particularly important.
> >
> >> Your proposal makes the fallback match with what we do for a bunch
> >> other devices on R-Car Gen2 like:
> >> "rcar-gen2-cpg-clocks"
> >> "rcar-gen2-scif"
> >> But we also seem to have:
> >> "pci-rcar-gen2"
> >
> > Bother, it looks like I got pci backwards :(
> >
> >> On R-Car Gen3 we seem to have the following per-SoC compat strings:
> >> "dmac-r8a7795"
> >> "etheravb-r8a7795"
> >> "gpio-r8a7795"
> >> "scif-r8a7795"
> >
> > I believe the above are to follow the existing pattern for
> > per-SoC compat strings in the same driver, which seems sane.
> >
> >> But we also have:
> >> "r8a7795-cpg-mssr"
> >>
> >> My only feeling is that it looks a tad odd if we follow
> >> "<vendor>,<family-generation>-<device>" for fallback strings but
> >> "<vendor>,<device>-<part-number>" for the per-soc binding. Why not
> >> using the same order? Maybe this is specified in some document
> >> somewhere?
> >
> > I believe that the problem is a historical one. Perhaps when
> > we started adding bindings for our hardware there were no clear
> > guidelines. But regardless we ended up with a mix as you describe.
> 
> Right, that seems to be the way things have happened.
> 
> > In the mean time guidelines have emerged and we (or at least I) have
> > agreed with the device tree people (probably Rob) to use the
> > <vendor>,<chip>-<device> format for new bindings. My reading is that
> > applies even if it results in fallback and non-fallback bindings for the
> > same driver have different orders. Some precedence for this can now be found
> > in renesas,rcar-dmac.txt.
> 
> Some sort of agreed format sounds good.
> 
> Your proposal of <vendor>,<chip>-<device> sounds good to me.
> 
> I'm however slightly more confused by seeing that your example
> renesas,rcar-dmac.txt included in renesas-drivers-2016-02-16-v4.5-rc4
> does not match the proposed format:
> 
> $ grep "renesas," Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> - compatible: "renesas,dmac-<soctype>", "renesas,rcar-dmac" as fallback.
>         - "renesas,dmac-r8a7790" (R-Car H2)
>         - "renesas,dmac-r8a7791" (R-Car M2-W)
>         - "renesas,dmac-r8a7792" (R-Car V2H)
>         - "renesas,dmac-r8a7793" (R-Car M2-N)
>         - "renesas,dmac-r8a7794" (R-Car E2)
>         - "renesas,dmac-r8a7795" (R-Car H3)
>         compatible = "renesas,dmac-r8a7790", "renesas,rcar-dmac";
>         compatible = "renesas,dmac-r8a7790", "renesas,rcar-dmac";
> $

It looks like I have been making the mess worse :(

Possibly I prepared the patch in question, though recently,
before I was properly aware of the preferred order.

> > I don't, however, think it applies where we add more soc-specific to a
> > driver that already has such bindings. Or new fallback bindings to a driver
> > that already has such bindings.
> 
> Right, but for rcar-dmac.c there is no matching on per-SoC strings in
> the driver so I guess we can pick anything we want?
> 
> $ grep "renesas," drivers/dma/sh/rcar-dmac.c
>     { .compatible = "renesas,rcar-dmac", },
> $

Pretty much.

> >> I guess your take with "r8a7795-cpg-mssr" above is to follow the same
> >> order as for the fallback case? This seems sane to me, and if so then
> >> perhaps the per-soc compat strings for the CMT should also be updated?
> >> Same for other devices too then, like the recently added
> >> "dmac-r8a7795"?
> >
> > From my point of view it would be nice to clean things up and
> > re-order all the bindings. But I think the drivers would
> > need to maintain compatibility with the old strings. And I wonder
> > if it is really worth the effort.
> 
> No need to rework existing stuff IMO. However once we rework DT
> bindings (CMT) or add new ones (SYS-DMAC) then we have a good
> opportunity to clean things up.

Understood. From my point of view that seems like an opportunity worth taking.
