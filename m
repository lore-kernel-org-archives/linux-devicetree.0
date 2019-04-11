From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH] arm64: dts: imx8mq: add GPU node
Date: Thu, 11 Apr 2019 20:47:28 +0200
Message-ID: <20190411184728.GA4139@bogon.m.sigxcpu.org>
References: <20190404165211.29297-1-l.stach@pengutronix.de>
 <20190408130729.GA31666@bogon.m.sigxcpu.org>
 <20190408134540.GA13816@bogon.m.sigxcpu.org>
 <1554901332.11529.9.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1554901332.11529.9.camel@pengutronix.de>
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
On Wed, Apr 10, 2019 at 03:02:12PM +0200, Lucas Stach wrote:
> Hi Guido,
> =

> Am Montag, den 08.04.2019, 15:45 +0200 schrieb Guido G=FCnther:
> > Hi,
> > On Mon, Apr 08, 2019 at 03:07:29PM +0200, Guido G=FCnther wrote:
> > > Hi Lucas,
> > > On Thu, Apr 04, 2019 at 06:52:11PM +0200, Lucas Stach wrote:
> > > > This enables the Vivante GC7000L GPU on the i.MX8MQ SoC.
> > > > =

> > > > > > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > > ---
> > > > =A0arch/arm64/boot/dts/freescale/imx8mq.dtsi | 22 +++++++++++++++++=
+++++
> > > > =A01 file changed, 22 insertions(+)
> > > > =

> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64=
/boot/dts/freescale/imx8mq.dtsi
> > > > index 4300781558f6..79d418b4f585 100644
> > > > --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> > > > @@ -792,6 +792,28 @@
> > > > > > > =A0			};
> > > > > > > =A0		};
> > > > =A0
> > > > > > > > > > +		gpu: gpu@38000000 {
> > > > > > > +			compatible =3D "vivante,gc";
> > > > > > > +			reg =3D <0x38000000 0x40000>;
> > > > > > > +			interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
> > > > > > > +			clocks =3D <&clk IMX8MQ_CLK_GPU_ROOT>,
> > > > > > > +			=A0=A0=A0=A0=A0=A0=A0=A0=A0<&clk IMX8MQ_CLK_GPU_SHADER_DI=
V>,
> > > > > > > +			=A0=A0=A0=A0=A0=A0=A0=A0=A0<&clk IMX8MQ_CLK_GPU_AXI>,
> > > > > > > +			=A0=A0=A0=A0=A0=A0=A0=A0=A0<&clk IMX8MQ_CLK_GPU_AHB>;
> > > > > > > +			clock-names =3D "core", "shader", "bus", "reg";
> > > > > > > +			assigned-clocks =3D <&clk IMX8MQ_CLK_GPU_CORE_SRC>,
> > > > > > > +			=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0<&c=
lk IMX8MQ_CLK_GPU_SHADER_SRC>,
> > > > > > > +			=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0<&c=
lk IMX8MQ_CLK_GPU_AXI>,
> > > > > > > +			=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0<&c=
lk IMX8MQ_CLK_GPU_AHB>;
> > > > > > > +			assigned-clock-parents =3D <&clk IMX8MQ_GPU_PLL_OUT>,
> > > > > > > +			=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0<&clk IMX8MQ_GPU_PLL_OUT>,
> > > > > > > +			=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0<&clk IMX8MQ_GPU_PLL_OUT>,
> > > > > > > +			=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0<&clk IMX8MQ_GPU_PLL_OUT>;
> > > > > > > +			assigned-clock-rates =3D <800000000>, <800000000>,
> > > > > > > +			=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0<800000000>, <800000000>;
> > > > > > > +			power-domains =3D <&pgc_gpu>;
> > > > +		};
> > > =

> > > Reviewed-by: Guido G=FCnther <agx@sigxcpu.org>
> > =

> > On a second thought should this have a
> > =

> > =A0=A0=A0=A0status =3D "disabled";
> =

> I disagree. This is a SoC internal peripheral, that has no board level
> dependencies other than the voltage rail being connected, so it's fine
> to have the node enabled on all systems. This is consistent with what
> we did on all previous i.MX SoC DTs.

Makes sense.

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =

Cheers,
 -- Guido
