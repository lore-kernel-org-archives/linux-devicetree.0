From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 2/7] clk: Add basic infrastructure for Pistachio clocks
Date: Mon, 30 Mar 2015 18:21:52 -0700
Message-ID: <5519F6B0.5040809@codeaurora.org>
References: <1424836567-7252-1-git-send-email-abrestic@chromium.org>	<1424836567-7252-3-git-send-email-abrestic@chromium.org>	<5519E37C.9010201@codeaurora.org> <CAL1qeaGTtMWDM+p+FpDRP=L-yqQ_ai7LY8GwcBUO_C1F+V1LzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaGTtMWDM+p+FpDRP=L-yqQ_ai7LY8GwcBUO_C1F+V1LzQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 03/30/15 17:15, Andrew Bresticker wrote:
> On Mon, Mar 30, 2015 at 4:59 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> On 02/24/15 19:56, Andrew Bresticker wrote:
>>> +
>>> +void pistachio_clk_force_enable(struct pistachio_clk_provider *p,
>>> +                             unsigned int *clk_ids, unsigned int num)
>>> +{
>>> +     unsigned int i;
>>> +     int err;
>>> +
>>> +     for (i = 0; i < num; i++) {
>>> +             struct clk *clk = p->clk_data.clks[clk_ids[i]];
>>> +
>>> +             if (IS_ERR(clk))
>>> +                     continue;
>>> +
>>> +             err = clk_prepare_enable(clk);
>>> +             if (err)
>>> +                     pr_err("Failed to enable clock %s: %d\n",
>>> +                            __clk_get_name(clk), err);
>>> +     }
>>> +}
>>>
>> Is this to workaround some problems in the framework where clocks are
>> turned off? Or is it that these clocks are already on before we boot
>> Linux and we need to make sure the framework knows that?
> It's the former.  These clocks are enabled at POR and may only be
> gated as the final step to entering suspend, so they must remain on at
> runtime.  The issue we were running into was that consumers of these
> critical clocks or their descendants would enable/disable their clocks
> during boot or runtime PM and cause these clocks to get disabled.
> Bumping up the prepare/enable count of these critical clocks seemed
> like the best way to handle this - is there a more preferred way?
> FWIW, this is also how the Tegra and Rockchip drivers handled this
> problem.

Ideally clock providers just provide clocks and don't actually call
clock consumer APIs. I don't see where these clocks are disabled in this
series. Is it just because suspend isn't done right now so there isn't a
place to hook the disable part? I hope that it's a 1:1 relation between
the clocks that are turned on here and the clocks that are turned off
during suspend.

I have a slightly similar problem on my hardware. Consider the case
where the bootloader has left on the display and audio clocks and they
share a common parent PLL. When the kernel boots up, all it knows is
that the display clock and audio clock share a common PLL and the rate
they're running at. If the audio driver probes first, calls clk_enable()
on the audio clock (almost a no-op except for the fact that we call the
.enable op when it's already on) and then calls clk_disable() on the
audio clock when it's done we'll also turn off the shared PLL.
Unfortunately it's also being used by the display clock for the display
driver that hasn't probed yet and so the display stops working and it
may show an artifact or black screen.

Other cases are where certain clocks should never be turned off because
they're used by some non-linux entity (dram controller for example) and
we don't have a place to put the clk_prepare_enable() besides in the
clock driver itself. In these cases, it may be better to tell the
framework that a clock should always be on. I think this case is what
Lee Jones is working on here[1].

Do you fall into one of these two cases? It isn't clear to me how
suspend is special and needs to be dealt with differently. Why wouldn't
these clocks be always on?

[1] https://lkml.org/lkml/2015/2/27/548

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
