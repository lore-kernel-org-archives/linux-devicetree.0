From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH v4 3/5] arm64: dts: imx8mq: Add SAI2 node
Date: Fri, 1 Mar 2019 14:25:52 +0200
Message-ID: <CAEnQRZD7kDh1tHtXx53D8BzVymVGPen72jxETHdd5cqLEaHyTQ@mail.gmail.com>
References: <20190227063737.24445-1-daniel.baluta@nxp.com> <20190227063737.24445-4-daniel.baluta@nxp.com>
 <CAOMZO5A7fe9U4qYegxiOC1sPApb22LcvpBLVgSz5XMWegDoZRA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAOMZO5A7fe9U4qYegxiOC1sPApb22LcvpBLVgSz5XMWegDoZRA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "angus@akkea.ca" <angus@akkea.ca>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Abel Vesa <abel.vesa@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dl-li
List-Id: devicetree@vger.kernel.org

On Thu, Feb 28, 2019 at 8:49 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> On Wed, Feb 27, 2019 at 3:38 AM Daniel Baluta <daniel.baluta@nxp.com> wrote:
>
> > +                       sai2: sai@308b0000 {
> > +                               #sound-dai-cells = <0>;
> > +                               compatible = "fsl,imx8mq-sai",
> > +                                            "fsl,imx6sx-sai";
> > +                               reg = <0x308b0000 0x10000>;
> > +                               interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> > +                               clocks = <&clk IMX8MQ_CLK_SAI2_IPG>,
> > +                                        <&clk IMX8MQ_CLK_DUMMY>,
> > +                                        <&clk IMX8MQ_CLK_SAI2_ROOT>,
> > +                                        <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
> > +                               clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
>
> mclk0 is not a valid entry as per the binding doc.

Indeed, will fix in next version. mclk0 is valid in our internal tree
because fsl_sai.c supports it.
Will remove mclk0 for now and re-add it when I will upstream the SAI patch.

Thanks Fabio for review!
