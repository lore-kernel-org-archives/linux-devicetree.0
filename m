From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Spreadtrum EIC controller documentation
Date: Tue, 13 Feb 2018 09:28:17 +0100
Message-ID: <CACRpkdY1WDOr=BO-h4Us8k9n2d4cXHgBOAHTbUO5ggAoS3-dfA@mail.gmail.com>
References: <e89b91042abbbcf04cb39a3350af000cc411eee1.1518076643.git.baolin.wang@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e89b91042abbbcf04cb39a3350af000cc411eee1.1518076643.git.baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Baolin!

Thank you for your patch.

On Thu, Feb 8, 2018 at 9:01 AM, Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:

> This patch adds the device tree bindings for the Spreadtrum EIC
> controller. The EIC can be recognized as one special type of GPIO,

s/recognized as one/seen as a/g

> which can only be used as input.
>
> Signed-off-by: Baolin Wang <baolin.wang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

> +The EIC is the abbreviation of external interrupt controller, which
> +is only can be used as input mode. The EIC controller includes 4

can be used only in input mode.

> +sub-modules: EIC-Debounce, EIC-Latch, EIC-Async, EIC-Sync.

Are they four sub-modules that are always synthesized into the
silicon at the same time, or do you mean that when producing the
hardware, the designer will choose one of these four types (it looks
like that from the example).

> +
> +The EIC-debounce sub-module provides up to 8 source input signal
> +connection.

connections.

> A debounce machanism is used to

mechanism

> capture input signal's

capture the input signals'

(note plural signals genitive)

> +stable status (ms grade)

is that millisecond resolution you mean?

> and a single-trigger mechanism is introduced
> +into this sub-module to enhance the input event detection reliability.
> +In addition, this sub-module's clock can be shut-off automatically to

no dash in "shut off"

> +reduce power dissipation. The debounce range is from 1ms to 4s with
> +the step of 1ms.

a step size of

> If the input signal is shorter than 1ms, it will be
> +omitted as this sub-module.

I don't understand the last part, do you mean the signal will be ignored
if it is asserted for less than 1 ms?

> +The EIC-latch sub-module is used to latch some special input signal

signals (plural)

What is special about them?

> +and send interrupts to MCU core, and it can provide up to 8 latch
> +source input signal connection.

connections (plural)

> +The EIC-async sub-module uses 32k clock

a 32kHz clock

> to capture short signal

to capture the short signal

> +(us grade)

Do you mean "microsecond granularity"?

> to generate interrupt to MCU by level or edge trigger.

What is MCU? I think you can just omit it, it could be integrated
elsewhere.

> +The EIC-sync is similar with GPIO's input function.

Do you mean that the EIC-sync module is a synchronized signal input
register? Please write that.

> +Required properties:
> +- compatible: Should be one of the following:
> +  "sprd,sc9860-eic-debounce",
> +  "sprd,sc9860-eic-latch",
> +  "sprd,sc9860-eic-async",
> +  "sprd,sc9860-eic-sync",
> +  "sprd,sc27xx-eic-debounce".

So it looks like there is one at the time, so in the SC9860
all four modules exist, but at different addresses?

(...)
> +Example:
> +       eic_debounce: eic@40210000 {
> +               compatible = "sprd,sc9860-eic-debounce";
> +               reg = <0 0x40210000 0 0x80>;

So does this mean that this is a debounced-only EIC?

There are latch, async and sync versions somewhere else in
memory? Or there could be? And they are never say debounce
and latch at the same time? Etc?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
