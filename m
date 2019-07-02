From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mm: Init rates and parents configs for clocks
Date: Tue, 2 Jul 2019 16:33:06 +0300
Message-ID: <CAEnQRZDn83HDR+k101UA9MVnCmQevAQcFTCRoS__Xf0PwCCSFQ@mail.gmail.com>
References: <1561469191-26840-1-git-send-email-abel.vesa@nxp.com>
 <CAEnQRZCVQ0+pRh6akiZJXU-fRugEXmnthZp8Q2=aXFXCO3vcUg@mail.gmail.com> <20190702132647.3kyfl5gx6ghdiizl@fsr-ub1664-175>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190702132647.3kyfl5gx6ghdiizl@fsr-ub1664-175>
Sender: linux-kernel-owner@vger.kernel.org
To: Abel Vesa <abel.vesa@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Anson Huang <anson.huang@nxp.com>, dl-linux-imx <linux-imx@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, Devicetree List <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jul 2, 2019 at 4:26 PM Abel Vesa <abel.vesa@nxp.com> wrote:
>
> On 19-06-26 15:45:15, Daniel Baluta wrote:
> > On Tue, Jun 25, 2019 at 4:42 PM Abel Vesa <abel.vesa@nxp.com> wrote:
> > >
> > > Add the initial configuration for clocks that need default parent and rate
> > > setting. This is based on the vendor tree clock provider parents and rates
> > > configuration except this is doing the setup in dts rather than using clock
> > > consumer API in a clock provider driver.
> > >
> > > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 36 +++++++++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > index 232a741..ab92108 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > @@ -451,6 +451,42 @@
> > >                                          <&clk_ext3>, <&clk_ext4>;
> > >                                 clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
> > >                                               "clk_ext3", "clk_ext4";
> > > +                               assigned-clocks = <&clk IMX8MM_CLK_AUDIO_AHB>,
> > > +                                               <&clk IMX8MM_CLK_IPG_AUDIO_ROOT>,
> > > +                                               <&clk IMX8MM_SYS_PLL3>,
> > > +                                               <&clk IMX8MM_VIDEO_PLL1>,
> > > +                                               <&clk IMX8MM_CLK_NOC>,
> > > +                                               <&clk IMX8MM_CLK_PCIE1_CTRL>,
> > > +                                               <&clk IMX8MM_CLK_PCIE1_PHY>,
> > > +                                               <&clk IMX8MM_CLK_CSI1_CORE>,
> > > +                                               <&clk IMX8MM_CLK_CSI1_PHY_REF>,
> > > +                                               <&clk IMX8MM_CLK_CSI1_ESC>,
> > > +                                               <&clk IMX8MM_CLK_DISP_AXI>,
> > > +                                               <&clk IMX8MM_CLK_DISP_APB>;
> > > +                               assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_800M>,
> > > +                                               <0>,
> > Isn't there a macro for 0? (dummy clock?)
>
> I don't know about any such macro. If you're referring to IMX8MM_CLK_DUMMY,
> that can't be used here since all I want here is to skip setting a parent to
> the  IMX8MM_CLK_IPG_AUDIO_ROOT. If I use IMX8MM_CLK_DUMMY (along with &clk)
> it will set the parent to IMX8MM_CLK_DUMMY and that's not what's needed here.
>
> This is in accordance to the documentation:
>
> Documentation/devicetree/bindings/clock/clock-bindings.txt:
>
> "To skip setting parent or rate of a clock its corresponding entry should be
> set to 0, or can be omitted if it is not followed by any non-zero entry."

You are right. Thanks for the explanation!
