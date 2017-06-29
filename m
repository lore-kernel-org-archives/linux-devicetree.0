From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] pinctrl: generic: Add output-enable property
Date: Thu, 29 Jun 2017 17:26:33 +0300
Message-ID: <CAHp75VdAM2EWXtZfaBZ4U2eXL0oj82ipWQZier18jX93xhdUYQ@mail.gmail.com>
References: <1498125658-14554-1-git-send-email-jacopo+renesas@jmondi.org> <CACRpkdYViCZG0PmboxVq7S9ggFOrsTuvk6ZjdzoBgS9aio0ygg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYViCZG0PmboxVq7S9ggFOrsTuvk6ZjdzoBgS9aio0ygg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Dong Aisheng <dongas86@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <Chris.Brandt@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 29, 2017 at 3:33 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Jun 22, 2017 at 12:00 PM, Jacopo Mondi
> <jacopo+renesas@jmondi.org> wrote:
>
>> Add output-enable generic pin configuration property.
>> This properties allows enabling/disabling pin's output capabilities
>> without actually driving any value on the line.

> I have applied the patch adding a few elaborations in the binding that
> the situation where you may use this is typically when enabling/disabling
> input or output buffers irrespective of the mode of the line as a whole.
>
> We might need even more documentation because this is really
> confusing.
>
> But for now it lets drivers work, which is nice.
>
> Rough consensus and running code should be our guide.

At least this looks much better than odd bi-directional thingy.
Thanks!

-- 
With Best Regards,
Andy Shevchenko
