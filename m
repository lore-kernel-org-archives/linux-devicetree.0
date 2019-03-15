From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/6] drm/bridge: Add Chipone ICN6211
 MIPI-DSI/RGB convertor bridge
Date: Fri, 15 Mar 2019 14:33:04 +0100
Message-ID: <20190315133304.vzwy3tbw27e6lum3@flea>
References: <20190315130825.9005-1-jagan@amarulasolutions.com>
 <20190315130825.9005-6-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ir35vyjoqc5slvyq"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBF6TV3SAKGQE7ENFYNI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190315130825.9005-6-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ir35vyjoqc5slvyq
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Mar 15, 2019 at 06:38:24PM +0530, Jagan Teki wrote:
> ICN6211 is MIPI-DSI/RGB converter bridge from chipone.
> It has a flexible configuration of MIPI DSI signal input
> and produce RGB565, RGB666, RGB888 output format.
> 
> Add bridge driver for it.
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  MAINTAINERS                              |   6 +
>  drivers/gpu/drm/bridge/Kconfig           |  10 +
>  drivers/gpu/drm/bridge/Makefile          |   1 +
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 275 +++++++++++++++++++++++
>  4 files changed, 292 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/chipone-icn6211.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4de80222cffb..e529addd30f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4897,6 +4897,12 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  S:	Maintained
>  F:	drivers/gpu/drm/bochs/
>  
> +DRM DRIVER FOR CHIPONE ICN6211 MIPI-DSI to RGB CONVERTOR BRIDGE
> +M:	Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> +S:	Maintained
> +F:	drivers/gpu/drm/bridge/chipone-icn6211.c
> +F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.txt
> +
>  DRM DRIVER FOR FARADAY TVE200 TV ENCODER
>  M:	Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 8840f396a7b6..cd314572e4ed 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -36,6 +36,16 @@ config DRM_CDNS_DSI
>  	  Support Cadence DPI to DSI bridge. This is an internal
>  	  bridge and is meant to be directly embedded in a SoC.
>  
> +config DRM_CHIPONE_ICN6211
> +	tristate "Chipone ICN6211 MIPI-DSI/RGB converter bridge"
> +	depends on DRM && DRM_PANEL
> +	depends on OF
> +	select DRM_MIPI_DSI
> +	help
> +	  ICN6211 is MIPI-DSI/RGB converter bridge from chipone.
> +	  It has a flexible configuration of MIPI DSI signal input
> +	  and produce RGB565, RGB666, RGB888 output format.
> +
>  config DRM_DUMB_VGA_DAC
>  	tristate "Dumb VGA DAC Bridge support"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 4934fcf5a6f8..541fdccad10b 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_DRM_ANALOGIX_ANX78XX) += analogix-anx78xx.o
>  obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
> +obj-$(CONFIG_DRM_CHIPONE_ICN6211) += chipone-icn6211.o
>  obj-$(CONFIG_DRM_DUMB_VGA_DAC) += dumb-vga-dac.o
>  obj-$(CONFIG_DRM_LVDS_ENCODER) += lvds-encoder.o
>  obj-$(CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW) += megachips-stdpxxxx-ge-b850v3-fw.o
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> new file mode 100644
> index 000000000000..cd2f3505f845
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2018 Amarula Solutions
> + * Author: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> + */
> +
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_mipi_dsi.h>
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of_graph.h>
> +
> +#define ICN6211_INIT_CMD_LEN		2
> +
> +struct chipone {
> +	struct device *dev;
> +	struct drm_bridge bridge;
> +	struct drm_connector connector;
> +	struct drm_panel *panel;
> +
> +	struct gpio_desc *reset;
> +};
> +
> +static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
> +{
> +	return container_of(bridge, struct chipone, bridge);
> +}
> +
> +static inline
> +struct chipone *connector_to_chipone(struct drm_connector *connector)
> +{
> +	return container_of(connector, struct chipone, connector);
> +}
> +
> +struct icn6211_init_cmd {
> +	u8 data[ICN6211_INIT_CMD_LEN];
> +};
> +
> +static const struct icn6211_init_cmd icn6211_init_cmds[] = {
> +	{ .data = { 0x7A, 0xC1 } },
> +	{ .data = { 0x20, 0x20 } },
> +	{ .data = { 0x21, 0xE0 } },
> +	{ .data = { 0x22, 0x13 } },
> +	{ .data = { 0x23, 0x28 } },
> +	{ .data = { 0x24, 0x30 } },
> +	{ .data = { 0x25, 0x28 } },
> +	{ .data = { 0x26, 0x00 } },
> +	{ .data = { 0x27, 0x0D } },
> +	{ .data = { 0x28, 0x03 } },
> +	{ .data = { 0x29, 0x1D } },
> +	{ .data = { 0x34, 0x80 } },
> +	{ .data = { 0x36, 0x28 } },
> +	{ .data = { 0xB5, 0xA0 } },
> +	{ .data = { 0x5C, 0xFF } },
> +	{ .data = { 0x2A, 0x01 } },
> +	{ .data = { 0x56, 0x92 } },
> +	{ .data = { 0x6B, 0x71 } },
> +	{ .data = { 0x69, 0x2B } },
> +	{ .data = { 0x10, 0x40 } },
> +	{ .data = { 0x11, 0x98 } },
> +	{ .data = { 0xB6, 0x20 } },
> +	{ .data = { 0x51, 0x20 } },
> +	{ .data = { 0x09, 0x10 } },
> +};

