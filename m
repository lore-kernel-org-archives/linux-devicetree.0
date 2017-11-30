From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 4/5] pinctrl: mcp23s08: configure irq polarity using
 irq data
Date: Thu, 30 Nov 2017 15:17:23 +0100
Message-ID: <CACRpkdYabJ3cMeqja3B2Lip1BT6f++k=wAM_NOKcRZQe-BCXBg@mail.gmail.com>
References: <1511252491-79952-1-git-send-email-preid@electromag.com.au> <1511252491-79952-5-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1511252491-79952-5-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sebastian Reichel <sre@kernel.org>, linux-gpio@vger.kernel.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 21, 2017 at 9:21 AM, Phil Reid <preid@electromag.com.au> wrote:

> The irq polarity is already encoded in the irq config. Use that to
> determine the polarity for the mcp32s08 irq output instead of the
> custom microchip,irq-active-high property.
>
> Signed-off-by: Phil Reid <preid@electromag.com.au>
(...)
>         if (mcp->irq && mcp->irq_controller) {
> -               irq_active_high =
> -                       device_property_read_bool(dev,
> -                                             "microchip,irq-active-high");
> +               if (device_property_present(dev, "microchip,irq-active-high"))
> +                       dev_warn(dev,
> +                                "microchip,irq-active-high is deprecated\n");
> +
> +               irq_trig = irqd_get_trigger_type(irq_get_irq_data(mcp->irq));
> +               if (irq_trig == IRQF_TRIGGER_HIGH)
> +                       irq_active_high = true;

This makes the setting from the interrupt line override the
custom property.

Should it not be the other way around to preserve compatibility
with elder device trees?

I.e. the custom property overrides the line setting?

Otherwise it looks good.

Yours,
Linus Walleij
