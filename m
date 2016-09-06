From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] pinctrl: zx: Add ZTE pinctrl dts document
Date: Tue, 6 Sep 2016 16:43:19 +0200
Message-ID: <CACRpkdaDCiwbnXCu2LwEZcKxQHweKpY7nw20w+fDQ7AnsOHY1g@mail.gmail.com>
References: <1472213965-4899-1-git-send-email-jun.nie@linaro.org> <CACRpkdZ5aHJs8EK29_y7wYZhyHAUdD99wy2RRGD-CZdoJo+NrA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZ5aHJs8EK29_y7wYZhyHAUdD99wy2RRGD-CZdoJo+NrA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jun Nie <jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Liu <jason.liu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Sep 6, 2016 at 4:15 PM, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> pa: pinctrla {
>     compatible = "parent-device-compat";
>     (...)
> };
>
> pb: pinctrlb {
>     compatible = "child-device-compat";
>     pinctrl-parent = &pinctrla;
>     (...)
> };

After thinking some more I kind of fancy the GPIO ranges
approach to be reused:

pa: pinctrla {
    compatible = "parent-device-compat";
    (...)
};

pb: pinctrlb {
    compatible = "child-device-compat";
    pinctrl-ranges = <&pa 0 31 0>;
    (...)
};

The definition and use would be similar to gpio-ranges, see:
Documentation/devicetree/bindings/gpio/gpio.txt, but these
bindings are specified in BNF which IMO is just confusing.

Anyways its <phandle local-offset count remote-offset>

Also group names are supported for GPIO ranges.

In the Linux implementation this facilitates reuse of the
existing GPIO ranges parsing and resolution.

To make cross-calls we need an abstract call akin to the
existing pinctrl_request_gpio() and pinctrl_free_gpio()
just named pinctrl_request_hierarchical()
pinctrl_free_hierarchical() or so so it is chrystal clear
what is going on when reading the code.

As this passes through the pinctrl driver core, new callbacks
are needed in struct pinmux_ops such as
.hierarchical_request(), .hierarchical_free().

This is going to be complex, but a way more maintainable
solution than doing the hack in patch 1/3 where we totally
loose control and definition of what happens.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
