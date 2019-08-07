From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 07/21] ARM: dts: imx7-colibri: fix 1.8V/UHS support
Date: Wed, 7 Aug 2019 08:19:13 -0300
Message-ID: <CAOMZO5CdWmVKXmNSLdbsmnU6_ZKwbeVArtOQzuTg_gtqTUnVag@mail.gmail.com>
References: <20190807082556.5013-1-philippe.schenker@toradex.com> <20190807082556.5013-8-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807082556.5013-8-philippe.schenker@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?B?TWljaGFsIFZva8OhxI0=?= <michal.vokac@ysoft.com>, Stefan Agner <stefan.agner@toradex.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

Hi Philippe,

On Wed, Aug 7, 2019 at 5:26 AM Philippe Schenker
<philippe.schenker@toradex.com> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Add pinmuxing and do not specify voltage restrictions for the usdhc
> instance available on the modules edge connector. This allows to use
> SD-cards with higher transfer modes if supported by the carrier board.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
>
> ---
>
> Changes in v3:
> - Add new commit message from Stefan's proposal on ML

The commit message has been improved, but there is also another point
I mentioned earlier:

>
> Changes in v2: None
>
>  arch/arm/boot/dts/imx7-colibri.dtsi | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/imx7-colibri.dtsi b/arch/arm/boot/dts/imx7-colibri.dtsi
> index 16d1a1ed1aff..67f5e0c87fdc 100644
> --- a/arch/arm/boot/dts/imx7-colibri.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri.dtsi
> @@ -326,7 +326,6 @@
>  &usdhc1 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_usdhc1 &pinctrl_cd_usdhc1>;
> -       no-1-8-v;
>         cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
>         disable-wp;
>         vqmmc-supply = <&reg_LDO2>;
> @@ -671,6 +670,28 @@
>                 >;
>         };
>
> +       pinctrl_usdhc1_100mhz: usdhc1grp_100mhz {

This new entry has been added and it is not referenced.

> +               fsl,pins = <
> +                       MX7D_PAD_SD1_CMD__SD1_CMD       0x5a
> +                       MX7D_PAD_SD1_CLK__SD1_CLK       0x1a
> +                       MX7D_PAD_SD1_DATA0__SD1_DATA0   0x5a
> +                       MX7D_PAD_SD1_DATA1__SD1_DATA1   0x5a
> +                       MX7D_PAD_SD1_DATA2__SD1_DATA2   0x5a
> +                       MX7D_PAD_SD1_DATA3__SD1_DATA3   0x5a
> +               >;
> +       };
> +
> +       pinctrl_usdhc1_200mhz: usdhc1grp_200mhz {

Same here.
