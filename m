From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 2/4] ARM: dts: ccimx6ulsbcpro: Enable AUO G101EVN010
 lcdif panel
Date: Thu, 25 Oct 2018 12:56:53 -0300
Message-ID: <CAOMZO5B+V5OETLdye7VVB8v6fnZPwPSZjV48_TkzhawQ4zL0oA@mail.gmail.com>
References: <1540480173-12009-1-git-send-email-alex.gonzalez@digi.com> <1540480173-12009-3-git-send-email-alex.gonzalez@digi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1540480173-12009-3-git-send-email-alex.gonzalez@digi.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gonzalez, Alex" <alex.gonzalez@digi.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>, DRI mailing list <dri-devel@lists.freedesktop.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 25, 2018 at 12:11 PM Alex Gonzalez <alex.gonzalez@digi.com> wrote:
>
> This change adds support for the AUO G101EVN010 lcdif panel for the
> mxsfb DRM driver.
>
> Signed-off-by: Alex Gonzalez <alex.gonzalez@digi.com>
> ---
>  arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts b/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
> index 11966d12af76..f6e6b2cf780b 100644
> --- a/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
> +++ b/arch/arm/boot/dts/imx6ul-ccimx6ulsbcpro.dts
> @@ -24,6 +24,18 @@
>                 status = "okay";
>         };
>
> +       panel {
> +               compatible = "auo,g101evn010", "simple-panel";

The "simple-panel" string could be dropped.

Reviewed-by: Fabio Estevam <festevam@gmail.com>


> +               power-supply = <&ldo4_ext>;
> +               backlight = <&lcd_backlight>;
> +
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint = <&display_out>;
> +                       };
> +               };
> +       };
> +
>         reg_usb_otg1_vbus: regulator-usb-otg1 {
>                 compatible = "regulator-fixed";
>                 regulator-name = "usb_otg1_vbus";
> @@ -112,6 +124,12 @@
>                      &pinctrl_lcdif_hvsync>;
>         lcd-supply = <&ldo4_ext>;       /* BU90T82 LVDS bridge power */
>         status = "okay";
> +
> +       port {
> +               display_out: endpoint {
> +                       remote-endpoint = <&panel_in>;
> +               };
> +       };
>  };
>
>  &ldo4_ext {
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
