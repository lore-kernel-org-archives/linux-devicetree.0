From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ARM: dts: imx7d: correct cpu supply name for voltage scaling
Date: Tue, 15 May 2018 08:44:53 -0300
Message-ID: <CAOMZO5Ci6Kmb9hK7=pvYXURWLfRun1gu+XOskXAe0xo=v1NTpA@mail.gmail.com>
References: <1526375609-17676-1-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1526375609-17676-1-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, NXP Linux Team <Linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, May 15, 2018 at 6:13 AM, Anson Huang <Anson.Huang@nxp.com> wrote:

> diff --git a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
> index 7f64568..60deaf9 100644
> --- a/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
> +++ b/arch/arm/boot/dts/imx7d-cl-som-imx7.dts
> @@ -33,7 +33,7 @@
>  };
>
>  &cpu0 {
> -       arm-supply = <&sw1a_reg>;
> +       cpu-supply = <&sw1a_reg>;
>  };
>
>  &fec1 {
> @@ -284,4 +284,4 @@
>                         MX7D_PAD_LPSR_GPIO1_IO05__GPIO1_IO5     0x14 /* OTG PWREN */
>                 >;
>         };
> -};
> \ No newline at end of file
> +};

This change seems unrelated.

Other than that:

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
