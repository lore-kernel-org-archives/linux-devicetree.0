From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH v3] arm64: dts: imx8mq: Init rates and parents configs for clocks
Date: Sun, 28 Jul 2019 18:25:05 +0300
Message-ID: <CAEnQRZCyyfoVeG90Qbt8nQaEJYS7ywsSRFAy7a7WR6JrKfq-yg@mail.gmail.com>
References: <20190728141218.12702-1-daniel.baluta@nxp.com> <b6506f6579f823e4c1e26ef3a7d1eed2@akkea.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b6506f6579f823e4c1e26ef3a7d1eed2@akkea.ca>
Sender: linux-kernel-owner@vger.kernel.org
To: Angus Ainslie <angus@akkea.ca>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Carlo Caione <ccaione@baylibre.com>, Abel Vesa <abel.vesa@nxp.com>, baruch@tkos.co.il, Andrey Smirnov <andrew.smirnov@gmail.com>, Devicetree List <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, Anson Huang <Anson.Huang@nxp.com>, linux-kernel-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun, Jul 28, 2019 at 5:53 PM Angus Ainslie <angus@akkea.ca> wrote:
>
> Hi Daniel,
>
> On 2019-07-28 07:12, Daniel Baluta wrote:
> > From: Abel Vesa <abel.vesa@nxp.com>
> >
> > Add the initial configuration for clocks that need default parent and
> > rate
> > setting. This is based on the vendor tree clock provider parents and
> > rates
> > configuration except this is doing the setup in dts rather then using
> > clock
> > consumer API in a clock provider driver.
> >
> > Note that by adding the initial rate setting for audio_pll1/audio_pll
> > setting we need to remove it from imx8mq-librem5-devkit.dts
> > imx8mq-librem5-devkit.dts
> >
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
>
> This works with our board. One small nit below
>
> Tested-by: Angus Ainslie (Purism) <angus@akkea.ca>
>
> > ---
> > Changes since v2:
> >       - set rate for audio_pll1/audio_pll2  in the dtsi file and
> >       remove the setting from imx8mq-librem5-devkit.dts
> >
> >  .../dts/freescale/imx8mq-librem5-devkit.dts   |  5 -----
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi     | 21 +++++++++++++++++++
> >  2 files changed, 21 insertions(+), 5 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> > b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> > index 683a11035643..c702ccc82867 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> > @@ -169,11 +169,6 @@
> >       };
> >  };
> >
> > -&clk {
> > -     assigned-clocks = <&clk IMX8MQ_AUDIO_PLL1>, <&clk IMX8MQ_AUDIO_PLL2>;
> > -     assigned-clock-rates = <786432000>, <722534400>;
> > -};
> > -
> >  &dphy {
> >       status = "okay";
> >  };
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > index 02fbd0625318..c67625a881a4 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > @@ -494,6 +494,27 @@
> >                               clock-names = "ckil", "osc_25m", "osc_27m",
> >                                             "clk_ext1", "clk_ext2",
> >                                             "clk_ext3", "clk_ext4";
> > +                             assigned-clocks = <&clk IMX8MQ_VIDEO_PLL1>,
> > +                                     <&clk IMX8MQ_AUDIO_PLL1>,
> > +                                     <&clk IMX8MQ_AUDIO_PLL2>,
> > +                                     <&clk IMX8MQ_CLK_AHB>,
> > +                                     <&clk IMX8MQ_CLK_NAND_USDHC_BUS>,
> > +                                     <&clk IMX8MQ_CLK_AUDIO_AHB>,
> > +                                     <&clk IMX8MQ_VIDEO_PLL1_REF_SEL>,
> > +                                     <&clk IMX8MQ_CLK_NOC>;
> > +                             assigned-clock-parents = <0>,
> > +                                             <0>,
> > +                                             <0>,
> > +                                             <&clk IMX8MQ_SYS1_PLL_133M>,
> > +                                             <&clk IMX8MQ_SYS1_PLL_266M>,
> > +                                             <&clk IMX8MQ_SYS2_PLL_500M>,
> > +                                             <&clk IMX8MQ_CLK_27M>,
> > +                                             <&clk IMX8MQ_SYS1_PLL_800M>;
> > +                             assigned-clock-rates = <593999999>,
> > +                                             <786432000>,
> > +                                             <722534400>;
> > +
> > +
>
> Extra whitespace

Thanks Angus for testing. Fixed in v4.
