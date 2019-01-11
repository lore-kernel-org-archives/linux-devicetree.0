Return-Path: <SRS0=Muqj=PT=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20190103164102.31437-1-thomas.petazzoni@bootlin.com> <20190103164102.31437-3-thomas.petazzoni@bootlin.com>
In-Reply-To: <20190103164102.31437-3-thomas.petazzoni@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jan 2019 11:01:19 +0100
Message-ID: <CACRpkdbzoMSopYL+gq67yCFsZDXWQ95jJAYWqpQfxqfxtP6ufQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] gpio: rename gpio_set_drive_single_ended() to gpio_set_config()
Content-Type: text/plain; charset="UTF-8"
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Jan 3, 2019 at 5:41 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> This commit simply renames gpio_set_drive_single_ended() to
> gpio_set_config(), as the function is not specific to setting the GPIO
> drive type, and will be used for other purposes in followup commits.
>
> In addition, it moves the function above gpiod_direction_input(), as
> it will be used from gpiod_direction_input().
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

This is fine, but if you're factoring this config setting out then also
change the lines in gpiod_set_debounce() and gpiod_set_transitory()
to call the same helper.

Yours,
Linus Walleij
