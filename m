From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH-V5 1/4] mfd: 88pm800: Add device tree support
Date: Tue, 7 Jul 2015 08:30:16 +0100
Message-ID: <20150707073016.GO3182@x1>
References: <1435591877-18214-1-git-send-email-vaibhav.hiremath@linaro.org>
 <1435591877-18214-2-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1435591877-18214-2-git-send-email-vaibhav.hiremath@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, sameo@linux.intel.com, linux-kernel@vger.kernel.org, yizhang@marvell.com, Chao Xie <chao.xie@marvell.com>
List-Id: devicetree@vger.kernel.org

On Mon, 29 Jun 2015, Vaibhav Hiremath wrote:

> Add DT support to the 88pm800 driver, along with compatible
> field for it's sub-devices (rtc, onkey and regulator)
>=20
> Signed-off-by: Chao Xie <chao.xie@marvell.com>
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
> ---
>  drivers/mfd/88pm800.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Acked-by: Lee Jones <lee.jones@linaro.org>

> diff --git a/drivers/mfd/88pm800.c b/drivers/mfd/88pm800.c
> index 841717a..40fd014 100644
> --- a/drivers/mfd/88pm800.c
> +++ b/drivers/mfd/88pm800.c
> @@ -27,6 +27,7 @@
>  #include <linux/mfd/core.h>
>  #include <linux/mfd/88pm80x.h>
>  #include <linux/slab.h>
> +#include <linux/of_device.h>
> =20
>  /* Interrupt Registers */
>  #define PM800_INT_STATUS1		(0x05)
> @@ -121,6 +122,11 @@ static const struct i2c_device_id pm80x_id_table=
[] =3D {
>  };
>  MODULE_DEVICE_TABLE(i2c, pm80x_id_table);
> =20
> +static const struct of_device_id pm80x_of_match_table[] =3D {
> +	{ .compatible =3D "marvell,88pm800", },
> +	{},
> +};
> +
>  static struct resource rtc_resources[] =3D {
>  	{
>  	 .name =3D "88pm80x-rtc",
> @@ -133,6 +139,7 @@ static struct resource rtc_resources[] =3D {
>  static struct mfd_cell rtc_devs[] =3D {
>  	{
>  	 .name =3D "88pm80x-rtc",
> +	 .of_compatible =3D "marvell,88pm80x-rtc",
>  	 .num_resources =3D ARRAY_SIZE(rtc_resources),
>  	 .resources =3D &rtc_resources[0],
>  	 .id =3D -1,
> @@ -151,6 +158,7 @@ static struct resource onkey_resources[] =3D {
>  static const struct mfd_cell onkey_devs[] =3D {
>  	{
>  	 .name =3D "88pm80x-onkey",
> +	 .of_compatible =3D "marvell,88pm80x-onkey",
>  	 .num_resources =3D 1,
>  	 .resources =3D &onkey_resources[0],
>  	 .id =3D -1,
> @@ -160,6 +168,7 @@ static const struct mfd_cell onkey_devs[] =3D {
>  static const struct mfd_cell regulator_devs[] =3D {
>  	{
>  	 .name =3D "88pm80x-regulator",
> +	 .of_compatible =3D "marvell,88pm80x-regulator",
>  	 .id =3D -1,
>  	},
>  };
> @@ -544,8 +553,21 @@ static int pm800_probe(struct i2c_client *client=
,
>  	int ret =3D 0;
>  	struct pm80x_chip *chip;
>  	struct pm80x_platform_data *pdata =3D dev_get_platdata(&client->dev=
);
> +	struct device_node *np =3D client->dev.of_node;
>  	struct pm80x_subchip *subchip;
> =20
> +	if (!pdata && !np) {
> +		dev_err(&client->dev,
> +			"pm80x requires platform data or of_node\n");
> +		return -EINVAL;
> +	}
> +
> +	if (!pdata) {
> +		pdata =3D devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
> +		if (!pdata)
> +			return -ENOMEM;
> +	}
> +
>  	ret =3D pm80x_init(client);
>  	if (ret) {
>  		dev_err(&client->dev, "pm800_init fail\n");
> @@ -611,6 +633,7 @@ static struct i2c_driver pm800_driver =3D {
>  		.name =3D "88PM800",
>  		.owner =3D THIS_MODULE,
>  		.pm =3D &pm80x_pm_ops,
> +		.of_match_table	=3D pm80x_of_match_table,
>  		},
>  	.probe =3D pm800_probe,
>  	.remove =3D pm800_remove,

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
