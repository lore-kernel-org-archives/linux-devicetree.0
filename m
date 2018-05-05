From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V6 7/7] ARM: dts: imx6sx-sabreauto: add egalax touch
 screen support
Date: Sat, 5 May 2018 08:56:07 -0300
Message-ID: <CAOMZO5D1H4+w=FGh+8icBziunDzM4jN7peA=mirGb9RBHHqMsg@mail.gmail.com>
References: <1525508963-7986-1-git-send-email-Anson.Huang@nxp.com> <1525508963-7986-7-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525508963-7986-7-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Haibo Chen <haibo.chen@freescale.com>, Fugang Duan <fugang.duan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Robin Gong <yibin.gong@nxp.com>, NXP Linux Team <Linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Anson,

On Sat, May 5, 2018 at 5:29 AM, Anson Huang <Anson.Huang@nxp.com> wrote:
> Add egalax touch screen support on i2c2 bus.
>
> Signed-off-by: Haibo Chen <haibo.chen@freescale.com>

Is Haibo the author of this patch? If so, his name should appear in
the From field.

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> changes since V5:
>         improve pinctrl node name and touchscreen node name.
>  arch/arm/boot/dts/imx6sx-sabreauto.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx6sx-sabreauto.dts b/arch/arm/boot/dts/imx6sx-sabreauto.dts
> index 1dc5b58..3fe41d3 100644
> --- a/arch/arm/boot/dts/imx6sx-sabreauto.dts
> +++ b/arch/arm/boot/dts/imx6sx-sabreauto.dts
> @@ -122,6 +122,12 @@
>  };
>
>  &iomuxc {
> +       pinctrl_egalax_int: egalax-intgrp {
> +               fsl,pins = <
> +                       MX6SX_PAD_SD4_RESET_B__GPIO6_IO_22      0x80000000
> +               >;
> +       };
> +
>         pinctrl_enet1: enet1grp {
>                 fsl,pins = <
>                         MX6SX_PAD_ENET1_MDIO__ENET1_MDIO        0xa0b1
> @@ -264,6 +270,16 @@
>         pinctrl-0 = <&pinctrl_i2c2>;
>         status = "okay";
>
> +       egalax_touchscreen@4 {

Should be touchscreen@4.
