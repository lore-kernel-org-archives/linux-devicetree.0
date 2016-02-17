From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v3 02/06] devicetree: bindings: R-Car Gen2 CMT0 and CMT1
 bindings
Date: Wed, 17 Feb 2016 15:28:05 +0900
Message-ID: <20160217062805.GH11534@verge.net.au>
References: <20160216071722.25461.61862.sendpatchset@little-apple>
 <20160216071741.25461.54191.sendpatchset@little-apple>
 <CAMuHMdVEPeEd3cTWWd-a_6k7MgtcGiiHdyMLZ1yXoWQpsH_URg@mail.gmail.com>
 <CANqRtoQg--gnv+ZkopO3PR3Pt7i5quiKvaPDyeJVOnahJGgdmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CANqRtoQg--gnv+ZkopO3PR3Pt7i5quiKvaPDyeJVOnahJGgdmg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Feb 17, 2016 at 11:33:27AM +0900, Magnus Damm wrote:
> Hi Geert,
> 
> On Tue, Feb 16, 2016 at 10:11 PM, Geert Uytterhoeven
> <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org> wrote:
> > On Tue, Feb 16, 2016 at 8:17 AM, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >> From: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
> >>
> >> Add documentation for new separate CMT0 and CMT1 DT compatible strings
> >> for R-Car Gen2. These compat strings allow us to enable CMT1-specific
> >> features in the driver. The old compat strings will be deprecated in
> >> the not so distant future.
> >>
> >> Signed-off-by: Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>
> >> Acked-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
> >> Acked-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> >> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> >> ---
> >>
> >>  Changes since V2:
> >>  - Added Acked-by from Rob
> >>  - Removed Tested-by tag from DT binding patch - duh!
> >>
> >>  Changes since V1:
> >>  - Added Acked-by and Tested-by from Geert
> >>  - Added Acked-by from Laurent
> >>
> >>  Documentation/devicetree/bindings/timer/renesas,cmt.txt |    3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> --- 0002/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> >> +++ work/Documentation/devicetree/bindings/timer/renesas,cmt.txt        2015-09-17 17:26:57.440513000 +0900
> >> @@ -36,6 +36,9 @@ Required Properties:
> >>                 (CMT1 on sh73a0 and r8a7740)
> >>                 This is a fallback for the above renesas,cmt-48-* entries.
> >>
> >> +    - "renesas,cmt0-rcar-gen2" for 32-bit CMT0 devices included in R-Car Gen2.
> >> +    - "renesas,cmt1-rcar-gen2" for 48-bit CMT1 devices included in R-Car Gen2.
> >
> > (advancing a few months always means more comments ;-)
> 
> Indeed!
> 
> > I'm wondering whether we should use e.g. "renesas,rcar-gen2-cmt0" instead?
> 
> I have no strong feelings one way or the other, but I agree that
> aiming to make things more consistent must be good.

FWIW, I agree with Geert's suggestion.
But I also think it is not particularly important.

> Your proposal makes the fallback match with what we do for a bunch
> other devices on R-Car Gen2 like:
> "rcar-gen2-cpg-clocks"
> "rcar-gen2-scif"
> But we also seem to have:
> "pci-rcar-gen2"

Bother, it looks like I got pci backwards :(

> On R-Car Gen3 we seem to have the following per-SoC compat strings:
> "dmac-r8a7795"
> "etheravb-r8a7795"
> "gpio-r8a7795"
> "scif-r8a7795"

I believe the above are to follow the existing pattern for
per-SoC compat strings in the same driver, which seems sane.

> But we also have:
> "r8a7795-cpg-mssr"
> 
> My only feeling is that it looks a tad odd if we follow
> "<vendor>,<family-generation>-<device>" for fallback strings but
> "<vendor>,<device>-<part-number>" for the per-soc binding. Why not
> using the same order? Maybe this is specified in some document
> somewhere?

I believe that the problem is a historical one. Perhaps when
we started adding bindings for our hardware there were no clear
guidelines. But regardless we ended up with a mix as you describe.

In the mean time guidelines have emerged and we (or at least I) have
agreed with the device tree people (probably Rob) to use the
<vendor>,<chip>-<device> format for new bindings. My reading is that
applies even if it results in fallback and non-fallback bindings for the
same driver have different orders. Some precedence for this can now be found
in renesas,rcar-dmac.txt.

I don't, however, think it applies where we add more soc-specific to a
driver that already has such bindings. Or new fallback bindings to a driver
that already has such bindings.

> I guess your take with "r8a7795-cpg-mssr" above is to follow the same
> order as for the fallback case? This seems sane to me, and if so then
> perhaps the per-soc compat strings for the CMT should also be updated?
> Same for other devices too then, like the recently added
> "dmac-r8a7795"?

>From my point of view it would be nice to clean things up and
re-order all the bindings. But I think the drivers would
need to maintain compatibility with the old strings. And I wonder
if it is really worth the effort.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
