From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH 2/2] drm/panel: Add support for Raydium RM67191 panel driver
Date: Fri, 14 Jun 2019 15:03:15 +0300
Message-ID: <CAEnQRZA0yB8KKU8zcZU1CgPE5x9bYtp_4ESQ+miMkwuYKRkbJQ@mail.gmail.com>
References: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com> <1560513063-24995-3-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560513063-24995-3-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dri-devel@lists.freedesktop.org, Devicetree List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Robert,

Minor comment. See inline:

On Fri, Jun 14, 2019 at 2:52 PM Robert Chiras <robert.chiras@nxp.com> wrote:
>
> This patch adds Raydium RM67191 TFT LCD panel driver (MIPI-DSI
> protocol).
>
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  drivers/gpu/drm/panel/panel-raydium-rm67191.c | 730 ++++++++++++++++++++++++++
>  3 files changed, 740 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm67191.c
>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index d9d931a..8be1ac1 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -159,6 +159,15 @@ config DRM_PANEL_RASPBERRYPI_TOUCHSCREEN
>           Pi 7" Touchscreen.  To compile this driver as a module,
>           choose M here.
>
> +config DRM_PANEL_RAYDIUM_RM67191
> +       tristate "Raydium RM67191 FHD 1080x1920 DSI video mode panel"
> +       depends on OF
> +       depends on DRM_MIPI_DSI
> +       depends on BACKLIGHT_CLASS_DEVICE
> +       help
> +         Say Y here if you want to enable support for Raydium RM67191 FHD
> +         (1080x1920) DSI panel.
> +
>  config DRM_PANEL_RAYDIUM_RM68200
>         tristate "Raydium RM68200 720x1280 DSI video mode panel"
>         depends on OF
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index fb0cb3a..1fc0f68 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_DRM_PANEL_ORISETECH_OTM8009A) += panel-orisetech-otm8009a.o
>  obj-$(CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS) += panel-osd-osd101t2587-53ts.o
>  obj-$(CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00) += panel-panasonic-vvx10f034n00.o
>  obj-$(CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN) += panel-raspberrypi-touchscreen.o
> +obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM67191) += panel-raydium-rm67191.o
>  obj-$(CONFIG_DRM_PANEL_RAYDIUM_RM68200) += panel-raydium-rm68200.o
>  obj-$(CONFIG_DRM_PANEL_ROCKTECH_JH057N00900) += panel-rocktech-jh057n00900.o
>  obj-$(CONFIG_DRM_PANEL_RONBO_RB070D30) += panel-ronbo-rb070d30.o
> diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> new file mode 100644
> index 0000000..75bfb03
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
> @@ -0,0 +1,730 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * i.MX drm driver - Raydium MIPI-DSI panel driver
> + *
> + * Copyright (C) 2017 NXP
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */

Please remove the license text once you already added the SPDX identifier.

Also preferred copyright for NXP is:

Copyright 2019 NXP

So, the file should look like this:

// SPDX-License-Identifier: GPL-2.0
/*
 * i.MX drm driver - Raydium MIPI-DSI panel driver
 *
 * Copyright 2019 NXP
 */
