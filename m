From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel
Date: Wed, 13 Apr 2016 15:49:47 +0200
Message-ID: <20160413134947.GA1492@ulmo.ba.sec>
References: <1460528887-22915-1-git-send-email-simhavcs@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460528887-22915-1-git-send-email-simhavcs@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinay Simha BN <simhavcs@gmail.com>
Cc: Archit Taneja <archit.taneja@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Airlie <airlied@linux.ie>, Jonathan Cameron <jic23@kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Shawn Guo <shawnguo@kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 13, 2016 at 11:58:04AM +0530, Vinay Simha BN wrote:
> Add support for the JDI lt070me05000 WUXGA DSI panel used in
> Nexus 7 2013 devices.
>=20
> Programming sequence for the panel is was originally found in the
> android-msm-flo-3.4-lollipop-release branch from:
>     https://android.googlesource.com/kernel/msm.git
>=20
> And video mode setting is from dsi-panel-jdi-dualmipi1-video.dtsi
> file in:
>     git://codeaurora.org/kernel/msm-3.10.git  LNX.LA.3.6_rb1.27
>=20
> Other fixes folded in were provided
> by Archit Taneja <archit.taneja@gmail.com>
>=20
> Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> [sumit.semwal: Ported to the drm/panel framework]
> Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> [jstultz: Cherry-picked to mainline, folded down other fixes
>  from Vinay and Archit]
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
>  .../bindings/display/panel/jdi,lt070me05000.txt    |  27 +
>  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
>  drivers/gpu/drm/panel/Kconfig                      |  11 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     | 685 +++++++++++++++=
++++++
>  5 files changed, 725 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/jdi,l=
t070me05000.txt
>  create mode 100644 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c

What's the difference between this and the patch you sent earlier? I'm
going to assume that the newer one is the correct patch, so I'll ignore
the previous patch.

> diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070me0=
5000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000=
=2Etxt
> new file mode 100644
> index 0000000..35c5ac7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt

The binding documentation should be a separate patch.

> @@ -0,0 +1,27 @@
> +JDI model LT070ME05000 1920x1200 7" DSI Panel
> +
> +Basic data sheet is at:
> +	http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet
> +
> +This panel has video mode implemented currently in the driver.

That's information irrelevant to the DT binding, since you're presumably
talking about the Linux drm/panel driver, whereas the DT binding is
supposed to specify the description of the panel hardware in OS-agnostic
terms.

> +Required properties:
> +- compatible: should be "jdi,lt070me05000"
> +
> +Optional properties:
> +- power-supply: phandle of the regulator that provides the supply voltage
> +- reset-gpio: phandle of gpio for reset line
> +- backlight: phandle of the backlight device attached to the panel
> +
> +Example:
> +
> +	dsi@54300000 {
> +		panel: panel@0 {
> +			compatible =3D "jdi,lt070me05000";
> +			reg =3D <0>;
> +
> +			power-supply =3D <...>;
> +			reset-gpio =3D <...>;
> +			backlight =3D <...>;
> +		};
> +	};
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Docu=
mentation/devicetree/bindings/vendor-prefixes.txt
> index a580f3e..ec42bb4 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> @@ -130,6 +130,7 @@ invensense	InvenSense Inc.
>  isee	ISEE 2007 S.L.
>  isil	Intersil
>  issi	Integrated Silicon Solutions Inc.
> +jdi	Japan Display Inc.
>  jedec	JEDEC Solid State Technology Association
>  karo	Ka-Ro electronics GmbH
>  keymile	Keymile GmbH

This should be a separate patch as well.

> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 1500ab9..f41690e 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -61,6 +61,17 @@ config DRM_PANEL_SHARP_LQ101R1SX01
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called panel-sharp-lq101r1sx01.
> =20
> +config DRM_PANEL_JDI_LT070ME05000
> +	tristate "JDI LT070ME05000 WUXGA DSI panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y here if you want to enable support for JDI WUXGA DSI video/
> +	  command mode panel as found in Google Nexus 7 (2013) devices.
> +	  The panel has a 1200(RGB)=C3=971920 (WUXGA) resolution and uses
> +	  24 bit RGB per pixel.
> +
>  config DRM_PANEL_SHARP_LS043T1LE01
>  	tristate "Sharp LS043T1LE01 qHD video mode panel"
>  	depends on OF

