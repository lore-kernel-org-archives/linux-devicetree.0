From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/3] ARM: dts: da850: Add node for pullup/pulldown pinconf
Date: Wed, 30 Nov 2016 14:01:48 +0100
Message-ID: <CACRpkdZOxZRRUGkso_b0hLta4OWkeAgX2khcJxFc8EETFKiiXw@mail.gmail.com>
References: <1480351226-3332-1-git-send-email-david@lechnology.com> <1480351226-3332-4-git-send-email-david@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1480351226-3332-4-git-send-email-david@lechnology.com>
Sender: linux-gpio-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Axel Haslam <ahaslam@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, =?UTF-8?Q?Bartosz_Go=C5=82aszewski?= <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 28, 2016 at 5:40 PM, David Lechner <david@lechnology.com> wrote:

> This SoC has a separate pin controller for configuring pullup/pulldown
> bias on groups of pins.
>
> Signed-off-by: David Lechner <david@lechnology.com>
> ---
>
> v2 changes:
> * Moved pin-controller@22c00c device node after gpio@226000 (there seem to be
>   more nodes in proper order here compared to the i2c@228000 node suggested by
>   Sekhar)

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Take this through the ARM SoC tree.

Yours,
Linus Walleij
