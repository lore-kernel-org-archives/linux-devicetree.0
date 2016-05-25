From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 1/2] extcon: gpio: add device tree support for
 extcon-gpio
Date: Wed, 25 May 2016 21:32:01 +0900
Message-ID: <57459B41.3060507@samsung.com>
References: <CGME20160525113554epcas1p1d75cdfe7b480576e34b222fe6e8339e5@epcas1p1.samsung.com>
 <1464176133-10742-1-git-send-email-vreddytalla@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1464176133-10742-1-git-send-email-vreddytalla@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Venkat Reddy Talla <vreddytalla@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: devicetree@vger.kernel.org

Hi Venkat,

I'm already working the support the device-tree for extcon-gpio [1].
[1] https://lkml.org/lkml/2015/10/21/8
- [PATCH v3] extcon: gpio: Add the support for Device tree bindings

So, I just apply this patch the temporay extcon-test[2] branch on extco=
n.git.
[2] https://git.kernel.org/cgit/linux/kernel/git/chanwoo/extcon.git/com=
mit/?h=3Dextcon-test&id=3D294d13e8d79fb0997e1bb146892cd75ec02221c0

But, Rob Herring gave me the some comment[2].=20
[3] https://lkml.org/lkml/2015/10/21/906
[4] https://lkml.org/lkml/2015/10/26/80

So, if you possible, do you improve the extcon-gpio.c for device-tree u=
sing by my patch[1]?
I think that you could improve the extcon-gpio.c driver as comment of R=
ob Herring.

I'm sorry for late reply.

Thanks,
Chanwoo Choi

