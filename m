From: Alexey Klimov <klimov.linux@gmail.com>
Subject: Re: [PATCH v8 2/6] video: add of helper for videomode
Date: Mon, 12 Nov 2012 23:00:37 +0400
Message-ID: <CALW4P+JmyEnnxpC8AuJ1-mPG-Rw0XEyZFogeVaNuw5omdH5-CA@mail.gmail.com>
References: <1352734626-27412-1-git-send-email-s.trumtrar@pengutronix.de>
	<1352734626-27412-3-git-send-email-s.trumtrar@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1352734626-27412-3-git-send-email-s.trumtrar@pengutronix.de>
Sender: linux-media-owner@vger.kernel.org
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: devicetree-discuss@lists.ozlabs.org, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robherring2@gmail.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thierry Reding <thierry.reding@avionic-design.de>, Guennady Liakhovetski <g.liakhovetski@gmx.de>, linux-media@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>, Stephen Warren <swarren@wwwdotorg.org>, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org

Hello Steffen,

On Mon, Nov 12, 2012 at 7:37 PM, Steffen Trumtrar
<s.trumtrar@pengutronix.de> wrote:
> This adds support for reading display timings from DT or/and convert =
one of those
> timings to a videomode.
> The of_display_timing implementation supports multiple children where=
 each
> property can have up to 3 values. All children are read into an array=
, that
> can be queried.
> of_get_videomode converts exactly one of that timings to a struct vid=
eomode.
>
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  .../devicetree/bindings/video/display-timings.txt  |  107 ++++++++++=
+
>  drivers/video/Kconfig                              |   13 ++
>  drivers/video/Makefile                             |    2 +
>  drivers/video/of_display_timing.c                  |  186 ++++++++++=
++++++++++
>  drivers/video/of_videomode.c                       |   47 +++++
>  include/linux/of_display_timings.h                 |   19 ++
>  include/linux/of_videomode.h                       |   15 ++
>  7 files changed, 389 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/video/display-t=
imings.txt
>  create mode 100644 drivers/video/of_display_timing.c
>  create mode 100644 drivers/video/of_videomode.c
>  create mode 100644 include/linux/of_display_timings.h
>  create mode 100644 include/linux/of_videomode.h
>
> diff --git a/Documentation/devicetree/bindings/video/display-timings.=
txt b/Documentation/devicetree/bindings/video/display-timings.txt
> new file mode 100644
> index 0000000..e22e2fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/video/display-timings.txt
> @@ -0,0 +1,107 @@
> +display-timings bindings
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> +
> +display-timings-node
> +--------------------
> +
> +required properties:
> + - none
> +
> +optional properties:
> + - native-mode: the native mode for the display, in case multiple mo=
des are
> +               provided. When omitted, assume the first node is the =
native.
> +
> +timings-subnode
> +---------------
> +
> +required properties:
> + - hactive, vactive: Display resolution
> + - hfront-porch, hback-porch, hsync-len: Horizontal Display timing p=
arameters
> +   in pixels
> +   vfront-porch, vback-porch, vsync-len: Vertical display timing par=
ameters in
> +   lines
> + - clock-frequency: displayclock in Hz
> +
> +optional properties:
> + - hsync-active : Hsync pulse is active low/high/ignored
> + - vsync-active : Vsync pulse is active low/high/ignored
> + - de-active : Data-Enable pulse is active low/high/ignored
> + - pixelclk-inverted : pixelclock is inverted/non-inverted/ignored
> + - interlaced (bool)
> + - doublescan (bool)
> +
> +All the optional properties that are not bool follow the following l=
ogic:
> +    <1> : high active
> +    <0> : low active
> +    omitted : not used on hardware
> +
> +There are different ways of describing the capabilities of a display=
=2E The devicetree
> +representation corresponds to the one commonly found in datasheets f=
or displays.
> +If a display supports multiple signal timings, the native-mode can b=
e specified.
> +
> +The parameters are defined as
> +
> +struct display_timing
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  +----------+---------------------------------------------+--------=
--+-------+
> +  |          |                =E2=86=91                            |=
          |       |
> +  |          |                |vback_porch                 |        =
  |       |
> +  |          |                =E2=86=93                            |=
          |       |
> +  +----------###############################################--------=
--+-------+
> +  |          #                =E2=86=91                            #=
          |       |
> +  |          #                |                            #        =
  |       |
> +  |  hback   #                |                            #  hfront=
  | hsync |
> +  |   porch  #                |       hactive              #  porch =
  |  len  |
> +  |<-------->#<---------------+--------------------------->#<-------=
->|<----->|
> +  |          #                |                            #        =
  |       |
> +  |          #                |vactive                     #        =
  |       |
> +  |          #                |                            #        =
  |       |
