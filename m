From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add driver for sitronix ST7789V panel
Date: Mon, 6 Feb 2017 14:26:20 +0100
Message-ID: <20170206132620.GB28955@ulmo.ba.sec>
References: <cover.d573d2c400f1a8ef8d2696fda74f3e860bff50ca.1486115846.git-series.maxime.ripard@free-electrons.com>
 <8194211279dd2d1b1c2e88a3c17d154c356bbbc7.1486115846.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <8194211279dd2d1b1c2e88a3c17d154c356bbbc7.1486115846.git-series.maxime.ripard@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 03, 2017 at 10:59:06AM +0100, Maxime Ripard wrote:
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                  |   4 +-
>  drivers/gpu/drm/panel/Makefile                 |   1 +-
>  drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 435 ++++++++++++++++++-
>  3 files changed, 440 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/gpu/drm/panel/panel-sitronix-st7789v.c
>=20
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 62aba976e744..d07b996a07b8 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -81,4 +81,8 @@ config DRM_PANEL_SHARP_LS043T1LE01
>  	  Say Y here if you want to enable support for Sharp LS043T1LE01 qHD
>  	  (540x960) DSI panel as found on the Qualcomm APQ8074 Dragonboard
> =20
> +config DRM_PANEL_SITRONIX_ST7789V
> +	tristate "Sitronx ST7789V panel"

"Sitronix"

> +	depends on OF && SPI
> +

Maybe be more verbose here about what kind of panel it is, and what
resolution it provides.

>  endmenu
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makef=
ile
> index a5c7ec0236e0..41b245d39984 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -6,3 +6,4 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) +=3D panel-samsung=
-ld9040.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8aa0.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) +=3D panel-sharp-lq101r1sx01.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) +=3D panel-sharp-ls043t1le01.o
> +obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) +=3D panel-sitronix-st7789v.o
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu=
/drm/panel/panel-sitronix-st7789v.c
> new file mode 100644
> index 000000000000..aab817b55aa6
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -0,0 +1,435 @@
> +/*
> + * Copyright (C) 2017 Free Electrons
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License version
> + * 2 as published by the Free Software Foundation.
> + */
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_panel.h>
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/spi/spi.h>

