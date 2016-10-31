From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v4 00/23] soc: renesas: Add R-Car RST driver for
 obtaining mode pin state
Date: Mon, 31 Oct 2016 16:25:37 -0700
Message-ID: <20161031232537.GT16026@codeaurora.org>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
 <CAMuHMdVbpuv94x-ocTSDoEj+SbnESDbkuMXsXExQvoyZepp+Zg@mail.gmail.com>
 <20161031081923.GF18195@verge.net.au>
 <CAMuHMdXA-hemOT=ZysEfettei9=HsDddGhqddkw38hwRrdeagw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXA-hemOT=ZysEfettei9=HsDddGhqddkw38hwRrdeagw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 10/31, Geert Uytterhoeven wrote:
> Hi Mike, Stephen, Arnd, Olof, Kevin,
> 
> Is the merge strategy [see ##### below] OK for you?
> Thanks a lot!
> 
> On Mon, Oct 31, 2016 at 9:19 AM, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org> wrote:
> > On Wed, Oct 26, 2016 at 02:00:24PM +0200, Geert Uytterhoeven wrote:
> >> On Fri, Oct 21, 2016 at 3:17 PM, Geert Uytterhoeven
> >> <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org> wrote:
> >> > Currently the R-Car Clock Pulse Generator (CPG) drivers obtains the
> >> > state of the mode pins either by a call from the platform code, or
> >> > directly by using a hardcoded register access. This is a bit messy, and
> >> > creates a dependency between driver and platform code.
> >> >
> >> > This patch series converts the various Renesas R-Car clock drivers
> >> > and support code from reading the mode pin states using a hardcoded
> >> > register access to using a new minimalistic R-Car RST driver.
> >> >
> >> > All R-Car clock drivers will rely on the presence in DT of a device node
> >> > for the RST module.  Backwards compatibility with old DTBs is retained
> >> > only for R-Car Gen2, which has fallback code using its own private copy
> >> > of rcar_gen2_read_mode_pins().
> >> >
> >> > After this, there is still one remaining user of
> >> > rcar_gen2_read_mode_pins() left in platform code. A patch series to
> >> > remove that user has already been posted, though ("[PATCH/RFT 0/4] ARM:
> >> > shmobile: R-Car Gen2: Allow booting secondary CPU cores in debug mode").
> >> > Since v3, the other user has been removed in commit 9f5ce39ddb8f68b3
> >> > ("ARM: shmobile: rcar-gen2: Obtain extal frequency from DT").
> >> >
> >> > This series consists of 5 parts:
> >> >   A. Patches 1 and 2 add DT bindings and driver code for the R-Car RST
> >> >      driver,
> >> >   B. Patches 3-11 add device nodes for the RST modules to the R-Car DTS
> >> >      files,
> >> >   C. Patches 12-17 convert the clock drivers to call into the new R-Car
> >> >      RST driver,
> >> >   D. Patches 18-20 remove passing mode pin state to the clock drivers
> >> >      from the platform code,
> >> >   E. Patches 21-23 remove dead code from the clock drivers.
> >> >
> >> > As is usually the case with moving functionality from platform code to
> >> > DT, there are lots of hard dependencies:
> >> >   - The DT updates in Part B can be merged as soon as the DT bindings in
> >> >     Part A have been approved,
> >> >   - The clock driver updates in Part C depend functionally on the driver
> >> >     code in Part A, and on the DT updates in Part B,
> >> >   - The board code cleanups in Part D depend on the clock driver updates
> >> >     in Part C,
> >> >   - The block driver cleanups in part E depend on the board code
> >> >     cleanups in part D.
> >> >
> >> > Hence to maintain the required lockstep between SoC driver, clock
> >> > drivers, shmobile platform code, and shmobile DT, I propose to queue up
> >> > all patches in a single branch against v4.9-rc1, and send pull requests
> >> > to both Mike/Stephen (clock) and Simon (rest).
> >> >
> >> > ***
> >>
> >> >   - Mike/Stephen/Simon/Magnus: Are you OK with the suggested merge
> >> >     approach above?
> >>
> >> Is this OK for you?
> 
> #####
> 
> (link to the full series at
>  https://groups.google.com/forum/#!topic/linux.kernel/fLSFsjOgPT8)

Would the pull requests for clk also have dts changes at the base
of the tree? Perhaps clk side can just ack the clk patches and
then have it all routed through arm-soc? The only worry I have is
if we need to make some sort of change in clk side that conflicts
with these changes. I don't usually like taking dts changes
through clk tree, so I'd like to avoid that if possible.

Part E could happen anytime after everything else happens, so
that doesn't seem like a concern. Part C could also be made to
only call into the new reset drivers if the reset dts nodes are
present? If that's done then we could merge clk patches anytime
and remove the dead code and the node search at some later time
when everything has settled?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
