Return-Path: <simhavcs@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20160413134947.GA1492@ulmo.ba.sec>
References: <1460528887-22915-1-git-send-email-simhavcs@gmail.com>
	<20160413134947.GA1492@ulmo.ba.sec>
Date: Wed, 13 Apr 2016 20:52:38 +0530
Message-ID: <CAGWqDJ5Z900uUEnOCk8dtF5CGR1ACE4jL-cXkOzFExxCakz2cw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Add JDI LT070ME05000 WUXGA DSI Panel
From: Vinay Simha <simhavcs@gmail.com>
Content-Type: multipart/alternative; boundary=001a113ee4bc23692105305f5921
To: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@linux.ie>, John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jonathan Cameron <jic23@kernel.org>, Pawel Moll <pawel.moll@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Kumar Gala <galak@codeaurora.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Archit Taneja <archit.taneja@gmail.com>, open list <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

--001a113ee4bc23692105305f5921
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

In Previous email , forgot to add cc: archit.

regards,
vinay simha bn
On 13-Apr-2016 19:19, "Thierry Reding" <thierry.reding@gmail.com> wrote:

> On Wed, Apr 13, 2016 at 11:58:04AM +0530, Vinay Simha BN wrote:
> > Add support for the JDI lt070me05000 WUXGA DSI panel used in
> > Nexus 7 2013 devices.
> >
> > Programming sequence for the panel is was originally found in the
> > android-msm-flo-3.4-lollipop-release branch from:
> >     https://android.googlesource.com/kernel/msm.git
> >
> > And video mode setting is from dsi-panel-jdi-dualmipi1-video.dtsi
> > file in:
> >     git://codeaurora.org/kernel/msm-3.10.git  LNX.LA.3.6_rb1.27
> >
> > Other fixes folded in were provided
> > by Archit Taneja <archit.taneja@gmail.com>
> >
> > Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
> > [sumit.semwal: Ported to the drm/panel framework]
> > Signed-off-by: Sumit Semwal <sumit.semwal@linaro.org>
> > [jstultz: Cherry-picked to mainline, folded down other fixes
> >  from Vinay and Archit]
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
> > ---
> >  .../bindings/display/panel/jdi,lt070me05000.txt    |  27 +
> >  .../devicetree/bindings/vendor-prefixes.txt        |   1 +
> >  drivers/gpu/drm/panel/Kconfig                      |  11 +
> >  drivers/gpu/drm/panel/Makefile                     |   1 +
> >  drivers/gpu/drm/panel/panel-jdi-lt070me05000.c     | 685
> +++++++++++++++++++++
> >  5 files changed, 725 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> >  create mode 100644 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
>
> What's the difference between this and the patch you sent earlier? I'm
> going to assume that the newer one is the correct patch, so I'll ignore
> the previous patch.
>
> > diff --git
> a/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
> > new file mode 100644
> > index 0000000..35c5ac7
> > --- /dev/null
> > +++
> b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000.txt
>
> The binding documentation should be a separate patch.
>
> > @@ -0,0 +1,27 @@
> > +JDI model LT070ME05000 1920x1200 7" DSI Panel
> > +
> > +Basic data sheet is at:
> > +
> http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet
> > +
> > +This panel has video mode implemented currently in the driver.
>
> That's information irrelevant to the DT binding, since you're presumably
> talking about the Linux drm/panel driver, whereas the DT binding is
> supposed to specify the description of the panel hardware in OS-agnostic
> terms.
>
> > +Required properties:
> > +- compatible: should be "jdi,lt070me05000"
> > +
> > +Optional properties:
> > +- power-supply: phandle of the regulator that provides the supply
> voltage
> > +- reset-gpio: phandle of gpio for reset line
> > +- backlight: phandle of the backlight device attached to the panel
> > +
> > +Example:
> > +
> > +     dsi@54300000 {
> > +             panel: panel@0 {
> > +                     compatible =3D "jdi,lt070me05000";
> > +                     reg =3D <0>;
> > +
> > +                     power-supply =3D <...>;
> > +                     reset-gpio =3D <...>;
> > +                     backlight =3D <...>;
> > +             };
> > +     };
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt
> b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > index a580f3e..ec42bb4 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.txt
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
> > @@ -130,6 +130,7 @@ invensense        InvenSense Inc.
> >  isee ISEE 2007 S.L.
> >  isil Intersil
> >  issi Integrated Silicon Solutions Inc.
> > +jdi  Japan Display Inc.
> >  jedec        JEDEC Solid State Technology Association
> >  karo Ka-Ro electronics GmbH
> >  keymile      Keymile GmbH
>
> This should be a separate patch as well.
>
> > diff --git a/drivers/gpu/drm/panel/Kconfig
> b/drivers/gpu/drm/panel/Kconfig
> > index 1500ab9..f41690e 100644
> > --- a/drivers/gpu/drm/panel/Kconfig
> > +++ b/drivers/gpu/drm/panel/Kconfig
> > @@ -61,6 +61,17 @@ config DRM_PANEL_SHARP_LQ101R1SX01
> >         To compile this driver as a module, choose M here: the module
> >         will be called panel-sharp-lq101r1sx01.
> >
> > +config DRM_PANEL_JDI_LT070ME05000
> > +     tristate "JDI LT070ME05000 WUXGA DSI panel"
> > +     depends on OF
> > +     depends on DRM_MIPI_DSI
> > +     depends on BACKLIGHT_CLASS_DEVICE
> > +     help
> > +       Say Y here if you want to enable support for JDI WUXGA DSI vide=
o/
> > +       command mode panel as found in Google Nexus 7 (2013) devices.
> > +       The panel has a 1200(RGB)=C3=971920 (WUXGA) resolution and uses
> > +       24 bit RGB per pixel.
> > +
> >  config DRM_PANEL_SHARP_LS043T1LE01
> >       tristate "Sharp LS043T1LE01 qHD video mode panel"
> >       depends on OF
>
> Please keep these sorted alphabetically. I do realize that the list
> isn't sorted quite correctly at the moment, so you may as well leave
> this as-is and I'll fix up the order when applying and after fixing
> the current ordering.
>
> > diff --git a/drivers/gpu/drm/panel/Makefile
> b/drivers/gpu/drm/panel/Makefile
> > index f277eed..e6c6fc8 100644
> > --- a/drivers/gpu/drm/panel/Makefile
> > +++ b/drivers/gpu/drm/panel/Makefile
> > @@ -5,3 +5,4 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) +=3D
> panel-samsung-ld9040.o
> >  obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8aa0.o
> >  obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) +=3D panel-sharp-lq101r1sx01=
.o
> >  obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) +=3D panel-sharp-ls043t1le01=
.o
> > +obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) +=3D panel-jdi-lt070me05000.o
>
> Same here.
>
> > diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
> b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
> > new file mode 100644
> > index 0000000..051aa1b
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
> > @@ -0,0 +1,685 @@
> > +/*
> > + * Copyright (C) 2015 InforceComputing
> > + * Author: Vinay Simha BN <simhavcs@gmail.com>
> > + *
> > + * Copyright (C) 2015 Linaro Ltd
> > + * Author: Sumit Semwal <sumit.semwal@linaro.org>
>
> Should either of those copyright lines include 2016? We're a pretty good
> way into 2016, and I'd be surprised if this wasn't touched this year at
> all.
>
> > +/*
> > + * From internet archives, the panel for Nexus 7 2nd Gen, 2013 model i=
s
> a
> > + * JDI model LT070ME05000, and its data sheet is at:
> > + *  http://panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datashee=
t
> > + */
>
> This comment is oddly placed here above the struct jdi_panel definition.
> Perhaps move that information into the header comment?
>
> > +struct jdi_panel {
> > +     struct drm_panel base;
> > +     struct mipi_dsi_device *dsi;
> > +
> > +     /* TODO: Add backilght support */
>
> "backlight". Also if this is still TODO, why even have parts of the code
> here? Just drop everything that's not used and move that to a follow-up
> patch that implements full support.
>
> > +     struct backlight_device *backlight;
> > +     struct regulator *supply;
> > +     struct gpio_desc *reset_gpio;
> > +     struct gpio_desc *enable_gpio;
> > +     struct gpio_desc *vcc_gpio;
> > +
> > +     struct regulator *backlit;
> > +     struct regulator *lvs7;
> > +     struct regulator *avdd;
> > +     struct regulator *iovdd;
> > +     struct gpio_desc *pwm_gpio;
>
> Most of these resources aren't specified in the device tree binding, so
> your driver doesn't properly implement the binding. You'll have to fix
> the driver or the binding.
>
> > +
> > +     bool prepared;
> > +     bool enabled;
> > +
> > +     const struct drm_display_mode *mode;
> > +};
> > +
> > +static inline struct jdi_panel *to_jdi_panel(struct drm_panel *panel)
> > +{
> > +     return container_of(panel, struct jdi_panel, base);
> > +}
> > +
> > +static char MCAP[2] =3D {0xB0, 0x00};
> > +static char interface_setting_cmd[6] =3D {0xB3, 0x04, 0x08, 0x00, 0x22=
,
> 0x00};
> > +static char interface_setting[6] =3D {0xB3, 0x26, 0x08, 0x00, 0x20, 0x=
00};
>
> Please make all of these (and the ones below) arrays of u8, since that's
> the type used in the prototype of the function that receives these as
> parameters. Also, please use consistent capitalization and a space after
> { and before }.
>
> > +static char interface_ID_setting[2] =3D {0xB4, 0x0C};
> > +static char DSI_control[3] =3D {0xB6, 0x3A, 0xD3};
> > +
> > +static char tear_scan_line[3] =3D {0x44, 0x03, 0x00};
>
> This is a standard DCS command, please turn this into a generic helper
> such as mipi_dsi_dcs_set_tear_scanline().
>
> > +/* for fps control, set fps to 60.32Hz */
> > +static char LTPS_timing_setting[2] =3D {0xC6, 0x78};
> > +static char sequencer_timing_control[2] =3D {0xD6, 0x01};
> > +
> > +/* set brightness */
> > +static char write_display_brightness[] =3D {0x51, 0xFF};
>
> Same here.
>
> > +/* enable LEDPWM pin output, turn on LEDPWM output, turn off pwm
> dimming */
> > +static char write_control_display[] =3D {0x53, 0x24};
>
> And here.
>
> > +/*
> > + * choose cabc mode, 0x00(-0%), 0x01(-15%), 0x02(-40%), 0x03(-54%),
> > + * disable SRE(sunlight readability enhancement)
> > + */
> > +static char write_cabc[] =3D {0x55, 0x00};
>
> And here.
>
> > +static int jdi_panel_init(struct jdi_panel *jdi)
> > +{
> > +     struct mipi_dsi_device *dsi =3D jdi->dsi;
> > +     int ret;
> > +
> > +     dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> > +
> > +     if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > +             ret =3D mipi_dsi_dcs_soft_reset(dsi);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             mdelay(10);
>
> Please don't use mdelay() because it will busy-loop for a very long time
> and waste precious CPU cycles. Instead, use usleep_range() for these
> cases (or msleep() for durations longer than ~10 ms). Same goes for the
> other occurrences below.
>
> > +
> > +             ret =3D mipi_dsi_dcs_set_pixel_format(dsi, 0x70);
> > +             if (ret < 0)
> > +                     return ret;
>
> There are symbolic constants for the pixel formats, use them to convey
> meaning.
>
> > +
> > +             ret =3D mipi_dsi_dcs_set_column_address(dsi, 0x0000, 0x04=
AF);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             ret =3D mipi_dsi_dcs_set_page_address(dsi, 0x0000, 0x077F=
);
> > +             if (ret < 0)
> > +                     return ret;
>
> These should be parameterized on the panel width and height, to make it
> clear where the values come from.
>
> > +
> > +             ret =3D mipi_dsi_dcs_set_tear_on(dsi,
> > +
> MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> > +             if (ret < 0)
> > +                     return ret;
> > +             mdelay(5);
> > +
> > +             ret =3D mipi_dsi_generic_write(dsi, tear_scan_line,
> > +                                          sizeof(tear_scan_line));
> > +             if (ret < 0)
> > +                     return ret;
>
> Like I mentioned earlier, this should be a generic helper to help make
> its intention clearer.
>
> > +
> > +             ret =3D mipi_dsi_dcs_write_buffer(dsi,
> write_display_brightness,
> > +
>  sizeof(write_display_brightness)
> > +                                             );
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             ret =3D mipi_dsi_dcs_write_buffer(dsi, write_control_disp=
lay,
> > +
>  sizeof(write_control_display));
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             ret =3D mipi_dsi_dcs_write_buffer(dsi, write_cabc,
> > +                                             sizeof(write_cabc));
> > +             if (ret < 0)
> > +                     return ret;
>
> Same for these. I don't currently have access to the DCS 1.3
> specification, but I suspect that some of the parameters for these
> commands could be defined via symbolic names.
>
> > +
> > +             ret =3D mipi_dsi_dcs_exit_sleep_mode(dsi);
> > +             if (ret < 0)
> > +                     return ret;
> > +             mdelay(120);
> > +
> > +             ret =3D mipi_dsi_generic_write(dsi, MCAP, sizeof(MCAP));
> > +             if (ret < 0)
> > +                     return ret;
> > +             mdelay(10);
> > +
> > +             ret =3D mipi_dsi_generic_write(dsi, interface_setting,
> > +                                          sizeof(interface_setting));
> > +             if (ret < 0)
> > +                     return ret;
> > +             mdelay(20);
> > +
> > +             backlight_control4[18] =3D 0x04;
> > +             backlight_control4[19] =3D 0x00;
> > +
> > +             ret =3D mipi_dsi_generic_write(dsi, backlight_control4,
> > +                                          sizeof(backlight_control4));
> > +             if (ret < 0)
> > +                     return ret;
> > +             mdelay(20);
> > +
> > +             MCAP[1] =3D 0x03;
> > +             ret =3D mipi_dsi_generic_write(dsi, MCAP, sizeof(MCAP));
> > +             if (ret < 0)
> > +                     return ret;
>
> That's odd. Doesn't this break idempotence of this function? You modify
> the global MCAP array by writing 0x03 to MCAP[1], so when this function
> is called a second time, MCAP[1] will be 0x03 already in the first call
> a few lines above, instead of the 0x00 that it was initially.
>
> > +     } else {
> > +             /*
> > +              * TODO : need to verify panel settings when
> > +              * dsi cmd mode supported for apq8064 - simhavcs
> > +              */
> > +             ret =3D mipi_dsi_dcs_soft_reset(dsi);
> > +             if (ret < 0)
> > +                     return ret;
>
> This whole else clause is dead code because the condition for the if
> clause is always true. Just drop it and add it back when you properly
> support both modes.
>
> > +static int jdi_panel_on(struct jdi_panel *jdi)
> > +{
> > +     struct mipi_dsi_device *dsi =3D jdi->dsi;
> > +     int ret;
> > +
> > +     dsi->mode_flags |=3D MIPI_DSI_MODE_LPM;
> > +
> > +     ret =3D mipi_dsi_dcs_set_display_on(dsi);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static int jdi_panel_off(struct jdi_panel *jdi)
> > +{
> > +     struct mipi_dsi_device *dsi =3D jdi->dsi;
> > +     int ret;
> > +
> > +     dsi->mode_flags &=3D ~MIPI_DSI_MODE_LPM;
>
> Should this not be cleared at the end of the function so that the below
> commands still get run in LP mode?
>
> > +
> > +     ret =3D mipi_dsi_dcs_set_display_off(dsi);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D mipi_dsi_dcs_set_tear_off(dsi);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     msleep(100);
> > +
> > +     return 0;
> > +}
> > +
> > +static int jdi_panel_disable(struct drm_panel *panel)
> > +{
> > +     struct jdi_panel *jdi =3D to_jdi_panel(panel);
> > +
> > +     if (!jdi->enabled)
> > +             return 0;
> > +
> > +     DRM_DEBUG("disable\n");
>
> This doesn't look very useful debug information. I think you should
> remove it. Same for other similar occurrences below.
>
> > +static const struct drm_panel_funcs jdi_panel_funcs =3D {
> > +             .disable =3D jdi_panel_disable,
> > +             .unprepare =3D jdi_panel_unprepare,
> > +             .prepare =3D jdi_panel_prepare,
> > +             .enable =3D jdi_panel_enable,
> > +             .get_modes =3D jdi_panel_get_modes,
> > +};
> > +
> > +static const struct of_device_id jdi_of_match[] =3D {
> > +             { .compatible =3D "jdi,lt070me05000", },
> > +             { }
> > +};
> > +MODULE_DEVICE_TABLE(of, jdi_of_match);
>
> A single tab is enough to indent the above.
>
> > +static int jdi_panel_add(struct jdi_panel *jdi)
> > +{
> > +     struct device *dev =3D &jdi->dsi->dev;
> > +     int ret;
> > +
> > +     jdi->mode =3D &default_mode;
>
> What do you keep this around for?
>
> > +
> > +     /* lvs5 */
> > +     jdi->supply =3D devm_regulator_get(dev, "power");
> > +     if (IS_ERR(jdi->supply))
> > +             return PTR_ERR(jdi->supply);
> > +
> > +     /* l17 */
> > +     jdi->backlit =3D devm_regulator_get(dev, "backlit");
> > +     if (IS_ERR(jdi->supply))
> > +             return PTR_ERR(jdi->supply);
> > +
> > +     jdi->lvs7 =3D devm_regulator_get(dev, "lvs7");
> > +     if (IS_ERR(jdi->lvs7))
> > +             return PTR_ERR(jdi->lvs7);
> > +
> > +     jdi->avdd =3D devm_regulator_get(dev, "avdd");
> > +     if (IS_ERR(jdi->avdd))
> > +             return PTR_ERR(jdi->avdd);
> > +
> > +     jdi->iovdd =3D devm_regulator_get(dev, "iovdd");
> > +     if (IS_ERR(jdi->iovdd))
> > +             return PTR_ERR(jdi->iovdd);
> > +
> > +     jdi->vcc_gpio =3D devm_gpiod_get(dev, "vcc", GPIOD_OUT_LOW);
> > +     if (IS_ERR(jdi->vcc_gpio)) {
> > +             dev_err(dev, "cannot get vcc-gpio %ld\n",
> > +                     PTR_ERR(jdi->vcc_gpio));
> > +             jdi->vcc_gpio =3D NULL;
> > +     } else {
> > +             gpiod_direction_output(jdi->vcc_gpio, 0);
> > +     }
> > +
> > +     jdi->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > +     if (IS_ERR(jdi->reset_gpio)) {
> > +             dev_err(dev, "cannot get reset-gpios %ld\n",
> > +                     PTR_ERR(jdi->reset_gpio));
> > +             jdi->reset_gpio =3D NULL;
> > +     } else {
> > +             gpiod_direction_output(jdi->reset_gpio, 0);
> > +     }
> > +
> > +     jdi->enable_gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW)=
;
> > +     if (IS_ERR(jdi->enable_gpio)) {
> > +             dev_err(dev, "cannot get enable-gpio %ld\n",
> > +                     PTR_ERR(jdi->enable_gpio));
> > +             jdi->enable_gpio =3D NULL;
> > +     } else {
> > +             gpiod_direction_output(jdi->enable_gpio, 0);
> > +     }
> > +
> > +     jdi->pwm_gpio =3D devm_gpiod_get(dev, "pwm", GPIOD_OUT_LOW);
> > +     if (IS_ERR(jdi->pwm_gpio)) {
> > +             dev_err(dev, "cannot get pwm-gpio %ld\n",
> > +                     PTR_ERR(jdi->pwm_gpio));
> > +             jdi->pwm_gpio =3D NULL;
> > +     } else {
> > +             gpiod_direction_output(jdi->pwm_gpio, 0);
> > +     }
>
> As I said earlier, most of these aren't specified in the binding, fix
> either the binding or the code.
>
> > +     /* we don't have backlight right now, proceed further */
> > +#ifdef BACKLIGHT
> > +     np =3D of_parse_phandle(dev->of_node, "backlight", 0);
> > +     if (np) {
> > +             jdi->backlight =3D of_find_backlight_by_node(np);
> > +             of_node_put(np);
> > +
> > +             if (!jdi->backlight)
> > +                     return -EPROBE_DEFER;
> > +     }
> > +#endif
>
> Again, if you don't support it, don't submit it. We don't want dead code
> in the kernel.
>
> > +MODULE_AUTHOR("Sumit Semwal <sumit.semwal@linaro.org>");
> > +MODULE_AUTHOR("Vinay Simha BN <simhavcs@gmail.com>");
> > +MODULE_DESCRIPTION("JDI WUXGA LT070ME05000 DSI video/command mode pane=
l
> driver");
>
> Technically this doesn't support command mode yet, so you might want to
> remove that from the description to avoid confusion.
>
> Thierry
>

--001a113ee4bc23692105305f5921
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">In Previous email , forgot to add cc: archit.</p>
<p dir=3D"ltr">regards,<br>
vinay simha bn</p>
<div class=3D"gmail_quote">On 13-Apr-2016 19:19, &quot;Thierry Reding&quot;=
 &lt;<a href=3D"mailto:thierry.reding@gmail.com">thierry.reding@gmail.com</=
a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed=
, Apr 13, 2016 at 11:58:04AM +0530, Vinay Simha BN wrote:<br>
&gt; Add support for the JDI lt070me05000 WUXGA DSI panel used in<br>
&gt; Nexus 7 2013 devices.<br>
&gt;<br>
&gt; Programming sequence for the panel is was originally found in the<br>
&gt; android-msm-flo-3.4-lollipop-release branch from:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://android.googlesource.com/kernel/=
msm.git" rel=3D"noreferrer" target=3D"_blank">https://android.googlesource.=
com/kernel/msm.git</a><br>
&gt;<br>
&gt; And video mode setting is from dsi-panel-jdi-dualmipi1-video.dtsi<br>
&gt; file in:<br>
&gt;=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://codeaurora.org/kernel/msm-3=
.10.git" rel=3D"noreferrer" target=3D"_blank">codeaurora.org/kernel/msm-3.1=
0.git</a>=C2=A0 LNX.LA.3.6_rb1.27<br>
&gt;<br>
&gt; Other fixes folded in were provided<br>
&gt; by Archit Taneja &lt;<a href=3D"mailto:archit.taneja@gmail.com">archit=
.taneja@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com=
">simhavcs@gmail.com</a>&gt;<br>
&gt; [sumit.semwal: Ported to the drm/panel framework]<br>
&gt; Signed-off-by: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.=
org">sumit.semwal@linaro.org</a>&gt;<br>
&gt; [jstultz: Cherry-picked to mainline, folded down other fixes<br>
&gt;=C2=A0 from Vinay and Archit]<br>
&gt; Signed-off-by: John Stultz &lt;<a href=3D"mailto:john.stultz@linaro.or=
g">john.stultz@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../bindings/display/panel/jdi,lt070me05000.txt=C2=A0 =C2=A0 |=
=C2=A0 27 +<br>
&gt;=C2=A0 .../devicetree/bindings/vendor-prefixes.txt=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/panel/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 11 +<br>
&gt;=C2=A0 drivers/gpu/drm/panel/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c=C2=A0 =C2=A0 =C2=
=A0| 685 +++++++++++++++++++++<br>
&gt;=C2=A0 5 files changed, 725 insertions(+)<br>
&gt;=C2=A0 create mode 100644 Documentation/devicetree/bindings/display/pan=
el/jdi,lt070me05000.txt<br>
&gt;=C2=A0 create mode 100644 drivers/gpu/drm/panel/panel-jdi-lt070me05000.=
c<br>
<br>
What&#39;s the difference between this and the patch you sent earlier? I&#3=
9;m<br>
going to assume that the newer one is the correct patch, so I&#39;ll ignore=
<br>
the previous patch.<br>
<br>
&gt; diff --git a/Documentation/devicetree/bindings/display/panel/jdi,lt070=
me05000.txt b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05=
000.txt<br>
&gt; new file mode 100644<br>
&gt; index 0000000..35c5ac7<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/devicetree/bindings/display/panel/jdi,lt070me05000=
.txt<br>
<br>
The binding documentation should be a separate patch.<br>
<br>
&gt; @@ -0,0 +1,27 @@<br>
&gt; +JDI model LT070ME05000 1920x1200 7&quot; DSI Panel<br>
&gt; +<br>
&gt; +Basic data sheet is at:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0<a href=3D"http://panelone.net/en/7-0-inch/JDI_LT=
070ME05000_7.0_inch-datasheet" rel=3D"noreferrer" target=3D"_blank">http://=
panelone.net/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet</a><br>
&gt; +<br>
&gt; +This panel has video mode implemented currently in the driver.<br>
<br>
That&#39;s information irrelevant to the DT binding, since you&#39;re presu=
mably<br>
talking about the Linux drm/panel driver, whereas the DT binding is<br>
supposed to specify the description of the panel hardware in OS-agnostic<br=
>
terms.<br>
<br>
&gt; +Required properties:<br>
&gt; +- compatible: should be &quot;jdi,lt070me05000&quot;<br>
&gt; +<br>
&gt; +Optional properties:<br>
&gt; +- power-supply: phandle of the regulator that provides the supply vol=
tage<br>
&gt; +- reset-gpio: phandle of gpio for reset line<br>
&gt; +- backlight: phandle of the backlight device attached to the panel<br=
>
&gt; +<br>
&gt; +Example:<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi@54300000 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0panel: panel@0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0compatible =3D &quot;jdi,lt070me05000&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reg =3D &lt;0&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0power-supply =3D &lt;...&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0reset-gpio =3D &lt;...&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0backlight =3D &lt;...&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/D=
ocumentation/devicetree/bindings/vendor-prefixes.txt<br>
&gt; index a580f3e..ec42bb4 100644<br>
&gt; --- a/Documentation/devicetree/bindings/vendor-prefixes.txt<br>
&gt; +++ b/Documentation/devicetree/bindings/vendor-prefixes.txt<br>
&gt; @@ -130,6 +130,7 @@ invensense=C2=A0 =C2=A0 =C2=A0 =C2=A0 InvenSense I=
nc.<br>
&gt;=C2=A0 isee ISEE 2007 S.L.<br>
&gt;=C2=A0 isil Intersil<br>
&gt;=C2=A0 issi Integrated Silicon Solutions Inc.<br>
&gt; +jdi=C2=A0 Japan Display Inc.<br>
&gt;=C2=A0 jedec=C2=A0 =C2=A0 =C2=A0 =C2=A0 JEDEC Solid State Technology As=
sociation<br>
&gt;=C2=A0 karo Ka-Ro electronics GmbH<br>
&gt;=C2=A0 keymile=C2=A0 =C2=A0 =C2=A0 Keymile GmbH<br>
<br>
This should be a separate patch as well.<br>
<br>
&gt; diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kco=
nfig<br>
&gt; index 1500ab9..f41690e 100644<br>
&gt; --- a/drivers/gpu/drm/panel/Kconfig<br>
&gt; +++ b/drivers/gpu/drm/panel/Kconfig<br>
&gt; @@ -61,6 +61,17 @@ config DRM_PANEL_SHARP_LQ101R1SX01<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0To compile this driver as a module, c=
hoose M here: the module<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be called panel-sharp-lq101r1sx0=
1.<br>
&gt;<br>
&gt; +config DRM_PANEL_JDI_LT070ME05000<br>
&gt; +=C2=A0 =C2=A0 =C2=A0tristate &quot;JDI LT070ME05000 WUXGA DSI panel&q=
uot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on OF<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on DRM_MIPI_DSI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BACKLIGHT_CLASS_DEVICE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Say Y here if you want to enable support f=
or JDI WUXGA DSI video/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0command mode panel as found in Google Nexu=
s 7 (2013) devices.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0The panel has a 1200(RGB)=C3=971920 (WUXGA=
) resolution and uses<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A024 bit RGB per pixel.<br>
&gt; +<br>
&gt;=C2=A0 config DRM_PANEL_SHARP_LS043T1LE01<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;Sharp LS043T1LE01 qHD video m=
ode panel&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on OF<br>
<br>
Please keep these sorted alphabetically. I do realize that the list<br>
isn&#39;t sorted quite correctly at the moment, so you may as well leave<br=
>
this as-is and I&#39;ll fix up the order when applying and after fixing<br>
the current ordering.<br>
<br>
&gt; diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Ma=
kefile<br>
&gt; index f277eed..e6c6fc8 100644<br>
&gt; --- a/drivers/gpu/drm/panel/Makefile<br>
&gt; +++ b/drivers/gpu/drm/panel/Makefile<br>
&gt; @@ -5,3 +5,4 @@ obj-$(CONFIG_DRM_PANEL_SAMSUNG_LD9040) +=3D panel-sams=
ung-ld9040.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0) +=3D panel-samsung-s6e8a=
a0.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) +=3D panel-sharp-lq101=
r1sx01.o<br>
&gt;=C2=A0 obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) +=3D panel-sharp-ls043=
t1le01.o<br>
&gt; +obj-$(CONFIG_DRM_PANEL_JDI_LT070ME05000) +=3D panel-jdi-lt070me05000.=
o<br>
<br>
Same here.<br>
<br>
&gt; diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/=
gpu/drm/panel/panel-jdi-lt070me05000.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000..051aa1b<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c<br>
&gt; @@ -0,0 +1,685 @@<br>
&gt; +/*<br>
&gt; + * Copyright (C) 2015 InforceComputing<br>
&gt; + * Author: Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gmail.com">s=
imhavcs@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * Copyright (C) 2015 Linaro Ltd<br>
&gt; + * Author: Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@linaro.org=
">sumit.semwal@linaro.org</a>&gt;<br>
<br>
Should either of those copyright lines include 2016? We&#39;re a pretty goo=
d<br>
way into 2016, and I&#39;d be surprised if this wasn&#39;t touched this yea=
r at<br>
all.<br>
<br>
&gt; +/*<br>
&gt; + * From internet archives, the panel for Nexus 7 2nd Gen, 2013 model =
is a<br>
&gt; + * JDI model LT070ME05000, and its data sheet is at:<br>
&gt; + *=C2=A0 <a href=3D"http://panelone.net/en/7-0-inch/JDI_LT070ME05000_=
7.0_inch-datasheet" rel=3D"noreferrer" target=3D"_blank">http://panelone.ne=
t/en/7-0-inch/JDI_LT070ME05000_7.0_inch-datasheet</a><br>
&gt; + */<br>
<br>
This comment is oddly placed here above the struct jdi_panel definition.<br=
>
Perhaps move that information into the header comment?<br>
<br>
&gt; +struct jdi_panel {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct drm_panel base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* TODO: Add backilght support */<br>
<br>
&quot;backlight&quot;. Also if this is still TODO, why even have parts of t=
he code<br>
here? Just drop everything that&#39;s not used and move that to a follow-up=
<br>
patch that implements full support.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct backlight_device *backlight;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regulator *supply;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc *reset_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc *enable_gpio;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc *vcc_gpio;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regulator *backlit;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regulator *lvs7;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regulator *avdd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regulator *iovdd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct gpio_desc *pwm_gpio;<br>
<br>
Most of these resources aren&#39;t specified in the device tree binding, so=
<br>
your driver doesn&#39;t properly implement the binding. You&#39;ll have to =
fix<br>
the driver or the binding.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool prepared;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool enabled;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const struct drm_display_mode *mode;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static inline struct jdi_panel *to_jdi_panel(struct drm_panel *panel)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return container_of(panel, struct jdi_panel, base=
);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static char MCAP[2] =3D {0xB0, 0x00};<br>
&gt; +static char interface_setting_cmd[6] =3D {0xB3, 0x04, 0x08, 0x00, 0x2=
2, 0x00};<br>
&gt; +static char interface_setting[6] =3D {0xB3, 0x26, 0x08, 0x00, 0x20, 0=
x00};<br>
<br>
Please make all of these (and the ones below) arrays of u8, since that&#39;=
s<br>
the type used in the prototype of the function that receives these as<br>
parameters. Also, please use consistent capitalization and a space after<br=
>
{ and before }.<br>
<br>
&gt; +static char interface_ID_setting[2] =3D {0xB4, 0x0C};<br>
&gt; +static char DSI_control[3] =3D {0xB6, 0x3A, 0xD3};<br>
&gt; +<br>
&gt; +static char tear_scan_line[3] =3D {0x44, 0x03, 0x00};<br>
<br>
This is a standard DCS command, please turn this into a generic helper<br>
such as mipi_dsi_dcs_set_tear_scanline().<br>
<br>
&gt; +/* for fps control, set fps to 60.32Hz */<br>
&gt; +static char LTPS_timing_setting[2] =3D {0xC6, 0x78};<br>
&gt; +static char sequencer_timing_control[2] =3D {0xD6, 0x01};<br>
&gt; +<br>
&gt; +/* set brightness */<br>
&gt; +static char write_display_brightness[] =3D {0x51, 0xFF};<br>
<br>
Same here.<br>
<br>
&gt; +/* enable LEDPWM pin output, turn on LEDPWM output, turn off pwm dimm=
ing */<br>
&gt; +static char write_control_display[] =3D {0x53, 0x24};<br>
<br>
And here.<br>
<br>
&gt; +/*<br>
&gt; + * choose cabc mode, 0x00(-0%), 0x01(-15%), 0x02(-40%), 0x03(-54%),<b=
r>
&gt; + * disable SRE(sunlight readability enhancement)<br>
&gt; + */<br>
&gt; +static char write_cabc[] =3D {0x55, 0x00};<br>
<br>
And here.<br>
<br>
&gt; +static int jdi_panel_init(struct jdi_panel *jdi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D jdi-&gt;dsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags |=3D MIPI_DSI_MODE_LPM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (dsi-&gt;mode_flags &amp; MIPI_DSI_MODE_VIDEO)=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_=
soft_reset(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mdelay(10);<br>
<br>
Please don&#39;t use mdelay() because it will busy-loop for a very long tim=
e<br>
and waste precious CPU cycles. Instead, use usleep_range() for these<br>
cases (or msleep() for durations longer than ~10 ms). Same goes for the<br>
other occurrences below.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_=
set_pixel_format(dsi, 0x70);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
<br>
There are symbolic constants for the pixel formats, use them to convey<br>
meaning.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_=
set_column_address(dsi, 0x0000, 0x04AF);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_=
set_page_address(dsi, 0x0000, 0x077F);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
<br>
These should be parameterized on the panel width and height, to make it<br>
clear where the values come from.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_=
set_tear_on(dsi,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 MIPI_DSI_DCS_TEAR_MODE_VBLANK);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mdelay(5);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_gene=
ric_write(dsi, tear_scan_line,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sizeof(tear_scan_line));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
<br>
Like I mentioned earlier, this should be a generic helper to help make<br>
its intention clearer.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_=
write_buffer(dsi, write_display_brightness,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sizeof(write_display_brightness)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_=
write_buffer(dsi, write_control_display,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sizeof(write_control_display));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_=
write_buffer(dsi, write_cabc,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0sizeof(write_cabc));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
<br>
Same for these. I don&#39;t currently have access to the DCS 1.3<br>
specification, but I suspect that some of the parameters for these<br>
commands could be defined via symbolic names.<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_=
exit_sleep_mode(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mdelay(120);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_gene=
ric_write(dsi, MCAP, sizeof(MCAP));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mdelay(10);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_gene=
ric_write(dsi, interface_setting,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sizeof(interface_setting));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mdelay(20);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backlight_control4[18=
] =3D 0x04;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backlight_control4[19=
] =3D 0x00;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_gene=
ric_write(dsi, backlight_control4,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sizeof(backlight_control4));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mdelay(20);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MCAP[1] =3D 0x03;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_gene=
ric_write(dsi, MCAP, sizeof(MCAP));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
<br>
That&#39;s odd. Doesn&#39;t this break idempotence of this function? You mo=
dify<br>
the global MCAP array by writing 0x03 to MCAP[1], so when this function<br>
is called a second time, MCAP[1] will be 0x03 already in the first call<br>
a few lines above, instead of the 0x00 that it was initially.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * TODO : need to ver=
ify panel settings when<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * dsi cmd mode suppo=
rted for apq8064 - simhavcs<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_=
soft_reset(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return ret;<br>
<br>
This whole else clause is dead code because the condition for the if<br>
clause is always true. Just drop it and add it back when you properly<br>
support both modes.<br>
<br>
&gt; +static int jdi_panel_on(struct jdi_panel *jdi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D jdi-&gt;dsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags |=3D MIPI_DSI_MODE_LPM;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_set_display_on(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int jdi_panel_off(struct jdi_panel *jdi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct mipi_dsi_device *dsi =3D jdi-&gt;dsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0dsi-&gt;mode_flags &amp;=3D ~MIPI_DSI_MODE_LPM;<b=
r>
<br>
Should this not be cleared at the end of the function so that the below<br>
commands still get run in LP mode?<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_set_display_off(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_enter_sleep_mode(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D mipi_dsi_dcs_set_tear_off(dsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0msleep(100);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int jdi_panel_disable(struct drm_panel *panel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct jdi_panel *jdi =3D to_jdi_panel(panel);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!jdi-&gt;enabled)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_DEBUG(&quot;disable\n&quot;);<br>
<br>
This doesn&#39;t look very useful debug information. I think you should<br>
remove it. Same for other similar occurrences below.<br>
<br>
&gt; +static const struct drm_panel_funcs jdi_panel_funcs =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.disable =3D jdi_pane=
l_disable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.unprepare =3D jdi_pa=
nel_unprepare,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.prepare =3D jdi_pane=
l_prepare,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.enable =3D jdi_panel=
_enable,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.get_modes =3D jdi_pa=
nel_get_modes,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct of_device_id jdi_of_match[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ .compatible =3D &qu=
ot;jdi,lt070me05000&quot;, },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{ }<br>
&gt; +};<br>
&gt; +MODULE_DEVICE_TABLE(of, jdi_of_match);<br>
<br>
A single tab is enough to indent the above.<br>
<br>
&gt; +static int jdi_panel_add(struct jdi_panel *jdi)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;jdi-&gt;dsi-&gt;dev;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0jdi-&gt;mode =3D &amp;default_mode;<br>
<br>
What do you keep this around for?<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* lvs5 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0jdi-&gt;supply =3D devm_regulator_get(dev, &quot;=
power&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(jdi-&gt;supply))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(jdi-&g=
t;supply);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* l17 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0jdi-&gt;backlit =3D devm_regulator_get(dev, &quot=
;backlit&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(jdi-&gt;supply))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(jdi-&g=
t;supply);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0jdi-&gt;lvs7 =3D devm_regulator_get(dev, &quot;lv=
s7&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(jdi-&gt;lvs7))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(jdi-&g=
t;lvs7);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0jdi-&gt;avdd =3D devm_regulator_get(dev, &quot;av=
dd&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(jdi-&gt;avdd))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(jdi-&g=
t;avdd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0jdi-&gt;iovdd =3D devm_regulator_get(dev, &quot;i=
ovdd&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(jdi-&gt;iovdd))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR(jdi-&g=
t;iovdd);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0jdi-&gt;vcc_gpio =3D devm_gpiod_get(dev, &quot;vc=
c&quot;, GPIOD_OUT_LOW);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(jdi-&gt;vcc_gpio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;ca=
nnot get vcc-gpio %ld\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0PTR_ERR(jdi-&gt;vcc_gpio));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jdi-&gt;vcc_gpio =3D =
NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_direction_outpu=
t(jdi-&gt;vcc_gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0jdi-&gt;reset_gpio =3D devm_gpiod_get(dev, &quot;=
reset&quot;, GPIOD_OUT_LOW);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(jdi-&gt;reset_gpio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;ca=
nnot get reset-gpios %ld\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0PTR_ERR(jdi-&gt;reset_gpio));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jdi-&gt;reset_gpio =
=3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_direction_outpu=
t(jdi-&gt;reset_gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0jdi-&gt;enable_gpio =3D devm_gpiod_get(dev, &quot=
;enable&quot;, GPIOD_OUT_LOW);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(jdi-&gt;enable_gpio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;ca=
nnot get enable-gpio %ld\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0PTR_ERR(jdi-&gt;enable_gpio));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jdi-&gt;enable_gpio =
=3D NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_direction_outpu=
t(jdi-&gt;enable_gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0jdi-&gt;pwm_gpio =3D devm_gpiod_get(dev, &quot;pw=
m&quot;, GPIOD_OUT_LOW);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(jdi-&gt;pwm_gpio)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &quot;ca=
nnot get pwm-gpio %ld\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0PTR_ERR(jdi-&gt;pwm_gpio));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jdi-&gt;pwm_gpio =3D =
NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpiod_direction_outpu=
t(jdi-&gt;pwm_gpio, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
<br>
As I said earlier, most of these aren&#39;t specified in the binding, fix<b=
r>
either the binding or the code.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* we don&#39;t have backlight right now, proceed=
 further */<br>
&gt; +#ifdef BACKLIGHT<br>
&gt; +=C2=A0 =C2=A0 =C2=A0np =3D of_parse_phandle(dev-&gt;of_node, &quot;ba=
cklight&quot;, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (np) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0jdi-&gt;backlight =3D=
 of_find_backlight_by_node(np);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(np);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!jdi-&gt;backligh=
t)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0return -EPROBE_DEFER;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +#endif<br>
<br>
Again, if you don&#39;t support it, don&#39;t submit it. We don&#39;t want =
dead code<br>
in the kernel.<br>
<br>
&gt; +MODULE_AUTHOR(&quot;Sumit Semwal &lt;<a href=3D"mailto:sumit.semwal@l=
inaro.org">sumit.semwal@linaro.org</a>&gt;&quot;);<br>
&gt; +MODULE_AUTHOR(&quot;Vinay Simha BN &lt;<a href=3D"mailto:simhavcs@gma=
il.com">simhavcs@gmail.com</a>&gt;&quot;);<br>
&gt; +MODULE_DESCRIPTION(&quot;JDI WUXGA LT070ME05000 DSI video/command mod=
e panel driver&quot;);<br>
<br>
Technically this doesn&#39;t support command mode yet, so you might want to=
<br>
remove that from the description to avoid confusion.<br>
<br>
Thierry<br>
</blockquote></div>

--001a113ee4bc23692105305f5921--
