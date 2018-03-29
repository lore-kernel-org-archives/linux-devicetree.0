From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: RE: [PATCH] gpio: dwapb: Add support for 32 interrupts
Date: Thu, 29 Mar 2018 09:39:38 +0000
Message-ID: <TY1PR01MB1769121CFDE3E1A4849944FFF5A20@TY1PR01MB1769.jpnprd01.prod.outlook.com>
References: <1522246950-9110-1-git-send-email-phil.edworthy@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1522246950-9110-1-git-send-email-phil.edworthy@renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Michel Pollet <michel.pollet@bp.renesas.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

On 28 March 2018 15:23, Phil Edworthy wrote:
> The DesignWare GPIO IP can be configured for either 1 or 32 interrupts,
> but the driver currently only supports 1 interrupt. See the DesignWare
> DW_apb_gpio Databook description of the 'GPIO_INTR_IO' parameter.
>=20
> This change allows the driver to work with up to 32 interrupts, it will
> get as many interrupts as specified in the DT 'interrupts' property.
> It doesn't do anything clever with the different interrupts, it just call=
s
> the same handler used for single interrupt hardware.
>=20
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
> Note: There are a few lines over 80 chars, but this is just guidance, rig=
ht?
>       Especially as there are already some lines over 80 chars.
> ---
>  .../devicetree/bindings/gpio/snps-dwapb-gpio.txt   | 10 ++++-
>  drivers/gpio/gpio-dwapb.c                          | 44 ++++++++++++++++=
+-----
>  include/linux/platform_data/gpio-dwapb.h           |  3 +-
>  3 files changed, 45 insertions(+), 12 deletions(-)

This patch triggers a build error for Quark MFD driver, which is the only u=
ser
of the structure outside of the driver. I will fix that with an additional =
patch,
but I'll wait to see what other comments I get first.

Thanks
Phil


> diff --git a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> index 4a75da7..e343581 100644
> --- a/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> +++ b/Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> @@ -26,8 +26,14 @@ controller.
>    the second encodes the triger flags encoded as described in
>    Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
>  - interrupt-parent : The parent interrupt controller.
> -- interrupts : The interrupt to the parent controller raised when GPIOs
> -  generate the interrupts.
> +- interrupts : The interrupts to the parent controller raised when GPIOs
> +  generate the interrupts. If the controller provides one combined inter=
rupt
> +  for all GPIOs, specify a single interrupt. If the controller provides =
one
> +  interrupt for each GPIO, provide a list of interrupts that correspond =
to each
> +  of the GPIO pins. When specifying multiple interrupts, if any of the G=
PIOs
> are
> +  not connected to an interrupt, use the interrupt-mask property.
> +- interrupt-mask : a 32-bit bit mask that specifies which interrupts in =
the list
> +  of interrupts is valid, bit is 1 for a valid irq.
>  - snps,nr-gpios : The number of pins in the port, a single cell.
>  - resets : Reset line for the controller.
>=20
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 226977f..47d82f9 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -441,14 +441,19 @@ static void dwapb_configure_irqs(struct
> dwapb_gpio *gpio,
>  	irq_gc->chip_types[1].handler =3D handle_edge_irq;
>=20
>  	if (!pp->irq_shared) {
> -		irq_set_chained_handler_and_data(pp->irq,
> dwapb_irq_handler,
> -						 gpio);
> +		int i;
> +
> +		for (i =3D 0; i < pp->ngpio; i++) {
> +			if (pp->irq[i])
> +				irq_set_chained_handler_and_data(pp-
> >irq[i],
> +						dwapb_irq_handler, gpio);
> +		}
>  	} else {
>  		/*
>  		 * Request a shared IRQ since where MFD would have
> devices
>  		 * using the same irq pin
>  		 */
> -		err =3D devm_request_irq(gpio->dev, pp->irq,
> +		err =3D devm_request_irq(gpio->dev, pp->irq[0],
>  				       dwapb_irq_handler_mfd,
>  				       IRQF_SHARED, "gpio-dwapb-mfd", gpio);
>  		if (err) {
> @@ -524,7 +529,7 @@ static int dwapb_gpio_add_port(struct dwapb_gpio
> *gpio,
>  	if (pp->idx =3D=3D 0)
>  		port->gc.set_config =3D dwapb_gpio_set_config;
>=20
> -	if (pp->irq)
> +	if (pp->has_irq)
>  		dwapb_configure_irqs(gpio, port, pp);
>=20
>  	err =3D gpiochip_add_data(&port->gc, port);
> @@ -535,7 +540,7 @@ static int dwapb_gpio_add_port(struct dwapb_gpio
> *gpio,
>  		port->is_registered =3D true;
>=20
>  	/* Add GPIO-signaled ACPI event support */
> -	if (pp->irq)
> +	if (pp->has_irq)
>  		acpi_gpiochip_request_interrupts(&port->gc);
>=20
>  	return err;
> @@ -601,13 +606,34 @@ dwapb_gpio_get_pdata(struct device *dev)
>  		if (dev->of_node && pp->idx =3D=3D 0 &&
>  			fwnode_property_read_bool(fwnode,
>  						  "interrupt-controller")) {
> -			pp->irq =3D
> irq_of_parse_and_map(to_of_node(fwnode), 0);
> -			if (!pp->irq)
> +			struct device_node *np =3D to_of_node(fwnode);
> +			u32 irq_mask =3D 0xFFFFFFFF;
> +			int j;
> +
> +			/* Optional irq mask */
> +			fwnode_property_read_u32(fwnode, "interrupt-
> mask", &irq_mask);
> +
> +			/*
> +			 * The IP has configuration options to allow a single
> +			 * combined interrupt or one per gpio. If one per
> gpio,
> +			 * some might not be used.
> +			 */
> +			for (j =3D 0; j < pp->ngpio; j++) {
> +				if (irq_mask & BIT(j)) {
> +					pp->irq[j] =3D
> irq_of_parse_and_map(np, j);
> +					if (pp->irq[j])
> +						pp->has_irq =3D true;
> +				}
> +			}
> +			if (!pp->has_irq)
>  				dev_warn(dev, "no irq for port%d\n", pp-
> >idx);
>  		}
>=20
> -		if (has_acpi_companion(dev) && pp->idx =3D=3D 0)
> -			pp->irq =3D
> platform_get_irq(to_platform_device(dev), 0);
> +		if (has_acpi_companion(dev) && pp->idx =3D=3D 0) {
> +			pp->irq[0] =3D
> platform_get_irq(to_platform_device(dev), 0);
> +			if (pp->irq[0])
> +				pp->has_irq =3D true;
> +		}
>=20
>  		pp->irq_shared	=3D false;
>  		pp->gpio_base	=3D -1;
> diff --git a/include/linux/platform_data/gpio-dwapb.h
> b/include/linux/platform_data/gpio-dwapb.h
> index 2dc7f4a..5a52d69 100644
> --- a/include/linux/platform_data/gpio-dwapb.h
> +++ b/include/linux/platform_data/gpio-dwapb.h
> @@ -19,7 +19,8 @@ struct dwapb_port_property {
>  	unsigned int	idx;
>  	unsigned int	ngpio;
>  	unsigned int	gpio_base;
> -	unsigned int	irq;
> +	unsigned int	irq[32];
> +	bool		has_irq;
>  	bool		irq_shared;
>  };
>=20
> --
> 2.7.4
