From: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: freescale: Add i.MX8MN dtsi support
Date: Fri, 31 May 2019 08:39:49 -0300
Message-ID: <CAOMZO5D1B1tKs8eu_a8hXs193+TukHAYHiCEyk5g63p1S-cnbg@mail.gmail.com>
References: <20190530094706.865-1-Anson.Huang@nxp.com> <20190530094706.865-2-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190530094706.865-2-Anson.Huang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yongcai Huang <Anson.Huang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bruno Thomsen <bruno.thomsen@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>, Ping Bai <ping.bai@nxp.com>, Li Yang <leoyang.li@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, pankaj.bansal@nxp.com, Bhaskar Upadhaya <bhaskar.upadhaya@nxp.com>, Pramod Kumar <pramod.kumar_1@nxp.com>, Vabhav Sharma <vabhav.sharma@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-kernel <linux-ke>
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2019 at 6:45 AM <Anson.Huang@nxp.com> wrote:

> +                       gpio1: gpio@30200000 {
> +                               compatible = "fsl,imx8mn-gpio", "fsl,imx35-gpio";
> +                               reg = <0x30200000 0x10000>;
> +                               interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +                                            <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;

No GPIO clocks entries?

> +                       usbphynop1: usbphynop1 {
> +                               compatible = "usb-nop-xceiv";
> +                               clocks = <&clk IMX8MN_CLK_USB_PHY_REF>;
> +                               assigned-clocks = <&clk IMX8MN_CLK_USB_PHY_REF>;
> +                               assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_100M>;
> +                               clock-names = "main_clk";
> +                       };

 usbphynop1 does not have any registers associated, so it should be
placed outside the soc.

Building with W=1 should warn you about that.

> +                       usbphynop2: usbphynop2 {
> +                               compatible = "usb-nop-xceiv";
> +                               clocks = <&clk IMX8MN_CLK_USB_PHY_REF>;
> +                               assigned-clocks = <&clk IMX8MN_CLK_USB_PHY_REF>;
> +                               assigned-clock-parents = <&clk IMX8MN_SYS_PLL1_100M>;
> +                               clock-names = "main_clk";
> +                       };
> +

Ditto
