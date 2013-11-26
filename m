From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] of: Add simple panel device tree binding
Date: Tue, 26 Nov 2013 10:01:54 +0800
Message-ID: <CAGS+omB5RKRUod_gDrDGRTi3B-BsX54dD1hHeT32gdPSjw9Bkg@mail.gmail.com>
References: <1385145714-3022-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385145714-3022-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Nov 23, 2013 at 2:41 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This binding specifies a set of common properties for display panels. It
> can be used as a basis by bindings for specific panels.
>
> Bindings for three specific panels are provided to show how the simple
> panel binding can be used.
>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This binding has already been discussed earlier. Both Laurent and Tomi
> seemed to be generally fine with this. The fact that the binding targets
> simple (dumb) panels only and the reduced set of properties make it easy
> to be extended in backwards-compatible ways should the need arise, while
> at the same time allowing to support a wide variety of panels out there.
>
>  .../devicetree/bindings/panel/auo,b101aw03.txt      |  7 +++++++
>  .../bindings/panel/chunghwa,claa101wb03.txt         |  7 +++++++
>  .../bindings/panel/panasonic,vvx10f004b00.txt       |  7 +++++++
>  .../devicetree/bindings/panel/simple-panel.txt      | 21 +++++++++++++++++++++
>  4 files changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/panel/auo,b101aw03.txt
>  create mode 100644 Documentation/devicetree/bindings/panel/chunghwa,claa101wb03.txt
>  create mode 100644 Documentation/devicetree/bindings/panel/panasonic,vvx10f004b00.txt
>  create mode 100644 Documentation/devicetree/bindings/panel/simple-panel.txt
>
> diff --git a/Documentation/devicetree/bindings/panel/auo,b101aw03.txt b/Documentation/devicetree/bindings/panel/auo,b101aw03.txt
> new file mode 100644
> index 000000000000..72e088a4fb3a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/auo,b101aw03.txt
> @@ -0,0 +1,7 @@
> +AU Optronics Corporation 10.1" WSVGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "auo,b101aw03"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/panel/chunghwa,claa101wb03.txt b/Documentation/devicetree/bindings/panel/chunghwa,claa101wb03.txt
> new file mode 100644
> index 000000000000..0ab2c05a4c22
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/chunghwa,claa101wb03.txt
> @@ -0,0 +1,7 @@
> +Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "chunghwa,claa101wb03"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/panel/panasonic,vvx10f004b00.txt b/Documentation/devicetree/bindings/panel/panasonic,vvx10f004b00.txt
> new file mode 100644
> index 000000000000..d328b0341bf4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/panasonic,vvx10f004b00.txt
> @@ -0,0 +1,7 @@
> +Panasonic Corporation 10.1" WUXGA TFT LCD panel
> +
> +Required properties:
> +- compatible: should be "panasonic,vvx10f004b00"
> +
> +This binding is compatible with the simple-panel binding, which is specified
> +in simple-panel.txt in this directory.
> diff --git a/Documentation/devicetree/bindings/panel/simple-panel.txt b/Documentation/devicetree/bindings/panel/simple-panel.txt
> new file mode 100644
> index 000000000000..1341bbf4aa3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/panel/simple-panel.txt
> @@ -0,0 +1,21 @@
> +Simple display panel
> +
> +Required properties:
> +- power-supply: regulator to provide the supply voltage
> +
> +Optional properties:
> +- ddc-i2c-bus: phandle of an I2C controller used for DDC EDID probing
> +- enable-gpios: GPIO pin to enable or disable the panel
> +- backlight: phandle of the backlight device attached to the panel
> +
> +Example:
> +
> +       panel: panel {
> +               compatible = "cptt,claa101wb01";
> +               ddc-i2c-bus = <&panelddc>;
> +
> +               power-supply = <&vdd_pnl_reg>;
> +               enable-gpios = <&gpio 90 0>;
> +
> +               backlight = <&backlight>;
> +       };


Pardon the question if this has been discussed before, but, would this
also be a good binding in which to store a panel's physical dimensions
(mmWidth, mmHeight)?  Or is there another binding more appropriate?

> --
> 1.8.4.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
