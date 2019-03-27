From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH v6 1/4] arm64: dts: imx8mq: Add SDMA nodes
Date: Wed, 27 Mar 2019 11:51:45 +0200
Message-ID: <CAEnQRZD27=jCvGB_Go-niXyEtrFu=MP2Wyvvqcx2CpnQ4Npx-Q@mail.gmail.com>
References: <20190308120141.3698-1-daniel.baluta@nxp.com> <20190308120141.3698-2-daniel.baluta@nxp.com>
 <20190319143139.GA24315@dragon> <f5934d5bca4b9241d0ac84de463fbeed@www.akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f5934d5bca4b9241d0ac84de463fbeed@www.akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>, Mark Rutland <mark.rutland@arm.com>, Devicetree List <devicetree@vger.kernel.org>, baruch@tkos.co.il, Anson Huang <anson.huang@nxp.com>, Abel Vesa <abel.vesa@nxp.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, ccaione@baylibre.com, Chris Spencer <spencercw@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Aisheng Dong <aisheng.dong@nxp.com>, agx@sigxcpu.org, Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Lucas
List-Id: devicetree@vger.kernel.org

On Tue, Mar 26, 2019 at 11:44 PM Angus Ainslie <angus@akkea.ca> wrote:
>
> On 2019-03-19 07:31, Shawn Guo wrote:
> > On Fri, Mar 08, 2019 at 12:02:22PM +0000, Daniel Baluta wrote:
> >> SDMA1 is part of AIPS-3 region and SDMA2 is part
> >> of AIPS-1 region.
> >>
> >> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> >
> > Reviewed-by tag should go after your SoB, since that's the sequence of
> > how they come.
> >
> >> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> >> [initial submit in i.MX internal tree]
> >> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> >> [adaptation for linux-next]
> >
> > I would see these notes in commit log or even just cover letter.
> >
> > Shawn
> >
> >> ---
> >>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 22 ++++++++++++++++++++++
> >>  1 file changed, 22 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> >> b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> >> index 9155bd4784eb..9d48450453fb 100644
> >> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> >> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> >> @@ -234,6 +234,17 @@
> >>                              status = "disabled";
> >>                      };
> >>
> >> +                    sdma2: sdma@302c0000 {
> >> +                            compatible = "fsl,imx8mq-sdma","fsl,imx7d-sdma";
> >> +                            reg = <0x302c0000 0x10000>;
> >> +                            interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
> >> +                            clocks = <&clk IMX8MQ_CLK_SDMA2_ROOT>,
> >> +                                     <&clk IMX8MQ_CLK_SDMA2_ROOT>;
> >> +                            clock-names = "ipg", "ahb";
> >> +                            #dma-cells = <3>;
> >> +                            fsl,sdma-ram-script-name = "imx/sdma/sdma-imx7d.bin";
> >> +                    };
> >> +
> >>                      iomuxc: iomuxc@30330000 {
> >>                              compatible = "fsl,imx8mq-iomuxc";
> >>                              reg = <0x30330000 0x10000>;
> >> @@ -575,6 +586,17 @@
> >>                              status = "disabled";
> >>                      };
> >>
> >> +                    sdma1: sdma@30bd0000 {
> >> +                            compatible = "fsl, imx8mq-sdma","fsl,imx7d-sdma";
>
> There shouldn't be a space in the imx8mq compatible string.

Oh, nice catch. This patch series is already in so care to send a fix?

Otherwise, I will take care of it.

thanks,
Daniel.
