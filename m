From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH 2/3] ARM: dts: imx6ull: add pxp support
Date: Mon, 03 Sep 2018 16:54:29 +0200
Message-ID: <1535986469.6568.6.camel@pengutronix.de>
References: <20180810151822.18650-1-p.zabel@pengutronix.de>
 <20180810151822.18650-3-p.zabel@pengutronix.de>
 <20180827065927.GE3850@dragon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180827065927.GE3850@dragon>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Mon, 2018-08-27 at 14:59 +0800, Shawn Guo wrote:
> On Fri, Aug 10, 2018 at 05:18:21PM +0200, Philipp Zabel wrote:
> > Add the device node for the i.MX6ULL Pixel Pipeline (PXP).
> > 
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> >  arch/arm/boot/dts/imx6ul.dtsi  | 8 ++++++++
> >  arch/arm/boot/dts/imx6ull.dtsi | 6 ++++++
> >  2 files changed, 14 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
> > index 47a3453a4211..e80a660c14f2 100644
> > --- a/arch/arm/boot/dts/imx6ul.dtsi
> > +++ b/arch/arm/boot/dts/imx6ul.dtsi
> > @@ -928,6 +928,14 @@
> >  				};
> >  			};
> >  
> > +			pxp: pxp@21cc000 {
> > +				compatible = "fsl,imx6ul-pxp";
> > +				reg = <0x021cc000 0x4000>;
> > +				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > +				clock-names = "axi";
> > +				clocks = <&clks IMX6UL_CLK_PXP>;
> > +			};
> > +
> >  			lcdif: lcdif@21c8000 {
> 
> In order of unit-address, pxp@21cc000 should go after lcdif@21c8000.

Thank you, I'll fix this in v2.

regards
Philipp