What are those commands supposed to be? Some of them at least look
pretty standard (and have proper functions):
MIPI_DCS_EXIT_INVERT_MODE, _SET_DISPLAY_ON, _SET_TEAR_OFF, etc.

> +static int chipone_get_modes(struct drm_connector *connector)
> +{
> +	struct chipone *icn = connector_to_chipone(connector);
> +
> +	return drm_panel_get_modes(icn->panel);
> +}
> +
> +static const
> +struct drm_connector_helper_funcs chipone_connector_helper_funcs = {
> +	.get_modes = chipone_get_modes,
> +};
> +
> +static const struct drm_connector_funcs chipone_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.destroy = drm_connector_cleanup,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static void chipone_disable(struct drm_bridge *bridge)
> +{
> +	struct chipone *icn = bridge_to_chipone(bridge);
> +	int ret = drm_panel_disable(bridge_to_chipone(bridge)->panel);
> +
> +	if (ret < 0)
> +		DRM_DEV_ERROR(icn->dev, "error disabling panel (%d)\n", ret);
> +}
> +
> +static void chipone_post_disable(struct drm_bridge *bridge)
> +{
> +	struct chipone *icn = bridge_to_chipone(bridge);
> +	int ret;
> +
> +	ret = drm_panel_unprepare(icn->panel);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(icn->dev, "error unpreparing panel (%d)\n", ret);
> +
> +	msleep(50);
> +
> +	gpiod_set_value(icn->reset, 0);
> +}
> +
> +static void chipone_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct chipone *icn = bridge_to_chipone(bridge);
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(icn->dev);
> +	unsigned int i;
> +	int ret;
> +
> +	gpiod_set_value(icn->reset, 0);
> +	msleep(20);
> +
> +	gpiod_set_value(icn->reset, 1);
> +	msleep(50);
> +
> +	for (i = 0; i < ARRAY_SIZE(icn6211_init_cmds); i++) {
> +		const struct icn6211_init_cmd *cmd = &icn6211_init_cmds[i];
> +
> +		ret = mipi_dsi_generic_write(dsi, cmd->data,
> +					     ICN6211_INIT_CMD_LEN);
> +		if (ret < 0) {
> +			DRM_DEV_ERROR(icn->dev,
> +				      "failed to write cmd %d: %d\n", i, ret);
> +			return;
> +		}
> +	}
> +
> +	ret = drm_panel_prepare(icn->panel);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(icn->dev, "error preparing panel (%d)\n", ret);
> +}
> +
> +static void chipone_enable(struct drm_bridge *bridge)
> +{
> +	struct chipone *icn = bridge_to_chipone(bridge);
> +	int ret = drm_panel_enable(icn->panel);
> +
> +	if (ret < 0)
> +		DRM_DEV_ERROR(icn->dev, "error enabling panel (%d)\n", ret);
> +}
> +
> +static int chipone_attach(struct drm_bridge *bridge)
> +{
> +	struct chipone *icn = bridge_to_chipone(bridge);
> +	struct drm_device *drm = bridge->dev;
> +	int ret;
> +
> +	icn->connector.polled = DRM_CONNECTOR_POLL_HPD;
> +	ret = drm_connector_init(drm, &icn->connector,
> +				 &chipone_connector_funcs,
> +				 DRM_MODE_CONNECTOR_Unknown);

It should be a DRM_MODE_CONNECTOR_DPI connector.

> +	if (ret) {
> +		DRM_ERROR("Failed to initialize connector\n");
> +		return ret;
> +	}
> +
> +	drm_connector_helper_add(&icn->connector,
> +				 &chipone_connector_helper_funcs);
> +	drm_connector_attach_encoder(&icn->connector, bridge->encoder);
> +	drm_panel_attach(icn->panel, &icn->connector);
> +	icn->connector.funcs->reset(&icn->connector);
> +	drm_fb_helper_add_one_connector(drm->fb_helper, &icn->connector);

What do you need that for?

> +	drm_connector_register(&icn->connector);
> +
> +	return 0;
> +}
> +
> +static void chipone_detach(struct drm_bridge *bridge)
> +{
> +	struct chipone *icn = bridge_to_chipone(bridge);
> +	struct drm_device *drm = bridge->dev;
> +
> +	drm_connector_unregister(&icn->connector);
> +	drm_fb_helper_remove_one_connector(drm->fb_helper, &icn->connector);
> +	drm_panel_detach(icn->panel);
> +	icn->panel = NULL;
> +	drm_connector_put(&icn->connector);
> +}
> +
> +static const struct drm_bridge_funcs chipone_bridge_funcs = {
> +	.disable = chipone_disable,
> +	.post_disable = chipone_post_disable,
> +	.enable = chipone_enable,
> +	.pre_enable = chipone_pre_enable,
> +	.attach = chipone_attach,
> +	.detach = chipone_detach,
> +};
> +
> +static int chipone_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct chipone *icn;
> +	int ret;
> +
> +	icn = devm_kzalloc(dev, sizeof(struct chipone), GFP_KERNEL);
> +	if (!icn)
> +		return -ENOMEM;
> +
> +	mipi_dsi_set_drvdata(dsi, icn);
> +
> +	icn->dev = dev;
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
> +
> +	icn->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(icn->reset)) {
> +		DRM_DEV_ERROR(dev, "no reset GPIO pin provided\n");
> +		return PTR_ERR(icn->reset);
> +	}
> +
> +	ret = drm_of_find_panel_or_bridge(icn->dev->of_node, 1, 0,
> +					  &icn->panel, NULL);
> +	if (ret && ret != -EPROBE_DEFER) {
> +		DRM_DEV_ERROR(dev, "failed to find panel (ret = %d)\n", ret);
> +		return ret;
> +	}
> +
> +	icn->bridge.funcs = &chipone_bridge_funcs;
> +	icn->bridge.of_node = dev->of_node;
> +
> +	drm_bridge_add(&icn->bridge);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		drm_bridge_remove(&icn->bridge);
> +		DRM_DEV_ERROR(dev, "failed to attach dsi (ret = %d)\n", ret);
> +	}
> +
> +	return ret;
> +}
> +
> +static int chipone_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct chipone *icn = mipi_dsi_get_drvdata(dsi);
> +
> +	mipi_dsi_detach(dsi);
> +	drm_bridge_remove(&icn->bridge);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id chipone_of_match[] = {
> +	{ .compatible = "bananapi,icn6211" },

This should have your generic compatible listed

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--ir35vyjoqc5slvyq--
