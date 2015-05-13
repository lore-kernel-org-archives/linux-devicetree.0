From: Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/4] clk: add lpc18xx ccu clk driver
Date: Wed, 13 May 2015 10:09:18 +0200
Message-ID: <CAGhQ9VzvvBCWu2+8zrAvpFRTWr3o9uhOeuucHB39s91fOPk8Mw@mail.gmail.com>
References: <1430170693-28303-1-git-send-email-manabian@gmail.com>
	<1430170693-28303-4-git-send-email-manabian@gmail.com>
	<20150512223241.16410.79958@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150512223241.16410.79958@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ariel D'Alessandro <ariel.dalessandro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 13 May 2015 at 00:32, Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Quoting Joachim Eastwood (2015-04-27 14:38:12)
>> +static int of_clk_get_parent_arg(struct device_node *np, int index)
>> +{
>> +       struct of_phandle_args clkspec;
>> +       int rc;
>> +
>> +       if (index < 0)
>> +               return -EINVAL;
>> +
>> +       rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
>> +                                       &clkspec);
>> +       if (rc)
>> +               return -EINVAL;
>> +
>> +       return clkspec.args_count ? clkspec.args[0] : -EINVAL;
>> +}
>
> Hi Joachim,
>
> I'm not sure why you need this. I guess it is related to my question in
> patch #2 about using clock-indices?

Yes. I basically need the clock id without grabbing the clock using a
clk_get function. See below.

>Can you explain why this function is required?

Since the CCU doesn't act like a normal clock consumer using clk_get
type functions I use this function to retrieve the CGU clock id. This
drivers is used on two CCUs blocks and I need to match the id with one
in the clk_branches array so that the driver itself can be generic.

> Anyways if returning the clock index is something that is really needed
> then why not rename it to "of_clk_get_index" and put it in
> drivers/clk/clk.c?

Okey, I'll do that in the next version if we agree that the function
is still needed.

regards,
Joachim Eastwood
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
