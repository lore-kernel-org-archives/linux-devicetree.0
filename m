From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 1/7] drm/bridge: move ANA78xx driver to analogix
 subdirectory
Date: Wed, 12 Jun 2019 12:16:54 +0200
Message-ID: <5617d9f2-9935-eec6-748b-02cd00450d76@samsung.com>
References: <20190604122150.29D6468B05@newverein.lst.de>
        <CGME20190604122320epcas3p3bdb18dc38aaad91e8c132625649db9ba@epcas3p3.samsung.com>
        <20190604122251.676BF68B05@newverein.lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604122251.676BF68B05@newverein.lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Torsten Duwe <duwe@lst.de>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Sean Paul <seanpaul@chromium.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Harald Geyer <harald@ccbib.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 04.06.2019 14:22, Torsten Duwe wrote:
> From: Icenowy Zheng <icenowy@aosc.io>
>
> As ANA78xx chips are designed and produced by Analogix Semiconductor,
> Inc, move their driver codes into analogix subdirectory.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Torsten Duwe <duwe@suse.de>
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej
> ---
>  drivers/gpu/drm/bridge/Kconfig                           | 10 ----------
>  drivers/gpu/drm/bridge/Makefile                          |  4 ++--
>  drivers/gpu/drm/bridge/analogix/Kconfig                  | 10 ++++++++++
>  drivers/gpu/drm/bridge/analogix/Makefile                 |  1 +
>  drivers/gpu/drm/bridge/{ => analogix}/analogix-anx78xx.c |  0
>  drivers/gpu/drm/bridge/{ => analogix}/analogix-anx78xx.h |  0
>  6 files changed, 13 insertions(+), 12 deletions(-)
>  rename drivers/gpu/drm/bridge/{ => analogix}/analogix-anx78xx.c (100%)
>  rename drivers/gpu/drm/bridge/{ => analogix}/analogix-anx78xx.h (100%)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index ee777469293a..862789bf64a0 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -16,16 +16,6 @@ config DRM_PANEL_BRIDGE
>  menu "Display Interface Bridges"
>  	depends on DRM && DRM_BRIDGE
>  
> -config DRM_ANALOGIX_ANX78XX
> -	tristate "Analogix ANX78XX bridge"
> -	select DRM_KMS_HELPER
> -	select REGMAP_I2C
> -	---help---
> -	  ANX78XX is an ultra-low Full-HD SlimPort transmitter
> -	  designed for portable devices. The ANX78XX transforms
> -	  the HDMI output of an application processor to MyDP
> -	  or DisplayPort.
> -
>  config DRM_CDNS_DSI
>  	tristate "Cadence DPI/DSI bridge"
>  	select DRM_KMS_HELPER
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 4934fcf5a6f8..a6c7dd7727ea 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
>  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
>  obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
>  obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
> @@ -12,8 +11,9 @@ obj-$(CONFIG_DRM_SII9234) += sii9234.o
>  obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358767) += tc358767.o
> -obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix/
>  obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
>  obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
>  obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
> +
> +obj-y += analogix/
>  obj-y += synopsys/
> diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
> index e930ff9b5cd4..704fb0f41dc3 100644
> --- a/drivers/gpu/drm/bridge/analogix/Kconfig
> +++ b/drivers/gpu/drm/bridge/analogix/Kconfig
> @@ -1,4 +1,14 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +config DRM_ANALOGIX_ANX78XX
> +	tristate "Analogix ANX78XX bridge"
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	help
> +	  ANX78XX is an ultra-low Full-HD SlimPort transmitter
> +	  designed for portable devices. The ANX78XX transforms
> +	  the HDMI output of an application processor to MyDP
> +	  or DisplayPort.
> +
>  config DRM_ANALOGIX_DP
>  	tristate
>  	depends on DRM
> diff --git a/drivers/gpu/drm/bridge/analogix/Makefile b/drivers/gpu/drm/bridge/analogix/Makefile
> index fdbf3fd2f087..6fcbfd3ee560 100644
> --- a/drivers/gpu/drm/bridge/analogix/Makefile
> +++ b/drivers/gpu/drm/bridge/analogix/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  analogix_dp-objs := analogix_dp_core.o analogix_dp_reg.o
> +obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
>  obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix_dp.o
> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> similarity index 100%
> rename from drivers/gpu/drm/bridge/analogix-anx78xx.c
> rename to drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.h b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.h
> similarity index 100%
> rename from drivers/gpu/drm/bridge/analogix-anx78xx.h
> rename to drivers/gpu/drm/bridge/analogix/analogix-anx78xx.h
