From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dts: sun8i: Add basic dtsi file
 for Allwinner R40
Date: Wed, 23 Aug 2017 16:35:32 +0200
Message-ID: <20170823143532.owocqyq3tehsahhg@flea.home>
References: <20170822061742.40869-1-icenowy@aosc.io>
 <20170822200521.nadkb4335mcc5ah2@flea.home>
 <ea10374b49489d2250fd804e1fdbf204@aosc.io>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jyr6nkumx2plx4ca"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBP5F63GAKGQEAMOVTQY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <ea10374b49489d2250fd804e1fdbf204-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: icenowy-h8G6r0blFSE@public.gmane.org
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jyr6nkumx2plx4ca
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Wed, Aug 23, 2017 at 07:56:29PM +0800, icenowy-h8G6r0blFSE@public.gmane.org wrote:
> > > +			reg = <0x01c0f000 0x1000>;
> > > +			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
> > > +			clock-names = "ahb", "mmc";
> > > +			resets = <&ccu RST_BUS_MMC0>;
> > > +			reset-names = "ahb";
> > > +			pinctrl-0 = <&mmc0_pins>;
> > > +			pinctrl-names = "default";
> > > +			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
> > > +			max-frequency = <150000000>;
> > 
> > have you tested that frequency?
> 
> I think the frequency should be kept here, although my cards cannot
> reach this frequency.
> 
> The numbers are same as the corresponding controllers in A64.
> 
> Maybe I should add a comment saying it's educated guess?

I'd rather have it tested by someone, and then add the proper
frequencies. It took quite a while to figure out how these modes were
supposed to be working on the A64, so it's not obvious that they're
just going to work.

> > > +		gic: interrupt-controller@1c81000 {
> > > +			compatible = "arm,gic-400";
> > > +			reg = <0x01c81000 0x1000>,
> > > +			      <0x01c82000 0x1000>,
> > > +			      <0x01c84000 0x2000>,
> > > +			      <0x01c86000 0x2000>;
> > > +			interrupt-controller;
> > > +			#interrupt-cells = <3>;
> > > +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) |
> > > IRQ_TYPE_LEVEL_HIGH)>;
> > > +		};
> > > +	};
> > > +
> > > +	timer {
> > > +		compatible = "arm,armv7-timer";
> > > +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
> > > IRQ_TYPE_LEVEL_LOW)>,
> > > +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > > +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > > +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> > 
> > Those masks are wrong.
> 
> I compared it with other sun8i SoCs' device tree.
> 
> Where's wrong?

It's supposed to be a mask of the CPUs in your system. Since you just
have one of them, it shouldn't be 4.

Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--jyr6nkumx2plx4ca--
