From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/1] Add driver for smsc usb251x i2c configuration
Date: Thu, 4 Aug 2016 12:25:49 -0500
Message-ID: <20160804172549.GA17162@rob-hp-laptop>
References: <1470148324-27428-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1470148324-27428-1-git-send-email-fabien.lahoudere@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Rutland <mark.rutland@arm.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Heiner Kallweit <hkallweit1@gmail.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 02, 2016 at 04:31:54PM +0200, Fabien Lahoudere wrote:
> This driver copy the configuration of the controller EEPROM via i2c.
> Configuration information is available in Documentation/usb/usb251x.txt
> 
> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
> ---
>  Documentation/devicetree/bindings/usb/usb251x.txt |  27 +++
>  drivers/usb/misc/Kconfig                          |   9 +
>  drivers/usb/misc/Makefile                         |   1 +
>  drivers/usb/misc/usb251x.c                        | 265 ++++++++++++++++++++++
>  4 files changed, 302 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb251x.txt
>  create mode 100644 drivers/usb/misc/usb251x.c
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb251x.txt b/Documentation/devicetree/bindings/usb/usb251x.txt
> new file mode 100644
> index 0000000..2b0863a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/usb251x.txt
> @@ -0,0 +1,27 @@
> +SMSC USB 2.0 Hi-Speed Hub Controller
> +
> +Required properties:
> +- compatible = "smsc,usb251x";
> +- reg = <0x2c>;
> +
> +Optional properties:
> +- smsc,usb251x-cfg-data1 : u8, set configuration data 1 (byte 0x06)
> +- smsc,usb251x-cfg-data2 : u8, set configuration data 2 (byte 0x07)
> +- smsc,usb251x-cfg-data3 : u8, set configuration data 3 (byte 0x08)
> +- smsc,usb251x-portmap12 : u8, set port mapping for ports 1 and 2 (byte 0xfb)
> +- smsc,usb251x-portmap34 : u8, set port mapping for ports 3 and 4 (byte 0xfc)
> +- smsc,usb251x-portmap56 : u8, set port mapping for ports 5 and 6 (byte 0xfd)
> +- smsc,usb251x-portmap7 : u8, set port mapping for port 7 (byte 0xfe)
> +- smsc,usb251x-status-command : u8, configure smbus behaviour (byte 0xff)

This is to override what's in the EEPROM or for when there is no EEPROM 
(or both)? 

What about the other values? Are they likely to need to be added later? 
I think I'd rather see either specific properties for specific settings 
if only a few or a single property for the whole EEPROM.

Rob
