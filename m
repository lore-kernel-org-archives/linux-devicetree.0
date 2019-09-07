From: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/9] ARM: dts: sun8i: r40: add crypto engine node
Date: Sat, 7 Sep 2019 19:54:07 +0200
Message-ID: <20190907175407.GB2628@Red>
References: <20190906184551.17858-1-clabbe.montjoie@gmail.com>
 <20190906184551.17858-5-clabbe.montjoie@gmail.com>
 <20190907040217.kzvq7gfxz67pluhz@flea>
Reply-To: clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD7YLCN32UNBBQW5Z7VQKGQE4GYYNJI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190907040217.kzvq7gfxz67pluhz@flea>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-crypto-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Sep 07, 2019 at 07:02:17AM +0300, Maxime Ripard wrote:
> On Fri, Sep 06, 2019 at 08:45:46PM +0200, Corentin Labbe wrote:
> > The Crypto Engine is a hardware cryptographic offloader that supports
> > many algorithms.
> > It could be found on most Allwinner SoCs.
> >
> > This patch enables the Crypto Engine on the Allwinner R40 SoC Device-tree.
> >
> > Signed-off-by: Corentin Labbe <clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/sun8i-r40.dtsi | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
> > index bde068111b85..7eb649cea163 100644
> > --- a/arch/arm/boot/dts/sun8i-r40.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-r40.dtsi
> > @@ -266,6 +266,17 @@
> >  			#phy-cells = <1>;
> >  		};
> >
> > +		crypto: crypto-engine@1c15000 {
> > +			compatible = "allwinner,sun8i-r40-crypto";
> > +			reg = <0x01c15000 0x1000>;
> > +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&ccu CLK_BUS_CE>, <&ccu CLK_CE>;
> > +			clock-names = "ahb", "mod";
> > +			resets = <&ccu RST_BUS_CE>;
> > +			reset-names = "ahb";
> > +			status = "okay";
> 
> The driver will probe if status is not declared, so if you want it
> always enabled you should simply remove status
> 

Fixed, thanks.
