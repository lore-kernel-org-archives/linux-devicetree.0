From: Kevin Cernekee <cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V3 11/11] MIPS: Add multiplatform BMIPS target
Date: Mon, 24 Nov 2014 11:57:08 -0800
Message-ID: <CAJiQ=7BRjxaGki515mZRUt7h9917DwUpkY6yVsz-WsF8WCpvEw@mail.gmail.com>
References: <1416796846-28149-1-git-send-email-cernekee@gmail.com>
 <1416796846-28149-12-git-send-email-cernekee@gmail.com> <CAL1qeaG+cmQDW3ceqq4kGgWBsf4RgfFpQ76OG0dg3SJy6nitgw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaG+cmQDW3ceqq4kGgWBsf4RgfFpQ76OG0dg3SJy6nitgw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Fraser <jfraser-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Dmitry Torokhov <dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux-MIPS <linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 24, 2014 at 11:29 AM, Andrew Bresticker <abrestic-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org> wrote:
>> diff --git a/arch/mips/bmips/setup.c b/arch/mips/bmips/setup.c
>
>> +void __init plat_time_init(void)
>> +{
>> +       struct device_node *np;
>> +       u32 freq;
>> +
>> +       np = of_find_node_by_name(NULL, "cpus");
>> +       if (!np)
>> +               panic("missing 'cpus' DT node");
>> +       if (of_property_read_u32(np, "mips-hpt-frequency", &freq) < 0)
>> +               panic("missing 'mips-hpt-frequency' property");
>> +       of_node_put(np);
>> +
>> +       mips_hpt_frequency = freq;
>> +}
>
> Could you use common clock framework for this?  Isn't the HPT just a
> fixed factor of the CPU clock?  I'm planning on doing something very
> similar for ImgTec MIPS SoCs, so perhaps this could go in a common
> place, like the r4k clocksource driver?

Jonas and I had tossed some ideas around earlier, and I included a few
random thoughts in the cover letter.

One concern is that this currently has to be set pretty early in the
boot process (prior to jiffies calibration IIRC), so it might still
need to be handled as a special case.

Regarding the "fixed factor" question: that is true on all of the
chips I've seen, with a few additional caveats:

 - Most MIPS cores use cpu_clk/2, but BMIPS5000 uses cpu_clk/8.

 - Some MIPS cores scale the CP0 counter frequency when the cpu_clk is
changed, but others do not.  Sometimes this depends on the core rev
(e.g. 65nm BMIPS438x cores do scale, but 40nm BMIPS438x cores do not).

 - We might not necessarily have a good way to determine cpu_clk on
every platform, either.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
