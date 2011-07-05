From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH v2 3/3] gpio/mxc: add device tree probe support
Date: Tue, 5 Jul 2011 11:45:49 -0600
Message-ID: <CACxGe6tRuyW0NjyiB2T+uAZ-NvJxwBVJOB0R3u_k-_DOkqmtdg@mail.gmail.com>
References: <1309879166-25788-1-git-send-email-shawn.guo@linaro.org> <1309879166-25788-4-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1309879166-25788-4-git-send-email-shawn.guo@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 5, 2011 at 9:19 AM, Shawn Guo <shawn.guo@linaro.org> wrote:
> The patch adds device tree probe support for gpio-mxc driver.
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>

Looks right to me.

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
> =A0.../devicetree/bindings/gpio/fsl-imx-gpio.txt =A0 =A0 =A0| =A0 22 =
++++++++++++++++++++
> =A0drivers/gpio/gpio-mxc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0| =A0 18 +++++++++++++++-
> =A02 files changed, 39 insertions(+), 1 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/gpio/fsl-imx-=
gpio.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt =
b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
> new file mode 100644
> index 0000000..4363ae4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/fsl-imx-gpio.txt
> @@ -0,0 +1,22 @@
> +* Freescale i.MX/MXC GPIO controller
> +
> +Required properties:
> +- compatible : Should be "fsl,<soc>-gpio"
> +- reg : Address and length of the register set for the device
> +- interrupts : Should be the port interrupt shared by all 32 pins, i=
f
> + =A0one number. =A0If two numbers, the first one is the interrupt sh=
ared
> + =A0by low 16 pins and the second one is for high 16 pins.
> +- gpio-controller : Marks the device node as a gpio controller.
> +- #gpio-cells : Should be two. =A0The first cell is the pin number a=
nd
> + =A0the second cell is used to specify optional parameters (currentl=
y
> + =A0unused).
> +
> +Example:
> +
> +gpio0: gpio@73f84000 {
> + =A0 =A0 =A0 compatible =3D "fsl,imx51-gpio", "fsl,imx31-gpio";
> + =A0 =A0 =A0 reg =3D <0x73f84000 0x4000>;
> + =A0 =A0 =A0 interrupts =3D <50 51>;
> + =A0 =A0 =A0 gpio-controller;
> + =A0 =A0 =A0 #gpio-cells =3D <2>;
> +};
> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 4875690..059d44a 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -27,6 +27,8 @@
> =A0#include <linux/platform_device.h>
> =A0#include <linux/slab.h>
> =A0#include <linux/basic_mmio_gpio.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> =A0#include <asm-generic/bug.h>
>
> =A0enum mxc_gpio_hwtype {
> @@ -126,6 +128,13 @@ static struct platform_device_id mxc_gpio_devtyp=
e[] =3D {
> =A0 =A0 =A0 =A0}
> =A0};
>
> +static const struct of_device_id mxc_gpio_dt_ids[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "fsl,imx1-gpio", .data =3D &mxc_gpio_=
devtype[IMX1_GPIO], },
> + =A0 =A0 =A0 { .compatible =3D "fsl,imx21-gpio", .data =3D &mxc_gpio=
_devtype[IMX2_GPIO], },
> + =A0 =A0 =A0 { .compatible =3D "fsl,imx31-gpio", .data =3D &mxc_gpio=
_devtype[IMX_GPIO], },
> + =A0 =A0 =A0 { /* sentinel */ }
> +};
> +
> =A0/*
> =A0* MX2 has one interrupt *for all* gpio ports. The list is used
> =A0* to save the references to all ports, so that mx2_gpio_irq_handle=
r
> @@ -308,7 +317,13 @@ static void __init mxc_gpio_init_gc(struct mxc_g=
pio_port *port)
>
> =A0static void __devinit mxc_gpio_get_hw(struct platform_device *pdev=
)
> =A0{
> - =A0 =A0 =A0 enum mxc_gpio_hwtype hwtype =3D pdev->id_entry->driver_=
data;
> + =A0 =A0 =A0 const struct of_device_id *of_id =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_match_device(mxc_gpi=
o_dt_ids, &pdev->dev);
> + =A0 =A0 =A0 enum mxc_gpio_hwtype hwtype;
> +
> + =A0 =A0 =A0 if (of_id)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdev->id_entry =3D of_id->data;
> + =A0 =A0 =A0 hwtype =3D pdev->id_entry->driver_data;
>
> =A0 =A0 =A0 =A0if (mxc_gpio_hwtype) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/*
> @@ -426,6 +441,7 @@ static struct platform_driver mxc_gpio_driver =3D=
 {
> =A0 =A0 =A0 =A0.driver =A0 =A0 =A0 =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "gpio-mxc",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D mxc_gpio_dt_ids,
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D mxc_gpio_probe,
> =A0 =A0 =A0 =A0.id_table =A0 =A0 =A0 =3D mxc_gpio_devtype,
> --
> 1.7.4.1
>
>
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
