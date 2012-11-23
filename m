From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] gpio: stmpe: Add DT support for stmpe gpio
Date: Fri, 23 Nov 2012 10:34:00 +0000
Message-ID: <20121123103400.GO17471@gmail.com>
References: <912d88b8906ce87cf5459cf3d5798e03bfce34c7.1353649737.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <912d88b8906ce87cf5459cf3d5798e03bfce34c7.1353649737.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linus.walleij@linaro.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

On Fri, 23 Nov 2012, Viresh Kumar wrote:

> From: Vipul Kumar Samar <vipulkumar.samar@st.com>
>=20
> This patch allows the STMPE GPIO driver to be successfully probed and
> initialised when Device Tree support is enabled. Bindings are mention=
ed in
> Documentation too.
>=20
> Signed-off-by: Vipul Kumar Samar <vipulkumar.samar@st.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  Documentation/devicetree/bindings/gpio/gpio-stmpe.txt | 18 +++++++++=
+++++++++
>  drivers/gpio/gpio-stmpe.c                             | 15 +++++++++=
+++---
>  drivers/mfd/stmpe.c                                   |  2 ++
>  3 files changed, 32 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-stmpe=
=2Etxt
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt b/=
Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> new file mode 100644
> index 0000000..7f010e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-stmpe.txt
> @@ -0,0 +1,18 @@
> +STMPE gpio
> +----------
> +
> +Required properties:
> + - compatible: "st,stmpe-gpio"
> +
> +Optional properties:
> + - norequest-mask: bitmask specifying which GPIOs should _not_ be re=
questable
> +   due to different usage (e.g. touch, keypad)
> +
> +Node name must be stmpe_gpio and should be child node of stmpe node =
to which it
> +belongs.
> +
> +Example:
> +	stmpe_gpio {
> +		compatible =3D "st,stmpe-gpio";
> +		st,norequest-mask =3D <0x20>;	//gpio 5 can't be used
> +	};
> diff --git a/drivers/gpio/gpio-stmpe.c b/drivers/gpio/gpio-stmpe.c
> index dce3472..91455d4 100644
> --- a/drivers/gpio/gpio-stmpe.c
> +++ b/drivers/gpio/gpio-stmpe.c
> @@ -12,6 +12,7 @@
>  #include <linux/gpio.h>
>  #include <linux/irq.h>
>  #include <linux/interrupt.h>
> +#include <linux/of.h>
>  #include <linux/mfd/stmpe.h>
> =20
>  /*
> @@ -304,6 +305,7 @@ static void stmpe_gpio_irq_remove(struct stmpe_gp=
io *stmpe_gpio)
>  static int __devinit stmpe_gpio_probe(struct platform_device *pdev)
>  {
>  	struct stmpe *stmpe =3D dev_get_drvdata(pdev->dev.parent);
> +	struct device_node *np =3D pdev->dev.of_node;
>  	struct stmpe_gpio_platform_data *pdata;
>  	struct stmpe_gpio *stmpe_gpio;
>  	int ret;
> @@ -321,12 +323,19 @@ static int __devinit stmpe_gpio_probe(struct pl=
atform_device *pdev)
> =20
>  	stmpe_gpio->dev =3D &pdev->dev;
>  	stmpe_gpio->stmpe =3D stmpe;
> -	stmpe_gpio->norequest_mask =3D pdata ? pdata->norequest_mask : 0;
> -
>  	stmpe_gpio->chip =3D template_chip;
>  	stmpe_gpio->chip.ngpio =3D stmpe->num_gpios;
>  	stmpe_gpio->chip.dev =3D &pdev->dev;
> -	stmpe_gpio->chip.base =3D pdata ? pdata->gpio_base : -1;

Why have you deleted this?

> +
> +	if (pdata) {
> +		stmpe_gpio->norequest_mask =3D pdata->norequest_mask;
> +		stmpe_gpio->chip.base =3D pdata->gpio_base;

Then added this?

> +	} else {
> +		stmpe_gpio->chip.base =3D -1;

And this?

Just leave the top line in and it saves you lots of complecations.

> +		if (np)
> +			of_property_read_u32(np, "st,norequest-mask",
> +					&pdata->norequest_mask);

Can you explain to me what this does?

> +	}
> =20
>  	if (irq >=3D 0)
>  		stmpe_gpio->irq_base =3D stmpe->irq_base + STMPE_INT_GPIO(0);
> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index e2c0dda..c757ac3 100644
> --- a/drivers/mfd/stmpe.c
> +++ b/drivers/mfd/stmpe.c
> @@ -298,12 +298,14 @@ static struct resource stmpe_gpio_resources[] =3D=
 {
> =20
>  static struct mfd_cell stmpe_gpio_cell =3D {
>  	.name		=3D "stmpe-gpio",
> +	.of_compatible	=3D "st,stmpe-gpio",

There's no need for any of the STMPE to have their own compatible
string, as they are MFD devices. They are registered as platform
devices from the MFD subsystem.

>  	.resources	=3D stmpe_gpio_resources,
>  	.num_resources	=3D ARRAY_SIZE(stmpe_gpio_resources),
>  };
> =20
>  static struct mfd_cell stmpe_gpio_cell_noirq =3D {
>  	.name		=3D "stmpe-gpio",
> +	.of_compatible	=3D "st,stmpe-gpio",
>  	/* gpio cell resources consist of an irq only so no resources here =
*/
>  };
> =20
> --=20
> 1.7.12.rc2.18.g61b472e
>=20

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
