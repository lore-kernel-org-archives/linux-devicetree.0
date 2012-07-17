From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 2/8] ARM: MCS814x: add Device Tree based MCS8140 board
 support
Date: Tue, 17 Jul 2012 13:19:43 +0000
Message-ID: <201207171319.43593.arnd@arndb.de>
References: <1342363754-30808-1-git-send-email-florian@openwrt.org>
 <1342363754-30808-3-git-send-email-florian@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1342363754-30808-3-git-send-email-florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sunday 15 July 2012, Florian Fainelli wrote:

> +
> +			uart0: serial@400dc000 {
> +				compatible = "ns16550";
> +				reg = <0x400dc000 0x20>;
> +				clock-frequency = <50000000>;
> +				reg-shift = <2>;
> +				interrupts = <21>;
> +				status = "okay";
> +			};

We often mark stuff like the uart as status="disabled" in the .dtsi file
and only enable it in the board specific .dts file when it's actually
connected. For components that are always present and usable, that's
of course not necessary.

> +
> +			adc {
> +				compatible = "simple-bus";
> +				#address-cells = <2>;
> +				#size-cells = <1>;
> +				// 8 64MB chip-selects
> +				ranges = <0 0 0x00000000 0x4000000	// sdram
> +					  1 0 0x04000000 0x4000000	// sdram
> +					  2 0 0x08000000 0x4000000	// reserved
> +					  3 0 0x0c000000 0x4000000	// flash/localbus
> +					  4 0 0x10000000 0x4000000	// flash/localbus
> +					  5 0 0x14000000 0x4000000	// flash/localbus
> +					  6 0 0x18000000 0x4000000	// flash/localbus
> +					  7 0 0x1c000000 0x4000000>;	// flash/localbus
> +
> +				sdram: memory@0,0 {
> +					reg = <0 0 0>;
> +				};
> +
> +				nor: flash@7,0 {
> +					reg = <7 0 0x4000000>;
> +					compatible = "cfi-flash";
> +					bank-width = <1>;		// 8-bit external flash
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +                                };
> +                        };

Nice representation of the external buses. It does seem however that at
least the nor flash entry is board specific and should be moved into the
board .dts file.
I would probably do the same for the memory node, but that one is less
obvious as it seems that there is not much choice here.

> +			usb0: ehci@400fc000 {
> +				compatible = "moschip,mcs814x-ehci", "usb-ehci";
> +				reg = <0x400fc000 0x74>;
> +				interrupts = <2>;
> +			};
> +
> +			usb1: ohci@400fd000 {
> +				compatible = "moschip,mcs814x-ohci", "ohci-le";
> +				reg = <0x400fd000 0x74>;
> +				interrupts = <11>;
> +			};
> +
> +			usb2: ohci@400fe000 {
> +				compatible = "moschip,mcs814x-ohci", "ohci-le";
> +				reg = <0x400fe000 0x74>;
> +				interrupts = <12>;
> +			};
> +
> +			usb3: otg@400ff000 {
> +				compatible = "moschip,msc814x-otg", "usb-otg";
> +				reg = <0x400ff000 0x1000>;
> +				interrupts = <13>;
> +			};

same comment as for the uart, I would mark these as disabled and only
enable the ones that are connected on a give board.

> +
> +static void __init mcs814x_dt_device_init(void)
> +{
> +	of_platform_populate(NULL, of_default_bus_match_table, NULL, NULL);
> +	mcs814x_init_machine();
> +}
> +
> +static const char *mcs8140_dt_board_compat[] __initdata = {
> +	"moschip,mcs8140",
> +	NULL,	/* sentinel */
> +};
> +
> +DT_MACHINE_START(mcs8140_dt, "Moschip MCS8140 board")
> +	/* Maintainer: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org> */
> +	.timer		= &mcs814x_timer,
> +	.map_io		= mcs814x_map_io,
> +	.init_early	= mcs814x_clk_init,
> +	.init_irq	= mcs814x_of_irq_init,
> +	.init_machine	= mcs814x_dt_device_init,
> +	.restart	= mcs814x_restart,
> +	.dt_compat	= mcs8140_dt_board_compat,
> +MACHINE_END

Not much to see here. Just move this into the common.c file. There is no
need to have a separate board file when all boards use the same one.

	Arnd
