From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] pinctrl: sunxi: Add support for interrupt debouncing
Date: Thu, 20 Oct 2016 15:04:46 +0200
Message-ID: <CACRpkdaoEH7OixJDkjuZ0qqYVURLvXwn8b41-OvqjZGJ=neh+Q@mail.gmail.com>
References: <cover.ed6c19bdf01ae70096f3d96af4805f59ef16f94a.1476868462.git-series.maxime.ripard@free-electrons.com>
 <fa022cca9917917ace4af7d5e852c9348ec5b553.1476868462.git-series.maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <fa022cca9917917ace4af7d5e852c9348ec5b553.1476868462.git-series.maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 19, 2016 at 11:15 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:

> The pin controller found in the Allwinner SoCs has support for interrupts
> debouncing.
>
> However, this is not done per-pin, preventing us from using the generic
> pinconf binding for that,

How typical.

> but per irq bank, which, depending on the SoC,
> ranges from one to five.
>
> Introduce a device-wide property to deal with this using a nanosecond
> resolution.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
(...)
> +Note: For backward compatibility reasons, the hosc and losc clocks are
> +only required if you need to use the optional
> +allwinner,debounce-time-ns property. Any new device tree should set them.
> +
> +Optional properties:
> +  - allwinner,debounce-time-ns: Array of debouncing periods in
> +    nanoseconds. One period per irq bank found in the controller

Do you really *need* to specify this with nanosecond resolution?

Else I would suggest to use microsecond resolution and just use
the generic binding (input-debounce) but on the device node instead
of the specific handler.

Yours,
Linus Walleij
