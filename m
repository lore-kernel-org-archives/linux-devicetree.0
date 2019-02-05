From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v2 04/12] ARM: davinci: WARN_ON() if clk_get() fails
Date: Mon, 4 Feb 2019 20:18:38 -0600
Message-ID: <0750392d-e298-b467-24c0-3c2779ead3f7@lechnology.com>
References: <20190204171757.32073-1-brgl@bgdev.pl>
 <20190204171757.32073-5-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190204171757.32073-5-brgl@bgdev.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>, Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: devicetree@vger.kernel.org

On 2/4/19 11:17 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> Currently the timer code checks if the clock pointer passed to it is
> good (!IS_ERR(clk)). The new clocksource driver expects the clock to
> be functional and doesn't perform any checks so emit a warning if
> clk_get() fails. Apply this to all davinci platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>   arch/arm/mach-davinci/da830.c  | 4 ++++
>   arch/arm/mach-davinci/da850.c  | 4 ++++
>   arch/arm/mach-davinci/dm355.c  | 4 ++++
>   arch/arm/mach-davinci/dm365.c  | 4 ++++
>   arch/arm/mach-davinci/dm644x.c | 4 ++++
>   arch/arm/mach-davinci/dm646x.c | 4 ++++
>   6 files changed, 24 insertions(+)
> 
> diff --git a/arch/arm/mach-davinci/da830.c b/arch/arm/mach-davinci/da830.c
> index 2cc9fe4c3a91..9a4b749cbb6b 100644
> --- a/arch/arm/mach-davinci/da830.c
> +++ b/arch/arm/mach-davinci/da830.c
> @@ -834,6 +834,10 @@ void __init da830_init_time(void)
>   	da830_pll_init(NULL, pll, NULL);
>   
>   	clk = clk_get(NULL, "timer0");
> +	if (WARN_ON(IS_ERR(clk))) {
> +		pr_err("Unable to get the timer clock\n");

Do we really need a warning _and_ an error?

> +		return;
> +	}
>   
>   	davinci_timer_init(clk);
>   }
