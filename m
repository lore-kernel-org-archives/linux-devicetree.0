From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3] extcon: add Maxim MAX3355 driver
Date: Thu, 17 Dec 2015 11:16:30 +0900
Message-ID: <56721AFE.9020103@samsung.com>
References: <2473780.4IzuWX8hE2@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <2473780.4IzuWX8hE2-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sergei,

On 2015=EB=85=84 12=EC=9B=94 17=EC=9D=BC 03:07, Sergei Shtylyov wrote:
> Maxim Integrated MAX3355E chip integrates a charge pump and comparato=
rs to
> enable a system with an integrated USB OTG dual-role transceiver to
> function as an USB OTG dual-role device. In addition to sensing/contr=
olling
> Vbus, the chip also passes thru the ID signal from the USB OTG connec=
tor.
> On some Renesas boards, this signal is just fed into the SoC thru a G=
PIO
> pin -- there's no real OTG controller, only host and gadget USB contr=
ollers
> sharing the same USB bus; however, we'd like to allow host or gadget
> drivers to be loaded depending on the cable type, hence the need for =
the
> MAX3355 extcon driver. The Vbus status signals are also wired to GPIO=
s
> (however, we aren't currently interested in them), the OFFVBUS# signa=
l is
> controlled by the host controllers, there's also the SHDN# signal wir=
ed to
> a GPIO, it should be driven high for the normal operation.
>=20
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>=20
> ---
> Changes in version 3:
> - reformatted the change log.
>=20
> Changes in version 2:
> - added the USB gadget cable support;
> - added the remove() driver method which drives SHDN# GPIO low to sav=
e power;
> - dropped vendor prefix from the ID GPIO property name;
> - changed the GPIO property name suffix to "-gpios";
> - switched to usign extcon_set_cable_state_() API;
> - switched to using the gpiod/sleeping 'gpiolib' APIs;
> - addded error messages to max3355_probe();
> - added IRQF_NO_SUSPEND flasg to the devm_request_threaded_irq() call=
;
> - renamed 'ret' variable to 'err' in max3355_probe();
> - expanded the Kconfig entry help text;
> - added vendor name to the patch summary, the bindings document, the =
Kconfig
>   entry, the driver heading comment, the module description, and the =
change log;
> - fixed up and reformatted the change log.
>=20
>  Documentation/devicetree/bindings/extcon/extcon-max3355.txt |   21 +
>  drivers/extcon/Kconfig                                      |    8=20
>  drivers/extcon/Makefile                                     |    1=20
>  drivers/extcon/extcon-max3355.c                             |  153 +=
+++++++++++
>  4 files changed, 183 insertions(+)
>=20
> Index: renesas/Documentation/devicetree/bindings/extcon/extcon-max335=
5.txt
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- /dev/null
> +++ renesas/Documentation/devicetree/bindings/extcon/extcon-max3355.t=
xt
> @@ -0,0 +1,21 @@
> +Maxim Integrated MAX3355 USB OTG chip
> +-------------------------------------
> +
> +MAX3355 integrates a charge pump and comparators to enable a system =
with an
> +integrated USB OTG dual-role transceiver to function as a USB OTG du=
al-role
> +device.
> +
> +Required properties:
> +- compatible: should be "maxim,max3355";
> +- maxim,shdn-gpios: should contain a phandle and GPIO specifier for =
the GPIO pin
> +  connected to the MAX3355's SHDN# pin;
> +- id-gpios: should contain a phandle and GPIO specifier for the GPIO=
 pin
> +  connected to the MAX3355's ID_OUT pin.
> +
> +Example (Koelsch board):
> +
> +	usb-otg {
> +		compatible =3D "maxim,max3355";
> +		maxim,shdn-gpios =3D <&gpio2 4 GPIO_ACTIVE_LOW>;
> +		id-gpios =3D <&gpio5 31 GPIO_ACTIVE_HIGH>;
> +	};
> Index: renesas/drivers/extcon/Kconfig
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- renesas.orig/drivers/extcon/Kconfig
> +++ renesas/drivers/extcon/Kconfig
> @@ -52,6 +52,14 @@ config EXTCON_MAX14577
>  	  Maxim MAX14577/77836. The MAX14577/77836 MUIC is a USB port acces=
sory
>  	  detector and switch.
> =20
> +config EXTCON_MAX3355
> +	tristate "Maxim MAX3355 USB OTG EXTCON Support"
> +	help
> +	  If you say yes here you get support for the USB OTG role detectio=
n by
> +	  MAX3355. The MAX3355 chip integrates a charge pump and comparator=
s to
> +	  enable a system with an integrated USB OTG dual-role transceiver =
to
> +	  function as an USB OTG dual-role device.
> +
>  config EXTCON_MAX77693
>  	tristate "Maxim MAX77693 EXTCON Support"
>  	depends on MFD_MAX77693 && INPUT
> Index: renesas/drivers/extcon/Makefile
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- renesas.orig/drivers/extcon/Makefile
> +++ renesas/drivers/extcon/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_EXTCON_ARIZONA)	+=3D extcon-a
>  obj-$(CONFIG_EXTCON_AXP288)	+=3D extcon-axp288.o
>  obj-$(CONFIG_EXTCON_GPIO)	+=3D extcon-gpio.o
>  obj-$(CONFIG_EXTCON_MAX14577)	+=3D extcon-max14577.o
> +obj-$(CONFIG_EXTCON_MAX3355)	+=3D extcon-max3355.o
>  obj-$(CONFIG_EXTCON_MAX77693)	+=3D extcon-max77693.o
>  obj-$(CONFIG_EXTCON_MAX77843)	+=3D extcon-max77843.o
>  obj-$(CONFIG_EXTCON_MAX8997)	+=3D extcon-max8997.o
> Index: renesas/drivers/extcon/extcon-max3355.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- /dev/null
> +++ renesas/drivers/extcon/extcon-max3355.c
> @@ -0,0 +1,153 @@
> +/*
> + * Maxim Integrated MAX3355 USB OTG chip extcon driver
> + *
> + * Copyright (C) 2014 Cogent Embedded, Inc.

2014 -> 2015

> + * Author: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> + *
> + * This software is licensed under the terms of the GNU General Publ=
ic
> + * License version 2, as published by the Free Software Foundation, =
and
> + * may be copied, distributed, and modified under those terms.
> + */
> +
> +#include <linux/extcon.h>
> +#include <linux/gpio.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/workqueue.h>
> +
> +struct max3355_data {
> +	struct extcon_dev *edev;
> +	struct gpio_desc *id_gpiod;
> +	struct gpio_desc *shdn_gpiod;
> +};
> +
> +static const unsigned int max3355_cable[] =3D {
> +	EXTCON_USB,
> +	EXTCON_USB_HOST,
> +	EXTCON_NONE,
> +};
> +
> +static irqreturn_t max3355_id_irq(int irq, void *dev_id)
> +{
> +	struct max3355_data *data =3D dev_id;
> +	int id =3D gpiod_get_value_cansleep(data->id_gpiod);
> +
> +	if (id) {
> +		/*
> +		 * ID =3D 1 means USB HOST cable detached.
> +		 * As we don't have event for USB peripheral cable attached,
> +		 * we simulate USB peripheral attach here.
> +		 */
> +		extcon_set_cable_state_(data->edev, EXTCON_USB_HOST, false);
> +		extcon_set_cable_state_(data->edev, EXTCON_USB, true);
> +	} else {
> +		/*
> +		 * ID =3D 0 means USB HOST cable attached.
> +		 * As we don't have event for USB peripheral cable detached,
> +		 * we simulate USB peripheral detach here.
> +		 */
> +		extcon_set_cable_state_(data->edev, EXTCON_USB, false);
> +		extcon_set_cable_state_(data->edev, EXTCON_USB_HOST, true);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int max3355_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	struct max3355_data *data;
> +	struct gpio_desc *gpiod;
> +	int irq, err;
> +
> +	data =3D devm_kzalloc(&pdev->dev, sizeof(struct max3355_data),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->edev =3D devm_extcon_dev_allocate(&pdev->dev, max3355_cable);
> +	if (IS_ERR(data->edev)) {
> +		dev_err(&pdev->dev, "failed to allocate extcon device\n");
> +		return PTR_ERR(data->edev);
> +	}
> +	data->edev->name =3D kstrdup(np->name, GFP_KERNEL);

You don't need to set the name of extcon device.
Instead, the extcon_dev_register() will set it.

> +
> +	gpiod =3D devm_gpiod_get(&pdev->dev, "id", GPIOD_IN);
> +	if (IS_ERR(gpiod)) {
> +		dev_err(&pdev->dev, "failed to get ID_OUT GPIO\n");
> +		return PTR_ERR(gpiod);
> +	}
> +	data->id_gpiod =3D gpiod;
> +
> +	gpiod =3D devm_gpiod_get(&pdev->dev, "maxim,shdn", GPIOD_OUT_HIGH);
> +	if (IS_ERR(gpiod)) {
> +		dev_err(&pdev->dev, "failed to get SHDN# GPIO\n");
> +		return PTR_ERR(gpiod);
> +	}
> +	data->shdn_gpiod =3D gpiod;
> +
> +	err =3D devm_extcon_dev_register(&pdev->dev, data->edev);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to register extcon device\n");
> +		return err;
> +	}
> +
> +	irq =3D gpiod_to_irq(data->id_gpiod);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "failed to translate ID_OUT GPIO to IRQ\n");
> +		return irq;
> +	}
> +
> +	err =3D devm_request_threaded_irq(&pdev->dev, irq, NULL, max3355_id=
_irq,
> +					IRQF_ONESHOT | IRQF_NO_SUSPEND |
> +					IRQF_TRIGGER_RISING |
> +					IRQF_TRIGGER_FALLING,
> +					pdev->name, data);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to request ID_OUT IRQ\n");
> +		return err;
> +	}

