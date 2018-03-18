Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Mar 2018 07:49:25 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3] leds: add LED driver for CR0014114 board
Message-ID: <20180318124925.i4yuxigkfu6spv26@rob-hp-laptop>
References: <20180312155829.12365-1-oleg@kaa.org.ua>
 <20180313124548.12074-1-oleg@kaa.org.ua>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180313124548.12074-1-oleg@kaa.org.ua>
To: Oleh Kravchenko <oleg@kaa.org.ua>
Cc: devicetree@vger.kernel.org, linux-leds@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Tue, Mar 13, 2018 at 02:45:48PM +0200, Oleh Kravchenko wrote:
> This patch adds a LED class driver for the RGB LEDs found on
> the Crane Merchandising System CR0014114 LEDs board.
> 
> Signed-off-by: Oleh Kravchenko <oleg@kaa.org.ua>
> ---
>  .../devicetree/bindings/leds/leds-cr0014114.txt    |  46 ++++
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +

Please split to separate patch.

>  drivers/leds/Kconfig                               |  13 +
>  drivers/leds/Makefile                              |   1 +
>  drivers/leds/leds-cr0014114.c                      | 292 +++++++++++++++++++++
>  5 files changed, 353 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-cr0014114.txt
>  create mode 100644 drivers/leds/leds-cr0014114.c
> 
> diff --git a/Documentation/devicetree/bindings/leds/leds-cr0014114.txt b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> new file mode 100644
> index 000000000000..977a9929b04f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/leds/leds-cr0014114.txt
> @@ -0,0 +1,46 @@
> +Crane Merchandising System - cr0014114 LED driver
> +-------------------------------------------------
> +
> +This LED Board is widely used in vending machines produced
> +by Crane Merchandising Systems.
> +
> +Required properties:
> +- compatible: "cms,cr0014114"
> +- reg: chip select address for the device
> +- spi-cpha: shifted clock phase mode is required
> +
> +LED sub-node properties:
> +- label : (optional)
> +	see Documentation/devicetree/bindings/leds/common.txt
> +- linux,default-trigger : (optional)
> +	see Documentation/devicetree/bindings/leds/common.txt
> +
> +Example
> +-------
> +
> +cr0014114@0 {

leds@...

> +	compatible = "crane,cr0014114";
> +	reg = <0>;
> +	spi-max-frequency = <50000>;
> +	spi-cpha;
> +
> +	led0 {

Is '0' meaningful to the controller as an address/channel. If so, use 
reg.

> +		label = "cr0:red:";
> +	};
> +	led1 {
> +		label = "cr0:green:";
> +	};
> +	led2 {
> +		label = "cr0:blue:";
> +	};
> +	led3 {
> +		label = "cr1:red:";
> +	};
> +	led4 {
> +		label = "cr1:green:";
> +	};
> +	led5 {
> +		label = "cr1:blue:";
> +	};
> +	...
> +};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
> index ae850d6c0ad3..f17949c365f5 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -75,6 +75,7 @@ cnxt	Conexant Systems, Inc.
>  compulab	CompuLab Ltd.
>  cortina	Cortina Systems, Inc.
>  cosmic	Cosmic Circuits
> +crane	Crane Connectivity Solutions
>  creative	Creative Technology Ltd
>  crystalfontz	Crystalfontz America, Inc.
>  cubietech	Cubietech, Ltd.