I prefer linux/* headers to go first.

> +
> +#define ST7789V_SLPIN_CMD		0x10
> +
> +#define ST7789V_SLPOUT_CMD		0x11
> +
> +#define ST7789V_INVON_CMD		0x21
> +
> +#define ST7789V_DISPOFF_CMD		0x28
> +
> +#define ST7789V_DISPON_CMD		0x29
> +
> +#define ST7789V_MADCTL_CMD		0x36
> +
> +#define ST7789V_COLMOD_CMD		0x3a
> +#define ST7789V_COLMOD_RGB_FMT_18BITS		(6 << 4)
> +#define ST7789V_COLMOD_CTRL_FMT_18BITS		(6 << 0)

MIPI_DCS_PIXEL_FMT_18BIT?

[...]
> +struct st7789v {
> +	struct drm_panel panel;
> +	struct spi_device *spi;
> +	struct gpio_desc *reset;
> +	struct backlight_device *backlight;
> +};
> +
> +enum st7789v_prefix {
> +	ST7789V_COMMAND =3D 0,
> +	ST7789V_DATA =3D 1,
> +};
> +
> +static inline struct st7789v *panel_to_st7789v(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct st7789v, panel);
> +}
> +
> +static int st7789v_spi_write(struct st7789v *ctx, u8 prefix, u8 data)

Why aren't you using the proper type here for prefix?

> +{
> +	struct spi_transfer xfer =3D { };
> +	struct spi_message msg;
> +	u16 txbuf =3D ((prefix & 1) << 8) | data;
> +
> +	spi_message_init(&msg);
> +
> +	xfer.tx_buf =3D &txbuf;
> +	xfer.bits_per_word =3D 9;
> +	xfer.len =3D sizeof(txbuf);
> +
> +	spi_message_add_tail(&xfer, &msg);
> +	return spi_sync(ctx->spi, &msg);
> +}
> +
> +static int st7789v_write_command(struct st7789v *ctx, u8 cmd)
> +{
> +	return st7789v_spi_write(ctx, ST7789V_COMMAND, cmd);
> +}
> +
> +static int st7789v_write_data(struct st7789v *ctx, u8 cmd)
> +{
> +	return st7789v_spi_write(ctx, ST7789V_DATA, cmd);
> +}
> +
> +static int st7789v_write_command_data(struct st7789v *ctx, u8 cmd,
> +				      unsigned long n_data, ...)
> +{
> +	va_list ap;
> +	int i;
> +
> +	st7789v_write_command(ctx, cmd);
> +
> +	va_start(ap, n_data);
> +	for (i =3D 0; i < n_data; i++)
> +		st7789v_write_data(ctx, va_arg(ap, int));
> +	va_end(ap);
> +
> +	return 0;
> +}

Please propagate error codes from st7789v_write_{command,data}(). And
you should abort early on errors.

> +#define NUMARGS(...)  (sizeof((int[]){__VA_ARGS__}) / sizeof(int))
> +#define st7789v_send(ctx, cmd, ...)					\
> +	st7789v_write_command_data(ctx, cmd, NUMARGS(__VA_ARGS__),	\
> +				   ##__VA_ARGS__)

How is this going to work if any of the arguments happens to not be an
int? What if you have something like this:

	u8 value =3D 0x2;

	st7789v_write_command_data(ctx, cmd, 0x1, value, 0x3);

? Wouldn't that invalidly read "value" as int and wrongly increment the
ap by three bytes too many?

> +static int st7789v_prepare(struct drm_panel *panel)
> +{
> +	struct st7789v *ctx =3D panel_to_st7789v(panel);
> +
> +	gpiod_set_value(ctx->reset, 1);
> +	msleep(30);
> +	gpiod_set_value(ctx->reset, 0);
> +	msleep(120);
> +
> +	st7789v_send(ctx, ST7789V_SLPOUT_CMD);
> +
> +	/* We need to wait 120ms after a sleep out command */
> +	msleep(120);
> +
> +	st7789v_send(ctx, ST7789V_MADCTL_CMD, 0);
> +
> +	st7789v_send(ctx, ST7789V_COLMOD_CMD,
> +		     ST7789V_COLMOD_CTRL_FMT_18BITS |
> +		     ST7789V_COLMOD_RGB_FMT_18BITS);
> +
> +	st7789v_send(ctx, ST7789V_PORCTRL_CMD,
> +		     0xc,		/* Backporch, normal mode*/
> +		     0xc,		/* Frontporch, normal mode */
> +		     0,			/* Disable separate porch control */
> +		     ST7789V_PORCTRL_IDLE_BP(3) |
> +		     ST7789V_PORCTRL_IDLE_FP(3),
> +		     ST7789V_PORCTRL_PARTIAL_BP(3) |
> +		     ST7789V_PORCTRL_PARTIAL_FP(3));
> +
> +	st7789v_send(ctx, ST7789V_GCTRL_CMD,
> +		     ST7789V_GCTRL_VGLS(5) | ST7789V_GCTRL_VGHS(3));
> +
> +	st7789v_send(ctx, ST7789V_VCOMS_CMD, 0x2b);
> +
> +	st7789v_send(ctx, ST7789V_LCMCTRL_CMD, ST7789V_LCMCTRL_XMH |
> +		     ST7789V_LCMCTRL_XMX | ST7789V_LCMCTRL_XBGR);
> +
> +	st7789v_send(ctx, ST7789V_VDVVRHEN_CMD, ST7789V_VDVVRHEN_CMDEN);
> +
> +	st7789v_send(ctx, ST7789V_VRHS_CMD, 0xf);
> +
> +	st7789v_send(ctx, ST7789V_VDVS_CMD, 0x20);
> +
> +	st7789v_send(ctx, ST7789V_FRCTRL2_CMD, 0xf);
> +
> +	st7789v_send(ctx, ST7789V_PWCTRL1_CMD, ST7789V_PWCTRL1_MAGIC,
> +		     ST7789V_PWCTRL1_AVDD(2) | ST7789V_PWCTRL1_AVCL(2) |
> +		     ST7789V_PWCTRL1_VDS(1));
> +
> +	st7789v_send(ctx, ST7789V_PVGAMCTRL_CMD,
> +		     ST7789V_PVGAMCTRL_VP63(0xd),
> +		     ST7789V_PVGAMCTRL_VP1(0xca),
> +		     ST7789V_PVGAMCTRL_VP2(0xe),
> +		     ST7789V_PVGAMCTRL_VP4(8),
> +		     ST7789V_PVGAMCTRL_VP6(9),
> +		     ST7789V_PVGAMCTRL_VP13(7),
> +		     ST7789V_PVGAMCTRL_VP20(0x2d),
> +		     ST7789V_PVGAMCTRL_VP27(0xb) | ST7789V_PVGAMCTRL_VP36(3),
> +		     ST7789V_PVGAMCTRL_VP43(0x3d),
> +		     ST7789V_PVGAMCTRL_JP1(3) | ST7789V_PVGAMCTRL_VP50(4),
> +		     ST7789V_PVGAMCTRL_VP57(0xa),
> +		     ST7789V_PVGAMCTRL_VP59(0xa),
> +		     ST7789V_PVGAMCTRL_VP61(0x1b),
> +		     ST7789V_PVGAMCTRL_VP62(0x28));
> +
> +	st7789v_send(ctx, ST7789V_NVGAMCTRL_CMD,
> +		     ST7789V_NVGAMCTRL_VN63(0xd),
> +		     ST7789V_NVGAMCTRL_VN1(0xca),
> +		     ST7789V_NVGAMCTRL_VN2(0xf),
> +		     ST7789V_NVGAMCTRL_VN4(8),
> +		     ST7789V_NVGAMCTRL_VN6(8),
> +		     ST7789V_NVGAMCTRL_VN13(7),
> +		     ST7789V_NVGAMCTRL_VN20(0x2e),
> +		     ST7789V_NVGAMCTRL_VN27(0xc) | ST7789V_NVGAMCTRL_VN36(5),
> +		     ST7789V_NVGAMCTRL_VN43(0x40),
> +		     ST7789V_NVGAMCTRL_JN1(3) | ST7789V_NVGAMCTRL_VN50(4),
> +		     ST7789V_NVGAMCTRL_VN57(9),
> +		     ST7789V_NVGAMCTRL_VN59(0xb),
> +		     ST7789V_NVGAMCTRL_VN61(0x1b),
> +		     ST7789V_NVGAMCTRL_VN62(0x28));
> +
> +	st7789v_send(ctx, ST7789V_INVON_CMD);
> +
> +	st7789v_send(ctx, ST7789V_RAMCTRL_CMD,
> +		     ST7789V_RAMCTRL_DM_RGB | ST7789V_RAMCTRL_RM_RGB,
> +		     ST7789V_RAMCTRL_EPF(3) | ST7789V_RAMCTRL_MAGIC);
> +
> +	st7789v_send(ctx, ST7789V_RGBCTRL_CMD,
> +		     ST7789V_RGBCTRL_WO | ST7789V_RGBCTRL_RCM(2) |
> +		     ST7789V_RGBCTRL_VSYNC_HIGH | ST7789V_RGBCTRL_HSYNC_HIGH |
> +		     ST7789V_RGBCTRL_PCLK_HIGH,
> +		     ST7789V_RGBCTRL_VBP(8), ST7789V_RGBCTRL_HBP(20));
> +
> +	return 0;
> +}

