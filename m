From: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 2/2] arm64: dts: mt8173: Add I2C device node
Date: Mon, 8 Jun 2015 19:10:37 +0800
Message-ID: <1433761837.31929.3.camel@mtksdaap41>
References: <1433164107-26568-1-git-send-email-eddie.huang@mediatek.com>
	 <1433164107-26568-3-git-send-email-eddie.huang@mediatek.com>
	 <20150608072725.GJ6325@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150608072725.GJ6325-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Sascha,

On Mon, 2015-06-08 at 09:27 +0200, Sascha Hauer wrote:
> Hi Eddie,
> 
> On Mon, Jun 01, 2015 at 09:08:27PM +0800, Eddie Huang wrote:
> > Add MT8173 I2C device nodes, include I2C controllers and pins.
> > MT8173 has six I2C controllers, from i2c0 to i2c6, exclude i2c5.
> > The 6th I2C controller register base doesn't next to 5th I2C,
> > and there is a hardware between 5th and 6th I2C controller. So
> > SoC designer name 6th controller as "i2c6", not "i2c5".
> > 
> > Signed-off-by: Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 119 +++++++++++++++++++++++++++++++
> >  1 file changed, 119 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index b52ec43..7003ed2 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > @@ -158,6 +158,53 @@
> >  			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
> >  						<GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
> >  						<GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
> > +			i2c0_pins_a: i2c0@0 {
> > +				pins1 {
> > +					pinmux = <MT8173_PIN_45_SDA0__FUNC_SDA0>,
> > +						 <MT8173_PIN_46_SCL0__FUNC_SCL0>;
> > +					bias-disable;
> > +				};
> > +			};
> 
> The pinmux nodes should be in the board dts, not in the SoC dtsi.
> 

These pins are fixed, and all boards using MT8173 SoC I2C controller
should use these pins. To reduce spread these to many board dts files,
so I put i2c pins in SoC dtsi.

Eddie
Thanks


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
