From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 07/14] gpio: thunderx: Use the default parent apis for {request,release}_resources
Date: Tue, 23 Apr 2019 13:18:34 +0200
Message-ID: <CACRpkdYB0dHrNe_k4AR+T_wd+jdNnLwhNsX0mQXUDtTNcTZ7MA@mail.gmail.com>
References: <20190420100950.7997-1-lokeshvutla@ti.com> <20190420100950.7997-8-lokeshvutla@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190420100950.7997-8-lokeshvutla@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Santosh Shilimkar <ssantosh@kernel.org>, Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>, Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Device Tree Mailing List <devicetree@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Sat, Apr 20, 2019 at 12:11 PM Lokesh Vutla <lokeshvutla@ti.com> wrote:

> thunderx_gpio_irq_{request,release}_resources apis are trying to
> {request,release} resources on parent interrupt. There are default
> apis doing the same. Use the default parent apis instead of writing
> the same code snippet.
>
> Cc: linux-gpio@vger.kernel.org
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

It's fine to apply this to the irqchip tree once the irq maintainers
are happy.

Yours,
Linus Walleij
