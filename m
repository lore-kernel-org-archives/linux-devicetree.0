From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND PATCH v11] video: backlight: gpio-backlight: Add DT
 support.
Date: Thu, 27 Feb 2014 08:12:40 +0000
Message-ID: <20140227081240.GS9195@lee--X1>
References: <1393437845-25564-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1393437845-25564-1-git-send-email-denis@eukrea.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Denis Carikli <denis@eukrea.com>
Cc: Bryan Wu <cooloney@gmail.com>, Jingoo Han <jg1.han@samsung.com>, Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

> Cc: Bryan Wu <cooloney@gmail.com>
> Cc: Jingoo Han <jg1.han@samsung.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Eric B=C3=A9nard <eric@eukrea.com>
> Signed-off-by: Denis Carikli <denis@eukrea.com>
> ---
> ChangeLog v10->v11:

Wow, that's a lot of fix-ups.

> - Shrinked the Cc list.

It's okay to have a large CC list, but I'd do it manually rather than
adding a line for each in the commit log. This latter method is good
for one or two extra people you wish to add to an individual patch
when sending a patch-set.

> - Fixed the of_match_table warning.
>=20
> ChangeLog v9->v10:
> - Only the respective maintainers, or people who responded to the pat=
ch
>   were kept in the Cc.
> - The unnecessary of_match_ptr in of_match_table was removed.

Why was it unnecessary?

> ChangeLog v8->v9:
> - Added Shawn Guo in the Cc list.
> - The default-brightness-level is now a boolean default-on property,
>   the gpio is only touched if the gpio-backlight driver instance prob=
es.
> - The code and documentation was updated accordingly.
>=20
> ChangeLog v7->v8:
> - The default-state was renamed to default-brightness-level.
> - default-brightness-level is now mandatory, like for backlight-pwm,
>   That way we avoid having to handle the case where it's not set,
>   which means that we would need not to set the gpio, but still
>   report a brightness value for sysfs, when not all gpio controllers =
are
>   able to read the gpio value.
> - switched the default-brightness-level to boolean values (0 or 1) in=
stead
>   of using strings ("on", "off", "keep").
> - The documentation was updated accordingly.
> - The example in the documentation now uses the dts gpio defines.
> - The "backlight: gpio_backlight: Use a default state enum." patch wa=
s then
>   dropped, becuase it is not necessary anymore.
>=20
> ChangeLog v6->v7:
> - removed a compilation warning with the removal of the useless ret d=
eclaration.
>=20
> ChangeLog v5->v6:
> - The default state handling was reworked:
>   - it's now called default-state, and looks like the gpio-leds defau=
lt-state.
>   - it now has a "keep" option, like for the gpio-leds.
>   - that "keep" option is the default when the default-state property=
 is not set.
> - The documentation was updated accordingly.
>=20
> ChangeLog v4->v5:
> - The default-brightness property now defaults to 0 in the driver.
> - def_value int becomes a bool.
> - The check for the gpio validity has been reworked.
> ---
>  .../bindings/video/backlight/gpio-backlight.txt    |   19 +++++++
>  drivers/video/backlight/gpio_backlight.c           |   60 ++++++++++=
+++++++---

These should really be in a seperate patch.

>  2 files changed, 72 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/video/backlight=
/gpio-backlight.txt
>=20
> diff --git a/Documentation/devicetree/bindings/video/backlight/gpio-b=
acklight.txt b/Documentation/devicetree/bindings/video/backlight/gpio-b=
acklight.txt
> new file mode 100644
> index 0000000..a923193
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/backlight/gpio-backligh=
t.txt
> @@ -0,0 +1,19 @@
> +gpio-backlight bindings
> +
> +Required properties:
> +  - compatible: "gpio-backlight"
> +  - gpios: describes the gpio that is used for enabling/disabling th=
e backlight
> +    (see GPIO binding[0] for more details).

The format of the [0] is confusing and it doesn't really add anything
here. If you wish to reverence an external binding document just write
out the path. Failing that [bindings]/gpio/gpio.txt also works.

> +Optional properties:
> +  - default-on: enable the backlight at boot.
> +
> +[0]: Documentation/devicetree/bindings/gpio/gpio.txt
> +
> +Example:
> +
> +	backlight {
> +		compatible =3D "gpio-backlight";
> +		gpios =3D <&gpio3 4 GPIO_ACTIVE_HIGH>;
> +		default-on;
> +	};
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video=
/backlight/gpio_backlight.c

<snip>

> +static int gpio_backlight_probe_dt(struct platform_device *pdev,
> +				   struct gpio_backlight *gbl)
> +{
> +	struct device_node *np =3D pdev->dev.of_node;
> +	enum of_gpio_flags gpio_flags;
> +	bool default_on =3D false;

There's no need to initialise this.

> +	gbl->fbdev =3D NULL;

This will already be NULL, as you used kzalloc().

> +	default_on =3D of_property_read_bool(np, "default-on");
> +
> +	gbl->def_value =3D default_on;

Why complicate matters?

        gbl->def_value =3D of_property_read_bool(np, "default-on");


> -	bl->props.brightness =3D pdata->def_value;
> +	bl->props.brightness =3D gbl->def_value;

Do you use gbl->def_value again later? If not:

        gbl->def_value =3D =3D of_property_read_bool(np, "default-on");

#ifdef CONFIG_OF ?

> +static struct of_device_id gpio_backlight_of_match[] =3D {
> +	{ .compatible =3D "gpio-backlight" },
> +	{ /* sentinel */ }
> +};
> +

#endif ?

>  static struct platform_driver gpio_backlight_driver =3D {
>  	.driver		=3D {
>  		.name		=3D "gpio-backlight",
>  		.owner		=3D THIS_MODULE,
> +		.of_match_table =3D gpio_backlight_of_match,

of_match_ptr() ?

<snip>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
