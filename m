From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Pin control mappings for DT
Date: Tue, 29 Nov 2011 11:59:37 -0800
Message-ID: <20111129195937.GO13928@atomide.com>
References: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
 <20111129174255.GQ31337@atomide.com>
 <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB24@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB24-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
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

* Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> [111129 09:27]:
> Tony Lindgren wrote at Tuesday, November 29, 2011 10:43 AM:
> > * Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [111128 23:07]:
> > > Greetings,
> > >
> > > can we have some initial idea about DT support for pin control
> > > devices and how these will look? Since pin control seems to be
> > > a cruicial piece for people to get board data out of their kernels
> > > we'd better have a common understanding.
> ...
> > > 2) Board pin group definitions, saying "these three pins
> > >   belong to the group "i2c0-pins"
> > 
> > These should be there for each driver, just like the interrupts:
> > 
> > 	uart3: serial@48020000 {
> > 		compatible = "ti,8250";
> > 		reg = <0x48020000 0x100>;
> > 		reg-shift = <2>;
> > 		interrupts = < 106 >;
> > 		pins = "uart3_rx_irrx.uart3_rx_irrx",
> > 			"uart3_tx_irtx.uart3_tx_irtx";
> > 	};
> 
> I don't agree here. I think that pinmux data is more strongly related
> to the pinmux controller HW than the HW blocks that have their signals
> affected by the pinmux.

I don't think so. The pinmux controller needs to know the available functions.
But the functions selected for each driver are board/machine specific.

We already have many alternative pins on the same package at least for
omaps. It's up to the board designed to select which pins to use.
And the pinmux controller has no way of knowing the routing. And mapping
all the combinations in the pinmux driver is just not scalable.

> I'd rather see a centralized pinmux table listing all the pinmux settings
> that the board should use. Either the table should include references to
> other nodes that use each setting, or the other nodes should refer to the
> table in the pinmux node and this indicate which settings they should use.

Are you talking about static tables in the kernel? We already have something
like this, and it just does not scale. We end up with huge amounts of static
data in the kernel that needs to be patched constantly for drivers and PM..

The goal is to boot the same kernel on various SoC/board/machine variants,
we don't want to edit a board/machine specific table in the kernel for
each variant. Or maybe you have something else in mind that I don't
understand?
 
> Ignoring this objection, if the pinmux details are kept in each device's
> own node, the binding needs to be a lot more complex than just listing the
> set of pins that are used; the following need to be covered:
> 
> * Alternative configurations e.g. for muxing a single I2C controller on
> to multiple sets of I2C pins to represent a bus mux.

Hmm, then you just list the functions in the I2C controller DT entry?
The above example already passes two pins.
 
> * Alternative configurations for active/sleep(suspend) etc.

This is too completely board specific. For example, if you have an external
pull on the I2C data line, the internal pull needs to be disabled. And then
the driver may need to change some of these settings for PM etc.
 
> * Pin configuration in addition to mux function selection.

Yes this is open.. It seems that we could set the board specific default
value from DT for the pins used by the driver. Then we could potentially
have generic configuration flags that the driver can set for "idle",
"wakeup" "off" like Linus suggested?
 
> It seems like it'd be easier to represent that all in a/some table(s) in
> the pinmux node. I think the current pinctrl mapping table would be a good
> model to start out with. But, we'd have to expand that to cover pin config
> as well as mux, or have separate tables in DT for each (which would be
> harder to keep in sync)

The current pinctrl mapping is totally messed up in it's current form I'm
sorry to say in a polite way :)

It currently assumes one set of static map data being passed from the
board/machine. So you can't mix static data and dynamic data coming
from DT. And it does not allow freeing the mappings if you have a loadable
pinmux module.. Things get even more messed up when trying to support
multiple driver instances..

To sort this out the mappings need to be tied to pinctrl/pinmux driver
instances to start with. That should be done before relying on it further
and adding more features to it. Anyways, on the positive side, it seems
that eventually most mappings can be dynamically generated with DT.

But I don't see why we should not be able to support static mappings
like you suggest, and dynamic mappings I suggest the same time. It
just requires some changes to the pinctrl fwk, right?

Oh, one more thing that needs to be considered is that the mappings are not
static. Consider popular development boards like beagle. Depending how
you choose to use the available pins, you need to mux them for an
extension board, for example. You don't really want to edit the mux mappings
and recompile the kernel just to support the same board with different
add on boards. Just changing the DT entries should be enough to map
the extra pins to an extra I2C controller or LCD or whatever.

Cheers,

Tony
