From: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v15 06/13] irqchip: Add irq-ingenic-tcu driver
Date: Thu, 25 Jul 2019 09:21:39 +0100
Message-ID: <2872522f-c172-849d-81d4-0e573ff52ea8@kernel.org>
References: <20190724171615.20774-1-paul@crapouillou.net>
 <20190724171615.20774-7-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190724171615.20774-7-paul@crapouillou.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me, Mathieu Malaterre <malat@debian.org>, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

On 24/07/2019 18:16, Paul Cercueil wrote:
> This driver handles the interrupt controller built in the Timer/Counter
> Unit (TCU) of the JZ47xx SoCs from Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Marc Zyngier <maz@kernel.org>

Given the various dependencies, I assume the series will get routed via
the MIPS tree.

Thanks,

	M.
-- 
Jazz is not dead, it just smells funny...
