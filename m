Return-Path: <robherring2@gmail.com>
Date: Sun, 18 Feb 2018 20:35:37 -0600
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 3/3] spi: spi-gpio: Augment device tree bindings
Message-ID: <20180219023537.pogb7vkmtyiryg46@rob-hp-laptop>
References: <20180212124532.25776-1-linus.walleij@linaro.org>
 <20180212124532.25776-4-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180212124532.25776-4-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Feb 12, 2018 at 01:45:32PM +0100, Linus Walleij wrote:
> After we augmented the core to handle "gpio-sck"/"sck-gpios",
> "gpio-mosi"/"mosi-gpios", "gpio-miso"/"miso-gpios" alike,
> deprecate the old binding and put the strict modern and
> recommended binding practice into place as the default for
> GPIO-based SPI.
> 
> This reflects the similar change in I2C:
> commit 7d29f509d2cf
> ("dt-bindings: i2c: i2c-gpio: Add support for named gpios")
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/devicetree/bindings/spi/spi-gpio.txt | 24 ++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
