From: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v10 5/6] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
Date: Mon, 14 Oct 2019 17:37:50 +0530
Message-ID: <CAMty3ZCiwOGgwbsjTHvEZhwHGhsgb6_FeBs9hHgLai9=rV2_HQ@mail.gmail.com>
References: <20191005141913.22020-1-jagan@amarulasolutions.com>
 <20191005141913.22020-6-jagan@amarulasolutions.com> <20191007105708.raxavxk4n7bvxh7x@gilmour>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007105708.raxavxk4n7bvxh7x@gilmour>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Trimarchi <michael@amarulasolutions.com>, Icenowy Zheng <icenowy@aosc.io>, linux-sunxi <linux-sunxi@googlegroups.com>, dri-devel <dri-devel@lists.freedesktop.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 7, 2019 at 4:27 PM Maxime Ripard <mripard@kernel.org> wrote:
>
> On Sat, Oct 05, 2019 at 07:49:12PM +0530, Jagan Teki wrote:
> > Add MIPI DSI pipeline for Allwinner A64.
> >
> > - dsi node, with A64 compatible since it doesn't support
> >   DSI_SCLK gating unlike A33
> > - dphy node, with A64 compatible with A33 fallback since
> >   DPHY on A64 and A33 is similar
> > - finally, attach the dsi_in to tcon0 for complete MIPI DSI
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > Tested-by: Merlijn Wajer <merlijn@wizzup.org>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 38 +++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > index 69128a6dfc46..ad4170b8aee0 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> > @@ -382,6 +382,12 @@
> >                                       #address-cells = <1>;
> >                                       #size-cells = <0>;
> >                                       reg = <1>;
> > +
> > +                                     tcon0_out_dsi: endpoint@1 {
> > +                                             reg = <1>;
> > +                                             remote-endpoint = <&dsi_in_tcon0>;
> > +                                             allwinner,tcon-channel = <1>;
> > +                                     };
> >                               };
> >                       };
> >               };
> > @@ -1003,6 +1009,38 @@
> >                       status = "disabled";
> >               };
> >
> > +             dsi: dsi@1ca0000 {
> > +                     compatible = "allwinner,sun50i-a64-mipi-dsi";
> > +                     reg = <0x01ca0000 0x1000>;
> > +                     interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > +                     clocks = <&ccu CLK_BUS_MIPI_DSI>;
> > +                     clock-names = "bus";
>
> This won't validate with the bindings you have either here, since it
> still expects bus and mod.
>
> I guess in that cas, we can just drop clock-names, which will require
> a bit of work on the driver side as well.

Okay.
mod clock is not required for a64, ie reason we have has_mod_clk quirk
patch. Adjust the clock-names: on dt-bindings would make sense here,
what do you think?
