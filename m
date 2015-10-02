From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: xgene: add support to configure GPIO line as
 input, output or external IRQ pin
Date: Fri, 2 Oct 2015 02:51:27 -0700
Message-ID: <CACRpkdbos6r_S06r9gR9Mn7qu-ri61UJcQM332JK6S4gFwSN-A@mail.gmail.com>
References: <1441963332-13329-1-git-send-email-yvo@apm.com>
	<1441963332-13329-2-git-send-email-yvo@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1441963332-13329-2-git-send-email-yvo@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Y Vo <yvo@apm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Phong Vo <pvo@apm.com>, Toan Le <toanle@apm.com>, Loc Ho <lho@apm.com>, Feng Kan <fkan@apm.com>, Quan Nguyen <qnguyen@apm.com>, Duc Dang <dhdang@apm.com>, patches <patches@apm.com>
List-Id: devicetree@vger.kernel.org

On Fri, Sep 11, 2015 at 2:22 AM, Y Vo <yvo@apm.com> wrote:

> Add support to configure GPIO line as input, output or external IRQ pin.
>
> Signed-off-by: Y Vo <yvo@apm.com>

Mostly OK but...

>  #define XGENE_MAX_GPIO_DS              22
>  #define XGENE_MAX_GPIO_DS_IRQ          6
> +#define XGENE_GPIO8_HWIRQ              0x48
> +#define XGENE_GPIO8_IDX                        8
(...)
> +static int xgene_irq_to_line(u32 irq)
> +{
> +       u32 offset = irq_get_irq_data(irq)->hwirq - XGENE_GPIO8_HWIRQ;
> +
> +       return (offset < XGENE_MAX_GPIO_DS_IRQ) ?
> +                       (offset + XGENE_GPIO8_IDX) : -EINVAL;
> +}

What is this hardcoded IRQ 0x48 business?

This patch needs kerneldoc for this xgene_irq_to_line() to explain
what exactly is going on, or noone will understand it enough to
debug or refactor the code.

I hope this 0x48 is not some way of compensating for Linux internal
IRQ offsets, that is what irqdomain is for.

Yours,
Linus Walleij
