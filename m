From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] gpio-exar: Use correct property prefix and document
 bindings
Date: Mon, 17 Jul 2017 12:48:25 -0500
Message-ID: <20170717174825.p2oflpvbd5ns6xx3@rob-hp-laptop>
References: <491bf615-f1d2-13ff-fa6e-fe5350a0b3b0@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <491bf615-f1d2-13ff-fa6e-fe5350a0b3b0@siemens.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-gpio <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 13, 2017 at 08:44:26AM +0200, Jan Kiszka wrote:
> The device-specific property should be prefixed with the vendor name
> Change this and document the bindings of this platform device.

You are breaking backwards compatibility. You minimally need to state 
that and why that is okay in this case.

> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-exar.txt | 5 +++++
>  drivers/gpio/gpio-exar.c                             | 2 +-
>  drivers/tty/serial/8250/8250_exar.c                  | 4 ++--
>  3 files changed, 8 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-exar.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-exar.txt b/Documentation/devicetree/bindings/gpio/gpio-exar.txt
> new file mode 100644
> index 000000000000..452180229b36
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-exar.txt
> @@ -0,0 +1,5 @@
> +Exportable MPIO interface of Exar UART chips
> +
> +Required properties of platform device:

platform device is a Linuxism.

> + - exar,first-pin: first exportable pins (0..15)
> + - ngpios: number of exportable pins (1..16)

Required, but you don't use it?

> diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
> index fb8d304cfa17..0ecd2369c2ca 100644
> --- a/drivers/gpio/gpio-exar.c
> +++ b/drivers/gpio/gpio-exar.c
> @@ -132,7 +132,7 @@ static int gpio_exar_probe(struct platform_device *pdev)
>  	if (!p)
>  		return -ENOMEM;
>  
> -	ret = device_property_read_u32(&pdev->dev, "linux,first-pin",
> +	ret = device_property_read_u32(&pdev->dev, "exar,first-pin",
>  				       &first_pin);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
> index b5c98e5bf524..c6360fbdf808 100644
> --- a/drivers/tty/serial/8250/8250_exar.c
> +++ b/drivers/tty/serial/8250/8250_exar.c
> @@ -261,7 +261,7 @@ __xr17v35x_register_gpio(struct pci_dev *pcidev,
>  }
>  
>  static const struct property_entry exar_gpio_properties[] = {
> -	PROPERTY_ENTRY_U32("linux,first-pin", 0),
> +	PROPERTY_ENTRY_U32("exar,first-pin", 0),
>  	PROPERTY_ENTRY_U32("ngpios", 16),
>  	{ }
>  };
> @@ -326,7 +326,7 @@ static int iot2040_rs485_config(struct uart_port *port,
>  }
>  
>  static const struct property_entry iot2040_gpio_properties[] = {
> -	PROPERTY_ENTRY_U32("linux,first-pin", 10),
> +	PROPERTY_ENTRY_U32("exar,first-pin", 10),
>  	PROPERTY_ENTRY_U32("ngpios", 1),
>  	{ }
>  };
> -- 
> 2.12.3
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
