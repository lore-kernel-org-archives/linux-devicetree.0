From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
Date: Fri, 28 Apr 2017 12:09:49 +0200
Message-ID: <CAMuHMdXyWFw6YW=yruCijgzgapBZ_VAkFboTuWW=CMv+8npU4w@mail.gmail.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com> <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Linus,

On Fri, Apr 28, 2017 at 10:32 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Thu, Apr 27, 2017 at 4:56 PM, Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Thu, Apr 27, 2017 at 11:19 AM, Jacopo Mondi
>> <jacopo+renesas@jmondi.org> wrote:
>>> Add bi-directional and output-enable pin configuration properties.
>>>
>>> bi-directional allows to specify when a pin shall operate in input and
>>> output mode at the same time. This is particularly useful in platforms
>>> where input and output buffers have to be manually enabled.
>>>
>>> output-enable is just syntactic sugar to specify that a pin shall
>>> operate in output mode, ignoring the provided argument.
>>> This pairs with input-enable pin configuration option.
>>
>> For me it looks like you are trying to alias open-drain + bias or
>> alike. Don't actually see the benefit of it.
>
> Andy is bringing up a valid point. And I remember asking about
> this before.
>
> What does "bi-directional" really mean, electrically speaking?
>
> Does is just mean open drain and/or open source actually?
> (See Documentation/gpio/driver.txt for an explanation of
> how open drain/source works.)
>
> When you set an output without setting a value, what happens
> electrically?
>
> Isn't this bias-high-impedance / High-Z?
>
> Hopefully you can find the answer from Renesas hardware dept.
>
> You can certainly call it whatever the datasheet calls it
> in your driver #defines but for the DT bindings we would
> ideally have the physical world things.

FWIW, you have already applied v4.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
