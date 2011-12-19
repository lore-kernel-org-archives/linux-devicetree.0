From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] gpio: add a driver for the Synopsys DesignWare APB
 GPIO block
Date: Sun, 18 Dec 2011 21:03:31 -0600
Message-ID: <4EEEA983.7010402@gmail.com>
References: <1324203229-15571-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324203229-15571-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Jamie,

On 12/18/2011 04:13 AM, Jamie Iles wrote:
> The Synopsys DesignWare block is used in some ARM devices (picoxcell)
> and can be configured to provide multiple banks of GPIO pins.  The first
> bank (A) can also provide IRQ capabilities.
> 
> Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Cc: Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>
> Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
> ---
> 
> I was originally working on a generic binding for the generic gpio
> driver, but this doesn't scale well when there are interrupt
> capabilities in the controller, so here's a driver specifically for the
> Synopsys block.
> 
>  .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   |   63 ++++
>  drivers/gpio/Kconfig                               |   10 +
>  drivers/gpio/Makefile                              |    1 +
>  drivers/gpio/gpio-dwapb.c                          |  337 ++++++++++++++++++++
>  4 files changed, 411 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
>  create mode 100644 drivers/gpio/gpio-dwapb.c
> 
> diff --git a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> new file mode 100644
> index 0000000..62943fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> @@ -0,0 +1,63 @@
> +* Synopsys DesignWare APB GPIO controller
> +
> +Required properties:
> +- compatible : Should be "snps,dw-apb-gpio"
> +- reg : Address and length of the register set for the device
> +
> +The GPIO controller has a configurable number of banks, each of which are
> +represented as child nodes with the following properties:
> +
> +Required properties:
> +- compatible : "snps,dw-apb-gpio-bank"
> +- gpio-controller : Marks the device node as a gpio controller.
> +- #gpio-cells : Should be two.  The first cell is the pin number and
> +  the second cell is used to specify optional parameters (currently
> +  unused).
> +- snps,gpio-bank : The integer bank index of the bank, a single cell.

What about using reg for this? It looks like this is only used for
calculating register addresses?

This smells a bit like cell-index which is a no-no.

> +- nr-gpio : The number of pins in the bank, a single cell.

Valid range is ?

> +
> +Optional properties:
> +- interrupt-controller : The first bank may be configured to be an interrupt
> +controller.
> +- #interrupt-cells : Specifies the number of cells needed to encode an
> +interrupt.  Shall be set to 2.  The first cell defines the interrupt number,
> +the second encodes the triger flags encoded as:
> +
> +	bits[3:0] trigger type and level flags.
> +		1 = low-to-high edge triggered
> +		2 = high-to-low edge triggered
> +		4 = active high level-sensitive
> +		8 = active low level-sensitive
> +
> +- interrupt-parent : The parent interrupt controller.
> +- interrupts : The interrupts to the parent controller raised when GPIOs
> +generate the interrupts.
> +
> +Example:
> +
> +gpio: gpio@20000 {
> +	compatible = "snps,dw-apb-gpio";
> +	reg = <0x20000 0x1000>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	banka: gpio-controller@0 {
> +		compatible = "snps,dw-apb-gpio-bank";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		nr-gpio = <8>;
> +		snps,gpio-bank = <0>
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&vic1>;
> +		interrupts = <0 1 2 3 4 5 6 7>;
> +	};
> +
> +	bankb: gpio-controller@1 {
> +		compatible = "snps,dw-apb-gpio-bank";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		nr-gpio = <8>;
> +		snps,gpio-bank = <1>
> +	};
> +};
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 573532f..93fd69d 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -85,6 +85,16 @@ config GPIO_GENERIC_PLATFORM
>  	help
>  	  Say yes here to support basic platform_device memory-mapped GPIO controllers.
>  
> +config GPIO_DWAPB
> +	bool "Synopsys DesignWare APB GPIO driver"
> +	select GPIO_GENERIC
> +	select GENERIC_IRQ_CHIP
> +	select IRQ_DOMAIN

In case you missed it, my irq domain support for generic irq chip makes
this and putting domain code in your driver unnecessary.

I only quickly scanned over the rest.

Rob
