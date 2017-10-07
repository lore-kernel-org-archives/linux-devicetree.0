From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: dt-bindings: add mcp23018 to mcp23s08 documentation
Date: Sun, 8 Oct 2017 01:41:26 +0200
Message-ID: <CACRpkdY-NRR1wcBbaeCLHfWwCVoQB+s=P=nMxZgMSyuqdmkA6g@mail.gmail.com>
References: <1507166615-4530-1-git-send-email-preid@electromag.com.au> <1507166615-4530-2-git-send-email-preid@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1507166615-4530-2-git-send-email-preid@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Oct 5, 2017 at 3:23 AM, Phil Reid <preid@electromag.com.au> wrote:

> This adds the required definitions for the mcp23018 which is the i2c
> variant of the mcp23s18.

Which is logical if "s" stands for "SPI", "0" is normal or I2C.

>      - "microchip,mcp23s18" for 16 GPIO SPI version

So that is the SPI version

>      - "microchip,mcp23008" for  8 GPIO I2C version or
>      - "microchip,mcp23017" for 16 GPIO I2C version of the chip
> +    - "microchip,mcp23018" for 16 GPIO SPI version

And right here you say that this is also the SPI version, but the
commit message says it is the I2C version.

Yours,
Linus Walleij
