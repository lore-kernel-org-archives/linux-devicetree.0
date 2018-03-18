From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: imx6sx-sabreauto: add external 24MHz clock source
Date: Sun, 18 Mar 2018 10:03:43 -0300
Message-ID: <CAOMZO5CG6XuJ7N8W--zEwEVd9JHj887_7aNp+K8D-Xt1OnKh7A@mail.gmail.com>
References: <1521342853-2941-1-git-send-email-Anson.Huang@nxp.com> <1521342853-2941-2-git-send-email-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1521342853-2941-2-git-send-email-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Anson Huang <Anson.Huang@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, NXP Linux Team <Linux-imx@nxp.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sun, Mar 18, 2018 at 12:14 AM, Anson Huang <Anson.Huang@nxp.com> wrote:

> diff --git a/arch/arm/boot/dts/imx6sx-sabreauto.dts b/arch/arm/boot/dts/imx6sx-sabreauto.dts
> index 72da5ac..83f7cac 100644
> --- a/arch/arm/boot/dts/imx6sx-sabreauto.dts
> +++ b/arch/arm/boot/dts/imx6sx-sabreauto.dts
> @@ -18,6 +18,14 @@
>                 reg = <0x80000000 0x80000000>;
>         };
>
> +       clocks {
> +               codec_osc: anaclk2 {
> +                       #clock-cells = <0>;
> +                       compatible = "fixed-clock";
> +                       clock-frequency = <24576000>;
> +               };
> +       };

The clocks container should be removed and the clock node could be put
directly into the root node.

Also, I do not see 'codec_osc' being used in this dts.
