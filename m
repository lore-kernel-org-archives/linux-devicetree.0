From: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>
Subject: Re: Pin control mappings for DT
Date: Tue, 29 Nov 2011 09:42:55 -0800
Message-ID: <20111129174255.GQ31337@atomide.com>
References: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYYvG2OXzwpiptbK4VWdeWVGTmE9c4PPC+EecFMkRZEiA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

* Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> [111128 23:07]:
> Greetings,
> 
> can we have some initial idea about DT support for pin control
> devices and how these will look? Since pin control seems to be
> a cruicial piece for people to get board data out of their kernels
> we'd better have a common understanding.

Below is what I currently have for the pinmux-simple.c driver
I'm working on. That's easy to change though so please comment.
 
> The way I've understood it, we will need three pieces of
> DT data:
> 
> 1) Per-driver info, includes the pin controller base, its pins, their
>  (optional) names and their specific presets like bias etc.

	pinmux@4a100000 {
		compatible = "pinmux-simple";
		reg = <0x4a100000 0x194>;
		#address-cells = <1>;
		#size-cells = <0>;
		pinmux,access-width-16bit = <1>;

		pinmux-gpmc_ad0@4a100040 {
			reg = <0x4a100040>;
			pinmux,functions =
				"gpmc_ad0", "sdmmc2_dat0", "", "",
				"", "", "", "";
		};

		pinmux-uart3_rx_irrx@4a100144 {
			reg = <0x4a100144>;
			pinmux,functions =
				"uart3_rx_irrx", "dmtimer8_pwm_evt", "", "gpio_143",
				"", "", "", "safe_mode";
		};

		...
	};

 
> 2) Board pin group definitions, saying "these three pins
>   belong to the group "i2c0-pins"

These should be there for each driver, just like the interrupts:

	uart3: serial@48020000 {
		compatible = "ti,8250";
		reg = <0x48020000 0x100>;
		reg-shift = <2>;
		interrupts = < 106 >;
		pins = "uart3_rx_irrx.uart3_rx_irrx",
			"uart3_tx_irtx.uart3_tx_irtx";
	};

Note that for now the format for now is pin_register.function.
I guess we could have it set up with something like:

		pins = <&uart3_rx_irrx 7 0>;

But it easily becomes impossible for people to get it right.
Anybody got better suggestions here?

Also I don't have anything for setting the driver specific
default values yet.
 
> 3) Board function mapping definitions saying "the pin group
>   'i2c0-pins' is to be used with device i2c0" which can map
>   several groups to a single device.

I don't think is needed? The #2 above allows mapping them
automatically. However, the mapping needs to be fixed for the
pinctrl fwk to make this work with both static data DT driver
instances.
 
> (1) should be read out by each pin controller driver and
> (2)+(3) by the pin controller, specifically  pinmux core.

Yeah it makes sense to have the common code map the DT entries
to devices.
 
> I'm tentatively also thinking about:
> 
> (4) Pin group state map - as in "group 'i2c0-pins' have
>   the states 'active', 'sleeping' and 'idle' "
> 
> Since this last piece needs to be connected to say
> bias settings etc it's currently unclear to me how that
> would work. But (1) thro (3) seem pretty solid.

Setting the pin states seems to be unhandled in the pinctrl
fwk currently, right?

In many cases it's only the pin using device driver that knows
how the pins should be set for PM and pulls, so these could
be set by the default values in DT for each driver.

Then some pins need to be dynamically re-muxed for wake-up
events etc, so I guess adding generic 'wakeup' and 'disabled'
modes might do the trick as long as those won't touch the
pull values configured by the driver. For example, 'wakeup' can
be used data lines, such as serial rx line. In that case the
serial rx line would be temporarily muxed into a GPIO input
function with wake-up flags set for the pin.

Regards, 

Tony
