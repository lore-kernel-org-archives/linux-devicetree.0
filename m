From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: Add doc for the ingenic-drm driver
Date: Wed, 17 Apr 2019 08:48:26 -0500
Message-ID: <CAL_JsqJk1qdKzeM+1n3ve65S43-B4Q93ns7Z7mOKidbFPA7KWw@mail.gmail.com>
References: <20190414200824.28348-1-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190414200824.28348-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Mark Rutland <mark.rutland@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>, od@zcrc.me, dri-devel <dri-devel@lists.freedesktop.org>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Apr 14, 2019 at 3:08 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Add documentation for the devicetree bindings of the DRM driver for the

DRM is a Linuxism. What is the LCD controller h/w block called?

> JZ47xx family of SoCs from Ingenic.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> ---
>
> Notes:
>     v2: Remove ingenic,panel property.
>
>     v3: - Rename compatible strings from ingenic,jz47XX-drm to ingenic,jz47XX-lcd
>         - The ingenic,lcd-mode property is now read from the panel node instead
>           of from the driver node
>
>  .../devicetree/bindings/display/ingenic,drm.txt    | 53 ++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,drm.txt
>
> diff --git a/Documentation/devicetree/bindings/display/ingenic,drm.txt b/Documentation/devicetree/bindings/display/ingenic,drm.txt
> new file mode 100644
> index 000000000000..9de47db8a515
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/ingenic,drm.txt
> @@ -0,0 +1,53 @@
> +Ingenic JZ47xx DRM driver
> +
> +Required properties:
> +- compatible: one of:
> +  * ingenic,jz4740-lcd
> +  * ingenic,jz4725b-lcd
> +- reg: LCD registers location and length
> +- clocks: LCD pixclock and device clock specifiers.
> +          The device clock is only required on the JZ4740.
> +- clock-names: "lcd_pclk" and "lcd"
> +- interrupts: Specifies the interrupt line the LCD controller is connected to.
> +
> +Optional properties in the panel mode:
> +- ingenic,lcd-mode: LCD mode to use with the display panel.
> +                   See <dt-bindings/display/ingenic,drm.h> for all the
> +                   possible values.
> +
> +Example:
> +
> +#include <dt-bindings/display/ingenic,drm.h>
> +
> +panel {
> +       compatible = "sharp,ls020b1dd01d", "simple-panel";

'simple-panel' is not a valid compatible string.


> +
> +       backlight = <&backlight>;
> +       power-supply = <&vcc>;
> +
> +       ingenic,lcd-mode = <JZ_LCD_SPECIAL_TFT_2>;
> +
> +       port {
> +               panel_input: endpoint {
> +                       remote-endpoint = <&panel_output>;
> +               };
> +       };
> +};
> +
> +
> +lcd: lcd-controller@13050000 {
> +       compatible = "ingenic,jz4725b-lcd";
> +       reg = <0x13050000 0x1000>;
> +
> +       interrupt-parent = <&intc>;
> +       interrupts = <31>;
> +
> +       clocks = <&cgu JZ4725B_CLK_LCD>;
> +       clock-names = "lcd";
> +
> +       port {
> +               panel_output: endpoint {
> +                       remote-endpoint = <&panel_input>;
> +               };
> +       };
> +};
> --
> 2.11.0
>
