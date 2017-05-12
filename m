From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v5 01/10] pinctrl: generic: Add bi-directional and output-enable
Date: Fri, 12 May 2017 14:25:23 +0200
Message-ID: <CAMuHMdWVsuq9eucz9hz47oBtEvBGW2sJ8-G7L4hDk53CNnxd2A@mail.gmail.com>
References: <1493281194-5200-2-git-send-email-jacopo+renesas@jmondi.org>
 <CAHp75Vcy1OE+9htFx9k3kQhGARQPT1C0gg3SEKZd7ULu_vkUMA@mail.gmail.com>
 <CACRpkdayW0qPXDcc_JofkwtX5UHhDPxiY_8deZZ7+hPNJkjgeQ@mail.gmail.com>
 <SG2PR06MB1165E7E651BE96CD7B7738B08A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75Vcp_eMWrjZRX-x3=Tt3JRXcL_wWG43MymF=oyLLP4EJwg@mail.gmail.com>
 <SG2PR06MB11658EC3A3A80C57E6F539AC8A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAHp75VeLtOuty=iaxuCaH43rnBZDTT03iH7JyjDJBQhTD-EjzA@mail.gmail.com>
 <CACRpkdZkNGSUvTrEdjbGKO1hr799QpJBGSHPVbsBibph7Jx61A@mail.gmail.com>
 <20170508160120.GB25206@w540> <CAHp75VfOMKOhpkec+htA6DRQhivpSmNXy1=Ayig1W+ZC84gTLw@mail.gmail.com>
 <20170508172516.GC25206@w540> <CACRpkdY1h+yfFuk2y9=nZqqvW9=G33_eHCisvuMkJ5b3zizY7Q@mail.gmail.com>
 <CAMuHMdXK9VmghZy1RounHWn-HDqgeT_12V_9RVihiuiajn+RDg@mail.gmail.com>
 <CACRpkdYsE1oeDp1HnYAFMKG2iPTg06cAtD41vxrmZPP70MJQdA@mail.gmail.com>
 <CAMuHMdXK7YB2zN4fz9XiqTuydxp7VvVV+wSgXWUYBB0evkp8dw@mail.gmail.com> <SG2PR06MB1165FF6C0F4DBD8987BC396A8AE20@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <SG2PR06MB1165FF6C0F4DBD8987BC396A8AE20@SG2PR06MB1165.apcprd06.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, jmondi <jacopo@jmondi.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King - ARM Linux <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, May 12, 2017 at 2:13 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, May 12, 2017, Geert Uytterhoeven wrote:
>> Jacopo, Chris: Would two bits per pin/function (none, input, output,
>> bidir)
>> be sufficient?
>> That makes one u16 per pin. So roughtly 12 ports x 16 pins => 384 bytes.
>> Plus code to handle it. After all not that bad...
>
> OK...I give up!
> If that's what it takes to get it, I'm fine.
>
> NOTE, your math is a little off, the issue is that depending on the
> function that you use, you might need to do extra settings, so you'd
> have to have a lookup table for every pin & function.
> Each pin can have 1 of 8 functions (which is good because a 'byte' has
> 8 bits).
>
> So,
>  12 ports x 16 pins => 384 bytes  (this table would just be for checking if bi-dir is needed)
>  12 ports x 16 pins => 384 bytes  (this table would just be for checking if input is needed)
>  12 ports x 16 pins => 384 bytes  (this table would just be for checking if input is needed)
         ------------
>                      1,152 bytes

12 x 16 = 192, not 384.

Do you need all possible combinations of input, output, and bi-dir?
I assumed they're mutually exclusive. If not, you need 3 bits/pin/function.

> But then...there are package variations so you need another entire
> table for those parts.
>    1,152 bytes x 2 = 2,304 bytes

With packages, do you mean e.g. RZ/A1H vs. RZ/A1L? These indeed differ, but
should use different compatible values.
Or do you mean QFP/BGA256 vs. BGA324? Isn't the former a subset of the latter?

> #What we should really do is just make a look-up table (tables) for the
> 'special' ones. But, we can have that discussion in a different thread.

Yep, depending on what gives the smallest code/data size.

> There is still a need for "input-enable" and "output-enable" for the timer
> pins. Because, when you choose the pin to be connected to the MTU2 timer,
> the pin can be used as either input-capture/output-compare/PWM and that's
> the user's choice. So that's probably a valid usage of the generic pin
> properties for configuration.

OK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
