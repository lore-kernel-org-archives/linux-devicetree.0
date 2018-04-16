From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/4] dt-bindings: Document the DT bindings for lan78xx
Date: Mon, 16 Apr 2018 14:22:26 -0500
Message-ID: <20180416192226.p5pg3yvixdulobt4@rob-hp-laptop>
References: <1523541336-145953-1-git-send-email-phil@raspberrypi.org>
 <1523541336-145953-5-git-send-email-phil@raspberrypi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1523541336-145953-5-git-send-email-phil@raspberrypi.org>
Sender: netdev-owner@vger.kernel.org
To: Phil Elwell <phil@raspberrypi.org>
Cc: Woojung Huh <woojung.huh@microchip.com>, Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>, Mark Rutland <mark.rutland@arm.com>, "David S. Miller" <davem@davemloft.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 12, 2018 at 02:55:36PM +0100, Phil Elwell wrote:
> The Microchip LAN78XX family of devices are Ethernet controllers with
> a USB interface. Despite being discoverable devices it can be useful to
> be able to configure them from Device Tree, particularly in low-cost
> applications without an EEPROM or programmed OTP.
> 
> Document the supported properties in a bindings file, adding it to
> MAINTAINERS at the same time.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.org>
> ---
>  .../devicetree/bindings/net/microchip,lan78xx.txt  | 44 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/microchip,lan78xx.txt
> 
> diff --git a/Documentation/devicetree/bindings/net/microchip,lan78xx.txt b/Documentation/devicetree/bindings/net/microchip,lan78xx.txt
> new file mode 100644
> index 0000000..e7d7850
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/microchip,lan78xx.txt
> @@ -0,0 +1,44 @@
> +Microchip LAN78xx Gigabit Ethernet controller
> +
> +The LAN78XX devices are usually configured by programming their OTP or with
> +an external EEPROM, but some platforms (e.g. Raspberry Pi 3 B+) have neither.
> +
> +Please refer to ethernet.txt for a description of common Ethernet bindings.
> +
> +Optional properties:
> +- microchip,eee-enabled: if present, enable Energy Efficient Ethernet support;

I see we have some flags for broken EEE, but nothing already defined to 
enable EEE. Seems like this should either be a user option (therefore 
not in DT) or we should use the broken EEE properties if this is h/w 
dependent.

> +- microchip,led-modes: a two-element vector, with each element configuring
> +  the operating mode of an LED. The values supported by the device are;
> +  0: Link/Activity
> +  1: Link1000/Activity
> +  2: Link100/Activity
> +  3: Link10/Activity
> +  4: Link100/1000/Activity
> +  5: Link10/1000/Activity
> +  6: Link10/100/Activity
> +  7: RESERVED
> +  8: Duplex/Collision
> +  9: Collision
> +  10: Activity
> +  11: RESERVED
> +  12: Auto-negotiation Fault
> +  13: RESERVED
> +  14: Off
> +  15: On
> +- microchip,tx-lpi-timer: the delay (in microseconds) between the TX fifo
> +  becoming empty and invoking Low Power Idles (default 600).

Needs a unit suffix as defined in property-units.txt.

> +
> +Example:
> +
> +	/* Standard configuration for a Raspberry Pi 3 B+ */
> +	ethernet: usbether@1 {
> +		compatible = "usb424,7800";
> +		reg = <1>;
> +		microchip,eee-enabled;
> +		microchip,tx-lpi-timer = <600>;
> +		/*
> +		 * led0 = 1:link1000/activity
> +		 * led1 = 6:link10/100/activity
> +		 */
> +		microchip,led-modes = <1 6>;
> +	};
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2328eed..b637aad 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14482,6 +14482,7 @@ M:	Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
>  L:	netdev@vger.kernel.org
>  S:	Maintained
>  F:	drivers/net/usb/lan78xx.*
> +F:	Documentation/devicetree/bindings/net/microchip,lan78xx.txt
>  
>  USB MASS STORAGE DRIVER
>  M:	Alan Stern <stern@rowland.harvard.edu>
> -- 
> 2.7.4
> 
