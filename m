From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 3/5] clk: meson: meson8b: add the GPU clock tree
Date: Tue, 11 Dec 2018 23:20:36 +0100
Message-ID: <CAFBinCABGbMu--+dr68CHoTcbis-TsUE3sA8QHhQofgv3eJs5w@mail.gmail.com>
References: <20181208171247.22238-1-martin.blumenstingl@googlemail.com>
 <20181208171247.22238-4-martin.blumenstingl@googlemail.com> <7345cb90-b63d-5461-d97c-89ef563dc421@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7345cb90-b63d-5461-d97c-89ef563dc421@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jbrunet@baylibre.com, khilman@baylibre.com, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, sboyd@kernel.org, mturquette@baylibre.com
List-Id: devicetree@vger.kernel.org

Hi Neil,

On Tue, Dec 11, 2018 at 10:21 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 08/12/2018 18:12, Martin Blumenstingl wrote:
> > Add the GPU clock tree on Meson8, Meson8b and Meson8m2.
> >
> > The GPU clock tree on Meson8b and Meson8m2 is almost identical to the
> > one one GXBB:
> > - there's a glitch-free mux at HHI_MALI_CLK_CNTL[31]
> > - there are two identical parents for this mux: mali_0 and mali_1, each
> >   with a gate, divider and mux
> > - the parents of mali_0_sel and mali_1_sel are identical to GXBB except
> >   there's no GP0_PLL on these 32-bit SoCs
> >
> > Meson8 is different because it does not have the glitch-free mux.
> > Instead if only has the mali_0 clock tree. The parents of mali_0_sel are
> > identical to the ones on Meson8b and Meson8m2.
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >  drivers/clk/meson/meson8b.c | 146 ++++++++++++++++++++++++++++++++++++
> >  drivers/clk/meson/meson8b.h |   9 ++-
> >  2 files changed, 154 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> > index 0b9353d8d4fd..748552c5f6c8 100644
> > --- a/drivers/clk/meson/meson8b.c
> > +++ b/drivers/clk/meson/meson8b.c
> > @@ -1573,6 +1573,135 @@ static struct clk_regmap meson8b_hdmi_sys = {
> >       },
> >  };
> >
> > +/*
> > + * The MALI IP is clocked by two identical clocks (mali_0 and mali_1)
> > + * muxed by a glitch-free switch on Meson8b and Meson8m2. Meson8 only
> > + * has mali_0 and no glitch-free mux.
> > + */
> > +static const char * const meson8b_mali_0_1_parent_names[] = {
> > +     "xtal", "mpll2", "mpll1", "fclk_div7", "fclk_div4", "fclk_div3",
> > +     "fclk_div5"
> > +};
> > +
> > +static u32 meson8b_mali_0_1_mux_table[] = { 0, 2, 3, 4, 5, 6, 7 };
> > +
> > +static struct clk_regmap meson8b_mali_0_sel = {
> > +     .data = &(struct clk_regmap_mux_data){
> > +             .offset = HHI_MALI_CLK_CNTL,
> > +             .mask = 0x7,
> > +             .shift = 9,
> > +             .table = meson8b_mali_0_1_mux_table,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "mali_0_sel",
> > +             .ops = &clk_regmap_mux_ops,
> > +             .parent_names = meson8b_mali_0_1_parent_names,
> > +             .num_parents = ARRAY_SIZE(meson8b_mali_0_1_parent_names),
> > +             /*
> > +              * Don't propagate rate changes up because the only changeable
> > +              * parents are mpll1 and mpll2 but we need those for audio and
> > +              * RGMII (Ethernet). We don't want to change the audio or
> > +              * Ethernet clocks when setting the GPU frequency.
> > +              */
> > +             .flags = 0,
> > +     },
> > +};
> > +
> > +static struct clk_regmap meson8b_mali_0_div = {
> > +     .data = &(struct clk_regmap_div_data){
> > +             .offset = HHI_MALI_CLK_CNTL,
> > +             .shift = 0,
> > +             .width = 7,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "mali_0_div",
> > +             .ops = &clk_regmap_divider_ops,
> > +             .parent_names = (const char *[]){ "mali_0_sel" },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap meson8b_mali_0 = {
> > +     .data = &(struct clk_regmap_gate_data){
> > +             .offset = HHI_MALI_CLK_CNTL,
> > +             .bit_idx = 8,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "mali_0",
> > +             .ops = &clk_regmap_gate_ops,
> > +             .parent_names = (const char *[]){ "mali_0_div" },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap meson8b_mali_1_sel = {
> > +     .data = &(struct clk_regmap_mux_data){
> > +             .offset = HHI_MALI_CLK_CNTL,
> > +             .mask = 0x7,
> > +             .shift = 25,
> > +             .table = meson8b_mali_0_1_mux_table,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "mali_1_sel",
> > +             .ops = &clk_regmap_mux_ops,
> > +             .parent_names = meson8b_mali_0_1_parent_names,
> > +             .num_parents = ARRAY_SIZE(meson8b_mali_0_1_parent_names),
> > +             /*
> > +              * Don't propagate rate changes up because the only changeable
> > +              * parents are mpll1 and mpll2 but we need those for audio and
> > +              * RGMII (Ethernet). We don't want to change the audio or
> > +              * Ethernet clocks when setting the GPU frequency.
> > +              */
> > +             .flags = 0,
> > +     },
> > +};
> > +
> > +static struct clk_regmap meson8b_mali_1_div = {
> > +     .data = &(struct clk_regmap_div_data){
> > +             .offset = HHI_MALI_CLK_CNTL,
> > +             .shift = 16,
> > +             .width = 7,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "mali_1_div",
> > +             .ops = &clk_regmap_divider_ops,
> > +             .parent_names = (const char *[]){ "mali_1_sel" },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap meson8b_mali_1 = {
> > +     .data = &(struct clk_regmap_gate_data){
> > +             .offset = HHI_MALI_CLK_CNTL,
> > +             .bit_idx = 24,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "mali_1",
> > +             .ops = &clk_regmap_gate_ops,
> > +             .parent_names = (const char *[]){ "mali_1_div" },
> > +             .num_parents = 1,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> > +static struct clk_regmap meson8b_mali = {
> > +     .data = &(struct clk_regmap_mux_data){
> > +             .offset = HHI_MALI_CLK_CNTL,
> > +             .mask = 1,
> > +             .shift = 31,
> > +     },
> > +     .hw.init = &(struct clk_init_data){
> > +             .name = "mali",
> > +             .ops = &clk_regmap_mux_ops,
> > +             .parent_names = (const char *[]){ "mali_0", "mali_1" },
> > +             .num_parents = 2,
> > +             .flags = CLK_SET_RATE_PARENT,
> > +     },
> > +};
> > +
> >  /* Everything Else (EE) domain gates */
> >
> >  static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
> > @@ -1833,6 +1962,9 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
> >               [CLKID_HDMI_SYS_SEL]        = &meson8b_hdmi_sys_sel.hw,
> >               [CLKID_HDMI_SYS_DIV]        = &meson8b_hdmi_sys_div.hw,
> >               [CLKID_HDMI_SYS]            = &meson8b_hdmi_sys.hw,
> > +             [CLKID_MALI_0_SEL]          = &meson8b_mali_0_sel.hw,
> > +             [CLKID_MALI_0_DIV]          = &meson8b_mali_0_div.hw,
> > +             [CLKID_MALI]                = &meson8b_mali_0.hw,
> >               [CLK_NR_CLKS]               = NULL,
> >       },
> >       .num = CLK_NR_CLKS,
> > @@ -2012,6 +2144,13 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
> >               [CLKID_HDMI_SYS_SEL]        = &meson8b_hdmi_sys_sel.hw,
> >               [CLKID_HDMI_SYS_DIV]        = &meson8b_hdmi_sys_div.hw,
> >               [CLKID_HDMI_SYS]            = &meson8b_hdmi_sys.hw,
> > +             [CLKID_MALI_0_SEL]          = &meson8b_mali_0_sel.hw,
> > +             [CLKID_MALI_0_DIV]          = &meson8b_mali_0_div.hw,
> > +             [CLKID_MALI_0]              = &meson8b_mali_0.hw,
> > +             [CLKID_MALI_1_SEL]          = &meson8b_mali_1_sel.hw,
> > +             [CLKID_MALI_1_DIV]          = &meson8b_mali_1_div.hw,
> > +             [CLKID_MALI_1]              = &meson8b_mali_1.hw,
> > +             [CLKID_MALI]                = &meson8b_mali.hw,
> >               [CLK_NR_CLKS]               = NULL,
> >       },
> >       .num = CLK_NR_CLKS,
> > @@ -2167,6 +2306,13 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
> >       &meson8b_hdmi_sys_sel,
> >       &meson8b_hdmi_sys_div,
> >       &meson8b_hdmi_sys,
> > +     &meson8b_mali_0_sel,
> > +     &meson8b_mali_0_div,
> > +     &meson8b_mali_0,
> > +     &meson8b_mali_1_sel,
> > +     &meson8b_mali_1_div,
> > +     &meson8b_mali_1,
> > +     &meson8b_mali,
> >  };
> >
> >  static const struct meson8b_clk_reset_line {
> > diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> > index 87fba739af81..f212e2304ff5 100644
> > --- a/drivers/clk/meson/meson8b.h
> > +++ b/drivers/clk/meson/meson8b.h
> > @@ -33,6 +33,7 @@
> >  #define HHI_VID_CLK_CNTL2            0x194 /* 0x65 offset in data sheet */
> >  #define HHI_VID_DIVIDER_CNTL         0x198 /* 0x66 offset in data sheet */
> >  #define HHI_SYS_CPU_CLK_CNTL0                0x19c /* 0x67 offset in data sheet */
> > +#define HHI_MALI_CLK_CNTL            0x1b0 /* 0x6c offset in data sheet */
> >  #define HHI_HDMI_CLK_CNTL            0x1cc /* 0x73 offset in data sheet */
> >  #define HHI_NAND_CLK_CNTL            0x25c /* 0x97 offset in data sheet */
> >  #define HHI_MPLL_CNTL                        0x280 /* 0xa0 offset in data sheet */
> > @@ -139,8 +140,14 @@
> >  #define CLKID_HDMI_SYS_SEL   172
> >  #define CLKID_HDMI_SYS_DIV   173
> >  #define CLKID_HDMI_SYS               174
> > +#define CLKID_MALI_0_SEL     175
> > +#define CLKID_MALI_0_DIV     176
> > +#define CLKID_MALI_0         177
> > +#define CLKID_MALI_1_SEL     178
> > +#define CLKID_MALI_1_DIV     179
> > +#define CLKID_MALI_1         180
> >
> > -#define CLK_NR_CLKS          175
> > +#define CLK_NR_CLKS          181
> >
> >  /*
> >   * include the CLKID and RESETID that have
> >
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
thank you for reviewing this!

> Changing mali clock for Meson8 will be fun aswell !
> How amlogic does that ? the only change the divider ?
I'm not sure how it works in practice, but the sequence is:
- spin_lock_irqsave (from mali_clock_critical)
- disable the clock
- change the divider and mux
- enable the clock again
- spin_unlock_irqrestore
(this is identical to the glitch-free mux setup except there's an
additional step for changing the mux before disabling the mali_0 clock
and after enabling the mali_0 clock again)

I learned the hard way that we can't access the Mali registers if the
clock is disabled.
so we need to be careful with this. my plan is to check the progress
of the lima driver from time to time - once there's frequency scaling
code I'll test it to see whether it works (or what I have to adjust)


Regards
Martin


[0] https://github.com/endlessm/linux-meson/blob/cd4096c3ff4eb5b8a8a5581bb46508601c5470dc/drivers/amlogic/gpu/mali/platform/mali_clock.c#L54
