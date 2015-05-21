From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 6/7] clocksource: Add Pistachio clocksource-only driver
Date: Fri, 22 May 2015 00:00:22 +0200 (CEST)
Message-ID: <alpine.DEB.2.11.1505212352330.5457@nanos>
References: <1432244260-14908-1-git-send-email-ezequiel.garcia@imgtec.com> <1432244506-15388-1-git-send-email-ezequiel.garcia@imgtec.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432244506-15388-1-git-send-email-ezequiel.garcia@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Cc: linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>, James Hartley <james.hartley@imgtec.com>, James Hogan <james.hogan@imgtec.com>, Damien.Horsley@imgtec.com, Govindraj.Raja@imgtec.com
List-Id: devicetree@vger.kernel.org

On Thu, 21 May 2015, Ezequiel Garcia wrote:
> +static cycle_t clocksource_read_cycles(struct clocksource *cs)
> +{
> +	u32 counter, overflw;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&lock, flags);

Hmm. Is that lock really necessary to read that counter? The
clocksource is global. And if its actually used for timekeeping, the
lock can get heavy contended.

> +	overflw = gpt_readl(TIMER_CURRENT_OVERFLOW_VALUE, 0);
> +	counter = gpt_readl(TIMER_CURRENT_VALUE, 0);
> +	raw_spin_unlock_irqrestore(&lock, flags);
> +
> +	return ~(cycle_t)counter;
> +}

Thanks,

	tglx
