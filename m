From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/3] Add basic support for RTC on Allwinner
 H6 SoC
Date: Wed, 7 Aug 2019 00:27:44 +0200
Message-ID: <20190806222744.xqxocjfwbl3g5z4g@core.my.home>
References: <20190412120730.473-1-megous@megous.com>
 <CAGb2v66cbpsoHJoiFJkBwhZ5SbO+uO+Kf6gtnA3kPFQZq0329Q@mail.gmail.com>
 <20190806183045.edhm3qzpegscf2z7@core.my.home>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDXLF6FR5INBBYX5U7VAKGQEYTVEMRI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190806183045.edhm3qzpegscf2z7-9v8tmBix7cb9zxVx7UNMDg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Alexandre Belloni <alexandre.belloni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-rtc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 06, 2019 at 08:30:45PM +0200, megous hlavni wrote:
> On Mon, Apr 15, 2019 at 04:18:12PM +0800, Chen-Yu Tsai wrote:
> > On Fri, Apr 12, 2019 at 8:07 PM megous via linux-sunxi
> > <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org> wrote:
> > >
> > > From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> > >
> > > I went through the datasheets for H6 and H5, and compared the differences.
> > > RTCs are largely similar, but not entirely compatible. Incompatibilities
> > > are in details not yet implemented by the rtc driver though.
> > >
> > > I also corrected the clock tree in H6 DTSI.
> > 
> > Please also add DCXO clock input/output and XO clock input to the bindings
> > and DT, and also fix up the clock tree. You can skip them in the driver for
> > now, but please add a TODO. As long as you don't change the clock-output-name
> > of osc24M, everything should work as before.
> > 
> > We just want the DT to describe what is actually there. For the XO input,
> > you could just directly reference the external crystal node. The gate for
> > it is likely somewhere in the PRCM block, which we don't have docs for.
> 
> So I was thinking about this for a while, and came up with this:
> 
> ----------------- arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi -----------------
> index 64c39f663d22..ac99ddbebe5c 100644
> @@ -627,14 +635,15 @@
> 
>  		rtc: rtc@7000000 {
>  			compatible = "allwinner,sun50i-h6-rtc";
>  			reg = <0x07000000 0x400>;
>  			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
> -			clock-output-names = "osc32k", "osc32k-out", "iosc";
> -			clocks = <&ext_osc32k>;
> +			clock-output-names = "osc32k", "osc32k-out", "iosc", "hosc";
> +			clock-names = "losc", "dcxo";
> +			clocks = <&ext_osc32k>, <&osc24M>;
>  			#clock-cells = <1>;
>  		};
> 
>  		r_ccu: clock@7010000 {
>  			compatible = "allwinner,sun50i-h6-r-ccu";
>  			reg = <0x07010000 0x400>;
> 
> I'm not completely sure how (or why?) to describe in DTSI which oscillator the
> designer used (XO vs DCXO). This information is signalled by the pad voltage and
> can be determined at runtime from DCXO_CTRL_REG's OSC_CLK_SRC_SEL (bit 3). It's
> not possible to change at runtime.
> 
> HOSC source selection is only material to the CPUS (ARISC) firmware when it
> wants to turn off all PLLs and the main crystal oscillator so that it knows
> which one to turn off. I don't see any other use for it. It's just
> informational. I don't think (future) crust firmware has space to be reading
> DTBs, so the detection will be using OSC_CLK_SRC_SEL anyway.
> 
> Maybe whether XO or DCXO is used also matters if you want to do some fine
> tunning of DCXO (control register has pletny of options), but that's probably
> better done in u-boot. And there's still no need to read HOSC source from DT.
> The driver can just check compatible, and if it is H6 and OSC_CLK_SRC_SEL is 1,
> it can do it's DCXO tunning, or whatever. But neither OS nor bootloader will
> be using this info to gate/disable the osciallator.
> 
> If we really want this in DT, maybe we can model it by having just two input
> clocks to RTC described in DTSI, and the DTSI for H6 would have this by default:
> 
> 	clock-names = "losc", "dcxo";
> 	clocks = <&ext_osc32k>, <&osc24M>;
> 
> And the board designer could change it from a board file, like this:
> 
> &rtc {
> 	clock-names = "losc", "xo";
> 	clocks = <&ext_osc32k>, <&osc24M>;
> };
> 
> The driver could decide which oscillator is used by the presence of either
> dcxo or xo input clock.
> 
> But in any case, the driver can also get this info from DCXO_CTRL_REG's
> OSC_CLK_SRC_SEL, so it doesn't need to read this from DT at all. So it's a bit
> pointless.
> 
> So I see two options:
> 
> 1) skip adding dcxo/xo to input clocks of RTC completely
> 2) the above
> 
> What do you think?

I tried option 2) and it feels pointless. It just creates this clock tree:

osc24M
  hosc
    plls...

from:

osc24M
  plls...

and doesn't achieve anything else, other than complicating things, for no reason
because no driver will ever need or use this info from the DT.

So my preference is for keeping it simple and going with option 1).

regards,
	o.


> regards,
> 	o.
> 
> 
> > > There's a small detail here, that's not described absolutely correctly in
> > > DTSI, but the difference is not really that material. ext_osc32k is
> > > originally modelled as a fixed clock that feeds into RTC module, but in
> > > reality it's the RTC module that implements via its registers enabling and
> > > disabling of this oscillator/clock.
> > >
> > > Though:
> > > - there's no other possible user of ext_osc32k than RTC module
> > > - there's no other possible external configuration for the crystal
> > >   circuit that would need to be handled in the dts per board
> > >
> > > So I guess, while the description is not perfect, this patch series still
> > > improves the current situation. Or maybe I'm misunderstanding something,
> > > and &ext_osc32k node just describes a fact that there's a crystal on
> > > the board. Then, everything is perhaps fine. :)
> > 
> > Correct. The external clock nodes are modeling the crystal, not the internal
> > clock gate / distributor.
> > 
> > Were the vendor to not include the crystal (for whatever reasons), the DT
> > should be able to describe it via the absence of the clock input, and the
> > driver should correctly use the internal (inaccurate) oscillator. I realize
> > the clocks property is required, and the driver doesn't handle this case
> > either, so we might have to fix that if it were to appear in the wild.
> > 
> > > For now, the enable bit for this oscillator is toggled by the re-parenting
> > > code automatically, as needed.
> > 
> > That's fine. No need to increase the clock tree depth.
> > 
> > ChenYu
> > 
> > > This patchset is necessary for implementing the WiFi/Bluetooth support
> > > on boards using H6 SoC.
> > >
> > > Please take a look.
> > >
> > > Thank you and regards,
> > >   Ondrej Jirman
> > >
> > > Ondrej Jirman (3):
> > >   dt-bindings: Add compatible for H6 RTC
> > >   rtc: sun6i: Add support for H6 RTC
> > >   arm64: dts: sun50i-h6: Add support for RTC and fix the clock tree
> > >
> > >  .../devicetree/bindings/rtc/sun6i-rtc.txt     |  1 +
> > >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 30 +++++++-------
> > >  drivers/rtc/rtc-sun6i.c                       | 40 ++++++++++++++++++-
> > >  3 files changed, 55 insertions(+), 16 deletions(-)
> > >
> > > --
> > > 2.21.0
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups "linux-sunxi" group.
> > > To unsubscribe from this group and stop receiving emails from it, send an email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
> > > For more options, visit https://groups.google.com/d/optout.
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
