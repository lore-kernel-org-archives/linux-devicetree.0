From: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 1/3] arcnet: com20020: Add memory map of com20020
Date: Tue, 8 May 2018 11:16:36 -0500
Message-ID: <20180508161636.GA23960@rob-hp-laptop>
References: <20180505213448.8180-1-andrea.greco.gapmilano@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180505213448.8180-1-andrea.greco.gapmilano@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrea Greco <andrea.greco.gapmilano@gmail.com>
Cc: m.grzeschik@pengutronix.de, Andrea Greco <a.greco@4sigma.it>, Mark Rutland <mark.rutland@arm.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sat, May 05, 2018 at 11:34:45PM +0200, Andrea Greco wrote:
> From: Andrea Greco <a.greco@4sigma.it>
> 
> Add support for com20022I/com20020, memory mapped chip version.
> Support bus: Intel 80xx and Motorola 68xx.
> Bus size: Only 8 bit bus size is supported.
> Added related device tree bindings
> 
> Signed-off-by: Andrea Greco <a.greco@4sigma.it>
> ---
>  .../devicetree/bindings/net/smsc-com20020.txt      |  23 +++

Please split bindings to separate patch.

>  drivers/net/arcnet/Kconfig                         |  12 +-
>  drivers/net/arcnet/Makefile                        |   1 +
>  drivers/net/arcnet/arcdevice.h                     |  27 ++-
>  drivers/net/arcnet/com20020-membus.c               | 191 +++++++++++++++++++++
>  drivers/net/arcnet/com20020.c                      |   9 +-
>  6 files changed, 253 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/smsc-com20020.txt
>  create mode 100644 drivers/net/arcnet/com20020-membus.c
> 
> diff --git a/Documentation/devicetree/bindings/net/smsc-com20020.txt b/Documentation/devicetree/bindings/net/smsc-com20020.txt
> new file mode 100644
> index 000000000000..39c5b19c55af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/smsc-com20020.txt
> @@ -0,0 +1,23 @@
> +SMSC com20020, com20022I

What does this device do?

> +
> +timeout: Arcnet timeout, checkout datashet
> +clockp: Clock Prescaler, checkout datashet

s/datashet/datasheet/

> +clockm: Clock multiplier, checkout datasheet

Would these 3 properties be common for arcnet devices? If not, then they 
should have a vendor prefix.

> +
> +phy-reset-gpios: Chip reset ppin

Use 'reset-gpios' as that is standard.

> +phy-irq-gpios: Chip irq pin

Use 'interrupts'. Interrupt capable gpio controllers are also interrupt 
controllers.

> +
> +com20020_A@0 {

Node names should be generic based on the class of device. I don't think 
we have one defined, but how about 'arcnet'.

Unit addresses must have a corresponding reg property. How is this 
device accessed?

> +    compatible = "smsc,com20020";

Not documented.

> +
> +	timeout	= <0x3>;
> +	backplane = <0x0>;
> +
> +	clockp = <0x0>;
> +	clockm = <0x3>;
> +
> +	phy-reset-gpios = <&gpio3 21 GPIO_ACTIVE_LOW>;
> +	phy-irq-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
> +
> +	status = "okay";

Don't should status in examples.

> +};
