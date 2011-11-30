From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Pin control mappings for DT
Date: Wed, 30 Nov 2011 10:16:24 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174FDAFE9E@HQMAIL01.nvidia.com>
References: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
 <20111129174255.GQ31337@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB24@HQMAIL01.nvidia.com>
 <20111129195937.GO13928@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111129195937.GO13928-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Tony Lindgren wrote at Tuesday, November 29, 2011 1:00 PM:
> * Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> [111129 09:27]:
> > Tony Lindgren wrote at Tuesday, November 29, 2011 10:43 AM:
> > > * Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [111128 23:07]:
> > > > Greetings,
> > > >
> > > > can we have some initial idea about DT support for pin control
> > > > devices and how these will look? Since pin control seems to be
> > > > a cruicial piece for people to get board data out of their kernels
> > > > we'd better have a common understanding.
> > ...
> > > > 2) Board pin group definitions, saying "these three pins
> > > >   belong to the group "i2c0-pins"
> > >
> > > These should be there for each driver, just like the interrupts:
> > >
> > > 	uart3: serial@48020000 {
> > > 		compatible = "ti,8250";
> > > 		reg = <0x48020000 0x100>;
> > > 		reg-shift = <2>;
> > > 		interrupts = < 106 >;
> > > 		pins = "uart3_rx_irrx.uart3_rx_irrx",
> > > 			"uart3_tx_irtx.uart3_tx_irtx";
> > > 	};
> >
> > I don't agree here. I think that pinmux data is more strongly related
> > to the pinmux controller HW than the HW blocks that have their signals
> > affected by the pinmux.
> 
> I don't think so. The pinmux controller needs to know the available functions.
> But the functions selected for each driver are board/machine specific.

That's certainly true.

However, in my opinion just because the actual usage of the pinmux is
board-/machine-specific, that doesn't determine whether the description
of that usage has to be stored in the DT node of the devices that are
affected by the pinmux, or in some centralized table.

> We already have many alternative pins on the same package at least for
> omaps. It's up to the board designed to select which pins to use.
> And the pinmux controller has no way of knowing the routing. And mapping
> all the combinations in the pinmux driver is just not scalable.
>
> > I'd rather see a centralized pinmux table listing all the pinmux settings
> > that the board should use. Either the table should include references to
> > other nodes that use each setting, or the other nodes should refer to the
> > table in the pinmux node and this indicate which settings they should use.
> 
> Are you talking about static tables in the kernel? We already have something
> like this, and it just does not scale. We end up with huge amounts of static
> data in the kernel that needs to be patched constantly for drivers and PM..
> 
> The goal is to boot the same kernel on various SoC/board/machine variants,
> we don't want to edit a board/machine specific table in the kernel for
> each variant. Or maybe you have something else in mind that I don't
> understand?

Yes, I think we're talking about slightly different things.

There are two components to the data:

1) The definition of what the pinmux HW can do.

There shouldn't be any combinations here.

This data should simply list for each pin what the valid mux options are.
(or for each pin group if mux registers control n pins at a time as on
Tegra)

This is the equivalent of the data that the pinctrl driver provides to
the pinctrl core in Linux.

If a logical function (8-bit MMC) requires 10 pins to be individually
configured, then that isn't represented at all in this dataset. This is
why I say "no combinations".

Yes, this can be large in itself, but it's linear in the number of pins,
groups, and functions, not exponential in the number of possible
combinations of those pins/groups/functions.

If n packages use the same pinmux HW, but end up routing different subsets
of die pads to actual package pins/balls, I think this dataset should
represent the die, not the package options. (See my other email) This
reduces the number of similar but different datasets (perhaps that's what
you mean when you talked about combinations?)

This data set is what I'd expect some pinctrl drivers to encode internally
using static tables, and perhaps some will parse this out of DT, most
likely using a custom DT binding per pinctrl HW design; perhaps with
consistent/similar base design across SoCs, but unlikely to be parse by
any core pinctrl code.

I mainly say that the DT binding is custom here because the information
needed by the pinctrl driver is pretty custom per SoC. Basic stuff like
a list of pins, functions may be common, but there will likely be many
additional fields for each pin/group/function/... needed by the
individual pinctrl driver.

2) The board-specific configuration for the pinmux.

This only represents the specific usage for a board; it'll say e.g. that
for SD/MMC controller 2, you need pins A=SD2_CMD, F=SD2_CLK, G..N=SD2_DAT.

This should limit the size of the data; there's no need to represent e.g.
all the possible sets of pins that a particular SD/MMC controller could be
mux'd to here, since presumably only a single option is actually valid on
the board.

This is the equivalent of the mapping table handled by the pinctrl core
on Linux.

> > Ignoring this objection, if the pinmux details are kept in each device's
> > own node, the binding needs to be a lot more complex than just listing the
> > set of pins that are used; the following need to be covered:
> >
> > * Alternative configurations e.g. for muxing a single I2C controller on
> > to multiple sets of I2C pins to represent a bus mux.
> 
> Hmm, then you just list the functions in the I2C controller DT entry?
> The above example already passes two pins.

I suppose with a sufficiently flexible mapping, we could distribute the
data that becomes the pinctrl mapping table across each device's own
node.

But when the pinctrl core starts up, it probably won't want to enumerate
the whole device tree looking for nodes that happen to have properties
that look like this distributed pinmux binding. I guess we'd need to
lazily parse each device's DT node when it first calls into pinmux_get().

I wonder what node we'd put the "system hog" entries into. I guess the
pinctrl core can parse the pinctrl device's own node for the same
properties whenever a controller is registered.

-- 
nvpublic
