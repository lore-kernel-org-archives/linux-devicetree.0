From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 8/9] pinctrl: axp209: add support for AXP813 GPIOs
Date: Wed, 13 Dec 2017 08:36:39 +0100
Message-ID: <CACRpkdY8_8BZ6HJV4qE_b9-Ln6TLK_m6DNUpgoh7x61F915nJw@mail.gmail.com>
References: <20171205144647.17594-1-quentin.schulz@free-electrons.com>
 <20171205144647.17594-9-quentin.schulz@free-electrons.com> <96bc20e3-97ca-ae76-9e35-e6af644659c7@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <96bc20e3-97ca-ae76-9e35-e6af644659c7-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 8, 2017 at 2:41 PM, Quentin Schulz
<quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

>> -     pctl->desc = &axp20x_data;
>> +     pctl->desc = (struct axp20x_pctrl_desc *)of_device_get_match_data(dev);
>>       pctl->regmap = axp20x->regmap;
>>       pctl->dev = &pdev->dev;
>>
>
> I am using pctl->desc before retrieving it, thus dereferencing from a
> null pointer.
>
> We just have to move
> pctl->chip.ngpio                = pctl->desc->npins;
> after
> pctl->desc = (struct axp20x_pctrl_desc *)of_device_get_match_data(dev);
>
> Linus, I guess that I should send a patch to fix this or is there an
> other way not to have to apply such a small and dumb patch?

Just send a patch based on my pin control tree "devel" branch or
linux-next, it's cool.

Things like this happens all the time.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
