From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf-L59+Z2yzLopAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] drm/tinydrm: add driver for ST7735R panels
Date: Mon, 11 Dec 2017 22:18:58 +0100
Message-ID: <1d6124f3-613f-45b4-1862-aad7453239e6@tronnes.org>
References: <1512943833-31352-1-git-send-email-david@lechnology.com>
 <1512943833-31352-3-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1512943833-31352-3-git-send-email-david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: limor-6aDhHjTmHzzR7s880joybQ@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


Den 10.12.2017 23.10, skrev David Lechner:
> This adds a new driver for Sitronix ST7735R display panels.
>
> This has been tested using an Adafruit 1.8" TFT.
>
> Signed-off-by: David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>
> ---

> +static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
> +				struct drm_crtc_state *crtc_state)
> +{
> +	struct tinydrm_device *tdev = pipe_to_tinydrm(pipe);
> +	struct mipi_dbi *mipi = mipi_dbi_from_tinydrm(tdev);
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
> +	msleep(20);
> +
> +	mipi_dbi_pipe_enable(pipe, crtc_state);
> +}
> +
> +static const struct drm_simple_display_pipe_funcs st7735r_pipe_funcs = {
> +	.enable		= st7735r_pipe_enable,
> +	.disable	= mipi_dbi_pipe_disable,
> +	.update		= tinydrm_display_pipe_update,
> +	.prepare_fb	= tinydrm_display_pipe_prepare_fb,
> +};
> +
> +static const struct drm_display_mode st7735r_mode = {
> +	TINYDRM_MODE(128, 160, 28, 35),
> +};

This naming talk has made me realise that these should be named after
the panel since they're not generic controller functions.
Maybe the mode can be generic, not sure if the physical size can/will
differ, the resolution is very likely to be the same for all.

What's your view on my descision to split the MIPI DBI compatible
controllers into per controller drivers instead of having one driver
that supports them all?
I've been afraid that it will be a very big file with macro definitions
per controller and enable functions per panel.

This driver has 15 macros and ~80 panel specific lines.
With one panel supported, half the driver is boilerplate.
The mi0283qt panel (MIPI DBI compatible) is in the same ballpark.

Adding helpers for panel reset/exit_sleep, for MIPI_DCS_SET_ADDRESS_MODE
and for display_on/enter_normal/flush could cut it down some more if we
made one driver to rule them all. Maybe the enable function per panel
could be cut in half that way.

I'm starting to wonder if one driver isn't such a bad solution after all...

Noralf.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
