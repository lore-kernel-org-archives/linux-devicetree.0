From: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm: bridge: sil902x
Date: Wed, 16 Mar 2016 14:14:25 +0100
Message-ID: <56E95C31.8070703@atmel.com>
References: <1452079551-30914-1-git-send-email-boris.brezillon@free-electrons.com>
 <1452083126-18211-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452083126-18211-1-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Le 06/01/2016 13:25, Boris Brezillon a =E9crit :
> Add basic support for the sil902x RGB -> HDMI bridge.
> This driver does not support audio output yet.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

You can add my:
Tested-by: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>

I tested it on a SAMA5D4 Xplained board with a Dell HDMI monitor.

Thanks, bye.


> ---
> Hello,
>=20
> This patch is only adding basic support for the sil9022 chip.
> As stated in the commit log, there's no audio support, but the
> driver also hardcodes a lot of things (like the RGB input format to
> use).
> There are two reasons for this:
> 1/ the DRM framework does not allow for advanced link description
>    between an encoder and a bridge (that's for the RGB format
>    limitation). Any idea how this should be described?
>=20
> 2/ I don't have the datasheet of this HDMI encoder, and all logic
>    has been extracted from those two drivers [1][2], which means
>    I may miss some important things in my encoder setup.
>=20
> Another thing I find weird in the drm_bridge interface is the fact
> that we have a ->attach() method, but no ->detach(), which can be
> a problem if we allow drm bridges and KMS drivers to be compiled as
> modules. Any reason for that?
>=20
> That's all for the questions part :-).
>=20
> Best Regards,
>=20
> Boris
>=20
> Changes in v2:
> - fix errors reported by kbuild test robot
>=20
> ---
>  drivers/gpu/drm/bridge/Kconfig   |   8 +
>  drivers/gpu/drm/bridge/Makefile  |   1 +
>  drivers/gpu/drm/bridge/sil902x.c | 491 +++++++++++++++++++++++++++++=
++++++++++
>  3 files changed, 500 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/sil902x.c
>=20
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/=
Kconfig
> index 27e2022..9701fd2 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -40,4 +40,12 @@ config DRM_PARADE_PS8622
>  	---help---
>  	  Parade eDP-LVDS bridge chip driver.
> =20
> +config DRM_SIL902X
> +	tristate "Silicon Image sil902x RGB/HDMI bridge"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	select REGMAP_I2C
> +	---help---
> +	  Silicon Image sil902x bridge chip driver.
> +
>  endmenu
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge=
/Makefile
> index f13c33d..a689aad 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -4,3 +4,4 @@ obj-$(CONFIG_DRM_DW_HDMI) +=3D dw-hdmi.o
>  obj-$(CONFIG_DRM_DW_HDMI_AHB_AUDIO) +=3D dw-hdmi-ahb-audio.o
>  obj-$(CONFIG_DRM_NXP_PTN3460) +=3D nxp-ptn3460.o
>  obj-$(CONFIG_DRM_PARADE_PS8622) +=3D parade-ps8622.o
> +obj-$(CONFIG_DRM_SIL902X) +=3D sil902x.o
> diff --git a/drivers/gpu/drm/bridge/sil902x.c b/drivers/gpu/drm/bridg=
e/sil902x.c
> new file mode 100644
> index 0000000..2657031
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/sil902x.c
> @@ -0,0 +1,491 @@
> +/*
> + * Copyright (C) 2014 Atmel
> + *		      Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> + *
> + * Authors:	      Bo Shen <voice.shen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> + *		      Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> + *		      Wu, Songjun <Songjun.Wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
> + *
> + *
> + * Copyright (C) 2010-2011 Freescale Semiconductor, Inc. All Rights =
Reserved.
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/component.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drmP.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_crtc_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_encoder_slave.h>
> +
> +#define SIL902X_TPI_VIDEO_DATA			0x0
> +
> +#define SIL902X_TPI_PIXEL_REPETITION		0x8
> +#define SIL902X_TPI_AVI_PIXEL_REP_BUS_24BIT     BIT(5)
> +#define SIL902X_TPI_AVI_PIXEL_REP_RISING_EDGE   BIT(4)
> +#define SIL902X_TPI_AVI_PIXEL_REP_4X		3
> +#define SIL902X_TPI_AVI_PIXEL_REP_2X		1
> +#define SIL902X_TPI_AVI_PIXEL_REP_NONE		0
> +#define SIL902X_TPI_CLK_RATIO_HALF		(0 << 6)
> +#define SIL902X_TPI_CLK_RATIO_1X		(1 << 6)
> +#define SIL902X_TPI_CLK_RATIO_2X		(2 << 6)
> +#define SIL902X_TPI_CLK_RATIO_4X		(3 << 6)
> +
> +#define SIL902X_TPI_AVI_IN_FORMAT		0x9
> +#define SIL902X_TPI_AVI_INPUT_BITMODE_12BIT	BIT(7)
> +#define SIL902X_TPI_AVI_INPUT_DITHER		BIT(6)
> +#define SIL902X_TPI_AVI_INPUT_RANGE_LIMITED	(2 << 2)
> +#define SIL902X_TPI_AVI_INPUT_RANGE_FULL	(1 << 2)
> +#define SIL902X_TPI_AVI_INPUT_RANGE_AUTO	(0 << 2)
> +#define SIL902X_TPI_AVI_INPUT_COLORSPACE_BLACK	(3 << 0)
> +#define SIL902X_TPI_AVI_INPUT_COLORSPACE_YUV422	(2 << 0)
> +#define SIL902X_TPI_AVI_INPUT_COLORSPACE_YUV444	(1 << 0)
> +#define SIL902X_TPI_AVI_INPUT_COLORSPACE_RGB	(0 << 0)
> +
> +#define SIL902X_TPI_AVI_INFOFRAME		0x0c
> +
> +#define SIL902X_SYS_CTRL_DATA			0x1a
> +#define SIL902X_SYS_CTRL_PWR_DWN		BIT(4)
> +#define SIL902X_SYS_CTRL_AV_MUTE		BIT(3)
> +#define SIL902X_SYS_CTRL_DDC_BUS_REQ		BIT(2)
> +#define SIL902X_SYS_CTRL_DDC_BUS_GRTD		BIT(1)
> +#define SIL902X_SYS_CTRL_OUTPUT_MODE		BIT(0)
> +#define SIL902X_SYS_CTRL_OUTPUT_HDMI		1
> +#define SIL902X_SYS_CTRL_OUTPUT_DVI		0
> +
> +#define SIL902X_REG_CHIPID(n)			(0x1b + (n))
> +
> +#define SIL902X_PWR_STATE_CTRL			0x1e
> +#define SIL902X_AVI_POWER_STATE_MSK		GENMASK(1, 0)
> +#define SIL902X_AVI_POWER_STATE_D(l)		((l) & SIL902X_AVI_POWER_STATE=
_MSK)
> +
> +#define SI902X_INT_ENABLE			0x3c
> +#define SI902X_INT_STATUS			0x3d
> +#define SI902X_HOTPLUG_EVENT			BIT(0)
> +#define SI902X_PLUGGED_STATUS			BIT(2)
> +
> +#define SIL902X_REG_TPI_RQB			0xc7
> +
> +struct sil902x {
> +	struct i2c_client *i2c;
> +	struct regmap *regmap;
> +	struct drm_bridge bridge;
> +	struct drm_connector connector;
> +	struct gpio_desc *reset_gpio;
> +	struct work_struct hotplug_work;
> +};
> +
> +static inline struct sil902x *bridge_to_sil902x(struct drm_bridge *b=
ridge)
> +{
> +	return container_of(bridge, struct sil902x, bridge);
> +}
> +
> +static inline struct sil902x *connector_to_sil902x(struct drm_connec=
tor *con)
> +{
> +	return container_of(con, struct sil902x, connector);
> +}
> +
> +static void sil902x_reset(struct sil902x *sil902x)
> +{
> +	gpiod_set_value(sil902x->reset_gpio, 1);
> +
> +	msleep(100);
> +
> +	gpiod_set_value(sil902x->reset_gpio, 0);
> +}
> +
> +static void sil902x_connector_destroy(struct drm_connector *connecto=
r)
> +{
> +	drm_connector_unregister(connector);
> +	drm_connector_cleanup(connector);
> +}
> +
> +static enum drm_connector_status
> +sil902x_connector_detect(struct drm_connector *connector, bool force=
)
> +{
> +	struct sil902x *sil902x =3D connector_to_sil902x(connector);
> +	unsigned int status;
> +
> +	regmap_read(sil902x->regmap, SI902X_INT_STATUS, &status);
> +
> +	return (status & SI902X_PLUGGED_STATUS) ?
> +	       connector_status_connected : connector_status_disconnected;
> +}
> +
> +static const struct drm_connector_funcs sil902x_atomic_connector_fun=
cs =3D {
> +	.dpms =3D drm_atomic_helper_connector_dpms,
> +	.detect =3D sil902x_connector_detect,
> +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> +	.destroy =3D sil902x_connector_destroy,
> +	.reset =3D drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_s=
tate,
> +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state=
,
> +};
> +
> +static const struct drm_connector_funcs sil902x_connector_funcs =3D =
{
> +	.dpms =3D drm_atomic_helper_connector_dpms,
> +	.detect =3D sil902x_connector_detect,
> +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> +	.destroy =3D sil902x_connector_destroy,
> +};
> +
> +static int sil902x_get_modes(struct drm_connector *connector)
> +{
> +	struct sil902x *sil902x =3D connector_to_sil902x(connector);
> +	struct regmap *regmap =3D sil902x->regmap;
> +	u32 bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
> +	unsigned int status;
> +	struct edid *edid;
> +	int num =3D 0;
> +	int ret;
> +	int i;
> +
> +	ret =3D regmap_update_bits(regmap, SIL902X_PWR_STATE_CTRL,
> +				 SIL902X_AVI_POWER_STATE_MSK,
> +				 SIL902X_AVI_POWER_STATE_D(2));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(regmap, SIL902X_SYS_CTRL_DATA,
> +			   SIL902X_SYS_CTRL_OUTPUT_HDMI |
> +			   SIL902X_SYS_CTRL_PWR_DWN);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(regmap, SIL902X_SYS_CTRL_DATA,
> +				 SIL902X_SYS_CTRL_DDC_BUS_REQ,
> +				 SIL902X_SYS_CTRL_DDC_BUS_REQ);
> +	if (ret)
> +		return ret;
> +
> +	i =3D 0;
> +	do {
> +		ret =3D regmap_read(regmap, SIL902X_SYS_CTRL_DATA, &status);
> +		if (ret)
> +			return ret;
> +		i++;
> +	} while (!(status & SIL902X_SYS_CTRL_DDC_BUS_GRTD));
> +
> +	ret =3D regmap_write(regmap, SIL902X_SYS_CTRL_DATA, status);
> +	if (ret)
> +		return ret;
> +
> +	edid =3D drm_get_edid(connector, sil902x->i2c->adapter);
> +	drm_mode_connector_update_edid_property(connector, edid);
> +	if (edid) {
> +		num +=3D drm_add_edid_modes(connector, edid);
> +		kfree(edid);
> +	}
> +
> +	ret =3D drm_display_info_set_bus_formats(&connector->display_info,
> +					       &bus_format, 1);
> +	if (ret)
> +		return ret;
> +
> +	regmap_read(regmap, SIL902X_SYS_CTRL_DATA, &status);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_update_bits(regmap, SIL902X_SYS_CTRL_DATA,
> +				 SIL902X_SYS_CTRL_DDC_BUS_REQ |
> +				 SIL902X_SYS_CTRL_DDC_BUS_GRTD, 0);
> +	if (ret)
> +		return ret;
> +
> +	i =3D 0;
> +	do {
> +		ret =3D regmap_read(regmap, SIL902X_SYS_CTRL_DATA, &status);
> +		if (ret)
> +			return ret;
> +		i++;
> +	} while (status & (SIL902X_SYS_CTRL_DDC_BUS_REQ |
> +			   SIL902X_SYS_CTRL_DDC_BUS_GRTD));
> +
> +	return num;
> +}
> +
> +static enum drm_mode_status sil902x_mode_valid(struct drm_connector =
*connector,
> +					       struct drm_display_mode *mode)
> +{
> +	/* TODO: check mode */
> +
> +	return MODE_OK;
> +}
> +
> +static struct drm_encoder *sil902x_best_encoder(struct drm_connector=
 *connector)
