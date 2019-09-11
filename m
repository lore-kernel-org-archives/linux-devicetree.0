From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/4] gpio: of: Make of_gpio_simple_xlate() private
Date: Wed, 11 Sep 2019 14:46:26 +0100
Message-ID: <CACRpkdaOu2mVGS13MpQQ-OJ71W0qR4oTvE9T4+=BKch4+Vdf1A@mail.gmail.com>
References: <20190906084539.21838-1-geert+renesas@glider.be> <20190906084539.21838-3-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906084539.21838-3-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 6, 2019 at 9:45 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> Since commit 9a95e8d25a140ba9 ("gpio: remove etraxfs driver"), there are
> no more users of of_gpio_simple_xlate() outside gpiolib-of.c.
> All GPIO drivers that need it now rely on of_gpiochip_add() setting it
> up as the default translate function.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Patch applied.

Yours,
Linus Walleij
