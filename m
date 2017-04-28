From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 02/10] pinctrl: generic: Add macros to unpack properties
Date: Fri, 28 Apr 2017 12:06:39 +0200
Message-ID: <CAMuHMdUexzY6_x19kzPRJW-DxetFC_M1horyTrsA4U9Rs-9g_A@mail.gmail.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-3-git-send-email-jacopo+renesas@jmondi.org> <CACRpkdbkBtJGJ_5MVy2QSAa0zcKVm=_H+vC_kH4AUcX58TiaLg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdbkBtJGJ_5MVy2QSAa0zcKVm=_H+vC_kH4AUcX58TiaLg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 28, 2017 at 10:16 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> On Thu, Apr 27, 2017 at 10:19 AM, Jacopo Mondi
>> +#define PIN_CONF_UNPACK_PARAM(c) ((c) & 0xffUL)
>> +#define PIN_CONF_UNPACK_ARGS(c) ((c) >> 8)
>
> But why.
>
> I have these two static inlines just below your new macros:
>
> static inline enum pin_config_param pinconf_to_config_param(unsigned
> long config)
> {
>         return (enum pin_config_param) (config & 0xffUL);
> }
>
> static inline u32 pinconf_to_config_argument(unsigned long config)
> {
>         return (u32) ((config >> 8) & 0xffffffUL);
> }

Cool, need...more...context...in...patches ;-)

> Why can't you use this in your code instead of macros?
>
> We generally prefer static inlines over macros because they are easier
> to read.

Sure.

Thanks for noticing!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