I recommend that you reorder the init code in probe() as following:

1. Allocate the memory of max3355_data *data.
2. Parse and initialize the gpio (id, shdn)
3. Allocate the memory of extcon_dev and register it.
4. Request the interrupt.

> +
> +	platform_set_drvdata(pdev, data);
> +
> +	/* Perform initial detection */
> +	max3355_id_irq(irq, data);
> +
> +	return 0;
> +}
> +
> +static int max3355_remove(struct platform_device *pdev)
> +{
> +	struct max3355_data *data =3D platform_get_drvdata(pdev);
> +
> +	gpiod_set_value_cansleep(data->shdn_gpiod, 0);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id max3355_match_table[] =3D {
> +	{ .compatible =3D "maxim,max3355", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, max3355_match_table);
> +
> +static struct platform_driver max3355_driver =3D {
> +	.probe		=3D max3355_probe,
> +	.remove		=3D max3355_remove,
> +	.driver		=3D {
> +		.name	=3D "extcon-max3355",
> +		.of_match_table =3D max3355_match_table,
> +		.owner	=3D THIS_MODULE,

You don't need to add the 'owner'.

> +	},
> +};
> +
> +module_platform_driver(max3355_driver);
> +
> +MODULE_AUTHOR("Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>"=
);
> +MODULE_DESCRIPTION("Maxim MAX3355 extcon driver");
> +MODULE_LICENSE("GPL v2");

Thanks,
Chanwoo Choi

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
