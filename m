From: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 03/11] drm: add driver for simple vga encoders
Date: Mon, 23 Mar 2015 21:54:07 +0100
Message-ID: <2913851.5ZpddhQmSu@phil>
References: <1422721984-27782-1-git-send-email-heiko@sntech.de> <10479896.3hQzemuBRM@avalon> <21277731.pHgJosY13N@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <21277731.pHgJosY13N@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Laurent,

Am Samstag, 28. Februar 2015, 01:42:45 schrieb Heiko St=FCbner:
> thanks for the comments
>=20
> Am Donnerstag, 26. Februar 2015, 20:33:33 schrieb Laurent Pinchart:
> > On Saturday 31 January 2015 17:32:56 Heiko Stuebner wrote:
> > > There exist simple vga encoders without any type of management in=
terface
> > > and just maybe a simple gpio for turning it on or off. Examples f=
or
> > > these
> > > are the Analog Devices ADV7123, Chipsea CS7123 or Micronas SDA712=
3.
> > >=20
> > > Add a generic encoder driver for those that can be used by drm dr=
ivers
> > > using the component framework.
> >=20
> > The rcar-du driver already handles the adi,adv7123 compatible strin=
g used
> > by this driver. A generic driver is in my opinion a very good idea,=
 but
> > we can't break the existing support. Porting the rcar-du driver to =
the
> > component model is needed.
>=20
> is this in someones plans already? Because I'm still having trouble
> understanding parts of the rockchip driver sometimes, so feel in no w=
ay
> qualified to try to get this tackled in some reasonable timeframe :-)

currently my idea is to simply do something like the following for this=
 :-)

static const struct of_device_id rcar_du_of_table[] =3D {
	{ .compatible =3D "renesas,du-r8a7779" },
	{ .compatible =3D "renesas,du-r8a7790" },
	{ .compatible =3D "renesas,du-r8a7791" },
	{ }
};

static int __init vga_encoder_init(void)
{
	struct device_node *np;

	/*
	 * Play nice with rcar-du that is having its own implementation
	 * of the adv7123 binding implementation and is not yet
	 * converted to using components.
	 */
	np =3D of_find_matching_node(NULL, rcar_du_of_table);
	if (np) {
		of_node_put(np);
		return 0;
	}

	return platform_driver_register(&vga_encoder_driver);
}


slightly similar to what some iommus do


> > > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > > ---
> > >=20
> > >  drivers/gpu/drm/i2c/Kconfig      |   6 +
> > >  drivers/gpu/drm/i2c/Makefile     |   2 +
> > >  drivers/gpu/drm/i2c/vga-simple.c | 325
> > >  ++++++++++++++++++++++++++++++++++++
> >=20
> > drivers/gpu/drm/i2c/ feels wrong for a platform device.
>=20
> yep, i2c probably being the wrong place was one of the caveats in the=
 cover
> letter and I was hoping some more seasoned drm people could suggest w=
here
> this should live after all.
>=20
> As your comments further down suggest that we might introduce some di=
fferent
> components, simply congregate them in a "components" subdir or someth=
ing
> splitting them more?

so does a "components" subdir look reasonable?


