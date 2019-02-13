From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/5] gpio: add support for pull-up/pull-down configuration
Date: Wed, 13 Feb 2019 09:15:49 +0100
Message-ID: <CACRpkdbcuERqOvR-5gknTKcq0BeQU2r2U12zFyVXZXWwDMAWAA@mail.gmail.com>
References: <20190207162859.26252-1-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207162859.26252-1-thomas.petazzoni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?B?SmFuIEt1bmRyw6F0?= <jan.kundrat@cesnet.cz>
List-Id: devicetree@vger.kernel.org

On Thu, Feb 7, 2019 at 5:29 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> As we started discussing in [1], it would be useful to have a way to
> configure pull-up/pull-down resistors for simple GPIO controllers that
> don't have any pinmuxing capability, and therefore no interaction with
> the pinctrl subsystem.
>
> This is a second iteration of the patches (the v1 was posted at
> https://patchwork.ozlabs.org/cover/1020392/).

I don't see any problem with this patch set so I have merged it
into an immutable branch in my GPIO tree, and if it builds fine
I will merge it for devel (for-v5.1).

Notably we do not add a userspace ABI in this patch series.

I guess that is fine for now, but I think we might see userspace
support requests soon. But that can be a different patch
and should be driven by actual need for that.

Yours,
Linus Walleij
