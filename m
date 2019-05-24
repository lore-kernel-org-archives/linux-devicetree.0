From: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Add lradc node
Date: Fri, 24 May 2019 10:35:36 +0200
Message-ID: <4343071.IDWclfcoxo@g550jk>
References: <20190518170929.24789-1-luca@z3ntu.xyz> <EF411F71-D257-41FC-9248-B0E3F686B6B9@z3ntu.xyz> <20190521142544.ma2xfu77bamk4hvc@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521142544.ma2xfu77bamk4hvc@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Dienstag, 21. Mai 2019 16:25:44 CEST Maxime Ripard wrote:
> On Tue, May 21, 2019 at 03:52:47PM +0200, luca@z3ntu.xyz wrote:
> > On May 21, 2019 3:09:55 PM GMT+02:00, Maxime Ripard 
<maxime.ripard@bootlin.com> wrote:
> > >On Tue, May 21, 2019 at 08:43:45AM +0200, luca@z3ntu.xyz wrote:
> > >> On May 20, 2019 1:07:42 PM GMT+02:00, Maxime Ripard
> > >
> > ><maxime.ripard@bootlin.com> wrote:
> > >> >On Sat, May 18, 2019 at 07:09:30PM +0200, Luca Weiss wrote:
> > >> >> Add a node describing the KEYADC on the A64.
> > >> >> 
> > >> >> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > >> >> ---
> > >> >> 
> > >> >>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 7 +++++++
> > >> >>  1 file changed, 7 insertions(+)
> > >> >> 
> > >> >> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > >> >
> > >> >b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > >> >
> > >> >> index 7734f70e1057..dc1bf8c1afb5 100644
> > >> >> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > >> >> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > >> >> @@ -704,6 +704,13 @@
> > >> >> 
> > >> >>  			status = "disabled";
> > >> >>  		
> > >> >>  		};
> > >> >> 
> > >> >> +		lradc: lradc@1c21800 {
> > >> >> +			compatible = "allwinner,sun4i-a10-lradc-
keys";
> > >> >> +			reg = <0x01c21800 0x100>;
> > >> >> +			interrupts = <GIC_SPI 30 
IRQ_TYPE_LEVEL_HIGH>;
> > >> >> +			status = "disabled";
> > >> >> +		};
> > >> >> +
> > >> >
> > >> >The controller is pretty different on the A64 compared to the A10.
> > >
> > >The
> > >
> > >> >A10 has two channels for example, while the A64 has only one.
> > >> >
> > >> >It looks like the one in the A83t though, so you can use that
> > >> >compatible instead.
> > >> 
> > >> Looking at the patch for the A83t, the only difference is that it
> > >> uses a 3/4 instead of a 2/3 voltage divider, nothing is changed with
> > >> the channels.
> > >
> > >I guess you can reuse the A83t compatible here then, and a more
> > >specific a64 compatible in case we ever need to fix this.
> > >
> > >> But I'm also not sure which one (or a different one)
> > >> is used from looking at the "A64 User Manual".
> > >
> > >I'm sorry, what are you referring to with "one" in that sentence?
> > 
> > Sorry, I meant I didn't find anything in the A64 user manual whether
> > a 3/4 or a 2/3 voltage divider (or one with different values) is
> > used on the A64.
> 
> Ok :)
> 
> I guess you can just reuse the A83t compatible then, together with the
> A64's.
> 
> Maxime
> 
> --
> Maxime Ripard, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Hi Maxime,
I'd submit a v2 with these changes to v1 then:
                lradc: lradc@1c21800 {
-                       compatible = "allwinner,sun4i-a10-lradc-keys";
-                       reg = <0x01c21800 0x100>;
+                       compatible = "allwinner,sun50i-a64-lradc-keys",
+                                    "allwinner,sun8i-a83t-r-lradc";
+                       reg = <0x01c21800 0x400>;
                        interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
                        status = "disabled";
                };
Does that look okay?
The reg change is due to me not spotting the address being 0x01C2 
1800---0x01C2 1BFF, so the size should be 0x400 and not 0x100.

Thanks for the feedback,
Luca
