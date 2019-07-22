From: Andy Duan <fugang.duan@nxp.com>
Subject: RE: [EXT] Re: [PATCH arm64/dts 1/1] arm64: dts: imx8qxp: add lpuart
 baud clock
Date: Mon, 22 Jul 2019 06:52:23 +0000
Message-ID: <VI1PR0402MB3600228E0A05617D3B01AA7AFFC40@VI1PR0402MB3600.eurprd04.prod.outlook.com>
References: <20190704100443.10957-1-fugang.duan@nxp.com>
 <20190722064649.GA3738@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190722064649.GA3738@dragon>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "daniel.baluta@gmail.com" <daniel.baluta@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

From: Shawn Guo <shawnguo@kernel.org> Sent: Monday, July 22, 2019 2:47 PM
> On Thu, Jul 04, 2019 at 06:04:43PM +0800, fugang.duan@nxp.com wrote:
> > From: Fugang Duan <fugang.duan@nxp.com>
> >
> > Add imx8qxp lpuart baud clock.
> >
> > Signed-off-by: Fugang Duan <fugang.duan@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 23
> > +++++++++++++++--------
> >  1 file changed, 15 insertions(+), 8 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > index 05fa0b7..4402b2e 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > @@ -30,6 +30,9 @@
> >               mmc2 = &usdhc3;
> >               mu1 = &lsio_mu1;
> >               serial0 = &adma_lpuart0;
> > +             serial1 = &adma_lpuart1;
> > +             serial2 = &adma_lpuart2;
> > +             serial3 = &adma_lpuart3;
> 
> This is not about adding baud clock, right?  Please either mention the change
> in the commit log, or have it as a separate patch.
> 
> Shawn

Thanks for your review.
I will send v2 to separate the patch.
> 
> >       };
> >
> >       cpus {
> > @@ -209,8 +212,9 @@
> >                       reg = <0x5a060000 0x1000>;
> >                       interrupts = <GIC_SPI 225
> IRQ_TYPE_LEVEL_HIGH>;
> >                       interrupt-parent = <&gic>;
> > -                     clocks = <&adma_lpcg
> IMX_ADMA_LPCG_UART0_BAUD_CLK>;
> > -                     clock-names = "ipg";
> > +                     clocks = <&adma_lpcg
> IMX_ADMA_LPCG_UART0_IPG_CLK>,
> > +                              <&adma_lpcg
> IMX_ADMA_LPCG_UART0_BAUD_CLK>;
> > +                     clock-names = "ipg", "baud";
> >                       power-domains = <&pd IMX_SC_R_UART_0>;
> >                       status = "disabled";
> >               };
> > @@ -220,8 +224,9 @@
> >                       reg = <0x5a070000 0x1000>;
> >                       interrupts = <GIC_SPI 226
> IRQ_TYPE_LEVEL_HIGH>;
> >                       interrupt-parent = <&gic>;
> > -                     clocks = <&adma_lpcg
> IMX_ADMA_LPCG_UART1_BAUD_CLK>;
> > -                     clock-names = "ipg";
> > +                     clocks = <&adma_lpcg
> IMX_ADMA_LPCG_UART1_IPG_CLK>,
> > +                              <&adma_lpcg
> IMX_ADMA_LPCG_UART1_BAUD_CLK>;
> > +                     clock-names = "ipg", "baud";
> >                       power-domains = <&pd IMX_SC_R_UART_1>;
> >                       status = "disabled";
> >               };
> > @@ -231,8 +236,9 @@
> >                       reg = <0x5a080000 0x1000>;
> >                       interrupts = <GIC_SPI 227
> IRQ_TYPE_LEVEL_HIGH>;
> >                       interrupt-parent = <&gic>;
> > -                     clocks = <&adma_lpcg
> IMX_ADMA_LPCG_UART2_BAUD_CLK>;
> > -                     clock-names = "ipg";
> > +                     clocks = <&adma_lpcg
> IMX_ADMA_LPCG_UART2_IPG_CLK>,
> > +                              <&adma_lpcg
> IMX_ADMA_LPCG_UART2_BAUD_CLK>;
> > +                     clock-names = "ipg", "baud";
> >                       power-domains = <&pd IMX_SC_R_UART_2>;
> >                       status = "disabled";
> >               };
> > @@ -242,8 +248,9 @@
> >                       reg = <0x5a090000 0x1000>;
> >                       interrupts = <GIC_SPI 228
> IRQ_TYPE_LEVEL_HIGH>;
> >                       interrupt-parent = <&gic>;
> > -                     clocks = <&adma_lpcg
> IMX_ADMA_LPCG_UART3_BAUD_CLK>;
> > -                     clock-names = "ipg";
> > +                     clocks = <&adma_lpcg
> IMX_ADMA_LPCG_UART3_IPG_CLK>,
> > +                              <&adma_lpcg
> IMX_ADMA_LPCG_UART3_BAUD_CLK>;
> > +                     clock-names = "ipg", "baud";
> >                       power-domains = <&pd IMX_SC_R_UART_3>;
> >                       status = "disabled";
> >               };
> > --
> > 2.7.4
> >
