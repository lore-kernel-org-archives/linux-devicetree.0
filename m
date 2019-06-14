From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add support for Raydium
 RM67191 panel
Date: Fri, 14 Jun 2019 09:59:54 -0300
Message-ID: <CAOMZO5AMBr0TZip_PRBRPkMZ-d-kVeEOB4-rMTtcfcYtjLrLqw@mail.gmail.com>
References: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com> <1560513063-24995-2-git-send-email-robert.chiras@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560513063-24995-2-git-send-email-robert.chiras@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Chiras <robert.chiras@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, NXP Linux Team <linux-imx@nxp.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2019 at 8:53 AM Robert Chiras <robert.chiras@nxp.com> wrote:
>
> Add dt-bindings documentation for Raydium RM67191 DSI panel.
>
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> ---
>  .../bindings/display/panel/raydium,rm67191.txt     | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
>
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
> new file mode 100644
> index 0000000..5a6268d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm67191.txt
> @@ -0,0 +1,42 @@
> +Raydium RM67171 OLED LCD panel with MIPI-DSI protocol
> +
> +Required properties:
> +- compatible:          "raydium,rm67191"
> +- reg:                 virtual channel for MIPI-DSI protocol
> +                       must be <0>
> +- dsi-lanes:           number of DSI lanes to be used
> +                       must be <3> or <4>
> +- port:                input port node with endpoint definition as
> +                       defined in Documentation/devicetree/bindings/graph.txt;
> +                       the input port should be connected to a MIPI-DSI device
> +                       driver
> +
> +Optional properties:
> +- reset-gpio:          a GPIO spec for the RST_B GPIO pin

reset-gpios (with the s in the end) is the recommendation.

> +- display-timings:     timings for the connected panel according to [1]

This is not needed.

> +- video-mode:          0 - burst-mode
> +                       1 - non-burst with sync event
> +                       2 - non-burst with sync pulse
> +
> +[1]: Documentation/devicetree/bindings/display/display-timing.txt

This path does not exist.

Also, could you try to align these bindings with the one from raydium,rm68200?

There are power-supply and backlight optional properties there, which
seem useful.

> +
> +Example:
> +
> +       panel@0 {
> +               compatible = "raydium,rm67191";
> +               reg = <0>;
> +               pinctrl-0 = <&pinctrl_mipi_dsi_0_1_en>;

You should also pass pinctrl-names = "default"; if you use pinctrl-0.

> +               reset-gpio = <&gpio1 7 GPIO_ACTIVE_HIGH>;

Should be active low.
