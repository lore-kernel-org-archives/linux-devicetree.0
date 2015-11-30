From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 6/6] gpio: tps65086: Add GPIO driver for the TPS65086 PMIC
Date: Mon, 30 Nov 2015 09:28:33 +0100
Message-ID: <CACRpkday8yoPMCJ0vRqO5ySam84woffXAzjar2gJ+Nw-1iGbuw@mail.gmail.com>
References: <1446657135-7820-1-git-send-email-afd@ti.com>
	<1446657135-7820-7-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446657135-7820-7-git-send-email-afd@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Nov 4, 2015 at 6:12 PM, Andrew F. Davis <afd@ti.com> wrote:

> Add support for the TPS65086 PMIC GPOs.
>
> TPS65086 has four configurable GPOs that can be used for several
> purposes.
>
> Signed-off-by: Andrew F. Davis <afd@ti.com>

(...)
> +       gpio->tps = dev_get_drvdata(pdev->dev.parent);
> +       gpio->gpio_chip = template_chip;

No gpio->gpio_chip.parent = &pdev->dev?

Yours,
Linus Walleij
