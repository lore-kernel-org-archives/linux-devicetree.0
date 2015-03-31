From: Michael Turquette <mturquette@linaro.org>
Subject: Re: [PATCH 2/7] clk: Add basic infrastructure for Pistachio clocks
Date: Mon, 30 Mar 2015 18:36:59 -0700
Message-ID: <20150331013659.25195.31669@quantum>
References: <1424836567-7252-1-git-send-email-abrestic@chromium.org>
 <1424836567-7252-3-git-send-email-abrestic@chromium.org>
 <5519E37C.9010201@codeaurora.org>
 <CAL1qeaGTtMWDM+p+FpDRP=L-yqQ_ai7LY8GwcBUO_C1F+V1LzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL1qeaGTtMWDM+p+FpDRP=L-yqQ_ai7LY8GwcBUO_C1F+V1LzQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Bresticker <abrestic@chromium.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Ralf Baechle <ralf@linux-mips.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-MIPS <linux-mips@linux-mips.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ezequiel Garcia <ezequiel.garcia@imgtec.com>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>
List-Id: devicetree@vger.kernel.org

Quoting Andrew Bresticker (2015-03-30 17:15:43)
> On Mon, Mar 30, 2015 at 4:59 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 02/24/15 19:56, Andrew Bresticker wrote:
> >> +
> >> +void pistachio_clk_force_enable(struct pistachio_clk_provider *p,
> >> +                             unsigned int *clk_ids, unsigned int num)
> >> +{
> >> +     unsigned int i;
> >> +     int err;
> >> +
> >> +     for (i = 0; i < num; i++) {
> >> +             struct clk *clk = p->clk_data.clks[clk_ids[i]];
> >> +
> >> +             if (IS_ERR(clk))
> >> +                     continue;
> >> +
> >> +             err = clk_prepare_enable(clk);
> >> +             if (err)
> >> +                     pr_err("Failed to enable clock %s: %d\n",
> >> +                            __clk_get_name(clk), err);
> >> +     }
> >> +}
> >>
> >
> > Is this to workaround some problems in the framework where clocks are
> > turned off? Or is it that these clocks are already on before we boot
> > Linux and we need to make sure the framework knows that?
> 
> It's the former.  These clocks are enabled at POR and may only be
> gated as the final step to entering suspend, so they must remain on at
> runtime.  The issue we were running into was that consumers of these
> critical clocks or their descendants would enable/disable their clocks
> during boot or runtime PM and cause these clocks to get disabled.
> Bumping up the prepare/enable count of these critical clocks seemed
> like the best way to handle this - is there a more preferred way?
> FWIW, this is also how the Tegra and Rockchip drivers handled this
> problem.

Hi Andrew,

Why are your drivers allowed to disable clocks which must not be
disabled? (you mentioned boot and runtime pm)

Is this the case that a critical clock is not directly disabled, but a
parent of that critical clock is and it is gated as a result?

Regards,
Mike
