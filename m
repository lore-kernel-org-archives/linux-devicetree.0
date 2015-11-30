From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 5/5] gpio: tps65912: Add GPIO driver for the TPS65912 PMIC
Date: Mon, 30 Nov 2015 09:26:10 +0100
Message-ID: <CACRpkdbV+FzEXC_6HqRMRONY5fHoUWzg0HdoXq_s2N-RYphpVA@mail.gmail.com>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
	<1447869580-10416-6-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1447869580-10416-6-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 18, 2015 at 6:59 PM, Andrew F. Davis <afd@ti.com> wrote:

> This patch adds support for the TPS65912 PMIC GPIOs.
>
> TPS65912 has five configurable GPIOs that can be used for several
> purposes.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

(...)
> +       gpio->tps = dev_get_drvdata(pdev->dev.parent);
> +       gpio->gpio_chip = template_chip;
> +       gpio->gpio_chip.dev = tps->dev;

This is now renamed .parent in linux-next. It needs to be changed if the
code should compile after merge.

Yours,
Linus Walleij
