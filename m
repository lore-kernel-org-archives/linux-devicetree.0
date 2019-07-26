From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/3] drm/bridge: Add NWL MIPI DSI host controller support
Date: Fri, 26 Jul 2019 12:08:17 +0200
Message-ID: <20190726100817.GB9754@ravnborg.org>
References: <cover.1563983037.git.agx@sigxcpu.org>
 <3158f4f8c97c21f98c394e5631d74bc60d796522.1563983037.git.agx@sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3158f4f8c97c21f98c394e5631d74bc60d796522.1563983037.git.agx@sigxcpu.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>, Lee Jones <lee.jones@linaro.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Guido.

Following some trivial comments.
As for the overall design I already commented on that in the binding.
(bridge versus display controller)
That it can work on top of mxsfb is a good indication that it is a
bridge but I just do not see the full picture.

In general the code looked clean and neat.

On Wed, Jul 24, 2019 at 05:52:26PM +0200, Guido Günther wrote:
> This adds initial support for the NWL MIPI DSI Host controller found on
> i.MX8 SoCs.
> 
> It adds support for the i.MX8MQ but the same IP can be found on
> e.g. the i.MX8QXP.
> 
> It has been tested on the Librem 5 devkit using mxsfb.

Looking at mxsfb I wonder hw this was done, as there seems to be no
bridge support in mxsfb. Using a patched version of mxsfb?


> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 4934fcf5a6f8..904a9eb3a20a 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -16,4 +16,5 @@ obj-$(CONFIG_DRM_ANALOGIX_DP) += analogix/
>  obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511/
>  obj-$(CONFIG_DRM_TI_SN65DSI86) += ti-sn65dsi86.o
>  obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
> +obj-y += imx-nwl/
obj-$(ONFIG_DRM_IMX_NWL_DSI) += imx-nwl/?
So we do not visit the directory unless required.

> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx-nwl/Makefile
> @@ -0,0 +1,2 @@
> +imx-nwl-objs := nwl-drv.o nwl-dsi.o

The preferred syntax is
imx-nwl-y := nwl-drv.o nwl-dsi.o

See for example Makefile for mxsfb.

Consider to introduce
header-test-y += nwl-drv.h nwl-dsi.h

So we at build time check that the headers are self-contained.
(they include what they need).


> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/irq.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mfd/syscon/imx8mq-iomuxc-gpr.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/phy/phy.h>
> +#include <linux/regmap.h>
> +#include <linux/sys_soc.h>
> +#include <video/videomode.h>
> +
> +#include "nwl-drv.h"
> +#include "nwl-dsi.h"

The most typical order of include files are:

#include <linux/*>

#include <video/*>

#include <drm/*>

#include ""

With the empty lines in-between each block.
And sorted like is already done here.

This in general for all the files for this driver.

> +
> +static bool
> +imx_nwl_dsi_bridge_mode_fixup(struct drm_bridge *bridge,
> +			      const struct drm_display_mode *mode,
> +			      struct drm_display_mode *adjusted_mode)
> +{
> +	struct imx_nwl_dsi *dsi = bridge_to_dsi(bridge);
> +	struct device *dev = dsi->dev;
> +	union phy_configure_opts new_cfg;
> +	unsigned long phy_ref_rate;
> +	int ret;
> +
> +	ret = nwl_dsi_get_dphy_params(dsi, adjusted_mode, &new_cfg);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * If hs clock is unchanged, we're all good - all parameters are
> +	 * derived from it atm.
> +	 */
> +	if (new_cfg.mipi_dphy.hs_clk_rate == dsi->phy_cfg.mipi_dphy.hs_clk_rate)
> +		return true;
> +
> +	phy_ref_rate = clk_get_rate(dsi->phy_ref_clk);
> +	DRM_DEV_DEBUG_DRIVER(dev, "PHY at ref rate: %lu\n", phy_ref_rate);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dsi->dev,
> +			      "Cannot setup PHY for mode: %ux%u @%d Hz\n",
> +			      adjusted_mode->hdisplay, adjusted_mode->vdisplay,
> +			      adjusted_mode->clock);
> +		DRM_DEV_ERROR(dsi->dev, "PHY ref clk: %lu, bit clk: %lu\n",
> +			      phy_ref_rate, new_cfg.mipi_dphy.hs_clk_rate);
> +	} else {
> +		/* Save the new desired phy config */
> +		memcpy(&dsi->phy_cfg, &new_cfg, sizeof(new_cfg));
> +	}
> +
> +	/* LCDIF + NWL needs active high sync */
> +	adjusted_mode->flags |= (DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
> +	adjusted_mode->flags &= ~(DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
> +
> +	drm_display_mode_to_videomode(adjusted_mode, &dsi->vm);

Hmm, the videomode is just another representation of data already
included in display_mode.
And, as a personal itch, I consider videomode as something that belongs
in the old fb drivers, and not drm drivers. But that may be me only.


	Sam
