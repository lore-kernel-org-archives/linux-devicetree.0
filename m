From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v13 07/13] clocksource: Add a new timer-ingenic driver
Date: Tue, 25 Jun 2019 08:53:19 +0200 (CEST)
Message-ID: <alpine.DEB.2.21.1906250851130.32342@nanos.tec.linutronix.de>
References: <20190624225759.18299-1-paul@crapouillou.net> <20190624225759.18299-8-paul@crapouillou.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624225759.18299-8-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Lee Jones <lee.jones@linaro.org>, Mathieu Malaterre <malat@debian.org>, od@zcrc.me, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, Artur Rojek <contact@artur-rojek.eu>
List-Id: devicetree@vger.kernel.org

On Tue, 25 Jun 2019, Paul Cercueil wrote:
> +
> +struct ingenic_soc_info {
> +	unsigned int num_channels;
> +};
> +
> +struct ingenic_tcu {
> +	struct regmap *map;
> +	struct clk *timer_clk, *cs_clk;
> +
> +	unsigned int timer_channel, cs_channel;
> +	struct clock_event_device cevt;
> +	struct clocksource cs;
> +	char name[4];
> +
> +	unsigned long pwm_channels_mask;
> +};

As in the irq driver. Aside of that:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
