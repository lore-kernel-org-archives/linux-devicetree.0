Return-Path: <SRS0=C5ln=FY=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:40008 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1163939AbeCBCRM (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 1 Mar 2018 21:17:12 -0500
Subject: Re: [PATCH v7 3/4 - variant 2] drm: rcar-du: Fix legacy DT to create
 LVDS encoder nodes
References: <20180301220540.11959-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180301220540.11959-5-laurent.pinchart+renesas@ideasonboard.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <0a229b8b-7034-3c41-4008-30c2a2bf945b@gmail.com>
Date: Thu, 1 Mar 2018 18:17:10 -0800
MIME-Version: 1.0
In-Reply-To: <20180301220540.11959-5-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 03/01/18 14:05, Laurent Pinchart wrote:
> The internal LVDS encoders now have their own DT bindings. Before
> switching the driver infrastructure to those new bindings, implement
> backward-compatibility through live DT patching.
> 
> Patching is disabled and will be enabled along with support for the new
> DT bindings in the DU driver.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> Changes since v6:
> 
> - Use of_overlay_fdt_apply()
> 
> Changes since v5:
> 
> - Use a private copy of rcar_du_of_changeset_add_property()
> 
> Changes since v3:
> 
> - Use the OF changeset API
> - Use of_graph_get_endpoint_by_regs()
> - Replace hardcoded constants by sizeof()
> 
> Changes since v2:
> 
> - Update the SPDX headers to use C-style comments in header files
> - Removed the manually created __local_fixups__ node
> - Perform manual fixups on live DT instead of overlay
> 
> Changes since v1:
> 
> - Select OF_FLATTREE
> - Compile LVDS DT bindings patch code when DRM_RCAR_LVDS is selected
> - Update the SPDX headers to use GPL-2.0 instead of GPL-2.0-only
> - Turn __dtb_rcar_du_of_lvds_(begin|end) from u8 to char
> - Pass void begin and end pointers to rcar_du_of_get_overlay()
> - Use of_get_parent() instead of accessing the parent pointer directly
> - Find the LVDS endpoints nodes based on the LVDS node instead of the
>   root of the overlay
> - Update to the <soc>-lvds compatible string format
> ---
>  drivers/gpu/drm/rcar-du/Kconfig                    |   2 +
>  drivers/gpu/drm/rcar-du/Makefile                   |   7 +-
>  drivers/gpu/drm/rcar-du/rcar_du_of.c               | 321 +++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_of.h               |  20 ++
>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts    |  79 +++++
>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts    |  53 ++++
>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts    |  53 ++++
>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts    |  53 ++++
>  .../gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts    |  53 ++++
>  9 files changed, 640 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.c
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of.h
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7790.dts
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7791.dts
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7793.dts
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7795.dts
>  create mode 100644 drivers/gpu/drm/rcar-du/rcar_du_of_lvds_r8a7796.dts
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index 5d0b4b7119af..3f83352a7313 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -22,6 +22,8 @@ config DRM_RCAR_LVDS
>  	bool "R-Car DU LVDS Encoder Support"
>  	depends on DRM_RCAR_DU
>  	select DRM_PANEL
> +	select OF_FLATTREE
> +	select OF_OVERLAY
>  	help
>  	  Enable support for the R-Car Display Unit embedded LVDS encoders.
>  
> diff --git a/drivers/gpu/drm/rcar-du/Makefile b/drivers/gpu/drm/rcar-du/Makefile
> index 0cf5c11030e8..86b337b4be5d 100644
> --- a/drivers/gpu/drm/rcar-du/Makefile
> +++ b/drivers/gpu/drm/rcar-du/Makefile
> @@ -8,7 +8,12 @@ rcar-du-drm-y := rcar_du_crtc.o \
>  		 rcar_du_plane.o
>  
>  rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_lvdsenc.o
> -
> +rcar-du-drm-$(CONFIG_DRM_RCAR_LVDS)	+= rcar_du_of.o \
> +					   rcar_du_of_lvds_r8a7790.dtb.o \
> +					   rcar_du_of_lvds_r8a7791.dtb.o \
> +					   rcar_du_of_lvds_r8a7793.dtb.o \
> +					   rcar_du_of_lvds_r8a7795.dtb.o \
> +					   rcar_du_of_lvds_r8a7796.dtb.o
>  rcar-du-drm-$(CONFIG_DRM_RCAR_VSP)	+= rcar_du_vsp.o
>  
>  obj-$(CONFIG_DRM_RCAR_DU)		+= rcar-du-drm.o
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_of.c b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> new file mode 100644
> index 000000000000..4e3376c64dfd
> --- /dev/null
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * rcar_du_of.c - Legacy DT bindings compatibility
> + *
> + * Copyright (C) 2018 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> + *
> + * Based on work from Jyri Sarha <jsarha@ti.com>
> + * Copyright (C) 2015 Texas Instruments
> + */
> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_graph.h>
> +#include <linux/slab.h>
> +
> +#include "rcar_du_crtc.h"
> +#include "rcar_du_drv.h"
> +
> +/* -----------------------------------------------------------------------------
> + * Generic Overlay Handling
> + */
> +
> +struct rcar_du_of_overlay {
> +	const char *compatible;
> +	void *begin;
> +	void *end;
> +};
> +
> +#define RCAR_DU_OF_DTB(type, soc)					\
> +	extern char __dtb_rcar_du_of_##type##_##soc##_begin[];		\
> +	extern char __dtb_rcar_du_of_##type##_##soc##_end[]
> +
> +#define RCAR_DU_OF_OVERLAY(type, soc)					\
> +	{								\
> +		.compatible = "renesas,du-" #soc,			\
> +		.begin = __dtb_rcar_du_of_##type##_##soc##_begin,	\
> +		.end = __dtb_rcar_du_of_##type##_##soc##_end,		\
> +	}
> +
> +static int __init rcar_du_of_apply_overlay(const struct rcar_du_of_overlay *dtbs,
> +					   const char *compatible)
> +{
> +	const struct rcar_du_of_overlay *dtb = NULL;
> +	unsigned int i;
> +	int ovcs_id;
> +
> +	for (i = 0; dtbs[i].compatible; ++i) {
> +		if (!strcmp(dtbs[i].compatible, compatible)) {
> +			dtb = &dtbs[i];
> +			break;
> +		}
> +	}
> +
> +	if (!dtb)
> +		return -ENODEV;
> +
> +	ovcs_id = 0;
> +	return of_overlay_fdt_apply(dtb->begin, &ovcs_id);

	return of_overlay_fdt_apply(dtb->begin, dtb->end - dtb->begin, &ovcs_id);



For version 5 of my patch series I added an FDT size argument, as you
suggested.


Reviewed-by: Frank Rowand <frank.rowand@sony.com>
