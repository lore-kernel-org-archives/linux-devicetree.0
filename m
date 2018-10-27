From: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH v3 20/25] drm/panel: Add Techstar TS8550B
 MIPI-DSI LCD panel
Date: Sat, 27 Oct 2018 16:27:38 +0000
Message-ID: <20181027162738.7jlvinhyzx766t4a@plaes.org>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
 <20181026144344.27778-21-jagan@amarulasolutions.com>
 <20181026161324.qbpcpkpwyixi7juk@plaes.org>
 <CAMty3ZDc84ErYB9LR_Y7OJtUOx+AAhTV1RwC7-Jr1Br8yN6hUw@mail.gmail.com>
Reply-To: plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBDB4J47M7YERB7ND2LPAKGQE4YJBONI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <CAMty3ZDc84ErYB9LR_Y7OJtUOx+AAhTV1RwC7-Jr1Br8yN6hUw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>, Vasily Khoruzhick <anarsoul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Oct 27, 2018 at 03:25:29PM +0530, Jagan Teki wrote:
> On Fri, Oct 26, 2018 at 9:43 PM Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> wrote:
> >
> > On Fri, Oct 26, 2018 at 08:13:39PM +0530, Jagan Teki wrote:
> > > Techstar TS8550B MIPI DSI panel is 480x854, 2-lane MIPI DSI
> > > LCD panel. Add panel driver for it.
> > >
> > > Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > Tested-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > ---
> > > Changes for v3:
> > > - new patch
> > > Changes for v2:
> > > - none
> > >
> > >  drivers/gpu/drm/panel/Kconfig                 |   9 +
> > >  drivers/gpu/drm/panel/Makefile                |   1 +
> > >  .../gpu/drm/panel/panel-techstar-ts8550b.c    | 346 ++++++++++++++++=
++
> > >  3 files changed, 356 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/panel/panel-techstar-ts8550b.c
> > >
> > > diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kc=
onfig
> > > index 20b88c275421..d0d4e60f5153 100644
> > > --- a/drivers/gpu/drm/panel/Kconfig
> > > +++ b/drivers/gpu/drm/panel/Kconfig
> > > @@ -195,4 +195,13 @@ config DRM_PANEL_SITRONIX_ST7789V
> > >         Say Y here if you want to enable support for the Sitronix
> > >         ST7789V controller for 240x320 LCD panels
> > >
> > > +config DRM_PANEL_TECHSTAR_TS8550B
> > > +     tristate "Techstar TS8550B MIPI-DSI panel driver"
> > > +     depends on OF
> > > +     depends on DRM_MIPI_DSI
> > > +     depends on BACKLIGHT_CLASS_DEVICE
> > > +     help
> > > +       Say Y if you want to enable support for panels based on the
> > > +       Techstar TS8550B MIPI-DSI interface.
> > > +
> > >  endmenu
> > > diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/M=
akefile
> > > index 04696bb85218..88011f06edb8 100644
> > > --- a/drivers/gpu/drm/panel/Makefile
> > > +++ b/drivers/gpu/drm/panel/Makefile
> > > @@ -20,3 +20,4 @@ obj-$(CONFIG_DRM_PANEL_SEIKO_43WVF1G) +=3D panel-se=
iko-43wvf1g.o
> > >  obj-$(CONFIG_DRM_PANEL_SHARP_LQ101R1SX01) +=3D panel-sharp-lq101r1sx=
01.o
> > >  obj-$(CONFIG_DRM_PANEL_SHARP_LS043T1LE01) +=3D panel-sharp-ls043t1le=
01.o
> > >  obj-$(CONFIG_DRM_PANEL_SITRONIX_ST7789V) +=3D panel-sitronix-st7789v=
.o
> > > +obj-$(CONFIG_DRM_PANEL_TECHSTAR_TS8550B) +=3D panel-techstar-ts8550b=
.o
> > > diff --git a/drivers/gpu/drm/panel/panel-techstar-ts8550b.c b/drivers=
/gpu/drm/panel/panel-techstar-ts8550b.c
> > > new file mode 100644
> > > index 000000000000..8baca71595a7
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/panel/panel-techstar-ts8550b.c
> > > @@ -0,0 +1,346 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +/*
> > > + * Copyright (C) 2019, Amarula Solutions.
> > > + * Author: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> > > + */
> > > +
> > > +#include <linux/backlight.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/device.h>
> > > +#include <linux/err.h>
> > > +#include <linux/errno.h>
> > > +#include <linux/fb.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/module.h>
> > > +
> > > +#include <linux/gpio/consumer.h>
> > > +#include <linux/regulator/consumer.h>
> > > +
> > > +#include <drm/drm_mipi_dsi.h>
> > > +#include <drm/drm_modes.h>
> > > +#include <drm/drm_panel.h>
> > > +
> > > +#include <video/mipi_display.h>
> > > +
> > > +struct ts8550b {
> > > +     struct drm_panel        panel;
> > > +     struct mipi_dsi_device  *dsi;
> > > +
> > > +     struct backlight_device *backlight;
> > > +     struct regulator        *dvdd;
> > > +     struct regulator        *avdd;
> > > +     struct gpio_desc        *reset;
> > > +
> > > +     bool                    is_enabled;
> > > +     bool                    is_prepared;
> > > +};
> > > +
> > > +static inline struct ts8550b *panel_to_ts8550b(struct drm_panel *pan=
el)
> > > +{
> > > +     return container_of(panel, struct ts8550b, panel);
> > > +}
> > > +
> > > +static inline int ts8550b_dcs_write_seq(struct ts8550b *ctx, const v=
oid *seq,
> > > +                                     size_t len)
> > > +{
> > > +     return mipi_dsi_dcs_write_buffer(ctx->dsi, seq, len);
> > > +};
> > > +
> > > +#define ts8550b_dcs_write_seq_static(ctx, seq...)            \
> > > +     ({                                                      \
> > > +             static const u8 d[] =3D { seq };                  \
> > > +             ts8550b_dcs_write_seq(ctx, d, ARRAY_SIZE(d));   \
> > > +     })
> > > +
> > > +static void ts8550b_init_sequence(struct ts8550b *ctx)
> >
> > This seems to be pretty "standard" MIPI-based display, utilizing
> > bunch of manufacturer-specific commands during init sequence.
> >
> > Standard MIPI commands fall between 0x00..0xAF and are defined in <vide=
o/mipi.h>
>=20
> Where is this file? we have include/video/mipi_display.h with
> 0x00..0xA8. Not all commands in sequence is listed in this, may be I
> will update DCS commands macros and rest as-it-is. what do you think?

Yeah, include/video/mipi_display.h is the header file I was referring to.

Although those three commands I pointed out look like standard DCS command
defines and the order makes sense too:
SOFT_RESET -> magic1 -> EXIT_SLEEP_MODE -> magic2 -> SET_DISPLAY_ON

Until someone finds proper datasheet for this device, those magic1
and magic2 sequenses remain mystery...

P=C3=A4ikest,
Priit :)

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
