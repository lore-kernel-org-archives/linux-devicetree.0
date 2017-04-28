From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/9] pinctrl: Renesas RZ/A1 pin and gpio controller
Date: Fri, 28 Apr 2017 10:06:16 +0200
Message-ID: <CACRpkdapS5YNk0BKXfbMOOk21X1BFuBLvTxNXWzWPeB1+PRW_A@mail.gmail.com>
References: <1491401247-7030-1-git-send-email-jacopo+renesas@jmondi.org>
 <1491401247-7030-3-git-send-email-jacopo+renesas@jmondi.org> <CAMuHMdUy3wo9x=nkpdSVSt34q5yaARc4+kFDC592V2LF7Cxzrg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdUy3wo9x=nkpdSVSt34q5yaARc4+kFDC592V2LF7Cxzrg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Apr 26, 2017 at 2:21 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Apr 5, 2017 at 4:07 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>> Add combined gpio and pin controller driver for Renesas RZ/A1
>> r7s72100 SoC.
>>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>
>> --- /dev/null
>> +++ b/drivers/pinctrl/pinctrl-rza1.c
>
>> +/*
>> + * Keep this up-to-date with pinconf-generic.h: it performs packing of
>> + * pin conf flags and argument during pinconf_generic_parse_dt_config();
>> + * we simply discard pinconf argument here
>> + */
>> +#define PIN_CONF_UNPACK(pinconf)       ((pinconf) & 0xffUL)
>
> Perhaps this should be moved to pinconf-generic.h, to make sure it stays
> up-to-date?

I agree. Use the generic macros.

If further processing is needed, make a static inline to discard config flags
etc.

Yours,
Linus Walleij
