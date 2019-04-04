Return-Path: <SRS0=Z6F2=SG=linaro.org=linus.walleij@kernel.org>
MIME-Version: 1.0
References: <20190321092145.14896-1-geert+renesas@glider.be> <20190321092145.14896-3-geert+renesas@glider.be>
In-Reply-To: <20190321092145.14896-3-geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Apr 2019 12:19:09 +0700
Message-ID: <CACRpkdaY1yodQWtN2saeWV8HqfZ6RZ83JfTF+14vaS0yrR2Yrw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: pca953x: Add support for CAT9554
Content-Type: text/plain; charset="UTF-8"
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chris Brandt <chris.brandt@renesas.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Thu, Mar 21, 2019 at 4:21 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The ON Semiconductor CAT9554 is a variant of the PCA953x GPIO expander,
> with 8 GPIOs and interrupt functionality.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - Split DT binding doc and driver update in separate patches.

Patch applied.

Yours,
Linus Walleij