> > >  3 files changed, 333 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/i2c/vga-simple.c
> > >=20
> > > diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kc=
onfig
> > > index 22c7ed6..319f2cb 100644
> > > --- a/drivers/gpu/drm/i2c/Kconfig
> > > +++ b/drivers/gpu/drm/i2c/Kconfig
> > > @@ -31,4 +31,10 @@ config DRM_I2C_NXP_TDA998X
> > >=20
> > >  	help
> > >  =09
> > >  	  Support for NXP Semiconductors TDA998X HDMI encoders.
> > >=20
> > > +config DRM_VGA_SIMPLE
> > > +	tristate "Generic simple vga encoder"
> > > +	help
> > > +	  Support for vga encoder chips without any special settings
> > > +	  and at most a power-control gpio.
> > > +
> > >=20
> > >  endmenu
> > >=20
> > > diff --git a/drivers/gpu/drm/i2c/Makefile b/drivers/gpu/drm/i2c/M=
akefile
> > > index 2c72eb5..858961f 100644
> > > --- a/drivers/gpu/drm/i2c/Makefile
> > > +++ b/drivers/gpu/drm/i2c/Makefile
> > > @@ -10,3 +10,5 @@ obj-$(CONFIG_DRM_I2C_SIL164) +=3D sil164.o
> > >=20
> > >  tda998x-y :=3D tda998x_drv.o
> > >  obj-$(CONFIG_DRM_I2C_NXP_TDA998X) +=3D tda998x.o
> > >=20
> > > +
> > > +obj-$(CONFIG_DRM_VGA_SIMPLE) +=3D vga-simple.o
> > > diff --git a/drivers/gpu/drm/i2c/vga-simple.c
> > > b/drivers/gpu/drm/i2c/vga-simple.c new file mode 100644
> > > index 0000000..bb9d19c
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/i2c/vga-simple.c
> > > @@ -0,0 +1,325 @@
> > > +/*
> > > + * Simple vga encoder driver
> > > + *
> > > + * Copyright (C) 2014 Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > > + *
> > > + * This software is licensed under the terms of the GNU General =
Public
> > > + * License version 2, as published by the Free Software Foundati=
on, and
> > > + * may be copied, distributed, and modified under those terms.
> > > + *
> > > + * This program is distributed in the hope that it will be usefu=
l,
> > > + * but WITHOUT ANY WARRANTY; without even the implied warranty o=
f
> > > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > > + * GNU General Public License for more details.
> > > + */
> > > +
> > > +#include <linux/module.h>
> > > +#include <linux/component.h>
> > > +#include <linux/gpio.h>
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/i2c.h>
> > > +#include <linux/regulator/consumer.h>
> > > +#include <drm/drm_of.h>
> > > +#include <drm/drmP.h>
> > > +#include <drm/drm_crtc.h>
> > > +#include <drm/drm_crtc_helper.h>
> > > +#include <drm/drm_edid.h>
> > > +
> > > +#define connector_to_vga_simple(x) container_of(x, struct vga_si=
mple,
> > > connector) +#define encoder_to_vga_simple(x) container_of(x, stru=
ct
> > > vga_simple, encoder) +
> > > +struct vga_simple {
> > > +	struct drm_connector connector;
> > > +	struct drm_encoder encoder;
> > > +
> > > +	struct device *dev;
> > > +	struct i2c_adapter *ddc;
> > > +
> > > +	struct regulator *vaa_reg;
> > > +	struct gpio_desc *enable_gpio;
> > > +
> > > +	struct mutex enable_lock;
> > > +	bool enabled;
> > > +};
> > > +
> > > +/*
> > > + * Connector functions
> > > + */
> > > +
> > > +enum drm_connector_status vga_simple_detect(struct drm_connector
> > > *connector, +					    bool force)
> > > +{
> > > +	struct vga_simple *vga =3D connector_to_vga_simple(connector);
> > > +
> > > +	if (!vga->ddc)
> > > +		return connector_status_unknown;
> > > +
> > > +	if (drm_probe_ddc(vga->ddc))
> > > +		return connector_status_connected;
> > > +
> > > +	return connector_status_disconnected;
> > > +}
> > > +
> > > +void vga_simple_connector_destroy(struct drm_connector *connecto=
r)
> > > +{
> > > +	drm_connector_unregister(connector);
> > > +	drm_connector_cleanup(connector);
> > > +}
> > > +
> > > +struct drm_connector_funcs vga_simple_connector_funcs =3D {
> > > +	.dpms =3D drm_helper_connector_dpms,
> > > +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> > > +	.detect =3D vga_simple_detect,
> > > +	.destroy =3D vga_simple_connector_destroy,
> > > +};
> > > +
> > > +/*
> > > + * Connector helper functions
> > > + */
> > > +
> > > +static int vga_simple_connector_get_modes(struct drm_connector
> > > *connector)
> > > +{
> > > +	struct vga_simple *vga =3D connector_to_vga_simple(connector);
> > > +	struct edid *edid;
> > > +	int ret =3D 0;
> > > +
> > > +	if (!vga->ddc)
> > > +		return 0;
> > > +
> > > +	edid =3D drm_get_edid(connector, vga->ddc);
> > > +	if (edid) {
> > > +		drm_mode_connector_update_edid_property(connector, edid);
> > > +		ret =3D drm_add_edid_modes(connector, edid);
> > > +		kfree(edid);
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int vga_simple_connector_mode_valid(struct drm_connector
> > > *connector, +					struct drm_display_mode *mode)
> > > +{
> > > +	return MODE_OK;
> > > +}
> > > +
> > > +static struct drm_encoder
> > > +*vga_simple_connector_best_encoder(struct drm_connector *connect=
or)
> > > +{
> > > +	struct vga_simple *vga =3D connector_to_vga_simple(connector);
> > > +
> > > +	return &vga->encoder;
> > > +}
> > > +
> > > +static struct drm_connector_helper_funcs
> > > vga_simple_connector_helper_funcs
> > > =3D { +	.get_modes =3D vga_simple_connector_get_modes,
> > > +	.best_encoder =3D vga_simple_connector_best_encoder,
> > > +	.mode_valid =3D vga_simple_connector_mode_valid,
> > > +};
> > > +
> > > +/*
> > > + * Encoder functions
> > > + */
> > > +
> > > +static void vga_simple_encoder_destroy(struct drm_encoder *encod=
er)
> > > +{
> > > +	drm_encoder_cleanup(encoder);
> > > +}
> > > +
> > > +static const struct drm_encoder_funcs vga_simple_encoder_funcs =3D=
 {
> > > +	.destroy =3D vga_simple_encoder_destroy,
> > > +};
> > > +
> > > +/*
> > > + * Encoder helper functions
> > > + */
> > > +
> > > +static void vga_simple_encoder_dpms(struct drm_encoder *encoder,=
 int
> > > mode)
> > > +{
> > > +	struct vga_simple *vga =3D encoder_to_vga_simple(encoder);
> > > +
> > > +	mutex_lock(&vga->enable_lock);
> > > +
> > > +	switch (mode) {
> > > +	case DRM_MODE_DPMS_ON:
> > > +		if (vga->enabled)
> > > +			goto out;
> > > +
> > > +		if (!IS_ERR(vga->vaa_reg))
> > > +			regulator_enable(vga->vaa_reg);
> > > +
> > > +		if (vga->enable_gpio)
> > > +			gpiod_set_value(vga->enable_gpio, 1);
> > > +
> > > +		vga->enabled =3D true;
> > > +		break;
> > > +	case DRM_MODE_DPMS_STANDBY:
> > > +	case DRM_MODE_DPMS_SUSPEND:
> > > +	case DRM_MODE_DPMS_OFF:
> > > +		if (!vga->enabled)
> > > +			goto out;
> > > +
> > > +		if (vga->enable_gpio)
> > > +			gpiod_set_value(vga->enable_gpio, 0);
> > > +
> > > +		if (!IS_ERR(vga->vaa_reg))
> > > +			regulator_enable(vga->vaa_reg);
> > > +
> > > +		vga->enabled =3D false;
> > > +		break;
> > > +	default:
> > > +		break;
> > > +	}
> > > +
> > > +out:
> > > +	mutex_unlock(&vga->enable_lock);
> > > +}
> > > +
> > > +static bool vga_simple_mode_fixup(struct drm_encoder *encoder,
> > > +				  const struct drm_display_mode *mode,
> > > +				  struct drm_display_mode *adjusted_mode)
> > > +{
> > > +	return true;
> > > +}
> > > +
> > > +static void vga_simple_encoder_prepare(struct drm_encoder *encod=
er)
> > > +{
> > > +}
> > > +
> > > +static void vga_simple_encoder_mode_set(struct drm_encoder *enco=
der,
> > > +					struct drm_display_mode *mode,
> > > +					struct drm_display_mode *adjusted_mode)
> > > +{
> > > +}
> > > +
> > > +static void vga_simple_encoder_commit(struct drm_encoder *encode=
r)
> > > +{
> > > +	vga_simple_encoder_dpms(encoder, DRM_MODE_DPMS_ON);
> > > +}
> > > +
> > > +static void vga_simple_encoder_disable(struct drm_encoder *encod=
er)
> > > +{
> > > +	vga_simple_encoder_dpms(encoder, DRM_MODE_DPMS_OFF);
> > > +}
> > > +
> > > +static const struct drm_encoder_helper_funcs
> > > vga_simple_encoder_helper_funcs =3D {
> > > +	.dpms =3D vga_simple_encoder_dpms,
> > > +	.mode_fixup =3D vga_simple_mode_fixup,
> > > +	.prepare =3D vga_simple_encoder_prepare,
> > > +	.mode_set =3D vga_simple_encoder_mode_set,
> > > +	.commit =3D vga_simple_encoder_commit,
> > > +	.disable =3D vga_simple_encoder_disable,
> >=20
> > this is interesting. Some users of this encoder (I'm thinking about
> > rcar-du, for which I've just posted the patches) are already ported=
 to
> > atomic updates, while others are not. How can we support both ?
>=20
> Wild guess, support both in such generic components and let bind deci=
de
> which to use ... is there some sort of drm_is_atomic() against the ma=
ster
> device.

my hope here is that till I am finished with my part, the atomic conver=
sion=20
will have turned up "magically" :-)


> > > +};
> > > +
> > > +/*
> > > + * Component helper functions
> > > + */
> > > +
> > > +static int vga_simple_bind(struct device *dev, struct device *ma=
ster,
> > > +				 void *data)
> > > +{
> > > +	struct platform_device *pdev =3D to_platform_device(dev);
> > > +	struct drm_device *drm =3D data;
> > > +
> > > +	struct device_node *ddc_node, *np =3D pdev->dev.of_node;
> > > +	struct vga_simple *vga;
> > > +	int ret;
> > > +
> > > +	if (!np)
> > > +		return -ENODEV;
> > > +
> > > +	vga =3D devm_kzalloc(dev, sizeof(*vga), GFP_KERNEL);
> > > +	if (!vga)
> > > +		return -ENOMEM;
> > > +
> > > +	vga->dev =3D dev;
> > > +	dev_set_drvdata(dev, vga);
> > > +	mutex_init(&vga->enable_lock);
> > > +
> > > +	vga->enable_gpio =3D devm_gpiod_get_optional(dev, "enable",
> > > +						   GPIOD_OUT_LOW);
> > > +	if (IS_ERR(vga->enable_gpio)) {
> > > +		ret =3D PTR_ERR(vga->enable_gpio);
> > > +		dev_err(dev, "failed to request GPIO: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	vga->enabled =3D false;
> > > +
> > > +	ddc_node =3D of_parse_phandle(np, "ddc-i2c-bus", 0);
> > > +	if (ddc_node) {
> > > +		vga->ddc =3D of_find_i2c_adapter_by_node(ddc_node);
> > > +		of_node_put(ddc_node);
> > > +		if (!vga->ddc) {
> > > +			dev_dbg(vga->dev, "failed to read ddc node\n");
> > > +			return -EPROBE_DEFER;
> > > +		}
> > > +	} else {
> > > +		dev_dbg(vga->dev, "no ddc property found\n");
> > > +	}
> > > +
> > > +	vga->vaa_reg =3D devm_regulator_get_optional(dev, "vaa");
> > > +
> > > +	vga->encoder.possible_crtcs =3D drm_of_find_possible_crtcs(drm,=
 np);
> > > +	vga->encoder.of_node =3D np;
> > > +	vga->connector.polled =3D DRM_CONNECTOR_POLL_CONNECT |
> > > +				DRM_CONNECTOR_POLL_DISCONNECT;
> > > +
> > > +	drm_encoder_helper_add(&vga->encoder,
>=20
> &vga_simple_encoder_helper_funcs);
>=20
> > > +	drm_encoder_init(drm, &vga->encoder, &vga_simple_encoder_funcs,
> > > +			 DRM_MODE_ENCODER_DAC);
> > > +
> > > +	drm_connector_helper_add(&vga->connector,
> > > +				 &vga_simple_connector_helper_funcs);
> >=20
> > I really dislike this, this is an encoder driver, not a connector d=
river.
> > It shouldn't be responsible for creating the connector. For all it =
knows,
> > there might not even be a VGA connector connected to the encoder, V=
GA
> > signals could be sent to a chained encoder. That might be a bit
> > far-fetched in the VGA case, but in the generic case encoder driver=
s
> > shouldn't create connectors.
>=20
> ok, so you suggest to have this split. Taking into account Rob's comm=
ent
> probably a "simple-encoder" and a "ddc-connector" for connectors usin=
g
> system i2c busses? And then connect everything via ports.

having them separate actually looks quite interesting, so definitly no =
argument=20
from me against doing a "vga-encoder" and "vga-connector" driver using =
the=20
already established bindings.


Heiko
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
