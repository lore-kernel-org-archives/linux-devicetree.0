From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] clk: Add fractional scale clock support
Date: Fri, 17 Jun 2016 08:43:27 +0200
Message-ID: <CAMuHMdUMm5BWWEmKX3xOBkMX7HWTYgD6R0xz=uggs_Uya8=3Gw@mail.gmail.com>
References: <1466120433-30648-1-git-send-email-hotran@apm.com> <1466120433-30648-3-git-send-email-hotran@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1466120433-30648-3-git-send-email-hotran@apm.com>
Sender: linux-clk-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, lho@apm.com, Duc Dang <dhdang@apm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 17, 2016 at 1:40 AM, Hoan Tran <hotran@apm.com> wrote:
> This patch adds fractional scale clock support.
> Fractional scale clock is implemented for a single register field.
>   Output rate = parent_rate * scale / denominator
> For example, for 1 / 8 fractional scale, denominator will be 8 and scale
> will be computed and programmed accordingly.
>
> Signed-off-by: Hoan Tran <hotran@apm.com>
> Signed-off-by: Loc Ho <lho@apm.com>

> --- /dev/null
> +++ b/drivers/clk/clk-fractional-scale.c

> +static long clk_fs_round_rate(struct clk_hw *hw, unsigned long rate,
> +                             unsigned long *parent_rate)
> +{
> +       struct clk_fractional_scale *fd = to_clk_sf(hw);
> +       u64 ret, scale;
> +
> +       if (!rate || rate >= *parent_rate)
> +               return *parent_rate;
> +
> +       /* freq = parent_rate * scaler / denom */
> +       ret = rate * fd->denom;

Can this overflow? No, because fd->denom is u64.
But if fd->denom is changed to u32, it needs a cast to u64 here.

> +       scale = ret / *parent_rate;

As detected by the kbuild test robot, this should use do_div().

> +
> +       ret = (u64) *parent_rate * scale;
> +       do_div(ret, fd->denom);
> +
> +       return ret;
> +}
> +
> +static int clk_fs_set_rate(struct clk_hw *hw, unsigned long rate,
> +                          unsigned long parent_rate)
> +{
> +       struct clk_fractional_scale *fd = to_clk_sf(hw);
> +       unsigned long flags = 0;
> +       u64 scale, ret;
> +       u32 val;
> +
> +       /*
> +        * Compute the scaler:
> +        *
> +        * freq = parent_rate * scaler / denom, or
> +        * scaler = freq * denom / parent_rate
> +        */
> +       ret = rate * fd->denom;

Can this overflow? No, because fd->denom is u64.
But if fd->denom is changed to u32, it needs a cast to u64 here.

> +       scale = ret / (u64)parent_rate;

Don't cast the divider to u64, as this will turn a 64-by-32 division into a
64-by-64 division.
As detected by the kbuild test robot, this should use do_div().

> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h

> +struct clk_fractional_scale {
> +       struct clk_hw   hw;
> +       void __iomem    *reg;
> +       u8              shift;
> +       u32             mask;
> +       u64             denom;

u64 sounds overkill to me, but it looks like that was done to avoid overflow in
the multiplications?

> +       u32             flags;
> +       spinlock_t      *lock;
> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
