From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/tinydrm: add driver for ST7735R panels
Date: Wed, 6 Dec 2017 19:27:47 +0100
Message-ID: <455f5c7a-9f3c-c019-9418-94f0c2015afd@tronnes.org>
References: <1511924469-11448-1-git-send-email-david@lechnology.com>
 <1511924469-11448-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1511924469-11448-3-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: limor-6aDhHjTmHzzR7s880joybQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Den 29.11.2017 04.01, skrev David Lechner:
> This adds a new driver for Sitronix ST7735R display panels.
>
> This has been tested using an Adafruit 1.8" TFT.
>
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---
>   MAINTAINERS                       |   6 +
>   drivers/gpu/drm/tinydrm/Kconfig   |  10 ++
>   drivers/gpu/drm/tinydrm/Makefile  |   1 +
>   drivers/gpu/drm/tinydrm/st7735r.c | 237 ++++++++++++++++++++++++++++++++++++++
>   4 files changed, 254 insertions(+)
>   create mode 100644 drivers/gpu/drm/tinydrm/st7735r.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a174632..9c7707e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4462,6 +4462,12 @@ S:	Maintained
>   F:	drivers/gpu/drm/tinydrm/st7586.c
>   F:	Documentation/devicetree/bindings/display/st7586.txt
>   
> +DRM DRIVER FOR SITRONIX ST7735R PANELS
> +M:	David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>

I know we haven't done this in the other tinydrm drivers, but I think
we should start adding which tree the development is happening in:

T:    git git://anongit.freedesktop.org/drm/drm-misc

