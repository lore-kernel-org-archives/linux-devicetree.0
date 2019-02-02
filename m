From: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH v2 2/2] drm/panel: Add driver for Samsung S6E63M0 panel
Date: Sat, 02 Feb 2019 15:27:06 +0100
Message-ID: <2172951.fb1UFt6Zc6@acerlaptop>
References: <20190201172852.4944-1-pawel.mikolaj.chmiel@gmail.com> <20190201172852.4944-2-pawel.mikolaj.chmiel@gmail.com> <20190201213607.GA27951@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190201213607.GA27951@ravnborg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: thierry.reding@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org, krzk@kernel.org, robh+dt@kernel.org, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

On pi=C4=85tek, 1 lutego 2019 22:36:07 CET Sam Ravnborg wrote:
> Hi Pawe=C5=82
>=20
> Looks good, thanks for addressing all the review feedback.
>=20
> On Fri, Feb 01, 2019 at 06:28:52PM +0100, Pawe=C5=82 Chmiel wrote:
> > This patch adds Samsung S6E63M0 AMOLED LCD panel driver, connected over
> > spi. It's based on already removed, non dt s6e63m0 driver and
> > panel-samsung-ld9040. It can be found for example in some of Samsung
> > Aries based phones.
> >=20
> > Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> If you consider (do not change unless you think it better) the
> following nits than you can add my:
>=20
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>=20
> 	Sam
>=20
> > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kcon=
fig
> > index 3f3537719beb..be05ed5218eb 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -158,6 +158,13 @@ config DRM_PANEL_SAMSUNG_S6E63J0X03
> >  	depends on BACKLIGHT_CLASS_DEVICE
> >  	select VIDEOMODE_HELPERS
> > =20
> > +config DRM_PANEL_SAMSUNG_S6E63M0
> > +	tristate "Samsung S6E63M0 RGB/SPI panel"
> > +	depends on OF
> > +	depends on SPI
> > +	depends on BACKLIGHT_CLASS_DEVICE
> > +	select VIDEOMODE_HELPERS
> With the use of display_mode the above "select VIDEOMODE_HELPERS"
> is likely no longer required. Please check.
Confirmed that it's not needed now.
>=20
> A help text would be nice.
Simple help text added.
>=20
> > +
> >  config DRM_PANEL_SAMSUNG_S6E8AA0
> >  	tristate "Samsung S6E8AA0 DSI video mode panel"
> >  	depends on OF
>=20
>=20
> > +#include <video/of_videomode.h>
> > +#include <video/videomode.h>
> Please check if these two files are required.
Removed.
>=20
> > +struct s6e63m0 {
> > +	struct device *dev;
> > +	struct drm_panel panel;
> > +	struct backlight_device *bl_dev;
> > +
> > +	struct regulator_bulk_data supplies[2];
> > +	struct gpio_desc *reset_gpio;
> > +	struct videomode vm;
> vm is no longer used - delete it.
Removed.
>=20
> > +
> > +	bool prepared;
> > +	bool enabled;
> > +
> > +	/*
> > +	 * This field is tested by functions directly accessing bus before
> > +	 * transfer, transfer is skipped if it is set. In case of transfer
> > +	 * failure or unexpected response the field is set to error value.
> > +	 * Such construct allows to eliminate many checks in higher level
> > +	 * functions.
> > +	 */
> > +	int error;
> > +};
> > +
>=20
> > +static int s6e63m0_get_modes(struct drm_panel *panel)
> > +{
> > +	struct drm_connector *connector =3D panel->connector;
> > +	struct drm_display_mode *mode;
> > +
> > +	mode =3D drm_mode_duplicate(panel->drm, &default_mode);
> > +	if (!mode) {
> > +		DRM_ERROR("failed to add mode %ux%ux@%u\n",
> > +			  default_mode.hdisplay, default_mode.vdisplay,
> > +			  default_mode.vrefresh);
> I recall I have seen a generic way to print the above,
> but I have failed to find it.
> Maybe it is just my memory that fools me.
>=20
> The above is fine.
>=20
> > +
> > +	s6e63m0_backlight_register(ctx);
>=20
> Is it correct that we continue even if we fail to register backlight?
=46ixed, now errors are handled and it's called before adding drm panel,=20
so we won't do this if there will be any error during backlight setup.
>=20
>=20
> > +
> > +	return 0;
> > +}
> > +
> > +
> > +static const struct of_device_id s6e63m0_of_match[] =3D {
> > +	{ .compatible =3D "samsung,s6e63m0" },
> > +	{ }
>=20
> Add /* sentinel */ comment?
Added
>=20
> > +};
>=20
>=20
I'll be sending v3 version with all issues fixed. It would be nice to have =
this tested on Samsung Goni.
Thanks for all comments
