Return-Path: <robherring2@gmail.com>
Date: Mon, 19 Feb 2018 14:40:29 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] phy: mapphone-mdm6600: Add USB PHY driver for MDM6600 on
 Droid 4
Message-ID: <20180219204029.xrftbbxvdfxlf7jh@rob-hp-laptop>
References: <20180217210723.7013-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180217210723.7013-1-tony@atomide.com>
To: Tony Lindgren <tony@atomide.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Marcel Partap <mpartap@gmx.net>, Michael Scott <michael.scott@linaro.org>, Sebastian Reichel <sre@kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Sat, Feb 17, 2018 at 01:07:23PM -0800, Tony Lindgren wrote:
> Let's add support for the GPIO controlled USB PHY on the MDM6600 modem.
> It is used on some Motorola Mapphone series of phones and tablets such
> as Droid 4.
> 
> The MDM6600 is hardwired to the first OHCI port in the Droid 4 case, and
> is controlled by several GPIOs. The USB PHY is integrated into the MDM6600
> device it seems. We know this as we get L3 errors from omap-usb-host if
> trying to use the PHY before MDM6600 is configured.
> 
> The GPIOs controlling MDM6600 are used to power MDM660 on and off, to

MDM660 a typo?

> configure the USB start-up mode (normal mode versus USB flashing), and
> they also tell the state of the MDM6600 device.
> 
> The two start-up mode GPIOs are dual-purposed and used for out of band
> (OOB) wake-up for USB and TS 27.010 serial mux. But we need to configure
> the USB start-up mode first to get MDM6600 booted in the right mode to
> be usable in the first place.
> 
> For now, this driver just gives up the two start-up mode GPIOs after the
> modem has been configured to boot in normal mode. One of them we may
> want to configure for USB OOB wake in this driver later on, but that's a
> separate series of patches and needs more work.
> 
> Note that the Motorola Mapphone Linux kernel tree has a "radio-ctrl"
> driver for modems. But it really does not control the radio at all, it
> just controls the modem power and start-up mode for USB. So I came to
> the conclusion that we're better off having this done in the USB PHY
> driver. For adding support for USB flashing mode, we can later on add
> a kernel module option for flash_mode=1 or something similar.
> 
> Also note that currently there is no PM runtime support for the OHCI
> on omap variant SoCs. So for low(er) power idle states, currenty both
> ohci-platform and phy-mapphone-mdm6600 must be unloaded or unbound.
> 
> For reference here is what I measured for total power consumption on
> an idle Droid 4 with and without USB related MDM6600 modules:
> 
> idle lcd off	phy-mapphone-mdm6600	ohci-platform
> 153mW		284mW			344mW
> 
> So it seems that MDM6600 is currently not yet idling even with it's
> radio turned off, but that's something that is beyond the control of
> this USB PHY driver.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marcel Partap <mpartap@gmx.net>
> Cc: Michael Scott <michael.scott@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../bindings/phy/phy-mapphone-mdm6600.txt          |  30 ++
>  drivers/phy/motorola/Kconfig                       |   9 +
>  drivers/phy/motorola/Makefile                      |   1 +
>  drivers/phy/motorola/phy-mapphone-mdm6600.c        | 490 +++++++++++++++++++++
>  4 files changed, 530 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-mapphone-mdm6600.txt
>  create mode 100644 drivers/phy/motorola/phy-mapphone-mdm6600.c
> 
> diff --git a/Documentation/devicetree/bindings/phy/phy-mapphone-mdm6600.txt b/Documentation/devicetree/bindings/phy/phy-mapphone-mdm6600.txt
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/phy-mapphone-mdm6600.txt
> @@ -0,0 +1,30 @@
> +Device tree binding documentation for Motorola Mapphone MDM6600 USB PHY
> +
> +Required properties:
> +- compatible	Must be "motorola,mapphone-mdm6600"
> +- enable-gpios	GPIO to enable the USB PHY
> +- power-gpios	GPIO to power on the device
> +- reset-gpios	GPIO to reset the device

The are pretty standard, but...

> +- mode-gpios	Two GPIOs to configure MDM6600 USB start-up mode for
> +		normal mode versus USB flashing mode
> +- status-gpios	Three GPIOs to read the power state of the MDM6600
> +- cmd-gpios	Three GPIOs to control the power state of the MDM6600

These 3 should have vendor a prefix.

> +
> +Example:
> +
> +fsusb1_phy: fsusb1_phy {

usb-phy {

> +	compatible = "motorola,mapphone-mdm6600";
> +	enable-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;     /* gpio_95 */
> +	power-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;	/* gpio_54 */
> +	reset-gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;	/* gpio_49 */
> +	mode-gpios = <&gpio5 20 GPIO_ACTIVE_HIGH>,	/* gpio_148 */
> +		     <&gpio5 21 GPIO_ACTIVE_HIGH>;	/* gpio_149 */
> +	status-gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>,	/* gpio_55 */
> +		       <&gpio2 21 GPIO_ACTIVE_HIGH>,	/* gpio_53 */
> +		       <&gpio2 20 GPIO_ACTIVE_HIGH>;	/* gpio_52 */
> +	cmd-gpios = <&gpio4 7 GPIO_ACTIVE_HIGH>,	/* gpio_103 */
> +		    <&gpio4 8 GPIO_ACTIVE_HIGH>,	/* gpio_104 */
> +		    <&gpio5 14 GPIO_ACTIVE_HIGH>;	/* gpio_142 */
> +	#phy-cells = <0>;
> +};
> +
