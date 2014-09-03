From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: Re: [PATCH 1/3] GPIO: gpio-dwapb: Enable platform driver binding to
 MFD driver
Date: Wed, 3 Sep 2014 22:03:02 +0200
Message-ID: <20140903200302.GA7673@breakpoint.cc>
References: <1409161588-19417-1-git-send-email-alvin.chen@intel.com>
 <1409161588-19417-2-git-send-email-alvin.chen@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1409161588-19417-2-git-send-email-alvin.chen@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Weike Chen <alvin.chen@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Boon Leong Ong <boon.leong.ong@intel.com>, Andriy Shevchenko <andriy.shevchenko@intel.com>, Mika Westerberg <mika.westerberg@intel.com>, Hock Leong Kweh <hock.leong.kweh@intel.com>, Darren Hart <dvhart@linux.intel.com>
List-Id: devicetree@vger.kernel.org

On 2014-08-27 10:46:26 [-0700], Weike Chen wrote:
> index 9de1515..8250a44 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -136,7 +136,6 @@ config GPIO_DWAPB
>  	tristate "Synopsys DesignWare APB GPIO driver"
>  	select GPIO_GENERIC
>  	select GENERIC_IRQ_CHIP
> -	depends on OF_GPIO

you need either OF_GPIO or PCI

