From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH] arm64: dts: imx8mq: add GPU node
Date: Mon, 8 Apr 2019 15:45:40 +0200
Message-ID: <20190408134540.GA13816@bogon.m.sigxcpu.org>
References: <20190404165211.29297-1-l.stach@pengutronix.de>
 <20190408130729.GA31666@bogon.m.sigxcpu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190408130729.GA31666@bogon.m.sigxcpu.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,
On Mon, Apr 08, 2019 at 03:07:29PM +0200, Guido G=FCnther wrote:
> Hi Lucas,
> On Thu, Apr 04, 2019 at 06:52:11PM +0200, Lucas Stach wrote:
> > This enables the Vivante GC7000L GPU on the i.MX8MQ SoC.
> > =

> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> > =

> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boo=
t/dts/freescale/imx8mq.dtsi
> > index 4300781558f6..79d418b4f585 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > @@ -792,6 +792,28 @@
> >  			};
> >  		};
> >  =

> > +		gpu: gpu@38000000 {
> > +			compatible =3D "vivante,gc";
> > +			reg =3D <0x38000000 0x40000>;
> > +			interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&clk IMX8MQ_CLK_GPU_ROOT>,
> > +			         <&clk IMX8MQ_CLK_GPU_SHADER_DIV>,
> > +			         <&clk IMX8MQ_CLK_GPU_AXI>,
> > +			         <&clk IMX8MQ_CLK_GPU_AHB>;
> > +			clock-names =3D "core", "shader", "bus", "reg";
> > +			assigned-clocks =3D <&clk IMX8MQ_CLK_GPU_CORE_SRC>,
> > +			                  <&clk IMX8MQ_CLK_GPU_SHADER_SRC>,
> > +			                  <&clk IMX8MQ_CLK_GPU_AXI>,
> > +			                  <&clk IMX8MQ_CLK_GPU_AHB>;
> > +			assigned-clock-parents =3D <&clk IMX8MQ_GPU_PLL_OUT>,
> > +			                         <&clk IMX8MQ_GPU_PLL_OUT>,
> > +			                         <&clk IMX8MQ_GPU_PLL_OUT>,
> > +			                         <&clk IMX8MQ_GPU_PLL_OUT>;
> > +			assigned-clock-rates =3D <800000000>, <800000000>,
> > +			                       <800000000>, <800000000>;
> > +			power-domains =3D <&pgc_gpu>;
> > +		};
> =

> Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>

On a second thought should this have a

    status =3D "disabled";

Cheers,
 -- Guido


> =

> Cheers,
>  -- Guido
> =

> =

> > +
> >  		usb_dwc3_0: usb@38100000 {
> >  			compatible =3D "fsl,imx8mq-dwc3", "snps,dwc3";
> >  			reg =3D <0x38100000 0x10000>;
> > -- =

> > 2.20.1
> > =

> > =

> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > =

> =

> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> =
