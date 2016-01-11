From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2] backlight: tps65217_bl: Add MODULE_DEVICE_TABLE.
Date: Mon, 11 Jan 2016 06:08:34 +0000
Message-ID: <20160111060834.GM3331@x1>
References: <1448814586-17117-1-git-send-email-enric.balletbo@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1448814586-17117-1-git-send-email-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Enric Balletbo i Serra <eballetbo@gmail.com>
Cc: devicetree@vger.kernel.org, jingoohan1@gmail.com, plagnioj@jcrosoft.com, tomi.valkeinen@ti.com, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, 29 Nov 2015, Enric Balletbo i Serra wrote:

> The device table is required to load modules based on modaliases.
>=20
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> Changes since last version:
> - Use of_match_ptr (Lee Jones)
>=20
>  drivers/video/backlight/tps65217_bl.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied, thanks.

> diff --git a/drivers/video/backlight/tps65217_bl.c b/drivers/video/ba=
cklight/tps65217_bl.c
> index 61d72bf..fd524ad 100644
> --- a/drivers/video/backlight/tps65217_bl.c
> +++ b/drivers/video/backlight/tps65217_bl.c
> @@ -320,10 +320,19 @@ static int tps65217_bl_probe(struct platform_de=
vice *pdev)
>  	return 0;
>  }
> =20
> +#ifdef CONFIG_OF
> +static const struct of_device_id tps65217_bl_of_match[] =3D {
> +	{ .compatible =3D "ti,tps65217-bl", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, tps65217_bl_of_match);
> +#endif
> +
>  static struct platform_driver tps65217_bl_driver =3D {
>  	.probe		=3D tps65217_bl_probe,
>  	.driver		=3D {
>  		.name	=3D "tps65217-bl",
> +		.of_match_table =3D of_match_ptr(tps65217_bl_of_match),
>  	},
>  };
> =20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
