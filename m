From: Michael Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/4] clk: add lpc18xx ccu clk driver
Date: Tue, 12 May 2015 15:32:41 -0700
Message-ID: <20150512223241.16410.79958@quantum>
References: <1430170693-28303-1-git-send-email-manabian@gmail.com>
 <1430170693-28303-4-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430170693-28303-4-git-send-email-manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ariel.dalessandro-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ezequiel-30ULvvUtt6G51wMPkGsGjgyUoB5FGQPZ@public.gmane.org, Joachim Eastwood <manabian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Joachim Eastwood (2015-04-27 14:38:12)
> +static int of_clk_get_parent_arg(struct device_node *np, int index)
> +{
> +       struct of_phandle_args clkspec;
> +       int rc;
> +
> +       if (index < 0)
> +               return -EINVAL;
> +
> +       rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
> +                                       &clkspec);
> +       if (rc)
> +               return -EINVAL;
> +
> +       return clkspec.args_count ? clkspec.args[0] : -EINVAL;
> +}

Hi Joachim,

I'm not sure why you need this. I guess it is related to my question in
patch #2 about using clock-indices? Can you explain why this function is
required?

Anyways if returning the clock index is something that is really needed
then why not rename it to "of_clk_get_index" and put it in
drivers/clk/clk.c?

Thanks,
Mike
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
