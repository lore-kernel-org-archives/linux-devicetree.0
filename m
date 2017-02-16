From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5] usb: misc: add USB251xB/xBi Hi-Speed Hub Controller
 Driver
Date: Wed, 15 Feb 2017 20:30:04 -0600
Message-ID: <20170216023004.25dwzy7ppxdoasfz@rob-hp-laptop>
References: <1486714767-25930-1-git-send-email-richard.leitner@skidata.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1486714767-25930-1-git-send-email-richard.leitner@skidata.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Leitner <richard.leitner@skidata.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, mark.rutland@arm.com, andriy.shevchenko@linux.intel.com, dev@g0hl1n.net
List-Id: devicetree@vger.kernel.org

On Fri, Feb 10, 2017 at 09:19:27AM +0100, Richard Leitner wrote:
> This patch adds a driver for configuration of the Microchip USB251xB/xBi
> USB 2.0 hub controller series with USB 2.0 upstream connectivity, SMBus
> configuration interface and two to four USB 2.0 downstream ports.
> 
> Furthermore add myself as a maintainer for this driver.
> 
> The datasheet can be found at the manufacturers website, see [1]. All
> device-tree exposed configuration features have been tested on a i.MX6
> platform with a USB2512B hub.
> 
> [1] http://ww1.microchip.com/downloads/en/DeviceDoc/00001692C.pdf
> 
> Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
> ---
> CHANGES v5:

V5 and the first I see it?

> 	- Put includes in alphabetical order
> 	- Fix some indentations
> 	- Replace {set,clr}_bit_in_byte with BIT() macros
> 	- Fix multiline comments
> 	- Use of_property_read_u32() instead of of_get_property() where possible
> 	- Use min_t() instead of by-hand implemented if's
> 	- Use strlcpy and ternary operator instead of strncpy in if/else
> 	- Remove useless & improve some other outputs
> 	- Omit i2c remove function
> 	- Use module_i2c_driver() instead of module_{init,exit}()
> CHANGES v4:
> 	- use utf8s_to_utf16s() instead of ascii2utf16le()
> 	- remove ascii2utf16le() in lib/string.c again
> 	- remove changes in drivers/usb/core/hcd.c again
> 	  (I will post a separate patch for using utf8s_to_utf16s()
> 	  in there too)
> 
> CHANGES v3:
> 	- move ascii2utf16le() to lib/string.c and also use it also for
> 		ascii2desc in drivers/usb/core/hcd.c
> 	- remove platform data support from usb251xb driver
> 
> CHANGES v2:
> 	- fix max-{b,s}p-current property name
> 	- add descriptor string handling from platform_data
> 	- fix non-dt handling
> ---
>  Documentation/devicetree/bindings/usb/usb251xb.txt |  83 +++
>  MAINTAINERS                                        |   8 +
>  drivers/usb/misc/Kconfig                           |   9 +
>  drivers/usb/misc/Makefile                          |   1 +
>  drivers/usb/misc/usb251xb.c                        | 605 +++++++++++++++++++++
>  5 files changed, 706 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb251xb.txt
>  create mode 100644 drivers/usb/misc/usb251xb.c
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
> new file mode 100644
> index 0000000..0c065f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
> @@ -0,0 +1,83 @@
> +Microchip USB 2.0 Hi-Speed Hub Controller
> +
> +The device node for the configuration of a Microchip USB251xB/xBi USB 2.0
> +Hi-Speed Controller.
> +
> +Required properties :
> + - compatible : Should be "microchip,usb251xb" or one of the specific types:
> +	"microchip,usb2512b", "microchip,usb2512bi", "microchip,usb2513b",
> +	"microchip,usb2513bi", "microchip,usb2514b", "microchip,usb2514bi"
> + - hub-reset-gpios : Should specify the gpio for hub reset

Just "reset-gpios". And you need to define the active state.

> +
> +Optional properties :
> + - reg : I2C address on the selected bus (default is <0x2C>)

Why is this optional? 

