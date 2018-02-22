Return-Path: <SRS0=Q8ug=FQ=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1519032320-103817-4-git-send-email-preid@electromag.com.au>
References: <1519032320-103817-1-git-send-email-preid@electromag.com.au> <1519032320-103817-4-git-send-email-preid@electromag.com.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 16:10:14 +0100
Message-ID: <CACRpkdahtvmfiyon1JLK7wO0Vi1x41otsGscpHiF7Wxmy3S4Hg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] pinctrl: mcp23s08: add open drain configuration
 for irq output
Content-Type: text/plain; charset="UTF-8"
To: Phil Reid <preid@electromag.com.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sebastian Reichel <sre@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 19, 2018 at 10:25 AM, Phil Reid <preid@electromag.com.au> wrote:

> The mcp23s08 series device can be configured for wired and interrupts
> using an external pull-up and open drain output via the IOCON_ODR bit.
> And "drive-open-drain" property to enable this.
>
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> Signed-off-by: Phil Reid <preid@electromag.com.au>

Patch applied with Jan's review tag as it is (as he says)
a net improvement.

But as the discussion shows, maybe we need more patching
on top of this.

Anyways nice to get this in so we can have some base to
work from.

Yours,
Linus Walleij
