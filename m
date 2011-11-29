From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Pin control mappings for DT
Date: Tue, 29 Nov 2011 10:02:32 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174FDAFB24@HQMAIL01.nvidia.com>
References: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
 <20111129174255.GQ31337@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20111129174255.GQ31337-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
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
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Tony Lindgren wrote at Tuesday, November 29, 2011 10:43 AM:
> * Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [111128 23:07]:
> > Greetings,
> >
> > can we have some initial idea about DT support for pin control
> > devices and how these will look? Since pin control seems to be
> > a cruicial piece for people to get board data out of their kernels
> > we'd better have a common understanding.
...
> > 2) Board pin group definitions, saying "these three pins
> >   belong to the group "i2c0-pins"
> 
> These should be there for each driver, just like the interrupts:
> 
> 	uart3: serial@48020000 {
> 		compatible = "ti,8250";
> 		reg = <0x48020000 0x100>;
> 		reg-shift = <2>;
> 		interrupts = < 106 >;
> 		pins = "uart3_rx_irrx.uart3_rx_irrx",
> 			"uart3_tx_irtx.uart3_tx_irtx";
> 	};

I don't agree here. I think that pinmux data is more strongly related
to the pinmux controller HW than the HW blocks that have their signals
affected by the pinmux.

I'd rather see a centralized pinmux table listing all the pinmux settings
that the board should use. Either the table should include references to
other nodes that use each setting, or the other nodes should refer to the
table in the pinmux node and this indicate which settings they should use.

Ignoring this objection, if the pinmux details are kept in each device's
own node, the binding needs to be a lot more complex than just listing the
set of pins that are used; the following need to be covered:

* Alternative configurations e.g. for muxing a single I2C controller on
to multiple sets of I2C pins to represent a bus mux.

* Alternative configurations for active/sleep(suspend) etc.

* Pin configuration in addition to mux function selection.

It seems like it'd be easier to represent that all in a/some table(s) in
the pinmux node. I think the current pinctrl mapping table would be a good
model to start out with. But, we'd have to expand that to cover pin config
as well as mux, or have separate tables in DT for each (which would be
harder to keep in sync)

-- 
nvpublic
