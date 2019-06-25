From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v4 2/2] drm/panel: Add support for Raydium RM67191 panel driver
Date: Tue, 25 Jun 2019 11:06:00 -0300
Message-ID: <CAOMZO5C2syuzyGcpjVOvSvDghaA-ifc8oL-pqhivP49wBf=GSw@mail.gmail.com>
References: <1561446674-25084-1-git-send-email-robert.chiras@nxp.com> <1561446674-25084-3-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561446674-25084-3-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, DRI mailing list <dri-devel@lists.freedesktop.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

Hi Robert,

On Tue, Jun 25, 2019 at 4:28 AM Robert Chiras <robert.chiras@nxp.com> wrote:

> +static int rad_bl_get_brightness(struct backlight_device *bl)
> +{
> +       struct mipi_dsi_device *dsi = bl_get_data(bl);
> +       struct rad_panel *rad = mipi_dsi_get_drvdata(dsi);
> +       struct device *dev = &dsi->dev;
> +       u16 brightness;
> +       int ret;
> +
> +       if (!rad->prepared)
> +               return 0;
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "\n");

Please remove this debug line.

> +       if (!rad->prepared)
> +               return 0;
> +
> +       DRM_DEV_DEBUG_DRIVER(dev, "New brightness: %d\n", bl->props.brightness);

Please remove it.

> +       ret = of_property_read_u32(np, "dsi-lanes", &dsi->lanes);
> +       if (ret) {
> +               dev_err(dev, "Failed to get dsi-lanes property (%d)\n", ret);
> +               return ret;
> +       }
> +
> +       panel->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);

Even it is optional, you still need to check for error and propagate
it in the case of error.

Otherwise defer probe will not work.

> +       ret = drm_panel_add(&panel->panel);
> +       if (ret)
> +               return ret;
> +
> +

One blank line is enough.
