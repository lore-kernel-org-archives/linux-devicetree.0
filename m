From: Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH 4/6] ARM: dts: sun8i: a83t: Add device node for CSI
 (Camera Sensor Interface)
Date: Tue, 9 Apr 2019 16:07:34 +0800
Message-ID: <CAGb2v64CYV68Q0a7x5p-XabS74vaQWP3paPopodmqQPTOrq2gQ@mail.gmail.com>
References: <20190408165744.11672-1-wens@kernel.org> <20190408165744.11672-5-wens@kernel.org>
 <20190409075804.4zrwjil7ie2gjigu@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190409075804.4zrwjil7ie2gjigu@flea>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Yong Deng <yong.deng@magewell.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk <linux-clk@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 9, 2019 at 3:58 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> Hi,
>
> On Tue, Apr 09, 2019 at 12:57:42AM +0800, Chen-Yu Tsai wrote:
> > From: Chen-Yu Tsai <wens@csie.org>
> >
> > The A83T SoC has a camera sensor interface (known as CSI in Allwinner
> > lingo), which is similar to the one found on the A64 and H3. The only
> > difference seems to be that support of MIPI CSI through a connected
> > MIPI CSI-2 bridge.
> >
> > Add a device node for it, and pinctrl nodes for the commonly used MCLK
> > and 8-bit parallel interface. The property /omit-if-no-ref/ is added to
> > the pinctrl nodes to keep the device tree blob size down if they are
> > unused.
> >
> > Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> > ---
> >  arch/arm/boot/dts/sun8i-a83t.dtsi | 31 +++++++++++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > index f739b88efb53..0c52f945fd5f 100644
> > --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> > +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> > @@ -682,6 +682,20 @@
> >                       #interrupt-cells = <3>;
> >                       #gpio-cells = <3>;
> >
> > +                     /omit-if-no-ref/
> > +                     csi_8bit_parallel_pins: csi-8bit-parallel-pins {
> > +                             pins = "PE0", "PE2", "PE3", "PE6", "PE7",
> > +                                    "PE8", "PE9", "PE10", "PE11",
> > +                                    "PE12", "PE13";
> > +                             function = "csi";
> > +                     };
> > +
> > +                     /omit-if-no-ref/
> > +                     csi_mclk_pin: csi-mclk-pin {
> > +                             pins = "PE1";
> > +                             function = "csi";
> > +                     };
> > +
> >                       emac_rgmii_pins: emac-rgmii-pins {
> >                               pins = "PD2", "PD3", "PD4", "PD5", "PD6", "PD7",
> >                                      "PD11", "PD12", "PD13", "PD14", "PD18",
> > @@ -994,6 +1008,23 @@
> >                       interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
> >               };
> >
> > +             csi: camera@1cb0000 {
> > +                     compatible = "allwinner,sun8i-a83t-csi";
> > +                     reg = <0x01cb0000 0x1000>;
> > +                     interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&ccu CLK_BUS_CSI>,
> > +                              <&ccu CLK_CSI_SCLK>,
> > +                              <&ccu CLK_DRAM_CSI>;
> > +                     clock-names = "bus", "mod", "ram";
> > +                     resets = <&ccu RST_BUS_CSI>;
> > +                     status = "disabled";
> > +
> > +                     csi_in: port {
> > +                             #address-cells = <1>;
> > +                             #size-cells = <0>;
>
> If we expect a single enpoint, then we don't need the address-cells
> and size-cells properties.

I wouldn't bet on anything. The way the Q8 tablets did front/back cameras
is kind of genius if not very hacky. They have two "identical" sensors
on the same I2C bus and CSI bus, with shared reset line but separate
shutdown lines. Since they are identical, they also have the same I2C
address. I haven't figured out how to model this in the device tree.

The point is, it's perfectly possible to have two or more sensors use
the same controller, provided only one be active at a time.

ChenYu
