From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: display/panel: Expand rotation documentation
Date: Tue, 11 Jun 2019 09:25:37 -0600
Message-ID: <CAL_JsqLM1CikZ8+NPjLk2CEW-z9vPynZpVG20x0jsa7hVq0LvA@mail.gmail.com>
References: <20190611040350.90064-1-dbasehore@chromium.org> <20190611040350.90064-3-dbasehore@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190611040350.90064-3-dbasehore@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Derek Basehore <dbasehore@chromium.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, Intel Graphics <intel-gfx@lists.freedesktop.org>, moderated list:
List-Id: devicetree@vger.kernel.org

On Mon, Jun 10, 2019 at 10:03 PM Derek Basehore <dbasehore@chromium.org> wrote:
>
> This adds to the rotation documentation to explain how drivers should
> use the property and gives an example of the property in a devicetree
> node.
>
> Signed-off-by: Derek Basehore <dbasehore@chromium.org>
> ---
>  .../bindings/display/panel/panel.txt          | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/panel/panel.txt b/Documentation/devicetree/bindings/display/panel/panel.txt
> index e2e6867852b8..f35d62d933fc 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel.txt
> +++ b/Documentation/devicetree/bindings/display/panel/panel.txt
> @@ -2,3 +2,35 @@ Common display properties
>  -------------------------
>
>  - rotation:    Display rotation in degrees counter clockwise (0,90,180,270)
> +
> +Property read from the device tree using of of_drm_get_panel_orientation

Don't put kernel specifics into bindings.

> +
> +The panel driver may apply the rotation at the TCON level, which will

What's TCON? Something Mediatek specific IIRC.

> +make the panel look like it isn't rotated to the kernel and any other
> +software.
> +
> +If not, a panel orientation property should be added through the SoC
> +vendor DRM code using the drm_connector_init_panel_orientation_property
> +function.

The 'rotation' property should be defined purely based on how the
panel is mounted relative to a device's orientation. If the display
pipeline has some ability to handle rotation, that's a feature of the
display pipeline and not the panel.

> +
> +Example:

This file is a collection of common properties. It shouldn't have an
example especially as this example is mostly non-common properties.

> +       panel: panel@0 {
> +               compatible = "boe,himax8279d8p";
> +               reg = <0>;
> +               enable-gpios = <&pio 45 0>;

> +               pp33-gpios = <&pio 35 0>;
> +               pp18-gpios = <&pio 36 0>;

BTW, are these upstream because they look like GPIO controlled
supplies which we model with gpio-regulator binding typically.

> +               pinctrl-names = "default", "state_3300mv", "state_1800mv";
> +               pinctrl-0 = <&panel_pins_default>;
> +               pinctrl-1 = <&panel_pins_3300mv>;
> +               pinctrl-2 = <&panel_pins_1800mv>;
> +               backlight = <&backlight_lcd0>;
> +               rotation = <180>;
> +               status = "okay";
> +
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint = <&dsi_out>;
> +                       };
> +               };
> +       };
> --
> 2.22.0.rc2.383.gf4fbbf30c2-goog
>
