From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 6/7] ARM: dts: rockchip: add core rk3288 dtsi
Date: Fri, 25 Jul 2014 12:39:06 -0700
Message-ID: <20140725193906.22930.61548@quantum>
References: <4868343.UFgjaXesOn@diego> <14646641.DlFrJR068n@diego>
 <CAD=FV=X9Ym_1-mweR2fBNwPhfbMVUu+EKO+qsY=te+=-pUDhcw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=X9Ym_1-mweR2fBNwPhfbMVUu+EKO+qsY=te+=-pUDhcw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?utf-8?q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Quoting Doug Anderson (2014-07-24 16:06:34)
> > +       xin24m: xin24m {
> > +               compatible = "fixed-clock";
> > +               clock-frequency = <24000000>;
> > +               #clock-cells = <0>;
> > +       };
> 
> I'm no expert, but strangely every other .dts seems to have the clocks
> under a "clocks" node.  That seems to contradict the suggestion made
> previously that things should not be on the top level, though.

That usually happens when there is a clock controller (e.g. "clocks")
that has multiple clock signals coming out of it. Typically this is for
a clock generator IP within a SoC or other chip.

However for a single board-level clock such as an osc then it is common
to put it at a top-level for that board since these can change from
board to board.

> 
> Also, _I think_ device tree suggests a more generic name for the node
> like "oscillator".  You could use "xin24m" as an output name, I think.
> Mike could correct me if I'm wrong.

You are correct.

Regards,
Mike
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
