From: Jun Nie <jun.nie@linaro.org>
Subject: Re: [PATCH 2/3] pinctrl: zx: Add ZTE pinctrl dts document
Date: Wed, 7 Sep 2016 12:07:44 +0800
Message-ID: <CABymUCPzLV7L1Xqz00=vwJ-63T9g6pEet+_oGVXkWDAVR1Rsyw@mail.gmail.com>
References: <1472213965-4899-1-git-send-email-jun.nie@linaro.org>
 <CACRpkdZ5aHJs8EK29_y7wYZhyHAUdD99wy2RRGD-CZdoJo+NrA@mail.gmail.com> <CACRpkdaDCiwbnXCu2LwEZcKxQHweKpY7nw20w+fDQ7AnsOHY1g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaDCiwbnXCu2LwEZcKxQHweKpY7nw20w+fDQ7AnsOHY1g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, Jason Liu <jason.liu@linaro.org>
List-Id: devicetree@vger.kernel.org

2016-09-06 22:43 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
> On Tue, Sep 6, 2016 at 4:15 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> pa: pinctrla {
>>     compatible = "parent-device-compat";
>>     (...)
>> };
>>
>> pb: pinctrlb {
>>     compatible = "child-device-compat";
>>     pinctrl-parent = &pinctrla;
>>     (...)
>> };
>
> After thinking some more I kind of fancy the GPIO ranges
> approach to be reused:
>
> pa: pinctrla {
>     compatible = "parent-device-compat";
>     (...)
> };
>
> pb: pinctrlb {
>     compatible = "child-device-compat";
>     pinctrl-ranges = <&pa 0 31 0>;
>     (...)
> };
>
> The definition and use would be similar to gpio-ranges, see:
> Documentation/devicetree/bindings/gpio/gpio.txt, but these
> bindings are specified in BNF which IMO is just confusing.
>
> Anyways its <phandle local-offset count remote-offset>
>
> Also group names are supported for GPIO ranges.
>
> In the Linux implementation this facilitates reuse of the
> existing GPIO ranges parsing and resolution.
>
> To make cross-calls we need an abstract call akin to the
> existing pinctrl_request_gpio() and pinctrl_free_gpio()
> just named pinctrl_request_hierarchical()
> pinctrl_free_hierarchical() or so so it is chrystal clear
> what is going on when reading the code.
>
> As this passes through the pinctrl driver core, new callbacks
> are needed in struct pinmux_ops such as
> .hierarchical_request(), .hierarchical_free().

The GPIO range method does provide clear hierarchical relation
and ease maintenance. But pin configuration of normal pins
and AON/normal shared pins are mixed together with one register
controlling 3 pin config. So I need find a way to handle the pin
configuration sharing.

Maybe splitting pin configuration to another driver is a solution with
pin config range linked the two pinmux devices like GPIO range.
But this lead to more complexity.

>
> This is going to be complex, but a way more maintainable
> solution than doing the hack in patch 1/3 where we totally
> loose control and definition of what happens.
>
> Yours,
> Linus Walleij