Please keep these sorted alphabetically. I do realize that the list
isn't sorted quite correctly at the moment, so you may as well leave
this as-is and I'll fix up the order when applying and after fixing
the current ordering.

> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makef=
ile
> index f277eed..e6c6fc8 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -5,3 +5,4 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) +=3D panel-samsung=
-ld9040.o
>  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8aa0.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) +=3D panel-sharp-lq101r1sx01.o
>  obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) +=3D panel-sharp-ls043t1le01.o
> +obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) +=3D panel-jdi-lt070me05000.o

Same here.

> diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu=
/drm/panel/panel-jdi-lt070me05000.c
> new file mode 100644
> index 0000000..051aa1b
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
> @@ -0,0 +1,685 @@
> +/*
> + * Copyright (C) 2015 InforceComputing
> + * Author: Vinay Simha BN <simhavcs@gmail.com>
> + *
> + * Copyright (C) 2015 Linaro Ltd
> + * Author: Sumit Semwal <sumit.semwal@linaro.org>

Should either of those copyright lines include 2016? We're a pretty good
way into 2016, and I'd be surprised if this wasn't touched this year at
all.

> +/*
> + * From internet archives, the panel for Nexus 7 2nd Gen, 2013 model is a
> + * JDI model LT070ME05000, and its data sheet is at:
> + *  http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet
> + */

This comment is oddly placed here above the struct jdi_panel definition.
Perhaps move that information into the header comment?

> +struct jdi_panel {
> +	struct drm_panel base;
> +	struct mipi_dsi_device *dsi;
> +
> +	/* TODO: Add backilght support */

"backlight". Also if this is still TODO, why even have parts of the code
here? Just drop everything that's not used and move that to a follow-up
patch that implements full support.

> +	struct backlight_device *backlight;
> +	struct regulator *supply;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *enable_gpio;
> +	struct gpio_desc *vcc_gpio;
> +
> +	struct regulator *backlit;
> +	struct regulator *lvs7;
> +	struct regulator *avdd;
> +	struct regulator *iovdd;
> +	struct gpio_desc *pwm_gpio;

Most of these resources aren't specified in the device tree binding, so
your driver doesn't properly implement the binding. You'll have to fix
the driver or the binding.

> +
> +	bool prepared;
> +	bool enabled;
> +
> +	const struct drm_display_mode *mode;
> +};
> +
> +static inline struct jdi_panel *to_jdi_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct jdi_panel, base);
> +}
> +
> +static char MCAP[2] =3D {0xB0, 0x00};
> +static char interface_setting_cmd[6] =3D {0xB3, 0x04, 0x08, 0x00, 0x22, =
0x00};
> +static char interface_setting[6] =3D {0xB3, 0x26, 0x08, 0x00, 0x20, 0x00=
};

Please make all of these (and the ones below) arrays of u8, since that's
the type used in the prototype of the function that receives these as
parameters. Also, please use consistent capitalization and a space after
{ and before }.

> +static char interface_ID_setting[2] =3D {0xB4, 0x0C};
> +static char DSI_control[3] =3D {0xB6, 0x3A, 0xD3};
> +
> +static char tear_scan_line[3] =3D {0x44, 0x03, 0x00};

This is a standard DCS command, please turn this into a generic helper
such as mipi_dsi_dcs_set_tear_scanline().

> +/* for fps control, set fps to 60.32Hz */
> +static char LTPS_timing_setting[2] =3D {0xC6, 0x78};
> +static char sequencer_timing_control[2] =3D {0xD6, 0x01};
> +
> +/* set brightness */
> +static char write_display_brightness[] =3D {0x51, 0xFF};

