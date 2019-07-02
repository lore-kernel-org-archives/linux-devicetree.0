From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mq: Add sai6 node
Date: Tue, 2 Jul 2019 15:40:23 +0300
Message-ID: <CAEnQRZBtAOzuF0L1iKKTRdR_A5skbnZFb=B1io8f_pdHcnvbyg@mail.gmail.com>
References: <20190702114102.1254-1-andradanciu1997@gmail.com> <20190702114542.2eoc6nm2kyhode43@fsr-ub1664-175>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702114542.2eoc6nm2kyhode43@fsr-ub1664-175>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Andra Danciu <andradanciu1997@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Anson Huang <anson.huang@nxp.com>, "ccaione@baylibre.com" <ccaione@baylibre.com>, "angus@akkea.ca" <angus@akkea.ca>, "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>, "agx@sigxcpu.org" <agx@sigxcpu.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>linux-
List-Id: devicetree@vger.kernel.org

On Tue, Jul 2, 2019 at 2:46 PM Abel Vesa <abel.vesa@nxp.com> wrote:
>
> On 19-07-02 14:41:02, Andra Danciu wrote:
>
> Missing commit message here. Please add one.

Agree. Also, please add SAI3. As you noticed our pico pi board has
pins exposed on for SAI2/SAI3.

As for the description you can say:

SAI3/6 supports up to 2-channels TX (1 dataline) and 2-channels RX (1 dataline).

>
> > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > index d09b808eff87..1ff664523f56 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > @@ -278,6 +278,20 @@
> >                       #size-cells = <1>;
> >                       ranges = <0x30000000 0x30000000 0x400000>;
> >
> > +                     sai6: sai@30030000 {
> > +                             compatible = "fsl,imx8mq-sai",
> > +                                     "fsl,imx6sx-sai";
> > +                             reg = <0x30030000 0x10000>;
> > +                             interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> > +                             clocks = <&clk IMX8MQ_CLK_SAI6_IPG>,
> > +                                     <&clk IMX8MQ_CLK_SAI6_ROOT>,
> > +                                     <&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
> > +                             clock-names = "bus", "mclk1", "mclk2", "mclk3";
> > +                             dmas = <&sdma2 4 24 0>, <&sdma2 5 24 0>;
> > +                             dma-names = "rx", "tx";
> > +                             status = "disabled";
> > +                     };
> > +
> >                       gpio1: gpio@30200000 {
> >                               compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
> >                               reg = <0x30200000 0x10000>;
> > --
> > 2.11.0
> >