>  	help
>  	  Say Y or M here to build support for the Synopsys DesignWare APB
>  	  GPIO block.
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index d6618a6..155a64b 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -21,6 +21,7 @@
>  #include <linux/of_irq.h>
>  #include <linux/platform_device.h>
>  #include <linux/spinlock.h>
> +#include <linux/platform_data/gpio-dwapb.h>
> =20
>  #define GPIO_SWPORTA_DR		0x00
>  #define GPIO_SWPORTA_DDR	0x04
> @@ -52,14 +53,15 @@ struct dwapb_gpio_port {
>  	struct bgpio_chip	bgc;
>  	bool			is_registered;
>  	struct dwapb_gpio	*gpio;
> +	struct dwapb_gpio_port_property *pp;
>  };
> =20
>  struct dwapb_gpio {
>  	struct	device		*dev;
>  	void __iomem		*regs;
>  	struct dwapb_gpio_port	*ports;
> -	unsigned int		nr_ports;

you could keep this the way it is

>  	struct irq_domain	*domain;
> +	const struct dwapb_gpio_platform_data	*pdata;

and not making this a member of this struct. I've been going up and dow=
n
the source and I don't see the need to marry dwapb_gpio to
dwapb_gpio_platform_data.=20
That dwapb_gpio_port_property thing has a long name. Could you just set
it up, pass it for registration and the free it? You can't free the
pdata for the non-OF tree but for the OF case you keep that struct
around for no reason.
You could safe some memory and use pdata directly for setup.

>  };
> =20
>  static int dwapb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
> @@ -207,22 +209,24 @@ static int dwapb_irq_set_type(struct irq_data *=
d, u32 type)
>  	return 0;
>  }
> =20
> +static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
> +{
> +	struct irq_desc *desc =3D irq_to_desc(irq);
> +
> +	dwapb_irq_handler(irq, desc);
> +
> +	return IRQ_HANDLED;

I suggest to teach dwapb_irq_handler() to return something that makes
you decide whether or not IRQ_HANDLED is the thing to do here. If
something goes crazy the core has no way of knowing and shutting you do=
wn.
Also invoking ->irq_eoi() _before_ your shared was invoked might not sm=
art.
What you want is something like

 static u32 _dwapb_irq_handler(struct dwapb_gpio *gpio,  struct irq_chi=
p *chip)
 {
         u32 irq_status =3D readl_relaxed(gpio->regs + GPIO_INTSTATUS);
	 u32 ret =3D irq_status;
=20
         while (irq_status) {
                 int hwirq =3D fls(irq_status) - 1;
                 int gpio_irq =3D irq_find_mapping(gpio->domain, hwirq)=
;
=20
                 generic_handle_irq(gpio_irq);
                 irq_status &=3D ~BIT(hwirq);
=20
                 if ((irq_get_trigger_type(gpio_irq) & IRQ_TYPE_SENSE_M=
ASK)
                         =3D=3D IRQ_TYPE_EDGE_BOTH)
                         dwapb_toggle_trigger(gpio, hwirq);
         }
	 return ret;
 }

 static void dwapb_irq_handler(u32 irq, struct irq_desc *desc)
 {
         struct dwapb_gpio *gpio =3D irq_get_handler_data(irq);
         struct irq_chip *chip =3D irq_desc_get_chip(desc);

	_dwapb_irq_handler(gpio, chip);
=20
         if (chip->irq_eoi)
                 chip->irq_eoi(irq_desc_get_irq_data(desc));
 }

 static irqreturn_t dwapb_irq_handler_mfd(int irq, void *dev_id)
 {
 	struct irq_desc *desc =3D irq_to_desc(irq);
	struct irq_chip *chip =3D irq_desc_get_chip(desc);
	int worked;
=20
 	worked =3D dwapb_irq_handler(dev_id, chip);
	if (worked)
		return IRQ_HANDLED;
	else
		return IRQ_NONE;
 }

How about it?

> +
>  static void dwapb_configure_irqs(struct dwapb_gpio *gpio,
>  				 struct dwapb_gpio_port *port)
>  {
>  	struct gpio_chip *gc =3D &port->bgc.gc;
> -	struct device_node *node =3D  gc->of_node;
> -	struct irq_chip_generic	*irq_gc;
> +	struct device_node *node =3D port->pp->node;
> +	struct irq_chip_generic	*irq_gc =3D NULL;
>  	unsigned int hwirq, ngpio =3D gc->ngpio;
>  	struct irq_chip_type *ct;
> -	int err, irq, i;
> -
> -	irq =3D irq_of_parse_and_map(node, 0);
> -	if (!irq) {
> -		dev_warn(gpio->dev, "no irq for bank %s\n",
> -			port->bgc.gc.of_node->full_name);
> -		return;
> -	}
> +	int err, i;
> =20
>  	gpio->domain =3D irq_domain_add_linear(node, ngpio,
>  					     &irq_generic_chip_ops, gpio);
> @@ -269,8 +273,24 @@ static void dwapb_configure_irqs(struct dwapb_gp=
io *gpio,
>  	irq_gc->chip_types[1].type =3D IRQ_TYPE_EDGE_BOTH;
>  	irq_gc->chip_types[1].handler =3D handle_edge_irq;
> =20
> -	irq_set_chained_handler(irq, dwapb_irq_handler);
> -	irq_set_handler_data(irq, gpio);
> +	if (!port->pp->irq_shared) {
> +		irq_set_chained_handler(port->pp->irq, dwapb_irq_handler);
> +	} else {
> +		/*
> +		 * Request a shared IRQ since where MFD would have devices
> +		 * using the same irq pin
> +		 */
> +		err =3D devm_request_irq(gpio->dev, port->pp->irq,
> +				       dwapb_irq_handler_mfd,
> +				       IRQF_SHARED, "gpio-dwapb-mfd", gpio);
> +		if (err) {
> +			dev_err(gpio->dev, "error requesting IRQ\n");
> +			irq_domain_remove(gpio->domain);
> +			gpio->domain =3D NULL;
> +			return;
> +		}
> +	}
> +	irq_set_handler_data(port->pp->irq, gpio);

This does not look like it belongs here. It should only be used togethe=
r
with irq_set_chained_handler() or am I missing here something?

> =20
>  	for (hwirq =3D 0 ; hwirq < ngpio ; hwirq++)
>  		irq_create_mapping(gpio->domain, hwirq);
> @@ -296,57 +316,43 @@ static void dwapb_irq_teardown(struct dwapb_gpi=
o *gpio)
>  }
> =20
>  static int dwapb_gpio_add_port(struct dwapb_gpio *gpio,
> -			       struct device_node *port_np,
> +			       struct dwapb_gpio_port_property *pp,
>  			       unsigned int offs)
>  {
>  	struct dwapb_gpio_port *port;
> -	u32 port_idx, ngpio;
>  	void __iomem *dat, *set, *dirout;
>  	int err;
> =20
> -	if (of_property_read_u32(port_np, "reg", &port_idx) ||
> -		port_idx >=3D DWAPB_MAX_PORTS) {
> -		dev_err(gpio->dev, "missing/invalid port index for %s\n",
> -			port_np->full_name);
> -		return -EINVAL;
> -	}
> -
>  	port =3D &gpio->ports[offs];
>  	port->gpio =3D gpio;
> +	port->pp   =3D pp;
> =20
> -	if (of_property_read_u32(port_np, "snps,nr-gpios", &ngpio)) {
> -		dev_info(gpio->dev, "failed to get number of gpios for %s\n",
> -			 port_np->full_name);
> -		ngpio =3D 32;
> -	}
> -
> -	dat =3D gpio->regs + GPIO_EXT_PORTA + (port_idx * GPIO_EXT_PORT_SIZ=
E);
> -	set =3D gpio->regs + GPIO_SWPORTA_DR + (port_idx * GPIO_SWPORT_DR_S=
IZE);
> +	dat =3D gpio->regs + GPIO_EXT_PORTA + (pp->idx * GPIO_EXT_PORT_SIZE=
);
> +	set =3D gpio->regs + GPIO_SWPORTA_DR + (pp->idx * GPIO_SWPORT_DR_SI=
ZE);
>  	dirout =3D gpio->regs + GPIO_SWPORTA_DDR +
> -		(port_idx * GPIO_SWPORT_DDR_SIZE);
> +		(pp->idx * GPIO_SWPORT_DDR_SIZE);
> =20
>  	err =3D bgpio_init(&port->bgc, gpio->dev, 4, dat, set, NULL, dirout=
,
>  			 NULL, false);
>  	if (err) {
>  		dev_err(gpio->dev, "failed to init gpio chip for %s\n",
> -			port_np->full_name);
> +			pp->name);
>  		return err;
>  	}
> =20
> -	port->bgc.gc.ngpio =3D ngpio;
> -	port->bgc.gc.of_node =3D port_np;
> +	port->bgc.gc.ngpio =3D pp->ngpio;
> +	port->bgc.gc.base =3D pp->gpio_base;
> =20
>  	/*
>  	 * Only port A can provide interrupts in all configurations of the =
IP.
>  	 */
So we had a port_idx check which was refered by the comment. Now we hav=
e
a comment and no check for it. You could do that loop over that array
here and keep that check.

> -	if (port_idx =3D=3D 0 &&
> -	    of_property_read_bool(port_np, "interrupt-controller"))
> +	if (pp->irq)
>  		dwapb_configure_irqs(gpio, port);
> =20
>  	err =3D gpiochip_add(&port->bgc.gc);
>  	if (err)
>  		dev_err(gpio->dev, "failed to register gpiochip for %s\n",
> -			port_np->full_name);
> +			pp->name);
>  	else
>  		port->is_registered =3D true;
> =20
> @@ -357,30 +363,115 @@ static void dwapb_gpio_unregister(struct dwapb=
_gpio *gpio)
>  {
>  	unsigned int m;
> =20
> -	for (m =3D 0; m < gpio->nr_ports; ++m)
> +	for (m =3D 0; m < gpio->pdata->nports; ++m)
>  		if (gpio->ports[m].is_registered)
>  			gpiochip_remove(&gpio->ports[m].bgc.gc);
>  }
> =20
> +/*
> + * Handlers for alternative sources of platform_data
> + */

Those abvious comments=E2=80=A6

> +
> +#ifdef CONFIG_OF_GPIO
> +/*
> + * Translate OpenFirmware node properties into platform_data
> + */
=E2=80=A6 are not really helping

> +static struct dwapb_gpio_platform_data *

Sebastian
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
