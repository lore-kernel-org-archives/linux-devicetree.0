From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v13 02/13] doc: Add doc for the Ingenic TCU hardware
Date: Tue, 25 Jun 2019 08:44:26 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1906250840150.32342@nanos.tec.linutronix.de>
References: <20190624225759.18299-1-paul@crapouillou.net> <20190624225759.18299-3-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624225759.18299-3-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Mathieu Malaterre <malat@debian.org>, od@zcrc.me, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

Paul,

On Tue, 25 Jun 2019, Paul Cercueil wrote:

> Add a documentation file about the Timer/Counter Unit (TCU) present in

s/Add a /Add /

> the Ingenic JZ47xx SoCs.
> 
> diff --git a/Documentation/mips/ingenic-tcu.txt b/Documentation/mips/ingenic-tcu.txt
> new file mode 100644
> index 000000000000..1a753805779c
> --- /dev/null
> +++ b/Documentation/mips/ingenic-tcu.txt

There is a massive effort to convert the whole Documentation tree to rst
format. Please do not introduce new txt files.

Also documentation wants a SPDX license identifier.

> +Implementation
> +--------------
> +
> +The functionalities of the TCU hardware are spread across multiple drivers:
> +- boilerplate:      drivers/mfd/ingenic-tcu.c
> +- clocks:           drivers/clk/ingenic/tcu.c
> +- interrupts:       drivers/irqchip/irq-ingenic-tcu.c
> +- timers:           drivers/clocksource/ingenic-timer.c
> +- PWM:              drivers/pwm/pwm-jz4740.c
> +- watchdog:         drivers/watchdog/jz4740_wdt.c
> +- OST:              drivers/clocksource/ingenic-ost.c

Hrm. These file names are going to be stale over time, but I have no better
idea either.

Thanks,

	tglx
