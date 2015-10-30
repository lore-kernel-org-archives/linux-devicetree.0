From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 5/5] gpio: tps65912: Add GPIO driver for the TPS65912 PMIC
Date: Fri, 30 Oct 2015 15:13:03 +0100
Message-ID: <CACRpkdb+C1M=cFKDNbJW74hUEA=87aA_weR0u22-9bDKgif6xQ@mail.gmail.com>
References: <1446161922-8755-1-git-send-email-afd@ti.com>
	<1446161922-8755-6-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1446161922-8755-6-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 30, 2015 at 12:38 AM, Andrew F. Davis <afd@ti.com> wrote:

> This patch adds support for the TPS65912 PMIC GPIOs.
>
> TPS65912 has five configurable GPIOs that can be used for several
> purposes.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>

This looks like a fine driver, can't really see anything wrong with it so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

> +#define to_tps65912_gpio(gc) container_of(gc, struct tps65912_gpio, gpio_chip)

I would rewrite that to static inline however.

Lee can take this into the MFD tree with my review-tag if he wants.

Yours,
Linus Walleij
