From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: generic: Add output-enable property
Date: Thu, 29 Jun 2017 14:33:17 +0200
Message-ID: <CACRpkdYViCZG0PmboxVq7S9ggFOrsTuvk6ZjdzoBgS9aio0ygg@mail.gmail.com>
References: <1498125658-14554-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1498125658-14554-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Dong Aisheng <dongas86@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <Chris.Brandt@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jun 22, 2017 at 12:00 PM, Jacopo Mondi
<jacopo+renesas@jmondi.org> wrote:

> Add output-enable generic pin configuration property.
> This properties allows enabling/disabling pin's output capabilities
> without actually driving any value on the line.
>
> ---
> v1->v2:
>  - Expand the property description as suggested by Laurent. I ended up
>    mentioning the in-famous output buffer :)

I have applied the patch adding a few elaborations in the binding that
the situation where you may use this is typically when enabling/disabling
input or output buffers irrespective of the mode of the line as a whole.

We might need even more documentation because this is really
confusing.

But for now it lets drivers work, which is nice.

Rough consensus and running code should be our guide.

Yours,
Linus Walleij