Please check for errors in all of the above.

> +static int st7789v_probe(struct spi_device *spi)
> +{
> +	struct device_node *backlight;
> +	struct st7789v *ctx;
> +	int ret;
> +
> +	ctx =3D devm_kzalloc(&spi->dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	spi_set_drvdata(spi, ctx);
> +	ctx->spi =3D spi;
> +
> +	ctx->panel.dev =3D &spi->dev;
> +	ctx->panel.funcs =3D &st7789v_drm_funcs;
> +
> +	ctx->reset =3D devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ctx->reset)) {
> +		dev_err(&spi->dev, "Couldn't get our reset line\n");
> +		return PTR_ERR(ctx->reset);
> +	}
> +
> +	backlight =3D of_parse_phandle(spi->dev.of_node, "backlight", 0);
> +	if (backlight) {
> +		ctx->backlight =3D of_find_backlight_by_node(backlight);
> +		of_node_put(backlight);
> +
> +		if (!ctx->backlight)
> +			return -EPROBE_DEFER;
> +	}

This could make use of one of the helpers that Noralf had sent earlier
for TinyDRM. That is, if it weren't specific to TinyDRM.

Thierry

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAliYeXoACgkQ3SOs138+
s6ECZQ/+Mgzxb5Dw62Mc+V7fTwmHUCU2ZTJY0o3hblSytysTBjhgHqEtbxYAs4Lf
X38OuKIA6UdXdG3DzowXGOGWt+ob+Z2O3pSrX+WuRoUiasNyWHUuoLcAaPSpqK1B
Jjro+TLNM6vHP4+DPnp5qOwAsrNrnNPsCB2NxxnMF2KsbJIMGk6wGe233yZgPcnp
3TI+aDB6pm/RwrvHzfyA8lwk03A2nRFHCu3NmXooJTVKysqgvpHikUZi1q8XhgoJ
UyG2zQBDkX27G+QH8gSlBHM83uUxNDC6EZgNXML/DIpS8G7IbRlMFlDgk1Vnvbts
LVS1DanWMbAIHqjIzAq5jwjXAz/oIhbJ9vFPF2B/ImhMWWgcwunqWUg+UgSs0kXJ
apw9VFjUDkOnuEev1EUEWeOZoF845a5yjUYaKK8xwAVXhnk0s8Q/i3RANdNX8yym
Lb05cR+ydoqUsyumQxzng8M4pTV32uVhHdBjORPn8YGzXdrxaSNOn49Q/yz/+uM7
wPu3Qp7AwL6w2oC/GhF5/v+6yaDpVinNt1KnZfj9xE8X0Xg7EQPJk+kHuPItO/RI
4IotELkvuByxNn/LUuTKhkDsXsqv0st0851EpEAkVaNVMBYozeYCnO1zmT0fkuSQ
GNHxksXC/Y8hbocL3g3s4hkmRVy+T6DVZzEJzl4cWt3S/ORwTqQ=
=WJJA
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
