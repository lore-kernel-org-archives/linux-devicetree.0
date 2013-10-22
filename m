From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCHv4] video: backlight: gpio-backlight: Add DT support.
Date: Tue, 22 Oct 2013 06:58:33 +0200
Message-ID: <20131022045833.GB17512@ns203013.ovh.net>
References: <20131019104555.GI18477@ns203013.ovh.net>
 <1382346813-8449-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1382346813-8449-1-git-send-email-denis@eukrea.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Denis Carikli <denis@eukrea.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Eric B??nard <eric@eukrea.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Jingoo Han <jg1.han@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Richard Purdie <rpurdie@rpsys.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Lothar Wa??mann <LW@KARO-electronics.de>
List-Id: devicetree@vger.kernel.org

On 11:13 Mon 21 Oct     , Denis Carikli wrote:
> Cc: Richard Purdie <rpurdie@rpsys.net>
> Cc: Jingoo Han <jg1.han@samsung.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Rob Herring <rob.herring@calxeda.com>
> Cc: Pawel Moll <pawel.moll@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
> Cc: devicetree@vger.kernel.org
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Lothar Wa=DFmann <LW@KARO-electronics.de>
> Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
> Cc: Eric B=E9nard <eric@eukrea.com>
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> ---
> ChangeLog v3->v4:
> - The default-brightness property is now optional, it defaults to 1 if no=
t set.
by default we set OFF not ON

do not actiate driver or properti by default you can not known to consequen=
ce
on the hw

Best Regards,
J.
> - def_value int becomes an u32.
> - gbl->def_value was set to pdata->def_value in pdata mode to avoid an ex=
tra
>   check.
> ---
>  .../bindings/video/backlight/gpio-backlight.txt    |   20 ++++++
>  drivers/video/backlight/gpio_backlight.c           |   69 ++++++++++++++=
++++--
>  2 files changed, 82 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/video/backlight/gpi=
o-backlight.txt
> =

> diff --git a/Documentation/devicetree/bindings/video/backlight/gpio-backl=
ight.txt b/Documentation/devicetree/bindings/video/backlight/gpio-backlight=
.txt
> new file mode 100644
> index 0000000..3474d4a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/backlight/gpio-backlight.txt
> @@ -0,0 +1,20 @@
> +gpio-backlight bindings
> +
> +Required properties:
> +  - compatible: "gpio-backlight"
> +  - gpios: describes the gpio that is used for enabling/disabling the ba=
cklight
> +     (see GPIO binding[0] for more details).
> +
> +Optional properties:
> +  - default-brightness-level: the default brightness level (can be 0(off=
) or
> +      1(on) since GPIOs only support theses levels).
> +
> +[0]: Documentation/devicetree/bindings/gpio/gpio.txt
> +
> +Example:
> +
> +	backlight {
> +		compatible =3D "gpio-backlight";
> +		gpios =3D <&gpio3 4 0>;
> +		default-brightness-level =3D <0>;
> +	};
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/bac=
klight/gpio_backlight.c
> index 81fb127..248124d 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -13,6 +13,8 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
>  #include <linux/platform_data/gpio_backlight.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -23,6 +25,7 @@ struct gpio_backlight {
>  =

>  	int gpio;
>  	int active;
> +	u32 def_value;
>  };
>  =

>  static int gpio_backlight_update_status(struct backlight_device *bl)
> @@ -60,6 +63,41 @@ static const struct backlight_ops gpio_backlight_ops =
=3D {
>  	.check_fb	=3D gpio_backlight_check_fb,
>  };
>  =