> +  |          #                =E2=86=93                            #=
          |       |
> +  +----------###############################################--------=
--+-------+
> +  |          |                =E2=86=91                            |=
          |       |
> +  |          |                |vfront_porch                |        =
  |       |
> +  |          |                =E2=86=93                            |=
          |       |
> +  +----------+---------------------------------------------+--------=
--+-------+
> +  |          |                =E2=86=91                            |=
          |       |
> +  |          |                |vsync_len                   |        =
  |       |
> +  |          |                =E2=86=93                            |=
          |       |
> +  +----------+---------------------------------------------+--------=
--+-------+
> +
> +
> +Example:
> +
> +       display-timings {
> +               native-mode =3D <&timing0>;
> +               timing0: 1920p24 {
> +                       /* 1920x1080p24 */
> +                       clock-frequency =3D <52000000>;
> +                       hactive =3D <1920>;
> +                       vactive =3D <1080>;
> +                       hfront-porch =3D <25>;
> +                       hback-porch =3D <25>;
> +                       hsync-len =3D <25>;
> +                       vback-porch =3D <2>;
> +                       vfront-porch =3D <2>;
> +                       vsync-len =3D <2>;
> +                       hsync-active =3D <1>;
> +               };
> +       };
> +
> +Every required property also supports the use of ranges, so the comm=
only used
> +datasheet description with <min typ max>-tuples can be used.
> +
> +Example:
> +
> +       timing1: timing {
> +               /* 1920x1080p24 */
> +               clock-frequency =3D <148500000>;
> +               hactive =3D <1920>;
> +               vactive =3D <1080>;
> +               hsync-len =3D <0 44 60>;
> +               hfront-porch =3D <80 88 95>;
> +               hback-porch =3D <100 148 160>;
> +               vfront-porch =3D <0 4 6>;
> +               vback-porch =3D <0 36 50>;
> +               vsync-len =3D <0 5 6>;
> +       };
> diff --git a/drivers/video/Kconfig b/drivers/video/Kconfig
> index 2a23b18..a324457 100644
> --- a/drivers/video/Kconfig
> +++ b/drivers/video/Kconfig
> @@ -39,6 +39,19 @@ config DISPLAY_TIMING
>  config VIDEOMODE
>         bool
>
> +config OF_DISPLAY_TIMING
> +       def_bool y
> +       select DISPLAY_TIMING
> +       help
> +         helper to parse display timings from the devicetree
> +
> +config OF_VIDEOMODE
> +       def_bool y
> +       select VIDEOMODE
> +       select OF_DISPLAY_TIMING
> +       help
> +         helper to get videomodes from the devicetree
> +
>  menuconfig FB
>         tristate "Support for frame buffer devices"
>         ---help---
> diff --git a/drivers/video/Makefile b/drivers/video/Makefile
> index fc30439..b936b00 100644
> --- a/drivers/video/Makefile
> +++ b/drivers/video/Makefile
> @@ -168,4 +168,6 @@ obj-$(CONFIG_FB_VIRTUAL)          +=3D vfb.o
>  #video output switch sysfs driver
>  obj-$(CONFIG_VIDEO_OUTPUT_CONTROL) +=3D output.o
>  obj-$(CONFIG_DISPLAY_TIMING) +=3D display_timing.o
> +obj-$(CONFIG_OF_DISPLAY_TIMING) +=3D of_display_timing.o
>  obj-$(CONFIG_VIDEOMODE) +=3D videomode.o
> +obj-$(CONFIG_OF_VIDEOMODE) +=3D of_videomode.o
> diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_dis=
play_timing.c
> new file mode 100644
> index 0000000..0bd30cc
> --- /dev/null
> +++ b/drivers/video/of_display_timing.c
> @@ -0,0 +1,186 @@
> +/*
> + * OF helpers for parsing display timings
> + *
> + * Copyright (c) 2012 Steffen Trumtrar <s.trumtrar@pengutronix.de>, =
Pengutronix
> + *
> + * based on of_videomode.c by Sascha Hauer <s.hauer@pengutronix.de>
> + *
> + * This file is released under the GPLv2
> + */
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <linux/export.h>
> +#include <linux/of_display_timings.h>
> +
> +/**
> + * parse_property - parse timing_entry from device_node
> + * @np: device_node with the property
> + * @name: name of the property
> + * @result: will be set to the return value
> + *
> + * DESCRIPTION:
> + * Every display_timing can be specified with either just the typica=
l value or
> + * a range consisting of min/typ/max. This function helps handling t=
his
> + **/
> +static int parse_property(struct device_node *np, char *name,
> +                               struct timing_entry *result)
> +{
> +       struct property *prop;
> +       int length, cells, ret;
> +
> +       prop =3D of_find_property(np, name, &length);
> +       if (!prop) {
> +               pr_err("%s: could not find property %s\n", __func__, =
name);
> +               return -EINVAL;
> +       }
> +
> +       cells =3D length / sizeof(u32);
> +       if (cells =3D=3D 1) {
> +               ret =3D of_property_read_u32(np, name, &result->typ);
> +               result->min =3D result->typ;
> +               result->max =3D result->typ;
> +       } else if (cells =3D=3D 3) {
> +               ret =3D of_property_read_u32_array(np, name, &result-=
>min, cells);
> +       } else {
> +               pr_err("%s: illegal timing specification in %s\n", __=
func__, name);
> +               return -EINVAL;
> +       }
> +
> +       return ret;
> +}
> +
> +/**
> + * of_get_display_timing - parse display_timing entry from device_no=
de
> + * @np: device_node with the properties
> + **/
> +static struct display_timing *of_get_display_timing(struct device_no=
de *np)
> +{
> +       struct display_timing *dt;
> +       int ret =3D 0;
> +
> +       dt =3D kzalloc(sizeof(*dt), GFP_KERNEL);
> +       if (!dt) {
> +               pr_err("%s: could not allocate display_timing struct\=
n", __func__);
> +               return NULL;
> +       }
> +
> +       ret |=3D parse_property(np, "hback-porch", &dt->hback_porch);
> +       ret |=3D parse_property(np, "hfront-porch", &dt->hfront_porch=
);
> +       ret |=3D parse_property(np, "hactive", &dt->hactive);
> +       ret |=3D parse_property(np, "hsync-len", &dt->hsync_len);
> +       ret |=3D parse_property(np, "vback-porch", &dt->vback_porch);
> +       ret |=3D parse_property(np, "vfront-porch", &dt->vfront_porch=
);
> +       ret |=3D parse_property(np, "vactive", &dt->vactive);
> +       ret |=3D parse_property(np, "vsync-len", &dt->vsync_len);
> +       ret |=3D parse_property(np, "clock-frequency", &dt->pixelcloc=
k);
> +
> +       of_property_read_u32(np, "vsync-active", &dt->vsync_pol_activ=
e);
> +       of_property_read_u32(np, "hsync-active", &dt->hsync_pol_activ=
e);
> +       of_property_read_u32(np, "de-active", &dt->de_pol_active);
> +       of_property_read_u32(np, "pixelclk-inverted", &dt->pixelclk_p=
ol);
> +       dt->interlaced =3D of_property_read_bool(np, "interlaced");
> +       dt->doublescan =3D of_property_read_bool(np, "doublescan");
> +
> +       if (ret) {
> +               pr_err("%s: error reading timing properties\n", __fun=
c__);
> +               return NULL;
> +       }
> +
> +       return dt;
> +}
> +
> +/**
> + * of_get_display_timings - parse all display_timing entries from a =
device_node
> + * @np: device_node with the subnodes
> + **/
> +struct display_timings *of_get_display_timings(struct device_node *n=
p)
> +{
> +       struct device_node *timings_np;
> +       struct device_node *entry;
> +       struct device_node *native_mode;
> +       struct display_timings *disp;
> +
> +       if (!np) {
> +               pr_err("%s: no devicenode given\n", __func__);
> +               return NULL;
> +       }
> +
> +       timings_np =3D of_find_node_by_name(np, "display-timings");
> +       if (!timings_np) {
> +               pr_err("%s: could not find display-timings node\n", _=
_func__);
> +               return NULL;
> +       }
> +
> +       disp =3D kzalloc(sizeof(*disp), GFP_KERNEL);
> +       if (!disp)
> +               return -ENOMEM;
> +
> +       entry =3D of_parse_phandle(timings_np, "native-mode", 0);
> +       /* assume first child as native mode if none provided */
> +       if (!entry)
> +               entry =3D of_get_next_child(np, NULL);
> +       if (!entry) {
> +               pr_err("%s: no timing specifications given\n", __func=
__);
> +               return NULL;
> +       }
> +
> +       pr_info("%s: using %s as default timing\n", __func__, entry->=
name);
> +
> +       native_mode =3D entry;
> +
> +       disp->num_timings =3D of_get_child_count(timings_np);
> +       disp->timings =3D kzalloc(sizeof(struct display_timing *)*dis=
p->num_timings,
> +                               GFP_KERNEL);
> +       if (!disp->timings)
> +               return -ENOMEM;

Could you please check return values here ^^^ and above "disp =3D
kzalloc(sizeof(*disp), GFP_KERNEL);" ?
May be it's better to return NULL instead of -ENOMEM and put error mess=
age?


--=20
Best regards, Klimov Alexey
