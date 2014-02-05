From: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv10] video: backlight: gpio-backlight: Add DT support.
Date: Wed, 05 Feb 2014 14:12:59 +0900
Message-ID: <000501cf2230$f0286ef0$d0794cd0$%han@samsung.com>
References: <1389878369-2046-1-git-send-email-denis@eukrea.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1389878369-2046-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Content-language: ko
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Denis Carikli' <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Cc: 'Alexander Shiyan' <shc_work-JGs/UdohzUI@public.gmane.org>, =?UTF-8?Q?'Eric_B=C3=A9nard'?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, 'Grant Likely' <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, 'Ian Campbell' <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, 'Jean-Christophe Plagniol-Villard' <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, 'Kumar Gala' <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, 'Laurent Pinchart' <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, =?UTF-8?Q?'Lothar_Wa=C3=9Fmann'?= <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>, 'Mark Rutland' <mark.rutland-5wv7dgnIgG8@public.gmane.org>, 'Pawel Moll' <pawel.moll-5wv7dgnIgG8@public.gmane.org>, 'Rob Herring' <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, 'Thierry Reding' <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, 'Jingoo Han' <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thursday, January 16, 2014 10:19 PM, Denis Carikli wrote:
>=20
> Cc: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
> Cc: Eric B=C3=A9nard <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
> Cc: Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
> Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> Cc: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
> Cc: Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> Cc: Lothar Wa=C3=9Fmann <LW-bxm8fMRDkQLDiMYJYoSAnRvVK+yQ3ZXh@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
> ---
> ChangeLog v9->v10:
> - Only the respective maintainers, or people who responded to the pat=
ch
>   were kept in the Cc.
> - The unnecessary of_match_ptr in of_match_table was removed.
>=20
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
>  2 files changed, 72 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/video/backlight=
/gpio-backlight.txt
>=20

[.....]

> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video=
/backlight/gpio_backlight.c
> index 81fb127..ec4cf5d 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c

[.....]

> +static struct of_device_id gpio_backlight_of_match[] =3D {
> +	{ .compatible =3D "gpio-backlight" },
> +	{ /* sentinel */ }
> +};
> +
>  static struct platform_driver gpio_backlight_driver =3D {
>  	.driver		=3D {
>  		.name		=3D "gpio-backlight",
>  		.owner		=3D THIS_MODULE,
> +		.of_match_table =3D &gpio_backlight_of_match,

The following build warning happens.
Would you fix the following build error?

CC      drivers/video/backlight/gpio_backlight.o
drivers/video/backlight/gpio_backlight.c:162:3: warning: initialization=
 from incompatible pointer type [enabled by default]
drivers/video/backlight/gpio_backlight.c:162:3: warning: (near initiali=
zation for ?=EC=81=A4pio_backlight_driver.driver.of_match_table?? [enab=
led by default]


Best regards,
Jingoo Han

>  	},
>  	.probe		=3D gpio_backlight_probe,
>  };
> --
> 1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
