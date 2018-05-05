From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH V6 4/7] ARM: dts: imx6sx-sabreauto: add fec support
Date: Sat, 5 May 2018 09:10:51 -0300
Message-ID: <CAOMZO5B8xrnjyoPoj0J_+WM6TBbE1Gbq8HChdTCQ=UpKYyRBmQ@mail.gmail.com>
References: <1525508963-7986-1-git-send-email-Anson.Huang@nxp.com> <1525508963-7986-4-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525508963-7986-4-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Haibo Chen <haibo.chen@freescale.com>, Fugang Duan <fugang.duan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Robin Gong <yibin.gong@nxp.com>, NXP Linux Team <Linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, May 5, 2018 at 5:29 AM, Anson Huang <Anson.Huang@nxp.com> wrote:
> Add FEC support on i.MX6SX Sabre Auto board.
>
> Signed-off-by: Fugang Duan <fugang.duan@nxp.com>

Again, it is not clear who is the author here. Is it Fugang or yourself?

> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> changes since V5:
>         use "gpios" instead of "enable-gpio".
>  arch/arm/boot/dts/imx6sx-sabreauto.dts | 80 ++++++++++++++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
>
> diff --git a/arch/arm/boot/dts/imx6sx-sabreauto.dts b/arch/arm/boot/dts/imx6sx-sabreauto.dts
> index 4d41b4d..7dda741 100644
> --- a/arch/arm/boot/dts/imx6sx-sabreauto.dts
> +++ b/arch/arm/boot/dts/imx6sx-sabreauto.dts
> @@ -18,6 +18,17 @@
>                 reg = <0x80000000 0x80000000>;
>         };
>
> +       reg_fec: fec_io_supply {
> +               compatible = "regulator-gpio";
> +               regulator-name = "1.8V_1.5V_FEC";
> +               regulator-min-microvolt = <1500000>;
> +               regulator-max-microvolt = <1800000>;
> +               states = <1500000 0x0 1800000 0x1>;
> +               gpios = <&max7322 0 GPIO_ACTIVE_HIGH>;
> +               vin-supply = <&sw2_reg>;
> +               enable-active-high;
> +       };

I still find this confusing.

There is no consumer for reg_fec in, so it seems you are relying on
the fact that the kernel regulator core will disable reg_fec to put
the regulator in the state you require.
