From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/2] clk: meson: meson8b: add the video decoder clock trees
Date: Wed, 20 Mar 2019 21:53:43 +0100
Message-ID: <CAFBinCC4cVkRr0TGJXkKVSd+k7bxeBVkZZxrH+EjS=X78StS=g@mail.gmail.com>
References: <20190319220012.31065-1-martin.blumenstingl@googlemail.com>
 <20190319220012.31065-3-martin.blumenstingl@googlemail.com> <CAMO6nawKpBRrp0oBtrGY8KskD6tUX9ZCNeDqSGPB-kMnm27HnA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMO6nawKpBRrp0oBtrGY8KskD6tUX9ZCNeDqSGPB-kMnm27HnA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Jourdan <mjourdan@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Maxime,

On Wed, Mar 20, 2019 at 12:16 PM Maxime Jourdan <mjourdan@baylibre.com> wrote:
>
> Hi Martin, thanks for looking into the video decoder for meson8!
you're welcome - this is only possible because of your work on the
video decoder driver!

> On Tue, Mar 19, 2019 at 11:00 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
> >
> > This adds the four video decoder clock trees.
> >
> > VDEC_1 is split into two paths on Meson8b and Meson8m2:
> > - input mux called "vdec_1_sel"
> > - two dividers ("vdec_1_1_div" and "vdec_1_2_div") and gates ("vdec_1_1"
> >   and "vdec_1_2")
> > - and an output mux (probably glitch-free) called "vdec_1"
>
> Yes, all vdec clocks have a glitch-free mux to be able to safely
> adjust the frequency on the fly, although in practice it's barely
> used.
>
> > On Meson8 the VDEC_1 tree is simpler because there's only one path:
> > - input mux called "vdec_1_sel"
> > - divider ("vdec_1_1_div") and gate ("vdec_1_1")
> > - (the gate is used as output directly, there's no mux)
> >
> > The VDEC_HCODEC and VDEC_2 clocks are simple composite clocks each
> > consisting of an input mux, divider and a gate.
> >
> > The VDEC_HEVC clock seems to have two paths similar to the VDEC_1 clock.
> > However, the register offsets of the second clock path is not known.
> > Amlogic's 3.10 kernel (which is used as reference) sets
> > HHI_VDEC2_CLK_CNTL[31] to 1 before changing the VDEC_HEVC clock and back
> > to 0 afterwards. For now, leave a TODO comment and only add the first
> > path.
> >
>
> Looking at aml-3.10/drivers/amlogic/amports/m8b/vdec_clk.c, it's weird
> indeed. They seem to copy the divider's value to the same place
> (HHI_VDEC2_CLK_CNTL[16~23]), and the only thing that stands out is
> enabling HHI_VDEC2_CLK_CNTL[31].
>
> Then again they don't make use of that codepath at all, so who knows..
indeed, that's why I skipped it for now

[...]
> > diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> > index e775f91ccce9..ed37196187e6 100644
> > --- a/drivers/clk/meson/meson8b.h
> > +++ b/drivers/clk/meson/meson8b.h
> > @@ -37,6 +37,9 @@
> >  #define HHI_MALI_CLK_CNTL              0x1b0 /* 0x6c offset in data sheet */
> >  #define HHI_VPU_CLK_CNTL               0x1bc /* 0x6f offset in data sheet */
> >  #define HHI_HDMI_CLK_CNTL              0x1cc /* 0x73 offset in data sheet */
> > +#define HHI_VDEC_CLK_CNTL              0x1e0 /* 0x78 offset in data sheet */
> > +#define HHI_VDEC2_CLK_CNTL             0x1e4 /* 0x79 offset in data sheet */
> > +#define HHI_VDEC3_CLK_CNTL             0x1e8 /* 0x7a offset in data sheet */
> >  #define HHI_NAND_CLK_CNTL              0x25c /* 0x97 offset in data sheet */
> >  #define HHI_MPLL_CNTL                  0x280 /* 0xa0 offset in data sheet */
> >  #define HHI_SYS_PLL_CNTL               0x300 /* 0xc0 offset in data sheet */
> > @@ -156,8 +159,20 @@
> >  #define CLKID_VPU_1_SEL                186
> >  #define CLKID_VPU_1_DIV                187
> >  #define CLKID_VPU_1            189
> > +#define CLKID_VDEC_1_SEL       191
> > +#define CLKID_VDEC_1_1_DIV     192
> > +#define CLKID_VDEC_1_1         193
> > +#define CLKID_VDEC_1_2_DIV     194
> > +#define CLKID_VDEC_1_2         195
>
> In order to make use of the glitch-free mux by the driver, shouldn't
> CLKID_VDEC_1_1 and CLKID_VDEC_1_2 be exported in the bindings ?
I considered this but I didn't export them because of three reasons:
- the video decoder driver doesn't have any logic to use the glitch-free mux yet
- assigned-clock-rates or clk_set_rate will figure out the parent
setup on it's own if we ignore the glitch-free mux until the video
decoder driver supports it
- exporting CLKIDs is easier than un-exporting them

Regards
Martin