> +{
> +	struct sil902x *sil902x =3D connector_to_sil902x(connector);
> +
> +	return sil902x->bridge.encoder;
> +}
> +
> +static const struct drm_connector_helper_funcs sil902x_connector_hel=
per_funcs =3D {
> +	.get_modes =3D sil902x_get_modes,
> +	.mode_valid =3D sil902x_mode_valid,
> +	.best_encoder =3D sil902x_best_encoder,
> +};
> +
> +static void sil902x_bridge_disable(struct drm_bridge *bridge)
> +{
> +	struct sil902x *sil902x =3D bridge_to_sil902x(bridge);
> +
> +	regmap_update_bits(sil902x->regmap, SIL902X_SYS_CTRL_DATA,
> +			   SIL902X_SYS_CTRL_PWR_DWN,
> +			   SIL902X_SYS_CTRL_PWR_DWN);
> +}
> +
> +static void sil902x_bridge_enable(struct drm_bridge *bridge)
> +{
> +	struct sil902x *sil902x =3D bridge_to_sil902x(bridge);
> +
> +	regmap_update_bits(sil902x->regmap, SIL902X_PWR_STATE_CTRL,
> +			   SIL902X_AVI_POWER_STATE_MSK,
> +			   SIL902X_AVI_POWER_STATE_D(0));
> +	regmap_update_bits(sil902x->regmap, SIL902X_SYS_CTRL_DATA,
> +			   SIL902X_SYS_CTRL_PWR_DWN, 0);
> +}
> +
> +static void sil902x_bridge_mode_set(struct drm_bridge *bridge,
> +				    struct drm_display_mode *mode,
> +				    struct drm_display_mode *adj)
> +{
> +	u8 buf[HDMI_INFOFRAME_HEADER_SIZE + HDMI_AVI_INFOFRAME_SIZE];
> +	struct sil902x *sil902x =3D bridge_to_sil902x(bridge);
> +	struct regmap *regmap =3D sil902x->regmap;
> +	struct hdmi_avi_infoframe frame;
> +	int ret;
> +
> +	buf[0] =3D adj->clock;
> +	buf[1] =3D adj->clock >> 8;
> +	buf[2] =3D adj->vrefresh;
> +	buf[3] =3D 0x00;
> +	buf[4] =3D adj->hdisplay;
> +	buf[5] =3D adj->hdisplay >> 8;
> +	buf[6] =3D adj->vdisplay;
> +	buf[7] =3D adj->vdisplay >> 8;
> +	buf[8] =3D SIL902X_TPI_CLK_RATIO_1X | SIL902X_TPI_AVI_PIXEL_REP_NON=
E |
> +		 SIL902X_TPI_AVI_PIXEL_REP_BUS_24BIT;
> +	buf[9] =3D SIL902X_TPI_AVI_INPUT_RANGE_AUTO |
> +		 SIL902X_TPI_AVI_INPUT_COLORSPACE_RGB;
> +
> +	ret =3D regmap_bulk_write(regmap, SIL902X_TPI_VIDEO_DATA, buf, 10);
> +	if (ret)
> +		return;
> +
> +	ret =3D drm_hdmi_avi_infoframe_from_display_mode(&frame, adj);
> +	if (ret < 0) {
> +		DRM_ERROR("couldn't fill AVI infoframe\n");
> +		return;
> +	}
> +
> +	ret =3D hdmi_avi_infoframe_pack(&frame, buf, sizeof(buf));
> +	if (ret < 0) {
> +		DRM_ERROR("failed to pack AVI infoframe: %zd\n", ret);
> +		return;
> +	}
> +
> +	/* Do not send the infoframe header, but keep the CRC field. */
> +	regmap_bulk_write(regmap, SIL902X_TPI_AVI_INFOFRAME,
> +			  buf + HDMI_INFOFRAME_HEADER_SIZE - 1,
> +			  HDMI_AVI_INFOFRAME_SIZE + 1);
> +}
> +
> +static int sil902x_bridge_attach(struct drm_bridge *bridge)
> +{
> +	const struct drm_connector_funcs *funcs =3D &sil902x_connector_func=
s;
> +	struct sil902x *sil902x =3D bridge_to_sil902x(bridge);
> +	struct drm_device *drm =3D bridge->dev;
> +	int ret;
> +
> +	drm_connector_helper_add(&sil902x->connector,
> +				 &sil902x_connector_helper_funcs);
> +
> +	if (drm_core_check_feature(drm, DRIVER_ATOMIC))
> +		funcs =3D &sil902x_atomic_connector_funcs;
> +
> +	ret =3D drm_connector_init(drm, &sil902x->connector, funcs,
> +				 DRM_MODE_CONNECTOR_HDMIA);
> +	if (ret)
> +		return ret;
> +
> +	if (sil902x->i2c->irq > 0)
> +		sil902x->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
> +	else
> +		sil902x->connector.polled =3D DRM_CONNECTOR_POLL_CONNECT;
> +
> +	drm_mode_connector_attach_encoder(&sil902x->connector, bridge->enco=
der);
> +
> +	return 0;
> +}
> +
> +static void sil902x_bridge_nop(struct drm_bridge *bridge)
> +{
> +}
> +
> +static const struct drm_bridge_funcs sil902x_bridge_funcs =3D {
> +	.attach =3D sil902x_bridge_attach,
> +	.mode_set =3D sil902x_bridge_mode_set,
> +	.disable =3D sil902x_bridge_disable,
> +	.post_disable =3D sil902x_bridge_nop,
> +	.pre_enable =3D sil902x_bridge_nop,
> +	.enable =3D sil902x_bridge_enable,
> +};
> +
> +static const struct regmap_range sil902x_volatile_ranges[] =3D {
> +	{ .range_min =3D 0, .range_max =3D 0xff },
> +};
> +
> +static const struct regmap_access_table sil902x_volatile_table =3D {
> +	.yes_ranges =3D sil902x_volatile_ranges,
> +	.n_yes_ranges =3D ARRAY_SIZE(sil902x_volatile_ranges),
> +};
> +
> +static const struct regmap_config sil902x_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.volatile_table =3D &sil902x_volatile_table,
> +	.cache_type =3D REGCACHE_NONE,
> +};
> +
> +static irqreturn_t sil902x_interrupt(int irq, void *data)
> +{
> +	struct sil902x *sil902x =3D data;
> +	unsigned int status =3D 0;
> +
> +	regmap_read(sil902x->regmap, SI902X_INT_STATUS, &status);
> +	regmap_write(sil902x->regmap, SI902X_INT_STATUS, status);
> +
> +	if ((status & SI902X_HOTPLUG_EVENT) && sil902x->bridge.dev)
> +		drm_helper_hpd_irq_event(sil902x->bridge.dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int sil902x_probe(struct i2c_client *client,
> +			 const struct i2c_device_id *id)
> +{
> +	struct device *dev =3D &client->dev;
> +	unsigned int status =3D 0;
> +	struct sil902x *sil902x;
> +	u8 chipid[4];
> +	int ret;
> +
> +	sil902x =3D devm_kzalloc(dev, sizeof(*sil902x), GFP_KERNEL);
> +	if (!sil902x)
> +		return -ENOMEM;
> +
> +	sil902x->i2c =3D client;
> +	sil902x->regmap =3D devm_regmap_init_i2c(client, &sil902x_regmap_co=
nfig);
> +	if (IS_ERR(sil902x->regmap))
> +		return PTR_ERR(sil902x->regmap);
> +
> +	sil902x->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW)=
;
> +	if (IS_ERR(sil902x->reset_gpio)) {
> +		dev_err(dev, "Failed to retrieve/request reset gpio: %ld\n",
> +			PTR_ERR(sil902x->reset_gpio));
> +		return PTR_ERR(sil902x->reset_gpio);
> +	}
> +
> +	sil902x_reset(sil902x);
> +
> +	ret =3D regmap_write(sil902x->regmap, SIL902X_REG_TPI_RQB, 0x0);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_bulk_read(sil902x->regmap, SIL902X_REG_CHIPID(0),
> +			       &chipid, 4);
> +	if (ret) {
> +		dev_err(dev, "regmap_read failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (chipid[0] !=3D 0xb0) {
> +		dev_err(dev, "Invalid chipid: %02x (expecting 0xb0)\n",
> +			chipid[0]);
> +		return -EINVAL;
> +	}
> +
> +	/* Clear all pending interrupts */
> +	regmap_read(sil902x->regmap, SI902X_INT_STATUS, &status);
> +	regmap_write(sil902x->regmap, SI902X_INT_STATUS, status);
> +
> +	if (client->irq > 0) {
> +		regmap_write(sil902x->regmap, SI902X_INT_ENABLE,
> +			     SI902X_HOTPLUG_EVENT);
> +
> +		ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +						sil902x_interrupt,
> +						IRQF_ONESHOT, dev_name(dev),
> +						sil902x);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	sil902x->bridge.funcs =3D &sil902x_bridge_funcs;
> +	sil902x->bridge.of_node =3D dev->of_node;
> +	ret =3D drm_bridge_add(&sil902x->bridge);
> +	if (ret) {
> +		dev_err(dev, "Failed to add drm_bridge\n");
> +		return ret;
> +	}
> +
> +	i2c_set_clientdata(client, sil902x);
> +
> +	return 0;
> +}
> +
> +static int sil902x_remove(struct i2c_client *client)
> +
> +{
> +	struct sil902x *sil902x =3D i2c_get_clientdata(client);
> +
> +	drm_bridge_remove(&sil902x->bridge);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_OF
> +static const struct of_device_id sil902x_dt_ids[] =3D {
> +	{ .compatible =3D "sil,sil9022", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, sil902x_dt_ids);
> +#endif
> +
> +static const struct i2c_device_id sil902x_i2c_ids[] =3D {
> +	{ "sil9022", 0 },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(i2c, sil902x_i2c_ids);
> +
> +static struct i2c_driver sil902x_driver =3D {
> +	.probe =3D sil902x_probe,
> +	.remove =3D sil902x_remove,
> +	.driver =3D {
> +		.name =3D "sil902x",
> +		.of_match_table =3D of_match_ptr(sil902x_dt_ids),
> +	},
> +	.id_table =3D sil902x_i2c_ids,
> +};
> +module_i2c_driver(sil902x_driver);
> +
> +MODULE_AUTHOR("Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>"=
);
> +MODULE_DESCRIPTION("SIL902x RGB -> HDMI bridges");
> +MODULE_LICENSE("GPL");
>=20


--=20
Nicolas Ferre
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
