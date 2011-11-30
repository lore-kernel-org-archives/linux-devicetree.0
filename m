From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Pin control mappings for DT
Date: Wed, 30 Nov 2011 11:34:10 -0800
Message-ID: <20111130193410.GW13928@atomide.com>
References: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
 <20111129174255.GQ31337@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB24@HQMAIL01.nvidia.com>
 <20111129195937.GO13928@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFE9E@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174FDAFE9E-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

* Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> [111130 09:41]:
> Tony Lindgren wrote at Tuesday, November 29, 2011 1:00 PM:
> > * Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> [111129 09:27]:
> > 
> > I don't think so. The pinmux controller needs to know the available functions.
> > But the functions selected for each driver are board/machine specific.
> 
> That's certainly true.
> 
> However, in my opinion just because the actual usage of the pinmux is
> board-/machine-specific, that doesn't determine whether the description
> of that usage has to be stored in the DT node of the devices that are
> affected by the pinmux, or in some centralized table.

Yes well both should work. I guess as long as the serial driver can
do pinmux_get(dev, NULL) the driver stays arch independent.
 
> There are two components to the data:
> 
> 1) The definition of what the pinmux HW can do.
> 
> There shouldn't be any combinations here.

But there are..
 
> This data should simply list for each pin what the valid mux options are.
> (or for each pin group if mux registers control n pins at a time as on
> Tegra)

..and we already have four completely different function tables and five
subsets/incremental changes for the same IP block for omap2/3/4.
 
> This is the equivalent of the data that the pinctrl driver provides to
> the pinctrl core in Linux.
> 
> If a logical function (8-bit MMC) requires 10 pins to be individually
> configured, then that isn't represented at all in this dataset. This is
> why I say "no combinations".

Right, but that's still nine data sets we already have :)
 
> Yes, this can be large in itself, but it's linear in the number of pins,
> groups, and functions, not exponential in the number of possible
> combinations of those pins/groups/functions.

Right, but we already have about 6000 LOC for that data right now that
we need to build in for that:

$ wc -l arch/arm/mach-omap2/mux*4*.[ch]
   690 arch/arm/mach-omap2/mux2420.c
   282 arch/arm/mach-omap2/mux2420.h
   793 arch/arm/mach-omap2/mux2430.c
   370 arch/arm/mach-omap2/mux2430.h
  2061 arch/arm/mach-omap2/mux34xx.c
   398 arch/arm/mach-omap2/mux34xx.h
  1356 arch/arm/mach-omap2/mux44xx.c
   298 arch/arm/mach-omap2/mux44xx.h
  6248 total
 
> If n packages use the same pinmux HW, but end up routing different subsets
> of die pads to actual package pins/balls, I think this dataset should
> represent the die, not the package options. (See my other email) This
> reduces the number of similar but different datasets (perhaps that's what
> you mean when you talked about combinations?)

Yes that's 4 the for suspersets we already have.
 
> This data set is what I'd expect some pinctrl drivers to encode internally
> using static tables, and perhaps some will parse this out of DT, most
> likely using a custom DT binding per pinctrl HW design; perhaps with
> consistent/similar base design across SoCs, but unlikely to be parse by
> any core pinctrl code.

I agree both should work, have it in the driver for simple cases,
or parse all or some of it from DT.
 
> I mainly say that the DT binding is custom here because the information
> needed by the pinctrl driver is pretty custom per SoC. Basic stuff like
> a list of pins, functions may be common, but there will likely be many
> additional fields for each pin/group/function/... needed by the
> individual pinctrl driver.

Yeah it can be totally different. But it seems in many cases it can
be abstracted to one 8 or 16 bit register per pin that toggle the various
functions and configure the pin direction, pull and wake-up capabilities.
So I'm trying to do a generic DT based to cover those case.
 
> 2) The board-specific configuration for the pinmux.
> 
> This only represents the specific usage for a board; it'll say e.g. that
> for SD/MMC controller 2, you need pins A=SD2_CMD, F=SD2_CLK, G..N=SD2_DAT.
> 
> This should limit the size of the data; there's no need to represent e.g.
> all the possible sets of pins that a particular SD/MMC controller could be
> mux'd to here, since presumably only a single option is actually valid on
> the board.
> 
> This is the equivalent of the mapping table handled by the pinctrl core
> on Linux.

Yes and this too should be possible to pass from the board/machine code,
or from device tree.
 
> I suppose with a sufficiently flexible mapping, we could distribute the
> data that becomes the pinctrl mapping table across each device's own
> node.
> 
> But when the pinctrl core starts up, it probably won't want to enumerate
> the whole device tree looking for nodes that happen to have properties
> that look like this distributed pinmux binding. I guess we'd need to
> lazily parse each device's DT node when it first calls into pinmux_get().

Well that just requires one pass over the tree to get the pins and the
pin using device entry, so it's not that bad actually.
 
> I wonder what node we'd put the "system hog" entries into. I guess the
> pinctrl core can parse the pinctrl device's own node for the same
> properties whenever a controller is registered.

Yes no idea what would be the best place to put these.. The unused
pins should be disabled for PM to avoid floating pins. For the clock
framework we do a late_initcall that disables the unused clocks, maybe
something similar could be done eventually for unused pins when a
SoC specific PM driver gets initialized.

Regards,

Tony
