From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 08/12] ARM: davinci: dm355: switch to using the
 clocksource driver
Date: Fri, 8 Feb 2019 18:04:43 +0530
Message-ID: <bb0bc61a-8c2b-affa-c58a-1e7c14f9390d@ti.com>
References: <20190204171757.32073-1-brgl@bgdev.pl>
 <20190204171757.32073-9-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190204171757.32073-9-brgl@bgdev.pl>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 04/02/19 10:47 PM, Bartosz Golaszewski wrote:
> -/*
> - * T0_BOT: Timer 0, bottom:  clockevent source for hrtimers
> - * T0_TOP: Timer 0, top   :  clocksource for generic timekeeping
> - * T1_BOT: Timer 1, bottom:  (used by DSP in TI DSPLink code)
> - * T1_TOP: Timer 1, top   :  <unused>

Documenting this timer division is important because DSP usage and
unused timers are not immediately clear from kernel code alone. Can you
retain these comments in all patches of this series (I guess T0_BOT etc.
terminology is changed, so feel free to adjust the comment text).

> - */
> -static struct davinci_timer_info dm355_timer_info = {
> -	.timers		= davinci_timer_instance,
> -	.clockevent_id	= T0_BOT,
> -	.clocksource_id	= T0_TOP,
> +static const struct davinci_timer_cfg dm355_timer_cfg = {
> +	.reg = {
> +		.start		= DAVINCI_TIMER0_BASE,
> +		.end		= DAVINCI_TIMER0_BASE + SZ_4K,

Here and other places too, SZ_4K - 1

Thanks,
Sekhar