On 2016=EB=85=84 05=EC=9B=94 25=EC=9D=BC 20:35, Venkat Reddy Talla wrot=
e:
> Adding device tree support for extcon-gpio driver.
>=20
> Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
>=20
> ---
> changes in v2:
> - using gpio flag cell to handle gpio active state
> - change dts property name gpio to gpios
> - removed prefix for debounce
> ---
> ---
>  drivers/extcon/extcon-gpio.c       | 80 ++++++++++++++++++++++++++++=
+++++++---
>  include/linux/extcon/extcon-gpio.h |  4 +-
>  2 files changed, 77 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/extcon/extcon-gpio.c b/drivers/extcon/extcon-gpi=
o.c
> index d023789..f29032c 100644
> --- a/drivers/extcon/extcon-gpio.c
> +++ b/drivers/extcon/extcon-gpio.c
> @@ -28,6 +28,8 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
> =20
>  struct gpio_extcon_data {
>  	struct extcon_dev *edev;
> @@ -90,21 +92,80 @@ static int gpio_extcon_init(struct device *dev, s=
truct gpio_extcon_data *data)
>  	return 0;
>  }
> =20
> +static struct gpio_extcon_pdata *gpio_extcon_of_pdata(
> +		struct platform_device *pdev)
> +{
> +	struct gpio_extcon_pdata *pdata;
> +	struct device_node *np =3D pdev->dev.of_node;
> +	enum of_gpio_flags flags;
> +	int gpio;
> +	u32 pval;
> +	int ret;
> +
> +	pdata =3D devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return ERR_PTR(-ENOMEM);
> +
> +	gpio =3D of_get_named_gpio_flags(np, "gpios", 0, &flags);
> +	if (gpio < 0)
> +		return ERR_PTR(gpio);
> +
> +	pdata->gpio =3D gpio;
> +
> +	if (flags & OF_GPIO_ACTIVE_LOW)
> +		pdata->gpio_active_low =3D 1;
> +
> +	ret =3D of_property_read_u32(np, "extcon-gpio,irq-flags", &pval);
> +	if (!ret)
> +		pdata->irq_flags =3D pval;
> +	else
> +		pdata->irq_flags =3D IRQF_TRIGGER_RISING |
> +					IRQF_TRIGGER_FALLING;
> +
> +	ret =3D of_property_read_u32(np, "debounce-ms", &pval);
> +	if (!ret)
> +		pdata->debounce =3D pval;
> +
> +	pdata->extcon_cable_cnt =3D of_property_count_u32_elems(np,
> +					"extcon-gpio,cable-names");
> +	if (pdata->extcon_cable_cnt <=3D 0) {
> +		dev_err(&pdev->dev, "not found out cable names\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	pdata->extcon_id =3D devm_kzalloc(&pdev->dev,
> +			(pdata->extcon_cable_cnt) *
> +			sizeof(*pdata->extcon_id), GFP_KERNEL);
> +	if (!pdata->extcon_id)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret =3D of_property_read_u32_array(np, "extcon-gpio,cable-names",
> +			pdata->extcon_id, pdata->extcon_cable_cnt);
> +	if (ret)
> +		return ERR_PTR(-EINVAL);
> +
> +	return pdata;
> +}
> +
>  static int gpio_extcon_probe(struct platform_device *pdev)
>  {
>  	struct gpio_extcon_pdata *pdata =3D dev_get_platdata(&pdev->dev);
>  	struct gpio_extcon_data *data;
>  	int ret;
> =20
> -	if (!pdata)
> -		return -EBUSY;
> -	if (!pdata->irq_flags || pdata->extcon_id > EXTCON_NONE)
> -		return -EINVAL;
> -
>  	data =3D devm_kzalloc(&pdev->dev, sizeof(struct gpio_extcon_data),
>  				   GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
> +
> +	if (!pdata && pdev->dev.of_node)
> +		pdata =3D gpio_extcon_of_pdata(pdev);
> +
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +	if (!pdata->irq_flags || !pdata->extcon_id)
> +		return -EINVAL;
> +
>  	data->pdata =3D pdata;
> =20
>  	/* Initialize the gpio */
> @@ -113,7 +174,7 @@ static int gpio_extcon_probe(struct platform_devi=
ce *pdev)
>  		return ret;
> =20
>  	/* Allocate the memory of extcon devie and register extcon device *=
/
> -	data->edev =3D devm_extcon_dev_allocate(&pdev->dev, &pdata->extcon_=
id);
> +	data->edev =3D devm_extcon_dev_allocate(&pdev->dev, pdata->extcon_i=
d);
>  	if (IS_ERR(data->edev)) {
>  		dev_err(&pdev->dev, "failed to allocate extcon device\n");
>  		return -ENOMEM;
> @@ -167,12 +228,19 @@ static int gpio_extcon_resume(struct device *de=
v)
> =20
>  static SIMPLE_DEV_PM_OPS(gpio_extcon_pm_ops, NULL, gpio_extcon_resum=
e);
> =20
> +static const struct of_device_id of_extcon_gpio_tbl[] =3D {
> +	{ .compatible =3D "extcon-gpio", },
> +	{ /* end */ }
> +};
> +MODULE_DEVICE_TABLE(of, of_extcon_gpio_tbl);
> +
>  static struct platform_driver gpio_extcon_driver =3D {
>  	.probe		=3D gpio_extcon_probe,
>  	.remove		=3D gpio_extcon_remove,
>  	.driver		=3D {
>  		.name	=3D "extcon-gpio",
>  		.pm	=3D &gpio_extcon_pm_ops,
> +		.of_match_table =3D of_extcon_gpio_tbl,
>  	},
>  };
> =20
> diff --git a/include/linux/extcon/extcon-gpio.h b/include/linux/extco=
n/extcon-gpio.h
> index 7cacafb..1914894 100644
> --- a/include/linux/extcon/extcon-gpio.h
> +++ b/include/linux/extcon/extcon-gpio.h
> @@ -31,15 +31,17 @@
>   *			If false, high state of gpio means active.
>   * @debounce:		Debounce time for GPIO IRQ in ms.
>   * @irq_flags:		IRQ Flags (e.g., IRQF_TRIGGER_LOW).
> + * extcon_cable_cnt:    External cable count.
>   * @check_on_resume:	Boolean describing whether to check the state o=
f gpio
>   *			while resuming from sleep.
>   */
>  struct gpio_extcon_pdata {
> -	unsigned int extcon_id;
> +	unsigned int *extcon_id;
>  	unsigned gpio;
>  	bool gpio_active_low;
>  	unsigned long debounce;
>  	unsigned long irq_flags;
> +	int extcon_cable_cnt;
> =20
>  	bool check_on_resume;
>  };
>=20
