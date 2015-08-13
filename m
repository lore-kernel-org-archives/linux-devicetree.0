From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 3/4] gpio: brcmstb: support wakeup from S5 cold boot
Date: Thu, 13 Aug 2015 13:12:31 +0200
Message-ID: <CACRpkdaTwLHC528+p6ytPhR7POonECfU3_-EEz--nrs353UTXg@mail.gmail.com>
References: <1438391865-7862-1-git-send-email-gregory.0xf0@gmail.com>
	<1438391865-7862-4-git-send-email-gregory.0xf0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1438391865-7862-4-git-send-email-gregory.0xf0@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Gregory Fong <gregory.0xf0@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, Brian Norris <computersforpeace@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@arm.linux.org.uk>
List-Id: devicetree@vger.kernel.org

On Sat, Aug 1, 2015 at 3:17 AM, Gregory Fong <gregory.0xf0@gmail.com> wrote:

> For wake from S5, we need to:
> - register a reboot handler
> - set wakeup capability before requesting IRQ so wakeup count is
>   incremented
> - mask all GPIO IRQs and clear any pending interrupts during driver
>   probe to since no driver will yet be registered to handle any IRQs
>   carried over from boot at that time, and it's possible that the
>   booted kernel does not request the same IRQ anyway.
>
> This means that /sys/.../power/wakeup_count is valid at boot time, and
> we can properly account for S5 wakeup stats. e.g.:
>
>   ### After waking from S5 from a GPIO key
>   # cat /sys/bus/platform/drivers/brcmstb-gpio/f04172c0.gpio/power/wakeup
>   enabled
>   # cat /sys/bus/platform/drivers/brcmstb-gpio/f04172c0.gpio/power/wakeup_count
>   1
>
> Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>
> ---
> v4: rename __brcmstb_gpio_irq_set_wake() to brcmstb_gpio_priv_set_wake().

Patch applied.

Yours,
Linus Walleij
