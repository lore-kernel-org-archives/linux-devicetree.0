From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/5] ARM: bcm2835: Replace alt0/i2s_alt[02] with standard groups.
Date: Tue, 8 Mar 2016 15:24:34 +0700
Message-ID: <CACRpkdYzSt=R7j9GLSY39CsyMKLjqRYnP_31ti5jWiGngJacqA@mail.gmail.com>
References: <1456510756-15337-1-git-send-email-eric@anholt.net>
	<1456510756-15337-3-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1456510756-15337-3-git-send-email-eric@anholt.net>
Sender: linux-gpio-owner@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

On Sat, Feb 27, 2016 at 1:19 AM, Eric Anholt <eric@anholt.net> wrote:

> Since all of these pins were documented, we can use their names to
> explain what's going on.
>
> Signed-off-by: Eric Anholt <eric@anholt.net>

> +       pinctrl-0 = <&i2c0_gpio0
> +                    &i2c1_gpio2
> +                    &gpclk0_gpio4
> +                    &gpclk1_gpio5
> +                    &spi0_gpio7
> +                    &pcm_gpio18
> +                    &pwm0_gpio40
> +                    &pwm1_gpio45
> +                    &gpioout
> +                    &alt3>;

Why are all of these done as hogs instead of being in pinctrl-0
"default" for the device that is using them? i2c1, gpclk0,
etc?

The only reason I see would be if they are unused or something.

Yours,
Linus Walleij
