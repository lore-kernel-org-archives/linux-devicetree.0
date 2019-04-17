From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: Add header for the ingenic-drm driver bindings
Date: Wed, 17 Apr 2019 08:47:57 -0500
Message-ID: <CAL_JsqKkYkRQ4jDM9NR_eP4BLaAw=M5f5f5iDYBv4sZGGDzzgA@mail.gmail.com>
References: <20190414200824.28348-1-paul@crapouillou.net> <20190414200824.28348-2-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414200824.28348-2-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, od@zcrc.me, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 14, 2019 at 3:08 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Add macros that can be used with the ingenic,lcd-mode property in the
> devicetree node that corresponds to the ingenic-drm driver.

DRM is a Linuxism.

>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> ---
>
> Notes:
>     v2: No change
>
>     v3: s/_DRM//
>
>  include/dt-bindings/display/ingenic,drm.h | 28 ++++++++++++++++++++++++++++

DRM is a Linuxism...

>  1 file changed, 28 insertions(+)
>  create mode 100644 include/dt-bindings/display/ingenic,drm.h
>
> diff --git a/include/dt-bindings/display/ingenic,drm.h b/include/dt-bindings/display/ingenic,drm.h
> new file mode 100644
> index 000000000000..c749b8c346fc
> --- /dev/null
> +++ b/include/dt-bindings/display/ingenic,drm.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + *  Ingenic JZ47xx KMS driver

Pretty sure this file is not a KMS driver.

> + *
> + *  Copyright (C) 2019, Paul Cercueil <paul@crapouillou.net>
> + */
> +#ifndef __INCLUDE_DT_BINDINGS_DISPLAY_INGENIC_DRM_H__
> +#define __INCLUDE_DT_BINDINGS_DISPLAY_INGENIC_DRM_H__
> +
> +#define JZ_LCD_GENERIC_16BIT                   0
> +#define JZ_LCD_GENERIC_18BIT                   16

We have some generic properties for defining the bus width already.
Plus, in many cases this can be implied by the panel compatible. The
exceptions are cases such as when both the ctrlr and panel support
multiple modes.

> +
> +#define JZ_LCD_SPECIAL_TFT_1                   1
> +#define JZ_LCD_SPECIAL_TFT_2                   2
> +#define JZ_LCD_SPECIAL_TFT_3                   3
> +
> +#define JZ_LCD_NON_INTERLACED_TV_OUT           4
> +#define JZ_LCD_INTERLACED_TV_OUT               6

Wouldn't this be determined by the type of connector (composite vs.
s-video/component)

> +
> +#define JZ_LCD_SINGLE_COLOR_STN                        8
> +#define JZ_LCD_SINGLE_MONOCHROME_STN           9
> +#define JZ_LCD_DUAL_COLOR_STN                  10
> +#define JZ_LCD_DUAL_MONOCHROME_STN             11
> +
> +#define JZ_LCD_8BIT_SERIAL                     12
> +#define JZ_LCD_LCM                             13
> +
> +#endif /* __INCLUDE_DT_BINDINGS_DISPLAY_INGENIC_DRM_H__ */
> --
> 2.11.0
>
