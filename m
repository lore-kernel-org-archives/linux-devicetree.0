From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH Resend] gpio: stmpe: Add DT support for stmpe gpio
Date: Mon, 26 Nov 2012 11:26:28 +0000
Message-ID: <20121126112628.GH12782@gmail.com>
References: <c0badc4f4021029a5de4393d7e3ca71494edb8ea.1353686946.git.viresh.kumar@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c0badc4f4021029a5de4393d7e3ca71494edb8ea.1353686946.git.viresh.kumar@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: linus.walleij@linaro.org, grant.likely@secretlab.ca, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, spear-devel@list.st.com, Vipul Kumar Samar <vipulkumar.samar@st.com>
List-Id: devicetree@vger.kernel.org

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
> V1->Resend:
> ----------
> - Don't move asignment of stmpe_gpio->chip.base to if (pdata) block.
>=20
>  Documentation/devicetree/bindings/gpio/gpio-stmpe.txt | 18 +++++++++=
+++++++++
>  drivers/gpio/gpio-stmpe.c                             | 10 ++++++++-=
-
>  drivers/mfd/stmpe.c                                   |  2 ++
>  3 files changed, 28 insertions(+), 2 deletions(-)
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

You have 'norequest-mask' here and 'st,norequest-mask' in the example.

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
> index dce3472..522c90e 100644
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
> @@ -321,13 +323,17 @@ static int __devinit stmpe_gpio_probe(struct pl=
atform_device *pdev)
> =20
>  	stmpe_gpio->dev =3D &pdev->dev;
>  	stmpe_gpio->stmpe =3D stmpe;
> -	stmpe_gpio->norequest_mask =3D pdata ? pdata->norequest_mask : 0;
> -
>  	stmpe_gpio->chip =3D template_chip;
>  	stmpe_gpio->chip.ngpio =3D stmpe->num_gpios;
>  	stmpe_gpio->chip.dev =3D &pdev->dev;
>  	stmpe_gpio->chip.base =3D pdata ? pdata->gpio_base : -1;
> =20
> +	if (pdata)
> +		stmpe_gpio->norequest_mask =3D pdata->norequest_mask;
> +	else if (np)
> +		of_property_read_u32(np, "st,norequest-mask",
> +				&stmpe_gpio->norequest_mask);
> +
>  	if (irq >=3D 0)
>  		stmpe_gpio->irq_base =3D stmpe->irq_base + STMPE_INT_GPIO(0);
>  	else
> diff --git a/drivers/mfd/stmpe.c b/drivers/mfd/stmpe.c
> index fd64efc..3e3ca9c 100644
> --- a/drivers/mfd/stmpe.c
> +++ b/drivers/mfd/stmpe.c
> @@ -298,12 +298,14 @@ static struct resource stmpe_gpio_resources[] =3D=
 {
> =20
>  static struct mfd_cell stmpe_gpio_cell =3D {
>  	.name		=3D "stmpe-gpio",
> +	.of_compatible	=3D "st,stmpe-gpio",
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

If 'st,norequest-mask' is truly required to be in the DT (I don't
really understand it well enough to comment), and you fix up the
inconsistency in the Documentation, you can apply my:

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro ST-Ericsson Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
