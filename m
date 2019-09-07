From: Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: Re: [PATCH 6/9] ARM64: dts: allwinner: sun50i: Add Crypto Engine
 node on A64
Date: Sat, 7 Sep 2019 19:54:53 +0200
Message-ID: <20190907175453.GC2628@Red>
References: <20190906184551.17858-1-clabbe.montjoie@gmail.com>
 <20190906184551.17858-7-clabbe.montjoie@gmail.com>
 <20190907040254.5ecohywqbekokwfx@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190907040254.5ecohywqbekokwfx@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: davem@davemloft.net, herbert@gondor.apana.org.au, linux@armlinux.org.uk, mark.rutland@arm.com, robh+dt@kernel.org, wens@csie.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Sat, Sep 07, 2019 at 07:02:54AM +0300, Maxime Ripard wrote:
> On Fri, Sep 06, 2019 at 08:45:48PM +0200, Corentin Labbe wrote:
> > The Crypto Engine is a hardware cryptographic accelerator that supports
> > many algorithms.
> > It could be found on most Allwinner SoCs.
> >
> > This patch enables the Crypto Engine on the Allwinner A64 SoC Device-tree.
> >
> > Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > index 69128a6dfc46..c9e30d462ab1 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -487,6 +487,17 @@
> >  			reg = <0x1c14000 0x400>;
> >  		};
> >
> > +		crypto: crypto@1c15000 {
> > +			compatible = "allwinner,sun50i-a64-crypto";
> > +			reg = <0x01c15000 0x1000>;
> > +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "ce_ns";
> 
> You didn't document that property
> 

It is unnecessary, I forgot to remove it.
Fixed, thanks.