> +static int gpio_backlight_probe_dt(struct platform_device *pdev,
> +				   struct gpio_backlight *gbl)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	enum of_gpio_flags gpio_flags;
> +	int ret;
> +
> +	gbl->fbdev =3D NULL;
> +	gbl->gpio =3D of_get_gpio_flags(np, 0, &gpio_flags);
> +
> +	gbl->active =3D (gpio_flags & OF_GPIO_ACTIVE_LOW) ? 0 : 1;
> +
> +	if (gbl->gpio =3D=3D -EPROBE_DEFER) {
> +		return ERR_PTR(-EPROBE_DEFER);
> +	} else if (gbl->gpio < 0) {
> +		dev_err(&pdev->dev, "Error: gpios is a required parameter.\n");
> +		return gbl->gpio;
> +	}
> +
> +	ret =3D of_property_read_u32(np, "default-brightness-level",
> +				   &gbl->def_value);
> +	if (ret < 0) {
> +		/* The property is optional. */
> +		gbl->def_value =3D 1;
> +	}
> +
> +	if (gbl->def_value > 1) {
> +		dev_warn(&pdev->dev,
> +			"Warning: Invalid default-brightness-level value. Its value can be ei=
ther 0(off) or 1(on).\n");
> +		gbl->def_value =3D 1;
> +	}
> +
> +	return 0;
> +}
> +
>  static int gpio_backlight_probe(struct platform_device *pdev)
>  {
>  	struct gpio_backlight_platform_data *pdata =3D
> @@ -67,10 +105,12 @@ static int gpio_backlight_probe(struct platform_devi=
ce *pdev)
>  	struct backlight_properties props;
>  	struct backlight_device *bl;
>  	struct gpio_backlight *gbl;
> +	struct device_node *np =3D pdev->dev.of_node;
>  	int ret;
>  =

> -	if (!pdata) {
> -		dev_err(&pdev->dev, "failed to find platform data\n");
> +	if (!pdata && !np) {
> +		dev_err(&pdev->dev,
> +			"failed to find platform data or device tree node.\n");
>  		return -ENODEV;
>  	}
>  =

> @@ -79,14 +119,22 @@ static int gpio_backlight_probe(struct platform_devi=
ce *pdev)
>  		return -ENOMEM;
>  =

>  	gbl->dev =3D &pdev->dev;
> -	gbl->fbdev =3D pdata->fbdev;
> -	gbl->gpio =3D pdata->gpio;
> -	gbl->active =3D pdata->active_low ? 0 : 1;
> +
> +	if (np) {
> +		ret =3D gpio_backlight_probe_dt(pdev, gbl);
> +		if (ret)
> +			return ret;
> +	} else {
> +		gbl->fbdev =3D pdata->fbdev;
> +		gbl->gpio =3D pdata->gpio;
> +		gbl->active =3D pdata->active_low ? 0 : 1;
> +		gbl->def_value =3D pdata->def_value;
> +	}
>  =

>  	ret =3D devm_gpio_request_one(gbl->dev, gbl->gpio, GPIOF_DIR_OUT |
>  				    (gbl->active ? GPIOF_INIT_LOW
>  						 : GPIOF_INIT_HIGH),
> -				    pdata->name);
> +				    pdata ? pdata->name : "backlight");
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "unable to request GPIO\n");
>  		return ret;
> @@ -103,17 +151,24 @@ static int gpio_backlight_probe(struct platform_dev=
ice *pdev)
>  		return PTR_ERR(bl);
>  	}
>  =

> -	bl->props.brightness =3D pdata->def_value;
> +	bl->props.brightness =3D gbl->def_value;
> +
>  	backlight_update_status(bl);
>  =

>  	platform_set_drvdata(pdev, bl);
>  	return 0;
>  }
>  =

> +static struct of_device_id gpio_backlight_of_match[] =3D {
> +	{ .compatible =3D "gpio-backlight" },
> +	{ /* sentinel */ }
> +};
> +
>  static struct platform_driver gpio_backlight_driver =3D {
>  	.driver		=3D {
>  		.name		=3D "gpio-backlight",
>  		.owner		=3D THIS_MODULE,
> +		.of_match_table =3D of_match_ptr(gpio_backlight_of_match),
>  	},
>  	.probe		=3D gpio_backlight_probe,
>  };
> -- =

> 1.7.9.5
> =
