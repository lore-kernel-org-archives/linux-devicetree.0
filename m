From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: mt8183: Add node for the Mali GPU
Date: Thu, 5 Sep 2019 11:32:29 +0100
Message-ID: <CAL_JsqLAEe1qYkTWCw7VPau9WnXTMUqtHR5XWGuk7ynZBiuLQA@mail.gmail.com>
References: <20190905081546.42716-1-drinkcat@chromium.org> <CAL_JsqJCO2G90TTT9Mpy4kjVKQyXWw4aXEEnbRp_SE8X=EGc5g@mail.gmail.com>
 <CANMq1KCTPdFhJG1SLf-i+-557Yx-1WLzWCHu3tT_5Q2BF+JgdQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CANMq1KCTPdFhJG1SLf-i+-557Yx-1WLzWCHu3tT_5Q2BF+JgdQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nick Fan <nick.fan@mediatek.com>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Boris Brezillon <boris.brezillon@collabora.com>
List-Id: devicetree@vger.kernel.org

On Thu, Sep 5, 2019 at 10:49 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> Thanks for the quick review!
>
> On Thu, Sep 5, 2019 at 5:09 PM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Thu, Sep 5, 2019 at 9:16 AM Nicolas Boichat <drinkcat@chromium.org> wrote:
> > >
> > > Add a basic GPU node and opp table for mt8183.
> > >
> > > The binding we use with out-of-tree Mali drivers includes more
> > > clocks, I assume this would be required eventually if we have an
> > > in-tree driver:
> >
> > We have an in-tree driver...
>
> Right but AFAICT it does not support Bifrost GPU (yet?).

It's mostly the mesa userspace side that's missing. The kernel driver
needs the compatible string and page table support[1]. The former
should be enough to access the registers which is typically enough to
sort out an platform specific clock, reset, power issues.

> > > clocks =
> > >         <&topckgen CLK_TOP_MFGPLL_CK>,
> > >         <&topckgen CLK_TOP_MUX_MFG>,
> > >         <&clk26m>,
> > >         <&mfgcfg CLK_MFG_BG3D>;
> > > clock-names =
> > >         "clk_main_parent",
> > >         "clk_mux",
> > >         "clk_sub_parent",
> > >         "subsys_mfg_cg";
>
> Do you think we should add those to the binding document? May not be
> easy to match what the amlogic binding does (I'm not sure to
> understand the details of this device, but I can dig further/ask).

I somewhat expect this needs more investigation. I'm doubtful that
there's a 26MHz clock going to Mali. Ideally, the clocks are what are
actually connected to the h/w, not just a list of all the clocks
needed on some platform because we fail to manage them elsewhere (like
an interconnect driver). Otherwise we end up with a different list for
every platform.

> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > >
> > > ---
> > > Upstreaming what matches existing bindings from our Chromium OS tree:
> > > https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/arch/arm64/boot/dts/mediatek/mt8183.dtsi#1348
> > >
> > > The evb part of this change depends on this patch to add PMIC dtsi:
> > > https://patchwork.kernel.org/patch/10928161/
> > >
> > >  arch/arm64/boot/dts/mediatek/mt8183-evb.dts |   7 ++
> > >  arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 103 ++++++++++++++++++++
> > >  2 files changed, 110 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > > index 1fb195c683c3d01..200d8e65a6368a1 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> > > @@ -7,6 +7,7 @@
> > >
> > >  /dts-v1/;
> > >  #include "mt8183.dtsi"
> > > +#include "mt6358.dtsi"
> > >
> > >  / {
> > >         model = "MediaTek MT8183 evaluation board";
> > > @@ -30,6 +31,12 @@
> > >         status = "okay";
> > >  };
> > >
> > > +&gpu {
> > > +       supply-names = "mali", "mali_sram";
> > > +       mali-supply = <&mt6358_vgpu_reg>;
> > > +       mali_sram-supply = <&mt6358_vsram_gpu_reg>;
> >
> > Not documented. Just 'sram-supply' is enough.
>
> Will fix.
>
> > Note that the binding doc queued up for 5.4 has been converted to DT schema.
>
> Yep I see that in linux-next.
>
> >
> > > +};
> > > +
> > >  &i2c0 {
> > >         pinctrl-names = "default";
> > >         pinctrl-0 = <&i2c_pins_0>;
> > > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > > index 97f84aa9fc6e1c1..8ea548a762ea252 100644
> > > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > > @@ -579,6 +579,109 @@
> > >                         #clock-cells = <1>;
> > >                 };
> > >
> > > +               gpu: mali@13040000 {
> >
> > gpu@...
> >
> > > +                       compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
> >
> > You need to add this compatible string too.
>
> Will do.
>
> >
> > > +                       reg = <0 0x13040000 0 0x4000>;
> > > +                       interrupts =
> > > +                               <GIC_SPI 280 IRQ_TYPE_LEVEL_LOW>,
> > > +                               <GIC_SPI 279 IRQ_TYPE_LEVEL_LOW>,
> > > +                               <GIC_SPI 278 IRQ_TYPE_LEVEL_LOW>;
> > > +                       interrupt-names = "job", "mmu", "gpu";
> > > +
> > > +                       clocks = <&topckgen CLK_TOP_MFGPLL_CK>;
> > > +                       power-domains =
> > > +                               <&scpsys MT8183_POWER_DOMAIN_MFG_CORE0>,
> > > +                               <&scpsys MT8183_POWER_DOMAIN_MFG_CORE1>,
> > > +                               <&scpsys MT8183_POWER_DOMAIN_MFG_2D>;
> >
> > This needs to be documented too.
>
> I see that Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> has power-domains in the example both not in the yaml, is that
> expected?

Err, no. Probably some copy-n-paste from utgard.

Rob

[1] https://patchwork.freedesktop.org/patch/304731/
