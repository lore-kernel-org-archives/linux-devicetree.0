From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/7] clk: Add basic infrastructure for Pistachio clocks
Date: Mon, 30 Mar 2015 18:49:37 -0700
Message-ID: <CAL1qeaHLwKKk0Pb4hGvuN2KnoKRGfJL68nA0CQvkjqmkSn5bAQ@mail.gmail.com>
References: <1424836567-7252-1-git-send-email-abrestic@chromium.org>
	<1424836567-7252-3-git-send-email-abrestic@chromium.org>
	<5519E37C.9010201@codeaurora.org>
	<CAL1qeaGTtMWDM+p+FpDRP=L-yqQ_ai7LY8GwcBUO_C1F+V1LzQ@mail.gmail.com>
	<20150331013659.25195.31669@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150331013659.25195.31669@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hartley <james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mike,

On Mon, Mar 30, 2015 at 6:36 PM, Michael Turquette
<mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Quoting Andrew Bresticker (2015-03-30 17:15:43)
>> On Mon, Mar 30, 2015 at 4:59 PM, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org> wrote:
>> > On 02/24/15 19:56, Andrew Bresticker wrote:
>> >> +
>> >> +void pistachio_clk_force_enable(struct pistachio_clk_provider *p,
>> >> +                             unsigned int *clk_ids, unsigned int num)
>> >> +{
>> >> +     unsigned int i;
>> >> +     int err;
>> >> +
>> >> +     for (i = 0; i < num; i++) {
>> >> +             struct clk *clk = p->clk_data.clks[clk_ids[i]];
>> >> +
>> >> +             if (IS_ERR(clk))
>> >> +                     continue;
>> >> +
>> >> +             err = clk_prepare_enable(clk);
>> >> +             if (err)
>> >> +                     pr_err("Failed to enable clock %s: %d\n",
>> >> +                            __clk_get_name(clk), err);
>> >> +     }
>> >> +}
>> >>
>> >
>> > Is this to workaround some problems in the framework where clocks are
>> > turned off? Or is it that these clocks are already on before we boot
>> > Linux and we need to make sure the framework knows that?
>>
>> It's the former.  These clocks are enabled at POR and may only be
>> gated as the final step to entering suspend, so they must remain on at
>> runtime.  The issue we were running into was that consumers of these
>> critical clocks or their descendants would enable/disable their clocks
>> during boot or runtime PM and cause these clocks to get disabled.
>> Bumping up the prepare/enable count of these critical clocks seemed
>> like the best way to handle this - is there a more preferred way?
>> FWIW, this is also how the Tegra and Rockchip drivers handled this
>> problem.
>
> Hi Andrew,
>
> Why are your drivers allowed to disable clocks which must not be
> disabled? (you mentioned boot and runtime pm)

The issue is that they do not directly consume a critical clock, but
rather a descendant of the critical clock and thus could cause the
critical clock to be disabled.  For example, the periph_sys clock is
one of these critical clocks and it is the parent of various
peripheral clocks, like the watchdog, I2C, PWM, etc.  If the I2C
driver enables and disables it's clock during probe(), and nothing
else has caused the periph_sys clock to be enabled, the disable() call
will cause periph_sys to become disabled since its enable count drops
to 0.

Now this could be solved if there was a driver to directly consume
these clocks and keep them enabled, but, like Stephen mentioned, there
really isn't a proper driver for that.  So it looks like I want
something like the always-on feature Lee is trying to introduce.

Thanks,
Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