Same here.

> +/* enable LEDPWM pin output, turn on LEDPWM output, turn off pwm dimming=
 */
> +static char write_control_display[] =3D {0x53, 0x24};

And here.

> +/*
> + * choose cabc mode, 0x00(-0%), 0x01(-15%), 0x02(-40%), 0x03(-54%),
> + * disable SRE(sunlight readability enhancement)
> + */
> +static char write_cabc[] =3D {0x55, 0x00};

And here.

> +static int jdi_panel_init(struct jdi_panel *jdi)
> +{
> +	struct mipi_dsi_device *dsi =3D jdi->dsi;
> +	int ret;
> +
> +	dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> +		ret =3D mipi_dsi_dcs_soft_reset(dsi);
> +		if (ret < 0)
> +			return ret;
> +
> +		mdelay(10);

Please don't use mdelay() because it will busy-loop for a very long time
and waste precious CPU cycles. Instead, use usleep_range() for these
cases (or msleep() for durations longer than ~10 ms). Same goes for the
other occurrences below.

> +
> +		ret =3D mipi_dsi_dcs_set_pixel_format(dsi, 0x70);
> +		if (ret < 0)
> +			return ret;

There are symbolic constants for the pixel formats, use them to convey
meaning.

> +
> +		ret =3D mipi_dsi_dcs_set_column_address(dsi, 0x0000, 0x04AF);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D mipi_dsi_dcs_set_page_address(dsi, 0x0000, 0x077F);
> +		if (ret < 0)
> +			return ret;

These should be parameterized on the panel width and height, to make it
clear where the values come from.

> +
> +		ret =3D mipi_dsi_dcs_set_tear_on(dsi,
> +					       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +		if (ret < 0)
> +			return ret;
> +		mdelay(5);
> +
> +		ret =3D mipi_dsi_generic_write(dsi, tear_scan_line,
> +					     sizeof(tear_scan_line));
> +		if (ret < 0)
> +			return ret;

Like I mentioned earlier, this should be a generic helper to help make
its intention clearer.

> +
> +		ret =3D mipi_dsi_dcs_write_buffer(dsi, write_display_brightness,
> +						sizeof(write_display_brightness)
> +						);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D mipi_dsi_dcs_write_buffer(dsi, write_control_display,
> +						sizeof(write_control_display));
> +		if (ret < 0)
> +			return ret;
> +
> +		ret =3D mipi_dsi_dcs_write_buffer(dsi, write_cabc,
> +						sizeof(write_cabc));
> +		if (ret < 0)
> +			return ret;

Same for these. I don't currently have access to the DCS 1.3
specification, but I suspect that some of the parameters for these
commands could be defined via symbolic names.

> +
> +		ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> +		if (ret < 0)
> +			return ret;
> +		mdelay(120);
> +
> +		ret =3D mipi_dsi_generic_write(dsi, MCAP, sizeof(MCAP));
> +		if (ret < 0)
> +			return ret;
> +		mdelay(10);
> +
> +		ret =3D mipi_dsi_generic_write(dsi, interface_setting,
> +					     sizeof(interface_setting));
> +		if (ret < 0)
> +			return ret;
> +		mdelay(20);
> +
> +		backlight_control4[18] =3D 0x04;
> +		backlight_control4[19] =3D 0x00;
> +
> +		ret =3D mipi_dsi_generic_write(dsi, backlight_control4,
> +					     sizeof(backlight_control4));
> +		if (ret < 0)
> +			return ret;
> +		mdelay(20);
> +
> +		MCAP[1] =3D 0x03;
> +		ret =3D mipi_dsi_generic_write(dsi, MCAP, sizeof(MCAP));
> +		if (ret < 0)
> +			return ret;

That's odd. Doesn't this break idempotence of this function? You modify
the global MCAP array by writing 0x03 to MCAP[1], so when this function
is called a second time, MCAP[1] will be 0x03 already in the first call
a few lines above, instead of the 0x00 that it was initially.

> +	} else {
> +		/*
> +		 * TODO : need to verify panel settings when
> +		 * dsi cmd mode supported for apq8064 - simhavcs
> +		 */
> +		ret =3D mipi_dsi_dcs_soft_reset(dsi);
> +		if (ret < 0)
> +			return ret;

This whole else clause is dead code because the condition for the if
clause is always true. Just drop it and add it back when you properly
support both modes.

> +static int jdi_panel_on(struct jdi_panel *jdi)
> +{
> +	struct mipi_dsi_device *dsi =3D jdi->dsi;
> +	int ret;
> +
> +	dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> +
> +	ret =3D mipi_dsi_dcs_set_display_on(dsi);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int jdi_panel_off(struct jdi_panel *jdi)
> +{
> +	struct mipi_dsi_device *dsi =3D jdi->dsi;
> +	int ret;
> +
> +	dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;

Should this not be cleared at the end of the function so that the below
commands still get run in LP mode?

> +
> +	ret =3D mipi_dsi_dcs_set_display_off(dsi);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D mipi_dsi_dcs_set_tear_off(dsi);
> +	if (ret < 0)
> +		return ret;
> +
> +	msleep(100);
> +
> +	return 0;
> +}
> +
> +static int jdi_panel_disable(struct drm_panel *panel)
> +{
> +	struct jdi_panel *jdi =3D to_jdi_panel(panel);
> +
> +	if (!jdi->enabled)
> +		return 0;
> +
> +	DRM_DEBUG("disable\n");

This doesn't look very useful debug information. I think you should
remove it. Same for other similar occurrences below.

> +static const struct drm_panel_funcs jdi_panel_funcs =3D {
> +		.disable =3D jdi_panel_disable,
> +		.unprepare =3D jdi_panel_unprepare,
> +		.prepare =3D jdi_panel_prepare,
> +		.enable =3D jdi_panel_enable,
> +		.get_modes =3D jdi_panel_get_modes,
> +};
> +
> +static const struct of_device_id jdi_of_match[] =3D {
> +		{ .compatible =3D "jdi,lt070me05000", },
> +		{ }
> +};
> +MODULE_DEVICE_TABLE(of, jdi_of_match);

A single tab is enough to indent the above.

> +static int jdi_panel_add(struct jdi_panel *jdi)
> +{
> +	struct device *dev =3D &jdi->dsi->dev;
> +	int ret;
> +
> +	jdi->mode =3D &default_mode;

What do you keep this around for?

> +
> +	/* lvs5 */
> +	jdi->supply =3D devm_regulator_get(dev, "power");
> +	if (IS_ERR(jdi->supply))
> +		return PTR_ERR(jdi->supply);
> +
> +	/* l17 */
> +	jdi->backlit =3D devm_regulator_get(dev, "backlit");
> +	if (IS_ERR(jdi->supply))
> +		return PTR_ERR(jdi->supply);
> +
> +	jdi->lvs7 =3D devm_regulator_get(dev, "lvs7");
> +	if (IS_ERR(jdi->lvs7))
> +		return PTR_ERR(jdi->lvs7);
> +
> +	jdi->avdd =3D devm_regulator_get(dev, "avdd");
> +	if (IS_ERR(jdi->avdd))
> +		return PTR_ERR(jdi->avdd);
> +
> +	jdi->iovdd =3D devm_regulator_get(dev, "iovdd");
> +	if (IS_ERR(jdi->iovdd))
> +		return PTR_ERR(jdi->iovdd);
> +
> +	jdi->vcc_gpio =3D devm_gpiod_get(dev, "vcc", GPIOD_OUT_LOW);
> +	if (IS_ERR(jdi->vcc_gpio)) {
> +		dev_err(dev, "cannot get vcc-gpio %ld\n",
> +			PTR_ERR(jdi->vcc_gpio));
> +		jdi->vcc_gpio =3D NULL;
> +	} else {
> +		gpiod_direction_output(jdi->vcc_gpio, 0);
> +	}
> +
> +	jdi->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(jdi->reset_gpio)) {
> +		dev_err(dev, "cannot get reset-gpios %ld\n",
> +			PTR_ERR(jdi->reset_gpio));
> +		jdi->reset_gpio =3D NULL;
> +	} else {
> +		gpiod_direction_output(jdi->reset_gpio, 0);
> +	}
> +
> +	jdi->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
> +	if (IS_ERR(jdi->enable_gpio)) {
> +		dev_err(dev, "cannot get enable-gpio %ld\n",
> +			PTR_ERR(jdi->enable_gpio));
> +		jdi->enable_gpio =3D NULL;
> +	} else {
> +		gpiod_direction_output(jdi->enable_gpio, 0);
> +	}
> +
> +	jdi->pwm_gpio =3D devm_gpiod_get(dev, "pwm", GPIOD_OUT_LOW);
> +	if (IS_ERR(jdi->pwm_gpio)) {
> +		dev_err(dev, "cannot get pwm-gpio %ld\n",
> +			PTR_ERR(jdi->pwm_gpio));
> +		jdi->pwm_gpio =3D NULL;
> +	} else {
> +		gpiod_direction_output(jdi->pwm_gpio, 0);
> +	}

As I said earlier, most of these aren't specified in the binding, fix
either the binding or the code.

> +	/* we don't have backlight right now, proceed further */
> +#ifdef BACKLIGHT
> +	np =3D of_parse_phandle(dev->of_node, "backlight", 0);
> +	if (np) {
> +		jdi->backlight =3D of_find_backlight_by_node(np);
> +		of_node_put(np);
> +
> +		if (!jdi->backlight)
> +			return -EPROBE_DEFER;
> +	}
> +#endif

Again, if you don't support it, don't submit it. We don't want dead code
in the kernel.

> +MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
> +MODULE_AUTHOR("Vinay Simha BN <simhavcs@gmail.com>");
> +MODULE_DESCRIPTION("JDI WUXGA LT070ME05000 DSI video/command mode panel =
driver");

Technically this doesn't support command mode yet, so you might want to
remove that from the description to avoid confusion.

Thierry

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXDk52AAoJEN0jrNd/PrOhsEMP/iTFOF4HkO+MF5tn3Uvv9msE
Dg8EREpT/zU2pzV+ajmOWBJw2r428NkBYj6EIUg8xY5C42KOufW7gln5UuQctlE8
ArCh+Va62pwkBit2uF22zNfnNXVkQu50vi4ORwkhfB2VQb058QyM9uVoRtHJfsg/
yES3EOJ0YjF68g15eBwdfgoO6EiZ/bt4yj+m0tn2i7ZtJ8wrEcMqj998yv+zmmLR
t//e2ZqPtUQRJceZYO0CK/XkmbWRVFWTYxo8vz6sVYLNpNVklsWBKk+2tLnrZ1w9
fvdHZ1DYBvTPnazQ19fjh2nXRKsWv5cLS1WknSM23GOGNtF4IyiwQo8KkpGTFw1S
U3ABKHhCM+zyploW25Hf9wy0Y724NYaeWx3guiB3e4VhL2xMC4M641LYtyTwiQzz
ysrR9g+2WxGCRCnzZkIxkGRrA/v7saHFmnFiH3h/ZxFKS/HpZJS9QbieS0eCgtQd
4frJ2/3mRxvyvq3f3hhgQkoYOFbb/KyFvHZFENNCO9lkMrfFxN4adsxsw0rkUIUK
I46qxxdKJHiS7x9pX/wTIU238uqux+wn7+CHvbOhKkR7cP/Et1jqf1BXpjIlvkVx
yu1X8J5EeS3a8OLplMLcU67MC/7ui1fciI0NQGZAGYU+sxQ26tqQljn+crtQa7JF
LTkthwKe1xI7a0eUfOQ3
=08OK
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