> +S:	Maintained
> +F:	drivers/gpu/drm/tinydrm/st7735r.c
> +F:	Documentation/devicetree/bindings/display/st7735r.txt
> +
>   DRM DRIVER FOR TDFX VIDEO CARDS
>   S:	Orphan / Obsolete
>   F:	drivers/gpu/drm/tdfx/
> diff --git a/drivers/gpu/drm/tinydrm/Kconfig b/drivers/gpu/drm/tinydrm/Kconfig
> index 90c5bd5..b0e567d 100644
> --- a/drivers/gpu/drm/tinydrm/Kconfig
> +++ b/drivers/gpu/drm/tinydrm/Kconfig
> @@ -52,3 +52,13 @@ config TINYDRM_ST7586
>   	  * LEGO MINDSTORMS EV3
>   
>   	  If M is selected the module will be called st7586.
> +
> +config TINYDRM_ST7735R
> +	tristate "DRM support for Sitronix ST7735R display panels"
> +	depends on DRM_TINYDRM && SPI
> +	select TINYDRM_MIPI_DBI
> +	help
> +	  DRM driver Sitronix ST7735R with one of the following LCDs:
> +	  * JD-T18003-T01 1.8" 128x160 TFT
> +
> +	  If M is selected the module will be called st7735r.
> diff --git a/drivers/gpu/drm/tinydrm/Makefile b/drivers/gpu/drm/tinydrm/Makefile
> index 8aeee53..49a1119 100644
> --- a/drivers/gpu/drm/tinydrm/Makefile
> +++ b/drivers/gpu/drm/tinydrm/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_TINYDRM_ILI9225)		+= ili9225.o
>   obj-$(CONFIG_TINYDRM_MI0283QT)		+= mi0283qt.o
>   obj-$(CONFIG_TINYDRM_REPAPER)		+= repaper.o
>   obj-$(CONFIG_TINYDRM_ST7586)		+= st7586.o
> +obj-$(CONFIG_TINYDRM_ST7735R)		+= st7735r.o
> diff --git a/drivers/gpu/drm/tinydrm/st7735r.c b/drivers/gpu/drm/tinydrm/st7735r.c
> new file mode 100644
> index 0000000..6435b00
> --- /dev/null
> +++ b/drivers/gpu/drm/tinydrm/st7735r.c
> @@ -0,0 +1,237 @@
> +/*
> + * DRM driver for Sitronix ST7735R panels
> + *
> + * Copyright 2017 David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-buf.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/spi/spi.h>
> +#include <video/mipi_display.h>
> +
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/tinydrm/mipi-dbi.h>
> +#include <drm/tinydrm/tinydrm-helpers.h>
> +
> +#define ST7735R_FRMCTR1		0xb1
> +#define ST7735R_FRMCTR2		0xb2
> +#define ST7735R_FRMCTR3		0xb3
> +#define ST7735R_INVCTR		0xb4
> +#define ST7735R_PWCTR1		0xc0
> +#define ST7735R_PWCTR2		0xc1
> +#define ST7735R_PWCTR3		0xc2
> +#define ST7735R_PWCTR4		0xc3
> +#define ST7735R_PWCTR5		0xc4
> +#define ST7735R_VMCTR1		0xc5
> +#define ST7735R_GAMCTRP1	0xe0
> +#define ST7735R_GAMCTRN1	0xe1
> +
> +#define ST7735R_MY	BIT(7)
> +#define ST7735R_MX	BIT(6)
> +#define ST7735R_MV	BIT(5)
> +
> +static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
> +				struct drm_crtc_state *crtc_state)
> +{
> +	struct tinydrm_device *tdev = pipe_to_tinydrm(pipe);
> +	struct mipi_dbi *mipi = mipi_dbi_from_tinydrm(tdev);
> +	struct drm_framebuffer *fb = pipe->plane.fb;
> +	struct device *dev = tdev->drm->dev;
> +	int ret;
> +	u8 addr_mode;
> +
> +	DRM_DEBUG_KMS("\n");
> +
> +	mipi_dbi_hw_reset(mipi);
> +
> +	ret = mipi_dbi_command(mipi, MIPI_DCS_SOFT_RESET);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "Error sending command %d\n", ret);
> +		return;
> +	}
> +
> +	msleep(150);
> +
> +	mipi_dbi_command(mipi, MIPI_DCS_EXIT_SLEEP_MODE);
> +	msleep(500);
> +
> +	mipi_dbi_command(mipi, ST7735R_FRMCTR1, 0x01, 0x2c, 0x2d);
> +	mipi_dbi_command(mipi, ST7735R_FRMCTR2, 0x01, 0x2c, 0x2d);
> +	mipi_dbi_command(mipi, ST7735R_FRMCTR3, 0x01, 0x2c, 0x2d, 0x01, 0x2c,
> +			 0x2d);
> +	mipi_dbi_command(mipi, ST7735R_INVCTR, 0x07);
> +	mipi_dbi_command(mipi, ST7735R_PWCTR1, 0xa2, 0x02, 0x84);
> +	mipi_dbi_command(mipi, ST7735R_PWCTR2, 0xc5);
> +	mipi_dbi_command(mipi, ST7735R_PWCTR3, 0x0a, 0x00);
> +	mipi_dbi_command(mipi, ST7735R_PWCTR4, 0x8a, 0x2a);
> +	mipi_dbi_command(mipi, ST7735R_PWCTR5, 0x8a, 0xee);
> +	mipi_dbi_command(mipi, ST7735R_VMCTR1, 0x0e);
> +	mipi_dbi_command(mipi, MIPI_DCS_EXIT_INVERT_MODE);
> +	switch (mipi->rotation) {
> +	default:
> +		addr_mode = ST7735R_MX | ST7735R_MY;
> +		break;
> +	case 90:
> +		addr_mode = ST7735R_MX | ST7735R_MV;
> +		break;
> +	case 180:
> +		addr_mode = 0;
> +		break;
> +	case 270:
> +		addr_mode = ST7735R_MY | ST7735R_MV;
> +		break;
> +	}
> +	mipi_dbi_command(mipi, MIPI_DCS_SET_ADDRESS_MODE, addr_mode);
> +	mipi_dbi_command(mipi, MIPI_DCS_SET_PIXEL_FORMAT,
> +			 MIPI_DCS_PIXEL_FMT_16BIT);
> +	mipi_dbi_command(mipi, ST7735R_GAMCTRP1, 0x0f, 0x1a, 0x0f, 0x18, 0x2f,
> +			 0x28, 0x20, 0x22, 0x1f, 0x1b, 0x23, 0x37, 0x00, 0x07,
> +			 0x02, 0x10);
> +	mipi_dbi_command(mipi, ST7735R_GAMCTRN1, 0x0f, 0x1b, 0x0f, 0x17, 0x33,
> +			 0x2c, 0x29, 0x2e, 0x30, 0x30, 0x39, 0x3f, 0x00, 0x07,
> +			 0x03, 0x10);
> +	mipi_dbi_command(mipi, MIPI_DCS_SET_DISPLAY_ON);
> +
> +	msleep(100);
> +
> +	mipi_dbi_command(mipi, MIPI_DCS_ENTER_NORMAL_MODE);
> +
> +	msleep(10);

Please use 20ms here to avoid warning:

-:168: WARNING: msleep < 20ms can sleep for up to 20ms; see 
Documentation/timers/timers-howto.txt
#168: FILE: drivers/gpu/drm/tinydrm/st7735r.c:107:
+       msleep(10);

> +
> +	mipi->enabled = true;
> +
> +	if (fb)
> +		fb->funcs->dirty(fb, NULL, 0, 0, NULL, 0);
> +
> +	tinydrm_enable_backlight(mipi->backlight);

The previous lines can be replaced with:

     mipi_dbi_pipe_enable(pipe, crtc_state);

I want us to use helpers as much as possible, and in this case the
flushing will be reworked in the future so less places to touch when
that happens.

> +}
> +
> +static void st7735r_pipe_disable(struct drm_simple_display_pipe *pipe)
> +{
> +	struct tinydrm_device *tdev = pipe_to_tinydrm(pipe);
> +	struct mipi_dbi *mipi = mipi_dbi_from_tinydrm(tdev);
> +

Please use mipi_dbi_pipe_disable() here.

> +	DRM_DEBUG_KMS("\n");
> +
> +	if (!mipi->enabled)
> +		return;
> +
> +	tinydrm_disable_backlight(mipi->backlight);
> +
> +	mipi_dbi_command(mipi, MIPI_DCS_SET_DISPLAY_OFF);

You turn off the panel, have you checked what it looks like if you don't
turn off backlight (which is optional in this driver)?

On the displays I have tried this on, all pixels turn white when they're
not driven, letting backlight through, giving an all white display.
That's why I have that blanking code in mipi_dbi_pipe_disable() when we
don't have backlight control and the reason I don't turn off the panel.
The power savings of not driving the panel is negligible AFAICR.

If you don't need DISPLAY_OFF, you can just use mipi_dbi_pipe_disable()
directly as the callback.

Noralf.

> +
> +	mipi->enabled = false;
> +}
> +
> +static const struct drm_simple_display_pipe_funcs st7735r_pipe_funcs = {
> +	.enable		= st7735r_pipe_enable,
> +	.disable	= st7735r_pipe_disable,
> +	.update		= tinydrm_display_pipe_update,
> +	.prepare_fb	= tinydrm_display_pipe_prepare_fb,
> +};
> +
> +static const struct drm_display_mode st7735r_mode = {
> +	TINYDRM_MODE(128, 160, 28, 35),
> +};
> +
> +DEFINE_DRM_GEM_CMA_FOPS(st7735r_fops);
> +
> +static struct drm_driver st7735r_driver = {
> +	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME |
> +				  DRIVER_ATOMIC,
> +	.fops			= &st7735r_fops,
> +	TINYDRM_GEM_DRIVER_OPS,
> +	.lastclose		= tinydrm_lastclose,
> +	.name			= "st7735r",
> +	.desc			= "Sitronix ST7735R",
> +	.date			= "20171128",
> +	.major			= 1,
> +	.minor			= 0,
> +};
> +
> +static const struct of_device_id st7735r_of_match[] = {
> +	{ .compatible = "sitronix,st7735r-jd-t18003-t01" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, st7735r_of_match);
> +
> +static const struct spi_device_id st7735r_id[] = {
> +	{ "st7735r-jd-t18003-t01", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(spi, st7735r_id);
> +
> +static int st7735r_probe(struct spi_device *spi)
> +{
> +	struct device *dev = &spi->dev;
> +	struct mipi_dbi *mipi;
> +	struct gpio_desc *dc;
> +	u32 rotation = 0;
> +	int ret;
> +
> +	mipi = devm_kzalloc(dev, sizeof(*mipi), GFP_KERNEL);
> +	if (!mipi)
> +		return -ENOMEM;
> +
> +	mipi->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(mipi->reset)) {
> +		DRM_DEV_ERROR(dev, "Failed to get gpio 'reset'\n");
> +		return PTR_ERR(mipi->reset);
> +	}
> +
> +	dc = devm_gpiod_get(dev, "dc", GPIOD_OUT_LOW);
> +	if (IS_ERR(dc)) {
> +		DRM_DEV_ERROR(dev, "Failed to get gpio 'dc'\n");
> +		return PTR_ERR(dc);
> +	}
> +
> +	mipi->backlight = tinydrm_of_find_backlight(dev);
> +	if (IS_ERR(mipi->backlight))
> +		return PTR_ERR(mipi->backlight);
> +
> +	device_property_read_u32(dev, "rotation", &rotation);
> +
> +	ret = mipi_dbi_spi_init(spi, mipi, dc);
> +	if (ret)
> +		return ret;
> +
> +	ret = mipi_dbi_init(&spi->dev, mipi, &st7735r_pipe_funcs,
> +			    &st7735r_driver, &st7735r_mode, rotation);
> +	if (ret)
> +		return ret;
> +
> +	spi_set_drvdata(spi, mipi);
> +
> +	return devm_tinydrm_register(&mipi->tinydrm);
> +}
> +
> +static void st7735r_shutdown(struct spi_device *spi)
> +{
> +	struct mipi_dbi *mipi = spi_get_drvdata(spi);
> +
> +	tinydrm_shutdown(&mipi->tinydrm);
> +}
> +
> +static struct spi_driver st7735r_spi_driver = {
> +	.driver = {
> +		.name = "st7735r",
> +		.owner = THIS_MODULE,
> +		.of_match_table = st7735r_of_match,
> +	},
> +	.id_table = st7735r_id,
> +	.probe = st7735r_probe,
> +	.shutdown = st7735r_shutdown,
> +};
> +module_spi_driver(st7735r_spi_driver);
> +
> +MODULE_DESCRIPTION("Sitronix ST7735R DRM driver");
> +MODULE_AUTHOR("David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>");
> +MODULE_LICENSE("GPL");

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