> + - skip-config : Skip Hub configuration, but only send the USB-Attach command
> + - vendor-id : USB Vendor ID of the hub (16 bit, default is 0x0424)
> + - product-id : USB Product ID of the hub (16 bit, default depends on type)

These are to set the ids or need to match what they are set too?

> + - device-id : USB Device ID of the hub (16 bit, default is 0x0bb3)
> + - language-id : USB Language ID (16 bit, default is 0x0000)
> + - manufacturer : USB Manufacturer string (max 31 characters long)
> + - product : USB Product string (max 31 characters long)
> + - serial : USB Serial string (max 31 characters long)
> + - {bus,self}-powered : selects between self- and bus-powered operation (default
> +	is self-powered)
> + - disable-hi-speed : disable USB Hi-Speed support
> + - {multi,single}-tt : selects between multi- and single-transaction-translator
> +	(default is multi-tt)
> + - disable-eop : disable End of Packet generation in full-speed mode
> + - {ganged,individual}-sensing : select over-current sense type in self-powered
> +	mode (default is individual)
> + - {ganged,individual}-port-switching : select port power switching mode
> +	(default is individual)
> + - dynamic-power-switching : enable auto-switching from self- to bus-powered
> +	operation if the local power source is removed or unavailable
> + - oc-delay-{100us,4ms,8ms,16ms} : set over current timer delay (default is 8ms)

Make the property value be the time (e.g. oc-delay-us).

> + - compound-device : indicated the hub is part of a compound device
> + - port-mapping-mode : enable port mapping mode
> + - string-support : enable string descriptor support (required for manufacturer,
> +	product and serial string configuration)
> + - non-removable-ports : Should specify the ports which have a non-removable
> +	device connected.
> + - sp-disabled-ports : Specifies the ports which will be self-power disabled
> + - bp-disabled-ports : Specifies the ports which will be bus-power disabled
> + - max-sp-power : Specifies the maximum current the hub consumes from an
> +	upstream port when operating as self-powered hub including the power
> +	consumption of a permanently attached peripheral if the hub is
> +	configured as a compound device. The value is given in mA in a 0 - 500
> +	range (default is 2).
> + - max-bp-power : Specifies the maximum current the hub consumes from an
> +	upstream port when operating as bus-powered hub including the power
> +	consumption of a permanently attached peripheral if the hub is
> +	configured as a compound device. The value is given in mA in a 0 - 500
> +	range (default is 100).
> + - max-sp-current : Specifies the maximum current the hub consumes from an
> +	upstream port when operating as self-powered hub EXCLUDING the power
> +	consumption of a permanently attached peripheral if the hub is
> +	configured as a compound device. The value is given in mA in a 0 - 500
> +	range (default is 2).
> + - max-bp-current : Specifies the maximum current the hub consumes from an
> +	upstream port when operating as bus-powered hub EXCLUDING the power
> +	consumption of a permanently attached peripheral if the hub is
> +	configured as a compound device. The value is given in mA in a 0 - 500
> +	range (default is 100).
> + - power-on-time : Specifies the time it takes from the time the host initiates
> +	the power-on sequence to a port until the port has adequate power. The
> +	value is given in ms in a 0 - 510 range (default is 100ms).

Various properties need unit suffixes (see property-units.txt) and 
either be common properties or need vendor prefixes.

This is a lot of properties. Are you really finding a need for all of 
them? Is this to handle h/w designers too cheap to put down the EEPROM? 
Maybe better to just define an eeprom property in the format the h/w 
expects.

> +
> +Examples:
> +	usb2512b@2c {
> +		compatible = "microchip,usb2512b";
> +		hub-reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	usb2514b@2c {
> +		compatible = "microchip,usb2514b";
> +		reg = <0x2c>;
> +		reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
> +		vendor-id = /bits/ 16 <0x0000>;
> +		product-id = /bits/ 16 <0x0000>;
> +		string-support;
> +		manufacturer = "Foo";
> +		product = "Foo-Bar";
> +		serial = "1234567890A";
> +	};
